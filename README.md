# TumblrImageViewController

It shows the images of tumblr blogs in the controller.

To use it, the implementation of the following protocal is necessary

@protocol TumblrImageViewControllerDelegate <NSObject>  // the delegate should know what to do after request and apikey
- (void)tumblrImagePickerController:(__kindof UIViewController *)picker didFinishPickingImage:(UIImage *)image;
- (NSString*)apikey;

@end

To get the apikey (OAuth Consumer Key), you can go to https://www.tumblr.com/docs/en/api/v2 to register your application

You can specify the number of images for each row by setting numOfColumns.
You can also specify the image cell size by setting imageCellSize. However, setting this will disable the function of numOfColumns.
In addition, you can set alertMessage for when no return data.

Below is an example:

TumblrImageViewController *tumblrImageViewController = [[TumblrImageViewController alloc]init];

    tumblrImageViewController.numOfColumns = 5;
    
    [self presentViewController:tumblrImageViewController animated:YES completion:^{
        
    }];
