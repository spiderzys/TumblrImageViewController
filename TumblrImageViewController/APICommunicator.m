//
//  APICommunicator.m
//  ImageEditor
//
//  Created by YANGSHENG ZOU on 2016-08-23.
//  Copyright © 2016 YANGSHENG ZOU. All rights reserved.
//

#import "APICommunicator.h"

@interface APICommunicator(){
    
}

@end

@implementation APICommunicator



- (void)requestDataFromTumblrBlog:(NSString *)blog withApikey:(NSString *)apikey{
    // get data from input blog name
    
    NSString *blogRequestString = [NSString stringWithFormat:@"https://api.tumblr.com/v2/blog/%@.tumblr.com/posts/photo?api_key=%@",blog,apikey];
    [[[NSURLSession sharedSession]dataTaskWithURL:[NSURL URLWithString:blogRequestString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error){
            [_delegate didRequestFailedDueToErrorMessage:error.description];
        }
        else{
            [self parseTumblrData:data];
        }
    }]resume];

    
}

- (void)parseTumblrData:(NSData*)data{
    NSError *parserError;
    NSMutableArray *photoUrlArray = [NSMutableArray new];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parserError];
    NSLog(@"%@",dic);
    if(!data){
        [_delegate didRequestFailedDueToErrorMessage:@"No data"];
    }
    else if(parserError){
        NSLog(@"%@",parserError);
    }
    else{
        NSDictionary *response = [dic objectForKey:@"response"];
        
        if (response.count == 0){
            [_delegate didRequestFailedDueToErrorMessage:@"No blog found"];
            return;
        }
        
        NSArray *posts = [response objectForKey:@"posts"];
        
        for (NSDictionary* post in posts){
            NSArray *photos = [post objectForKey:@"photos"];
            for (NSDictionary *photo in photos){
                NSDictionary *originalPhoto = [photo objectForKey:@"original_size"];
                NSString* photoUrl = [originalPhoto objectForKey:@"url"];
                [photoUrlArray addObject:[NSURL URLWithString:photoUrl]];
            }
        }
        
    }
    [_delegate didGetPhotoUrls:photoUrlArray];
}



@end
