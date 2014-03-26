////
//  ImagePickerViewController.m
//  Millenium
//
//  Created by Jami Sue Becker on 3/21/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import "ImagePickerViewController.h"

@interface ImagePickerViewController ()

@end

@implementation ImagePickerViewController

//draw rectangle
/*- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}*/

/*- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //self.backgroundColor = [UIColor whiteColor];
       touchesArray = [[NSMutableArray alloc]initWithCapacity:4];
            }
    return self;
}*/





- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        touchesArray = [[NSMutableArray alloc]initWithCapacity:4];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    MaskView *view = [[MaskView alloc]initWithFrame:self.view.frame];
    overlayWebView.hidden = YES;
    overlay1WebView.hidden = YES;
    
    
    //works to load on timer picker
    /*[NSTimer
     scheduledTimerWithTimeInterval:1
     target:self
     selector:@selector(onLoadTimer:)
     userInfo:nil
     repeats:NO];*/
    
    
    googleButton.hidden= YES;
    editImageView.hidden = YES;
    editLogoButton.hidden = YES;
    
    
    touchesArray = [[NSMutableArray alloc]initWithCapacity:4];
    
    UIImage *chosenImage = [UIImage imageNamed:@"SampleLogo2.png"];
    //[_logoPicButton setBackgroundImage:chosenImage forState:UIControlStateNormal];
    
    chosenImageView.image = chosenImage;
    
    NSString *strURL = @"http://www.google.com";
    NSURL *url = [NSURL URLWithString:strURL];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self->googleWebView loadRequest:urlRequest];

    AppDelegate *appdelegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    appdelegate.model=YES;
    
    
    //[googleButton addTarget:self action:@selector(gestureRecognizer:) forControlEvents:UIControlEventTouchDragOutside];
   // [googleButton addTarget:self action:@selector(drawRect:) forControlEvents:UIControlEventTouchDragOutside];
    
    
    //[self selectPhoto:nil];
        
    }

//works to autoload imagePicker
/*- (void)onLoadTimer:(id)unused
{
    
    //Loads Picker on timer
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];

}*/






#pragma mark-
#pragma mark Image picking
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    //[_logoPicButton setBackgroundImage:chosenImage forState:UIControlStateNormal];
    
    chosenImageView.image = chosenImage;
    
    //self.imageView.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
        
    AppDelegate *appdelegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    appdelegate.model=NO;
    
    
     [self performSegueWithIdentifier:@"imagePickedSegue" sender:self];
    
    
   
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([segue.identifier isEqualToString:@"imagePickedSegue"]) {
        
        InteractiveViewController *destViewController = segue.destinationViewController;
        //destViewController.indexPath = sender;
        destViewController.chosenImage= chosenImage;
        
               
    }

    
}


//mask image
/*- (UIImage*) maskImage:(UIImage *)image withMask:(UIImage *)maskImage {
    
	CGImageRef maskRef = maskImage.CGImage;
    
	CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                        CGImageGetHeight(maskRef),
                                        CGImageGetBitsPerComponent(maskRef),
                                        CGImageGetBitsPerPixel(maskRef),
                                        CGImageGetBytesPerRow(maskRef),
                                        CGImageGetDataProvider(maskRef), NULL, false);
    
	CGImageRef masked = CGImageCreateWithMask([image CGImage], mask);
	return [UIImage imageWithCGImage:masked];
    
}*/




- (IBAction)screenShot:(UIButton *)sender{
    
    
    
    //begin capture entire webview
    CGRect screenRect = self->overlayWebView.frame;

    UIGraphicsBeginImageContext(screenRect.size);

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] set];
    CGContextFillRect(ctx, screenRect);

    [googleWebView.layer renderInContext:ctx];

    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    
   
    
    chosenImageView.image = newImage;
    chosenImage = newImage;
    
   
    
}

