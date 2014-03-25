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
    maskView.hidden = YES;
    
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
    
    /*UIStoryboard *storyboard = self.storyboard;
    InteractiveViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"InteractiveViewBoard"];
    [self presentViewController:svc animated:YES completion:nil];*/
    
   
    
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
    
    //googleButton.hidden= NO;
    
    //if (editImageView.hidden == YES) {
    
        
        
        
    //begin capture entire webview
    CGRect screenRect = [[UIScreen mainScreen] bounds];

    UIGraphicsBeginImageContext(screenRect.size);

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor blackColor] set];
    CGContextFillRect(ctx, screenRect);

    [googleWebView.layer renderInContext:ctx];

    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    
    //UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    //[_logoPicButton setBackgroundImage:chosenImage forState:UIControlStateNormal];
    
    chosenImageView.image = newImage;
    chosenImage = newImage;
    editImageView.image = newImage;
    //[editLogoButton setBackgroundImage:newImage forState:UIControlStateNormal];
        
   // }
    
    /*else  {
        
        
        //save masked edited image
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        
        UIGraphicsBeginImageContext(screenRect.size);
        
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        [[UIColor blackColor] set];
        CGContextFillRect(ctx, screenRect);
        
        [googleWebView.layer renderInContext:ctx];
        
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        //UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
        //[_logoPicButton setBackgroundImage:chosenImage forState:UIControlStateNormal];
        
        chosenImageView.image = newImage;
        chosenImage = newImage;
        
        [editLogoButton setBackgroundImage:newImage forState:UIControlStateNormal];
        
    }*/

    
    //return newImage;
    
}
/*- (IBAction)drawRect:(UIButton*)sender{
    
    
 
    
    NSLog(@"%@,%@,%@,%@",rectPoint1,rectPoint2, rectPoint3, rectPoint4);
    
    
    //
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 1.0);
	// Draw them with a 2.0 stroke width so they are a bit more visible.
	CGContextSetLineWidth(context, 2.0);
	
	// Draw a connected sequence of line segments
	CGPoint addLines[] =
	{
        *(rectPoint1),*(rectPoint2),*(rectPoint3),*(rectPoint4),
	};
	// Bulk call to add lines to the current path.
	// Equivalent to MoveToPoint(points[0]); for(i=1; i<count; ++i) AddLineToPoint(points[i]);
	CGContextAddLines(context, addLines, sizeof(addLines)/sizeof(addLines[0]));
	CGContextStrokePath(context);

    
    //
    
    //CGRectMake captureRect = [ *(rectPoint1),*(rectPoint2),*(rectPoint3),*(rectPoint4),];
    //CGRect captureRect = [rectPoint1, rectPoint2, rectPoint3, rectPoint4];
    
    //UIGraphicsBeginImageContext(captureRect.size);
    
    CGContextRef ctxDraw = UIGraphicsGetCurrentContext();
    [[UIColor lightGrayColor] set];
    //CGContextFillRect(ctxDraw, captureRect);
    
    [googleWebView.layer renderInContext:ctxDraw];
   
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    chosenImageView.image = newImage;
    chosenImage = newImage;
    [editLogoButton setBackgroundImage:newImage forState:UIControlStateNormal];
    
}*/

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

/*- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //call function to draw Ellipse
    [self drawEllipse:context];
    
    
}*/
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
//get touch points
/*- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    CGPoint pointOnScreen = [touch locationInView:nil];
    NSLog(@"Point - %f, %f", pointOnScreen.x, pointOnScreen.y);
    NSLog(@"Touch");
    return NO; // handle the touch
}*/


//for adding points to crop Image
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    
    /*UITouch *touch = [touches anyObject];
    CGPoint startPoint = [touch locationInView:nil];
    startPoint = [touch locationInView:googleWebView];
    rectFrame->origin.x = startPoint.x;
    rectFrame->origin.y = startPoint.y;*/
    
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    /*UITouch *touch = [touches anyObject];
    CGPoint endPoint = [touch locationInView:nil];
    endPoint = [touch locationInView:self];
    rectFrame->size.width = endPoint.y - startPoint->x;
    rectFrame->size.height = endPoint.y - startPoint->x;*/
    
    //[self setNeedsDisplay];
    //[googleWebView setNeedsDisplay];
}

