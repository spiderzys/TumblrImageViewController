# TumblrImageViewController

It shows the images of tumblr blogs in the controller.

<img src="https://github.com/spiderzys/TumblrImageViewController/blob/master/example.png" width="88">


The implementation of the following protocal is necessary

    @protocol TumblrImageViewControllerDelegate <NSObject>  // the delegate should know what to do after request and apikey

    @required

    - (void)tumblrImagePickerController:(__kindof UIViewController *)picker didFinishPickingImage:(UIImage *)image;
    - (NSString*)apikey;

    @optional

    - (void)didRequestFailedDueToErrorMessage:(NSString*)errorMessage;

    @end

To get the apikey (OAuth Consumer Key), you can go to https://www.tumblr.com/docs/en/api/v2 to register your application

You can specify the number of images for each row by setting numOfColumns.
You can also specify the image cell size by setting imageCellSize. However, setting this will disable the function of numOfColumns.
In addition, you can set alertMessage for when no return data.

Below is an example:

    
    TumblrImageViewController *tumblrImageViewController = [[TumblrImageViewController alloc]init];
    
    tumblrImageViewController.numOfColumns = 5;
    
    tumblrImageViewController.delegate = self;
    
    [self presentViewController:tumblrImageViewController animated:YES completion:^{
        
    }];



    - (NSString*)apikey{
       return @"put your key";
     }

     - (void)tumblrImagePickerController:(__kindof UIViewController *)picker didFinishPickingImage:(UIImage *)image{

    [picker dismissViewControllerAnimated:YES completion:^{
    
        self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    }];
    
     }

