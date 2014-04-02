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
//@synthesize chosenImage;
@synthesize selectedImage;
@synthesize chosenImageView;





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
    
    UILongPressGestureRecognizer *gestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    googleWebView.userInteractionEnabled = YES;
    gestureRecognizer.minimumPressDuration = 0.3;
    gestureRecognizer.delegate = self;
    gestureRecognizer.numberOfTouchesRequired = 1;
    [googleWebView addGestureRecognizer:gestureRecognizer];
    
    /*UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
    tapRecognizer.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:tapRecognizer];*/
    
    
    /*UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    doubleTap.numberOfTouchesRequired = 2;
    [self->googleWebView addGestureRecognizer:doubleTap];*/
    
   /* UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    doubleTap.numberOfTouchesRequired = 2;
    [self->overlayWebView addGestureRecognizer:doubleTap];*/
    
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
    
    //UIImage *chosenImage = [UIImage imageNamed:@"SampleLogo2.png"];
    //[_logoPicButton setBackgroundImage:chosenImage forState:UIControlStateNormal];
    
    chosenImageView.image = selectedImage;
    
    NSString *strURL = @"http://www.google.com";
    NSURL *url = [NSURL URLWithString:strURL];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self->googleWebView loadRequest:urlRequest];

    
    // enables image picker in portrait in window
    AppDelegate *appdelegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    appdelegate.model=YES;
    
    
    //[googleButton addTarget:self action:@selector(gestureRecognizer:) forControlEvents:UIControlEventTouchDragOutside];
   // [googleButton addTarget:self action:@selector(drawRect:) forControlEvents:UIControlEventTouchDragOutside];
    
    
    //[self selectPhoto:nil];
        
    }


-(void) handleLongPress:(UITapGestureRecognizer*) sender{
    
    NSURL*url = [googleWebView.request URL];
    UITextField*urlField;
    urlField.text = [url absoluteString];
    
    //url = [googleWebView request:URL];
    NSLog(@"url recieved: %@", url);
    NSLog(@"Downloading...");
    // Get an image from the URL below
    UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:url]];
    //UIImage *image = [[UIImage alloc] init];
    NSLog(@"%f,%f",image.size.width,image.size.height);
    // Let's save the file into Document folder.
    // You can also change this to your desktop for testing. (e.g. /Users/kiichi/Desktop/)
    NSString *deskTopDir = @"/Users/jamisuebecker/Desktop";
    //NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    // If you go to the folder below, you will find those pictures
    NSLog(@"%@",deskTopDir);
    NSLog(@"saving png");
    NSString *pngFilePath = [NSString stringWithFormat:@"%@/jpg.png",deskTopDir];
    NSData *data1 = [NSData dataWithData:UIImagePNGRepresentation(image)];
    [data1 writeToFile:pngFilePath atomically:YES];
    NSLog(@"saving jpeg");
    NSString *jpegFilePath = [NSString stringWithFormat:@"%@/jpg.jpeg",deskTopDir];
    NSData *data2 = [NSData dataWithData:UIImageJPEGRepresentation(image, 1.0f)];
    [data2 writeToFile:jpegFilePath atomically:YES];
    NSLog(@"saving image done");
    //[image release];
    

    
}

/*- (void)handleLongPress:(UILongPressGestureRecognizer*)gestureRecognizer{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan){
        //get the image view that the user selected and save it as your selectedImageView property
        UIImageView *pressedImageView = (UIImageView *)gestureRecognizer.view;
        self->googleWebView = pressedImageView;
        
        NSLog(@"TAPPED");
        //Touch gestures below top bar should not make the page turn.
        //EDITED Check for only Tap here instead.
        CGPoint touchPoint = [touch locationInView:self.view];
        
        NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
        bool pageFlag = [userDefaults boolForKey:@"pageDirectionRTLFlag"];
        NSLog(@"pageFlag tapbtnRight %d", pageFlag);
        
        NSString *imgURL = [NSString stringWithFormat:@"document.elementFromPoint(%f, %f).src", touchPoint.x, touchPoint.y];
        NSString *urlToSave = [googleWebView stringByEvaluatingJavaScriptFromString:imgURL];
        NSLog(@"urlToSave :%@",urlToSave);
        NSURL * imageURL = [NSURL URLWithString:urlToSave];
        NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
        UIImage * image = [UIImage imageWithData:imageData];
        selectedImage = image;//imgView is the reference of UIImageView
        
        UIImageWriteToSavedPhotosAlbum(image,
                                       self,
                                       @selector(savedPhotoImage:didFinishSavingWithError:contextInfo:),
                                       NULL);
        
        
    }}*/


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

/*- (void)tapDetected:(UITapGestureRecognizer *)tapRecognizer
{
    [UIView animateWithDuration:0.25 animations:^{
        self.view.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
        self.view.transform = CGAffineTransformIdentity;
    }];
}*/

