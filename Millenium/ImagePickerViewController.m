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
@synthesize logoPicButton;
@synthesize maskSquareButton;
@synthesize maskSquareImageView;
@synthesize maskCircleButton;
@synthesize maskCircleImageView;





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
    
    
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scale:)] ;
	[pinchRecognizer setDelegate:self];
	[self.view addGestureRecognizer:pinchRecognizer];
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)] ;
	[panRecognizer setMinimumNumberOfTouches:1];
	[panRecognizer setMaximumNumberOfTouches:1];
	[panRecognizer setDelegate:self];
	[canvas addGestureRecognizer:panRecognizer];
    
    UIPanGestureRecognizer *panRecognizerLogo = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)] ;
	[panRecognizerLogo setMinimumNumberOfTouches:1];
	[panRecognizerLogo setMaximumNumberOfTouches:1];
	[panRecognizerLogo setDelegate:self];
	[chosenImageView addGestureRecognizer:panRecognizerLogo];

    
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
    maskSquareImageView.hidden = YES;
    
    
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


-(void)move:(id)sender {
    
    //CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:canvas];
    CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:chosenImageView];
    
    if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        _firstX = [chosenImageView center].x;
        _firstY = [chosenImageView center].y;
        
        
        
    }
    
    translatedPoint = CGPointMake(_firstX+translatedPoint.x, _firstY+translatedPoint.y);
    
    [chosenImageView setCenter:translatedPoint];
   // [self showOverlayWithFrame:chosenImageView.frame];
}

-(void)scale:(id)sender {
    
    if([(UIPinchGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        _lastScale = 1.0;
    }
    
    CGFloat scale = 1.0 - (_lastScale - [(UIPinchGestureRecognizer*)sender scale]);
    
    CGAffineTransform currentTransform = chosenImageView.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, scale, scale);
    
    [chosenImageView setTransform:newTransform];
    
    
    //CGAffineTransform currentTransformLogo = logoPicButton.transform;
    //CGAffineTransform newTransformLogo = CGAffineTransformScale(currentTransform, scale, scale);
    
    //[logoPicButton setTransform:newTransform];
    
    _lastScale = [(UIPinchGestureRecognizer*)sender scale];
    //[self showOverlayWithFrame:chosenImageView.frame];
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
    
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/logoImage.png"]];
    //[UIImageJPEGRepresentation(chosenImage, 1.0) writeToFile:imagePath atomically:YES];
    
    [UIImagePNGRepresentation(chosenImage) writeToFile:imagePath atomically:YES];
    
    
    NSLog(@"chosenImage %@",selectedImage);
    
    
    [UIImagePNGRepresentation(chosenImage) writeToFile:imagePath atomically:YES];
    
    [logoPicButton setBackgroundImage:chosenImage forState:UIControlStateNormal];

    
    
    
   
    
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






#pragma mark
#pragma mark Mask
- (UIImage*) maskImage:(UIImage *)selectedImage withMask:(UIImage *)maskImage {
    
	CGImageRef imgRef = [selectedImage CGImage];
    CGImageRef maskRef = [maskImage CGImage];
    CGImageRef actualMask = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                              CGImageGetHeight(maskRef),
                                              CGImageGetBitsPerComponent(maskRef),
                                              CGImageGetBitsPerPixel(maskRef),
                                              CGImageGetBytesPerRow(maskRef),
                                              CGImageGetDataProvider(maskRef), NULL, false);
    masked = CGImageCreateWithMask(imgRef, actualMask);
    return [UIImage imageWithCGImage:masked];
    
    
}




- (IBAction)maskButtonClicked:(id)sender
{
    chosenImageView.image = [self maskImage:chosenImageView.image withMask:[UIImage imageNamed:@"MaskWhiteSquare6"]];
    //UIImage*croppedLogoImage = [UIImage imageWithCGImage:masked];
    
    UIImage*croppedLogoImage = chosenImageView.image;
    
    //rewrite image to crop it correctly
    UIGraphicsBeginImageContext(croppedLogoImage.size);
    [croppedLogoImage drawAtPoint:CGPointZero];
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //return [UIImage imageWithCGImage:myColorMaskedImage];
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/logoImage.png"]];
    [UIImagePNGRepresentation(newImg) writeToFile:imagePath atomically:NO];
    
    
    
    [logoPicButton setBackgroundImage:croppedLogoImage forState:UIControlStateNormal];
    
    
    
    
    
    
}

- (IBAction)maskSquareButton:(id)sender{
    
    maskSquareImageView.hidden= NO;
}


//moves logo around
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




- (IBAction)screenShotRect:(UIButton *)sender{
    
    
    
    //begin capture entire webview
    //CGRect screenRect = self->overlayWebView.frame;
    
    CGRect screenRect = CGRectMake(680.0f, 413.0f, 404.0f, 504.0f);
    
    UIGraphicsBeginImageContext(screenRect.size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] set];
    CGContextFillRect(ctx, screenRect);
    
    //[googleWebView.layer renderInContext:ctx];
    
    //[chosenImageView.layer renderInContext:ctx];
    [logoPicButton.layer renderInContext:ctx];
    
    UIImage *rectImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    
    //chosenImageView.image = newImage;
    //chosenImage = newImage;
    
    NSLog(@"chosenImage %@",selectedImage);
    
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/logoImage.png"]];
    //[UIImageJPEGRepresentation(newImage, 1.0) writeToFile:imagePath atomically:YES];
    
    [UIImagePNGRepresentation(rectImage) writeToFile:imagePath atomically:YES];
    
   // [logoPicButton setBackgroundImage:newImage forState:UIControlStateNormal];
    // [profilePictureHandle writeData:UIImagePNGRepresentation(croppedImage)];
    
    
    
    
}


