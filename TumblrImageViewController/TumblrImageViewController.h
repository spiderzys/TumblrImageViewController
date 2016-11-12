//
//  TumblrImageViewController.h
//  TumblrImageViewController
//
//  Created by YANGSHENG ZOU on 2016-11-11.
//  Copyright © 2016 YANGSHENG ZOU. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "APICommunicator.h"

@protocol TumblrImageViewControllerDelegate <NSObject>  // the delegate should know what to do after request
- (void)tumblrImagePickerController:(__kindof UIViewController *)picker didFinishPickingImage:(UIImage *)image;
- (NSString*)apikey;
@end

@interface TumblrImageViewController : UIViewController <APICommunicatorDelegate, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *imageCollectionView;
@property (weak, nonatomic) IBOutlet UISearchBar *blogSearchBar;
@property (weak, nonatomic) id<TumblrImageViewControllerDelegate> delegate;


// you can either set num of images for each row or size for each image, but the latter one has higher priority
@property (assign, nonatomic) int numOfColumns;
@property (assign, nonatomic) CGSize imageCellSize;
@property (strong, nonatomic) NSString* alertMessage;


@end