/*- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint endPoint = [touch locationInView:nil];
    endPoint = [touch locationInView:googleWebView];
    rectFrame->size.width = endPoint.y - startPoint->x;
    rectFrame->size.height = endPoint.y - startPoint->x;
    
    NSLog(@"%@ rectFrame",rectFrame);
    
    //[self setNeedsDisplay];
    [googleWebView setNeedsDisplay];
}*/
- (void)drawRect:(CGRect)rect
{
    
    
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, .50);
	// Draw them with a 2.0 stroke width so they are a bit more visible.
	CGContextSetLineWidth(context, 2.0);
	
	// Draw a connected sequence of line segments
	CGPoint addLines[] =
	{
        firstPoint,secondPoint,thirdPoint,fourthPoint,firstPoint,
	};
	// Bulk call to add lines to the current path.
	// Equivalent to MoveToPoint(points[0]); for(i=1; i<count; ++i) AddLineToPoint(points[i]);
	CGContextAddLines(context, addLines, sizeof(addLines)/sizeof(addLines[0]));
	CGContextStrokePath(context);
    
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    //CGPoint point = [touch locationInView:self];
    //CGPoint point = [touch locationInView:mask1View];
    CGPoint point = [touch locationInView:maskView];
    
    [touchesArray addObject:[NSValue valueWithCGPoint:point]];
    if (touchesArray.count > 4) {
        [touchesArray removeObjectAtIndex:0];
    }
    if (touchesArray.count == 4) {
        
        firstPoint = [[touchesArray objectAtIndex:0]CGPointValue];
        secondPoint = [[touchesArray objectAtIndex:1]CGPointValue];
        thirdPoint = [[touchesArray objectAtIndex:2]CGPointValue];
        fourthPoint = [[touchesArray objectAtIndex:3]CGPointValue];

    }
    
    
    NSLog(@"%@",[NSString stringWithFormat:@"1:%f/%f\n2:%f/%f\n3:%f/%f\n4:%f/%f",firstPoint.x,firstPoint.y,secondPoint.x,secondPoint.y,thirdPoint.x,thirdPoint.y,fourthPoint.x,fourthPoint.y]);
    
    //[self setNeedsDisplay];
    
    [maskView setNeedsDisplay];


    
    
    
   
}



- (IBAction)getPoints:(UIButton*)sender{
    
    //overlay1WebView.hidden = NO;
    overlayWebView.hidden = NO;
    /*CGRect myImageRect = CGRectMake( 200.0f, 100.0f, 800.0f, 600.0f);
    UIImageView *myImage = [[UIImageView alloc]initWithFrame:myImageRect];
    //[myImage setImage:[UIImage imageNamed:@"playboyz.png"]];
    [myImage setImage:chosenImage];
    [maskView addSubview:myImage];*/

    
    CGRect myImageRect = CGRectMake( 300.0f, 200.0f, 700.0f, 600.0f);
    UIImageView *myImage = [[UIImageView alloc]initWithFrame:myImageRect];
    //[myImage setImage:[UIImage imageNamed:@"SampleLogo3.png"]];
    [myImage setImage:chosenImage];
    [self.view addSubview:myImage];
    
    
    MaskView *maskView = [[MaskView alloc]initWithFrame:self.view.frame];
    /*self.view = drawView;
    maskView = drawView;*/
    maskView.hidden = NO;
   [maskView setOpaque:NO];
    [overlayWebView addSubview:maskView];
    
    
    
    
    //maskView.backgroundColor = [UIColor clearColor];
    
    
    

    
    
    
    
}

/*- (IBAction)drawRect:(UIButton*)sender{
//- (void)drawRect:(CGRect)rect
//{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
    
    
    //missing something
    //CGContextAddRect(context, *(rectFrame));
    NSLog(@"rect1: %@", NSStringFromCGRect(*(rectFrame)));
    //CGContextAddRect(context, rectFrame);
    CGContextDrawPath(context, kCGPathFillStroke);
    
}*/


- (IBAction)editLogo:(UIButton *)sender{
    
    googleWebView.hidden = YES;
    editLogoButton.hidden = NO;
    editImageView.hidden = NO;
    //editImageView.image=chosenImage;
    
    
    
    //get logo boundary
    
    
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
        editLogoButton.hidden =YES;
        editImageView.hidden = YES;
        NSString *strURL = @"http://www.google.com";
        NSURL *url = [NSURL URLWithString:strURL];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
        [self->googleWebView loadRequest:urlRequest];
        
        
    }
    
    else {
        
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