- (IBAction)screenShotSquare:(UIButton *)sender{
    
    
    
    //begin capture entire webview
    //CGRect screenRect = self->overlayWebView.frame;
    
    CGRect screenRect = CGRectMake(680.0f, 413.0f, 504.0f, 504.0f);
    
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
    
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/logoImage.png"]];
    //[UIImageJPEGRepresentation(newImage, 1.0) writeToFile:imagePath atomically:YES];
    
    [UIImagePNGRepresentation(newImage) writeToFile:imagePath atomically:YES];
    
    [logoPicButton setBackgroundImage:newImage forState:UIControlStateNormal];
    // [profilePictureHandle writeData:UIImagePNGRepresentation(croppedImage)];
    
    
    
    
}

- (IBAction)screenShotCircle:(UIButton *)sender{
    
   
    
    //begin capture entire webview
    //CGRect screenRect = self->overlayWebView.frame;
    
    //CGRect ellRect = CGRectMake(680.0f, 413.0f, 504.0f, 504.0f);
    
    CGRect ellipseRect = CGRectMake(60.0f, 150.0f, 200.0f, 200.0f);
    //CGContextFillEllipseInRect(ctx, ellipseRect);
    
    UIGraphicsBeginImageContext(ellipseRect.size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] set];
    CGContextFillRect(ctx, ellipseRect);
    
    
    
    
    [googleWebView.layer renderInContext:ctx];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    
    chosenImageView.image = newImage;
    //chosenImage = newImage;
    
    NSLog(@"chosenImage %@",selectedImage);
    
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/logoImage.png"]];
    //[UIImageJPEGRepresentation(newImage, 1.0) writeToFile:imagePath atomically:YES];
    
    [UIImagePNGRepresentation(newImage) writeToFile:imagePath atomically:YES];
    
    [logoPicButton setBackgroundImage:newImage forState:UIControlStateNormal];
    // [profilePictureHandle writeData:UIImagePNGRepresentation(croppedImage)];
    
    
    
    
}