- (IBAction)drawCircle:(UIButton*)sender{
    
    //elipseImageView.hidden = NO;
    ///elipseImageView.image=shapeImage;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    
    //Set color of current context
    [[UIColor blackColor] set];
    
    //Set shadow and color of shadow
    CGContextSetShadowWithColor(context, CGSizeZero, 10.0f, [[UIColor blackColor] CGColor]);
    
    //Draw ellipse
    CGRect ellipseRect = CGRectMake(60.0f, 150.0f, 200.0f, 200.0f);
    CGContextFillEllipseInRect(context, ellipseRect);
    
    CGContextRestoreGState(context);

    
}

//move logo around in edit mode
- (IBAction) imageMoved:(id) sender withEvent:(UIEvent *) event
{
    
    UITouch *t = [[event allTouches] anyObject];
    UIControl *control = sender;
    CGPoint center = control.center;
    
    CGPoint pPrev = [t previousLocationInView:control];
    CGPoint p = [t locationInView:control];
    center.x += p.x - pPrev.x;
    center.y += p.y - pPrev.y;
    control.center = center;
    
    
    
}


//for adding points to crop Image
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    
    
    
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}



- (IBAction)getPoints:(UIButton*)sender{
    
    overlay1WebView.hidden = NO;
    overlayWebView.hidden = NO;
    
    
    
    
    [editImageView setImage:chosenImage];
    
    
    
    MaskView *maskView = [[MaskView alloc]initWithFrame:self.view.frame];
    maskView.hidden = NO;
   [maskView setOpaque:NO];
    
    [overlay1WebView addSubview:maskView];
    
    
}


- (IBAction)cropScreenShot:(UIButton*)sender{
    
    CGRect screenRect = self->overlayWebView.frame;
    
    UIGraphicsBeginImageContext(screenRect.size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] set];
    
    CGContextFillRect(ctx, screenRect);
    
    [googleWebView.layer renderInContext:ctx];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    chosenImageView.image = newImage;
    chosenImage = newImage;

}


- (IBAction)editLogo:(UIButton *)sender{
    
    googleWebView.hidden = YES;
    editLogoButton.hidden = NO;
    editImageView.hidden = NO;
    
    
    
    [editLogoButton setBackgroundImage:chosenImage forState:UIControlStateNormal];
    [editLogoButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [editLogoButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
}

- (IBAction)takePhoto:(UIButton *)sender {
 
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
 
    [self presentViewController:picker animated:YES completion:NULL];
 
 }
 
 - (IBAction)selectPhoto:(UIButton *)sender {
     
     AppDelegate *appdelegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];
     appdelegate.model=YES;
 
     UIImagePickerController *picker = [[UIImagePickerController alloc] init];
     picker.delegate = self;
     picker.allowsEditing = YES;
     picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
 
     [self presentViewController:picker animated:YES completion:NULL];
 
 
 }

- (IBAction)goInteractive:(UIButton *)sender {
    
    UIStoryboard *storyboard = self.storyboard;
    InteractiveViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"InteractiveViewBoard"];
    [self presentViewController:svc animated:YES completion:nil];
    
    
}

- (IBAction)goWeb:(UIButton *)sender {
    
    googleWebView.hidden = NO;
    
    if (editImageView.hidden == NO)
    
    {
        overlay1WebView.hidden= YES;
        editLogoButton.hidden =YES;
        editImageView.hidden = YES;
        NSString *strURL = @"http://www.google.com";
        NSURL *url = [NSURL URLWithString:strURL];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
        [self->googleWebView loadRequest:urlRequest];
        
        
    }
    
    else {
        
        overlay1WebView.hidden= YES;
        editLogoButton.hidden =YES;
        editImageView.hidden = YES;
        NSString *strURL = @"http://www.google.com";
        NSURL *url = [NSURL URLWithString:strURL];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
        [self->googleWebView loadRequest:urlRequest];
        
        
    }

    
    
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