- (void)tapDetected:(UITapGestureRecognizer *)sender
{
    int scrollPositionY = [[self->googleWebView stringByEvaluatingJavaScriptFromString:@"window.pageYOffset"] intValue];
    int scrollPositionX = [[self->googleWebView stringByEvaluatingJavaScriptFromString:@"window.pageXOffset"] intValue];
    
    int displayWidth = [[self->googleWebView stringByEvaluatingJavaScriptFromString:@"window.outerWidth"] intValue];
    CGFloat scale = googleWebView.frame.size.width / displayWidth;
    
    CGPoint pt = [sender locationInView:self->googleWebView];
    pt.x *= scale;
    pt.y *= scale;
    pt.x += scrollPositionX;
    pt.y += scrollPositionY;
    
    NSString *js = [NSString stringWithFormat:@"document.elementFromPoint(%f, %f).tagName", pt.x, pt.y];
    NSString * tagName = [self->googleWebView stringByEvaluatingJavaScriptFromString:js];
    
    NSString *imgURL = [NSString stringWithFormat:@"document.elementFromPoint(%f, %f).src", startPoint->x, startPoint->y];
    NSString *urlToSave = [self->googleWebView stringByEvaluatingJavaScriptFromString:imgURL];
    
    NSURL *url = [NSURL URLWithString:urlToSave];
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    
    //UIImageWriteToSavedPhotosAlbum(image, <#id completionTarget#>, <#SEL completionSelector#>, <#void *contextInfo#>)
    
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
}

-(void) doubleTap :(UITapGestureRecognizer*) sender {
    
    
    int scrollPositionY = [[self->googleWebView stringByEvaluatingJavaScriptFromString:@"window.pageYOffset"] intValue];
    int scrollPositionX = [[self->googleWebView stringByEvaluatingJavaScriptFromString:@"window.pageXOffset"] intValue];
    
    int displayWidth = [[self->googleWebView stringByEvaluatingJavaScriptFromString:@"window.outerWidth"] intValue];
    CGFloat scale = googleWebView.frame.size.width / displayWidth;
    
    CGPoint pt = [sender locationInView:self->googleWebView];
    pt.x *= scale;
    pt.y *= scale;
    pt.x += scrollPositionX;
    pt.y += scrollPositionY;
    
    NSString *js = [NSString stringWithFormat:@"document.elementFromPoint(%f, %f).tagName", pt.x, pt.y];
    NSString * tagName = [self->googleWebView stringByEvaluatingJavaScriptFromString:js];
    
    NSString *imgURL = [NSString stringWithFormat:@"document.elementFromPoint(%f, %f).src", startPoint->x, startPoint->y];
    NSString *urlToSave = [self->googleWebView stringByEvaluatingJavaScriptFromString:imgURL];
    
    NSURL *url = [NSURL URLWithString:urlToSave];
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    
    //UIImageWriteToSavedPhotosAlbum(image, <#id completionTarget#>, <#SEL completionSelector#>, <#void *contextInfo#>)
    
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}


#pragma mark-
#pragma mark Image picking
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    //[_logoPicButton setBackgroundImage:chosenImage forState:UIControlStateNormal];
    
    chosenImageView.image = chosenImage;
    NSLog(@"chosenImage %@",chosenImage);
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
        
    AppDelegate *appdelegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    appdelegate.model=NO;
    
   // [self performSegueWithIdentifier:@"imagePickedSegue" sender:self];
    
    selectedImage = chosenImage;
    
   
    
}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"imagePickedSegue"]) {
        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        InteractiveViewController *destViewController = segue.destinationViewController;
        // NSLog(@"chosenImage %@",chosenImage);
        //NSLog(@"chosenImage %@",newImage);
        //destViewController.chosenImage = chosenImage;
        destViewController.selectedImage=chosenImageView.image;
        NSLog(@"chosenImage %@",chosenImageView.image);

    }
}

/*-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([segue.identifier isEqualToString:@"imagePickedSegue"]) {
        
        InteractiveViewController *destViewController = segue.destinationViewController;
        //destViewController.indexPath = sender;
        destViewController.chosenImage = chosenImage;
        
        
               
    }

    
}*/


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
    //chosenImage = newImage;
    
    
    
    NSLog(@"chosenImage %@",selectedImage);
    
   
    
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
    
    [editImageView setImage:selectedImage];
    
    MaskView *maskView = [[MaskView alloc]initWithFrame:self.view.frame];
    maskView.hidden = NO;
   [maskView setOpaque:NO];
    
    [overlay1WebView addSubview:maskView];
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    //CGContextFillRect(context, self.bounds);
    
    
}


- (IBAction)cropScreenShot:(UIButton*)sender{
    
    overlay1WebView.hidden = NO;
    overlayWebView.hidden = NO;
    
    [editImageView setImage:selectedImage];
    
    MaskView *maskView = [[MaskView alloc]initWithFrame:self.view.frame];
    maskView.hidden = NO;
    [maskView setOpaque:NO];
    
    [overlay1WebView addSubview:maskView];
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] set];
    
    //CGContextFillRect(ctx, maskUse);
    //CGContextFillRect (__bridge CAShapeLayer *)(addPath[]);
    
    [googleWebView.layer renderInContext:ctx];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    
    chosenImageView.image = newImage;
    //chosenImage = newImage;
    
    
    
    NSLog(@"chosenImage %@",selectedImage);

}


- (IBAction)editLogo:(UIButton *)sender{
    
    googleWebView.hidden = YES;
    editLogoButton.hidden = NO;
    editImageView.hidden = NO;
    
    
    
    [editLogoButton setBackgroundImage:selectedImage forState:UIControlStateNormal];
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

- (IBAction)goHome:(UIButton *)sender {
    
    UIStoryboard *storyboard = self.storyboard;
    ViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"HomeStoryboard"];
    [self presentViewController:vc animated:YES completion:nil];
    
    
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