- (IBAction)screenShot:(UIButton *)sender{
    
    
    
    //begin capture entire webview
    //CGRect screenRect = self->overlayWebView.frame;
    
    CGRect screenRect = CGRectMake(680.0f, 413.0f, 504.0f, 504.0f);

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
    
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/logoImage.png"]];
    //[UIImageJPEGRepresentation(newImage, 1.0) writeToFile:imagePath atomically:YES];
    
    [UIImagePNGRepresentation(newImage) writeToFile:imagePath atomically:YES];
    
    [logoPicButton setBackgroundImage:newImage forState:UIControlStateNormal];
   // [profilePictureHandle writeData:UIImagePNGRepresentation(croppedImage)];
    
    
   
    
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
    
    
    CGContextStrokePath(context);
    
    
    
    myClippingImage = UIGraphicsGetImageFromCurrentImageContext();
    
    CGImageRef image = CGBitmapContextCreateImage(context);
    
    //UIImage*myMaskOriginalImage;
    
    CGImageCreateWithImageInRect(myClippingImage.CGImage, CGRectMake(0,0, 800,600));
    
    //CGContextSaveGState((__bridge CGContextRef)(aPath));
    
    
    
    
    
    
    //CGContextAddPath(context, (__bridge CGPathRef)(aPath));
    //CGContextClip(context);
    
    
    
    //UIImage*myMaskOriginalImage = UIGraphicsGetImageFromCurrentImageContext();
    
    
    /*UIImage*myMaskOriginalImage = CGContextDrawImage(aRef, image, CGRectMake(0, 0, imageWidth,
     imageHeight));*/
    
    //UIImage*myMaskOriginalImage = CGContextDrawImage(aRef, image, CGRectMake(0, 0, 800, 600));
    
    
    
    
    //NSString *imagePath1 =  [directoryPath objectAtIndex:0];
    //imagePath1= [imagePath1 stringByAppendingPathComponent:@"myMaskImage.jpg"];
    
    //writes masked image to documents
    NSString  *imagePath1 = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/myMaskImage.jpg"]];
    //[UIImageJPEGRepresentation(myClippingImage, 1.0) writeToFile:imagePath1 atomically:YES];
    
    [UIImagePNGRepresentation(myClippingImage) writeToFile:imagePath1 atomically:YES];
    
    
    CGContextRestoreGState(context);

    
    UIGraphicsEndImageContext();
    
   // CGContextAddPath(context, (__bridge CGPathRef)(aRef));
   // CGContextClip(context);
    
    
    
    
    //CGContextFillRect(context, self.bounds);
    
    
}

-(UIImage*)imageFromImageView:(UIImageView*)imageView{
    
    
    UIGraphicsBeginImageContext(editImageView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextRotateCTM(context,2*M_PI);
    
    [editImageView.layer renderInContext:context];
    UIImage*imageSaveMask = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageSaveMask;
    
    NSString  *imagePath1 = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/myMaskImage.jpg"]];
    //[UIImageJPEGRepresentation(imageSaveMask, 1.0) writeToFile:imagePath1 atomically:YES];
    [UIImagePNGRepresentation(imageSaveMask) writeToFile:imagePath1 atomically:YES];
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
    
    
    
    [[UIColor clearColor] set];
    
    CGRect screenRect = CGRectMake(180.0f, 290.0f, 228.0f, 228.0f);
    
     //CGSize screenRect = editImageView.frame.size;
   
    CGContextFillRect(ctx, screenRect);
    
    //[chosenImageView renderInContext:ctx];
    
    [chosenImageView setOpaque:NO];
    [chosenImageView setOpaque:NO];
    [chosenImageView setBackgroundColor:[UIColor clearColor]];
    [chosenImageView setBackgroundColor:[UIColor clearColor].CGColor];
    
   //[chosenImageView renderInContext:ctx];

    
    /*[[[[globalSingleton paintingView] drawingView] layer] renderInContext:ctx];
    
    [[[globalSingleton paintingView] drawingView] setOpaque:NO];
    [[[[globalSingleton paintingView] drawingView] layer] setOpaque:NO];
    [[[globalSingleton paintingView] drawingView] setBackgroundColor:[UIColor clearColor]];
    [[[[globalSingleton paintingView] drawingView] layer] setBackgroundColor:[UIColor clearColor].CGColor];
    
    [[[[globalSingleton paintingView] drawingView] layer] renderInContext:ctx];*/
    
    UIImage *image1 = UIGraphicsGetImageFromCurrentImageContext();
    
    NSString  *imagePath3 = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/logoImageClear.png"]];
    //[UIImageJPEGRepresentation(CFBridgingRelease(masked), 1.0) writeToFile:imagePath atomically:YES];
    
    [UIImagePNGRepresentation(image1) writeToFile:imagePath3 atomically:YES];


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
    
    //NSLog(@"chosenImage %@",masked);
    
    //UIImage*croppedImage=chosenImageView.image;
    
    /*NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/logoImage.png"]];*/
    //[UIImageJPEGRepresentation(CFBridgingRelease(masked), 1.0) writeToFile:imagePath atomically:YES];
    
    
   //[UIImagePNGRepresentation(croppedImage) writeToFile:imagePath atomically:YES];
    
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
