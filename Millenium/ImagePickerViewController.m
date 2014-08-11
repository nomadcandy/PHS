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
@synthesize alertShowString;
@synthesize imageDownloaded;

@synthesize interactiveHeaderString;

@synthesize selectedImage;
@synthesize chosenImageView;
@synthesize logoPicButton;
@synthesize maskSquareButton;
@synthesize maskSquareImageView;
@synthesize maskCircleButton;
@synthesize maskCircleImageView;

@synthesize testTransImageView;
@synthesize searchField;

@synthesize sellerField;
@synthesize nameField;
@synthesize companyField;
@synthesize numberField;

@synthesize sellerString;
@synthesize nameString;
@synthesize companyString;
@synthesize numberString;

@synthesize urlFavString;
@synthesize artworkNameAddFavString;
@synthesize artworkCompanyAddFavString;
@synthesize artworkSellerAddFavString;
@synthesize artworkIDAddFavString;
@synthesize artworkLocationIDAddFavString;
@synthesize artworkColorAddFavString;
@synthesize artworkSizeAddFavString;
@synthesize artworkFormatAddFavString;





@synthesize artworkNameArray;
@synthesize artworkSizeArray;
@synthesize artworkFormatArray;
@synthesize artworkFullImageArray;
@synthesize artworkIconArray;
@synthesize artworkIDArray;
@synthesize artworkInfoArray;
@synthesize artworkCompanyArray;
@synthesize artworkSellerArray;
@synthesize artworkColorArray;

@synthesize matNameArray;
@synthesize matSizeArray;
@synthesize matFormatArray;
@synthesize matFullImageArray;
@synthesize matIconArray;
@synthesize matIDArray;
@synthesize matInfoArray;
@synthesize matSellerArray;
@synthesize matCompanyArray;
@synthesize matColorArray;
@synthesize matBGColorArray;

@synthesize artworkCount;
@synthesize matCount;

@synthesize activityIndicator;

@synthesize snapshotView;
@synthesize logoImage;

@synthesize alert;
@synthesize alertInteractive;
@synthesize alertLogo;





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
    
    interactiveHeaderString = @"Logo Picked";
    
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
    
    NSString *strURL = @"http://www.images.google.com";
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
    //[self showOverlayWithFrame:chosenImageView.frame];
}

-(void)scale:(id)sender {
    
    if([(UIPinchGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        _lastScale = 1.0;
    }
    
    CGFloat scale = 1.0 - (_lastScale - [(UIPinchGestureRecognizer*)sender scale]);
    
    /*CGAffineTransform currentTransform = chosenImageView.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, scale, scale);
    
    [chosenImageView setTransform:newTransform];*/
    
    
    //CGAffineTransform currentTransformLogo = logoPicButton.transform;
    //CGAffineTransform newTransformLogo = CGAffineTransformScale(currentTransform, scale, scale);
    
    //[logoPicButton setTransform:newTransform];
    
    _lastScale = [(UIPinchGestureRecognizer*)sender scale];
    //[self showOverlayWithFrame:chosenImageView.frame];
}

-(BOOL) doesAlertLogoExist {
    for (UIWindow* window in [UIApplication sharedApplication].windows) {
        NSArray* subviews = window.subviews;
        if ([subviews count] > 0) {
            
            BOOL alert = [[subviews objectAtIndex:0] isKindOfClass:[UIAlertView class]];
            BOOL action = [[subviews objectAtIndex:0] isKindOfClass:[UIActionSheet class]];
            
            if (alert || action)
                return YES;
        }
    }
    return NO;
}


-(void) handleLongPress:(UITapGestureRecognizer*) sender{
    
    
    
    NSURL*url = [googleWebView.request URL];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:
                             url];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data,
                                               NSError *connectionError) {
                               // handle response
                           }];
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:url
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                // handle response
                
            }] resume];
    
    imageDownloaded = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:url]];
    //UIImage *image = [[UIImage alloc] init];
    //NSLog(@"%f,%f",imageDownloaded.size.width,imageDownloaded.size.height);
    
    chosenImageView.image=imageDownloaded;
    UIGraphicsBeginImageContext(imageDownloaded.size);
    [imageDownloaded drawAtPoint:CGPointZero];
    
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //return [UIImage imageWithCGImage:myColorMaskedImage];
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/logoImage.png"]];
    [UIImagePNGRepresentation(newImg) writeToFile:imagePath atomically:NO];
    


    
    if ([alertShowString isEqualToString:@"YES"]){
        
        
        
        
    }else{
    
        
    
        alertLogo=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Add a name for your Logo"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
        alertLogo.alertViewStyle = UIAlertViewStylePlainTextInput;
        
    
        alertShowString=@"YES";
   
    
    
    
    
        alertLogo.tag = 1;
        [alertLogo show];
        
        
    }
    


  alertShowString=@"NO";
    
    
    
}


- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse {
    return nil;
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
    //NSLog(@"chosenImage %@",chosenImage);
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
        
    AppDelegate *appdelegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    appdelegate.model=NO;
    
   
    selectedImage = chosenImage;
    
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/logoImage.png"]];
    //[UIImageJPEGRepresentation(chosenImage, 1.0) writeToFile:imagePath atomically:YES];
    
    [UIImagePNGRepresentation(chosenImage) writeToFile:imagePath atomically:YES];
    
    
    //NSLog(@"chosenImage %@",selectedImage);
    
    
    [UIImagePNGRepresentation(chosenImage) writeToFile:imagePath atomically:YES];
    
    [logoPicButton setBackgroundImage:chosenImage forState:UIControlStateNormal];

    
    
    
   
    
}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"ImagePickedSegue"])
    
    {
        
        InteractiveViewController *goingController = segue.destinationViewController;
        goingController.selectedImage=chosenImageView.image;
        //NSLog(@"chosenImage %@",chosenImageView.image);
        //goingController.interactiveHeaderString=interactiveHeaderString;
        goingController.interactiveHeaderString=@"Create Mat";
        goingController.nameString = nameField.text;
        //NSLog(@"nameField %@",nameField.text);
        


        goingController.logoColorString=@" ";
        
        

    }
    
    if ([segue.identifier isEqualToString:@"SearchSegue"]) {
        
        LogoCollectionViewController *goingController = segue.destinationViewController;
        
        
        goingController.artworkNameArray = artworkNameArray;
        goingController.artworkSizeArray = artworkSizeArray;
        goingController.artworkFormatArray = artworkFormatArray;
        goingController.artworkIconArray = artworkIconArray;
        goingController.artworkFullImageArray = artworkFullImageArray;
        goingController.artworkIDArray = artworkIDArray;
        goingController.artworkCount = artworkCount;
        goingController.artworkColorArray = artworkColorArray;
        
        
        
        goingController.matNameArray = matNameArray;
        goingController.matSizeArray = matSizeArray;
        goingController.matFormatArray = matFormatArray;
        goingController.matIconArray = matIconArray;
        goingController.matFullImageArray = matFullImageArray;
        goingController.matIDArray = matIDArray;
        goingController.matCompanyArray = matCompanyArray;
        goingController.matSellerArray = matSellerArray;
        goingController.matCount = matCount;
        
        
        
    }

}





//hits this
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
//Try this-it works
-(UIImage *)changeWhiteColorTransparent: (UIImage *)image
{
    
    UIImage*imageTrans;
    imageTrans=chosenImageView.image;
    
    imageTrans = [UIImage imageWithData:UIImageJPEGRepresentation(imageTrans, 1.0)];
    CGImageRef rawImageRef=imageTrans.CGImage;
    //RGB color range to mask (make transparent)  R-Low, R-High, G-Low, G-High, B-Low, B-High
    //255 is for white only
    const float colorMasking[6] = {222, 255, 222, 255, 222, 255};
    
    UIGraphicsBeginImageContext(imageTrans.size);
    CGImageRef maskedImageRef=CGImageCreateWithMaskingColors(rawImageRef, colorMasking);
    
    //iPhone translation
    CGContextTranslateCTM(UIGraphicsGetCurrentContext(), 0.0, imageTrans.size.height);
    CGContextScaleCTM(UIGraphicsGetCurrentContext(), 1.0, -1.0);
    
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, imageTrans.size.width, imageTrans.size.height), maskedImageRef);
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    CGImageRelease(maskedImageRef);
    UIGraphicsEndImageContext();
    
    //return [UIImage imageWithCGImage:myColorMaskedImage];
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/logoImage.png"]];
    [UIImagePNGRepresentation(result) writeToFile:imagePath atomically:NO];
    
    return result;
    
  
    //does not hit anything after this...
    
    /*[[UIColor clearColor] set];
    
    
    
    [chosenImageView setOpaque:NO];
    [chosenImageView setOpaque:NO];
    [chosenImageView setBackgroundColor:[UIColor clearColor]];*/
    
    //chosenImageView.image= result;
    
   
   // UIImage*transLogoImage = result;
    
    //rewrite image to crop it correctly
   /* UIGraphicsBeginImageContext(transLogoImage.size);
    [transLogoImage drawAtPoint:CGPointZero];
    UIImage *clearImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();*/
    
   


}




-(IBAction)goWhite:(id)sender{
    //calls UImage function change White...
    chosenImageView.image=[self changeWhiteColorTransparent:chosenImageView.image];
    
   
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
  
    
 //This code not used
 if (alertView == alert) {
    
    nameField = [alertView textFieldAtIndex:0];
     //NSLog(@"alertNameField - %@",alertNameField.text);
     logoImage = chosenImageView.image;
    
        
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@.png",nameField.text]];
    
    [UIImagePNGRepresentation(logoImage) writeToFile:imagePath atomically:YES];
    
    
    
    //[self.view addSubview:snapshotView];
    
    
    //NOTE- Do not remove local NSString values will break
    
    NSString*logoUrlAppendAddFavString= nameField.text;
    NSString*pngString= @".png";
    //NSLog(@"nameFieldText %@",nameField.text);
    //NSLog(@"nameFieldText %@",nameHideField.text);
    
    
    NSString*urlLogoStringAppend = [logoUrlAppendAddFavString stringByAppendingString:pngString];
    
    urlFavString = urlLogoStringAppend;
    
    //NSLog(@"urlFavString%@",urlFavString);
    
    artworkNameAddFavString =nameField.text;
    artworkColorAddFavString =@"No Color is provided";
    artworkSizeAddFavString =@"4'x 6'";
    artworkCompanyAddFavString =@"Company";
    artworkSellerAddFavString =@"Seller";
    artworkIDAddFavString =@"no ID has been provided";

    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    NSManagedObject *newLogoFavorite = [NSEntityDescription insertNewObjectForEntityForName:@"LogoFavorite" inManagedObjectContext:context];
    
    
    
    
     [newLogoFavorite setValue:self.artworkNameAddFavString forKey:@"artworkName"];
     [newLogoFavorite setValue:self.urlFavString forKey:@"fullImageURL"];
     [newLogoFavorite setValue:self.artworkCompanyAddFavString forKey:@"company"];
     [newLogoFavorite setValue:self.artworkSellerAddFavString forKey:@"seller"];
     [newLogoFavorite setValue:self.artworkColorAddFavString forKey:@"color"];
     [newLogoFavorite setValue:self.artworkSizeAddFavString forKey:@"artworkSize"];
     [newLogoFavorite setValue:self.artworkIDAddFavString forKey:@"productID"];
     [newLogoFavorite setValue:self.artworkLocationIDAddFavString forKey:@"locationID"];
     [newLogoFavorite setValue:self.artworkFormatAddFavString forKey:@"format"];
    
    
    
    
    NSError *error = nil;
    // Save the object to persistent store
   /* if (![context save:&error]) {
        //NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }*/
     
     
   
     
       
    if ( alert==alertLogo){
           
           nameField = [alertLogo textFieldAtIndex:0];
          artworkNameAddFavString=nameField.text;
        

       }

       //save name for Interactive View
   }else{
      
       nameField = [alertView textFieldAtIndex:0];
       artworkNameAddFavString=nameField.text;
       
       //NSLog(@"alertNameField - %@",alertNameField.text);
       
      //nameField.text = nameField.text;
       
   }
    
}


//gets managedObjectContext from the appDelegate
- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}


-(IBAction)addLogoFavorite:(id)sender{
    
   /* UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Add a name for your Logo"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    
    
   
    alert.tag = 1;
    [alert show];*/
    
    
        artworkColorAddFavString =@"No Color is provided";
        artworkSizeAddFavString =@"4'x 6'";
        artworkCompanyAddFavString =@"Company";
        artworkSellerAddFavString =@"Seller";
        artworkIDAddFavString =@"no ID has been provided";
        artworkFormatAddFavString =@"landscape";
        artworkLocationIDAddFavString =@"-1";
    
       //added
       // artworkNameAddFavString =nameFi;
    
    
    //UITextField * alertNameField = [alertLogo textFieldAtIndex:0];

    UITextField * alertNameField = [alertLogo textFieldAtIndex:0];
    //NSLog(@"alertNameField - %@",alertNameField.text);
    logoImage = chosenImageView.image;
    
    
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@.png",artworkNameAddFavString]];
    
    [UIImagePNGRepresentation(logoImage) writeToFile:imagePath atomically:YES];
    
    
    
    //[self.view addSubview:snapshotView];
    
    
    //NOTE- Do not remove local NSString values will break
    
    NSString*logoUrlAppendAddFavString= artworkNameAddFavString;
    NSString*pngString= @".png";
    //NSLog(@"nameFieldText %@",nameField.text);
    //NSLog(@"nameFieldText %@",nameHideField.text);
    
    
    NSString*urlLogoStringAppend = [logoUrlAppendAddFavString stringByAppendingString:pngString];
    
    urlFavString = urlLogoStringAppend;
    
    //NSLog(@"urlFavString%@",urlFavString);
    
    //artworkNameAddFavString =alertNameField.text;
    artworkColorAddFavString =@"No Color is provided";
    artworkSizeAddFavString =@"4'x 6'";
    artworkCompanyAddFavString =@"Company";
    artworkSellerAddFavString =@"Seller";
    artworkIDAddFavString =@"no ID has been provided";
    
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    NSManagedObject *newLogoFavorite = [NSEntityDescription insertNewObjectForEntityForName:@"LogoFavorite" inManagedObjectContext:context];
    
    
    
    //NSLog(@"artworkNameAddFavString %@",artworkNameAddFavString);
    [newLogoFavorite setValue:self.artworkNameAddFavString forKey:@"artworkName"];
    
    [newLogoFavorite setValue:self.urlFavString forKey:@"fullImageURL"];
    [newLogoFavorite setValue:self.artworkCompanyAddFavString forKey:@"company"];
    [newLogoFavorite setValue:self.artworkSellerAddFavString forKey:@"seller"];
    [newLogoFavorite setValue:self.artworkColorAddFavString forKey:@"color"];
    [newLogoFavorite setValue:self.artworkSizeAddFavString forKey:@"artworkSize"];
    [newLogoFavorite setValue:self.artworkIDAddFavString forKey:@"productID"];
    [newLogoFavorite setValue:self.artworkLocationIDAddFavString forKey:@"locationID"];
    [newLogoFavorite setValue:self.artworkFormatAddFavString forKey:@"format"];
    
    
    
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        //NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }

    
    
    
    
   
    
    
    //NSLog(@"favoritesArray %@",_favoritesArray);
    
}


-(IBAction)goSearch:(id)sender{
    
   [activityIndicator startAnimating];
    
    if( searchField.text!= Nil || [searchField.text length] == 0 ) {
        
        
        NSString*searchOneString= searchField.text;
        
       
        
        int stringLength = [searchOneString length];
        NSRange range = NSMakeRange(0, stringLength);
        NSString *newString = [searchOneString stringByReplacingOccurrencesOfString:@" " withString:@"%20" options:NSCaseInsensitiveSearch range:range];
        
        newString = [newString stringByReplacingOccurrencesOfString:@"'" withString:@"" options:NSCaseInsensitiveSearch range:range];
        
        newString = [newString stringByReplacingOccurrencesOfString:@"!" withString:@"" options:NSCaseInsensitiveSearch range:range];
        
        newString = [newString stringByReplacingOccurrencesOfString:@"-" withString:@"" options:NSCaseInsensitiveSearch range:range];

        
        NSLog(@"Old String: '%@' --> New String: '%@'", searchOneString, newString);

    
        
    
    
    NSString*urlSearchString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/?searchString=%@&Orderby=mostPopular&interactiveOnly=1&locationID=-1&userID=0", newString];
    

    
    
    NSURL *urlSearch = [[NSURL alloc] initWithString:urlSearchString];
    NSURLRequest *request = [NSURLRequest requestWithURL:
                                 urlSearch];

    
    //NSLog(@"URLLOGIN: %@",urlSearch);
    
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse *response,
                                                   NSData *data,
                                                   NSError *connectionError) {
                                   // handle response
                               }];
        
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithURL:urlSearch
                completionHandler:^(NSData *data,
                                    NSURLResponse *response,
                                    NSError *error) {
                    // handle response
                    
                }] resume];

    
    NSError *error = nil;
    NSData *data = [NSData dataWithContentsOfURL:urlSearch];
    
    
    
    
    
    //parse Array from web
    NSArray *searchLogoArray = [NSJSONSerialization
                                JSONObjectWithData:data
                                options:NSJSONReadingAllowFragments
                                error: &error];
    
    
    
    
    
    
    artworkCount= searchLogoArray.count;
    
    
    NSString*urlSearchMatString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/?searchString=%@&Orderby=mostPopular&interactiveOnly=0&locationID=-1&userID=0", newString];
    
    
    
    
        
        
    NSURL *urlSearchMat = [[NSURL alloc] initWithString:urlSearchMatString];
    NSURLRequest *requestMat = [NSURLRequest requestWithURL:
                                 urlSearchMat];
    
    
   // NSLog(@"URLSearchMat: %@",urlSearchMat);
    NSError *errorMat = nil;
    NSData *dataMat = [NSData dataWithContentsOfURL:urlSearchMat];//
    
        //NSLog(@"URLLOGIN: %@",urlSearch);
        
        [NSURLConnection sendAsynchronousRequest:requestMat
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse *response,
                                                   NSData *dataMat,
                                                   NSError *connectionError) {
                                   // handle response
                               }];
        
        NSURLSession *sessionMat = [NSURLSession sharedSession];
        [[sessionMat dataTaskWithURL:urlSearchMat
                completionHandler:^(NSData *dataMat,
                                    NSURLResponse *response,
                                    NSError *errorMat) {
                    // handle response
                    
                }] resume];
        
        
        //NSError *errorMat = nil;
        //NSData *dataMat = [NSData dataWithContentsOfURL:urlSearch];

    
    //parse Array from web
    NSArray *searchMatArray = [NSJSONSerialization
                               JSONObjectWithData:dataMat
                               options:NSJSONReadingAllowFragments
                               error: &errorMat];
    
    
    
    matCount= searchMatArray.count;
    
        
    
    [searchLogoArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
        
        //NSLog(@"%@", object);
        //NSLog(@"searchLogoArray %@",searchLogoArray);
        
        
        artworkNameArray = [searchLogoArray valueForKey:@"ArtworkName"];
        
        
       
        
        
        artworkSizeArray = [searchLogoArray valueForKey:@"ArtworkSize"];
        artworkFormatArray = [searchLogoArray valueForKey:@"Format"];
        artworkFullImageArray = [searchLogoArray valueForKey:@"FullImageURL"];
        artworkIconArray = [searchLogoArray valueForKey:@"IconURL"];
        artworkIDArray = [searchLogoArray valueForKey:@"ProductID"];
        artworkCompanyArray = [searchLogoArray valueForKey:@"CompanyName"];
        artworkSellerArray = [searchLogoArray valueForKey:@"Seller"];
        artworkColorArray = [searchLogoArray valueForKey:@"Color"];
        
        
        
        
        
    }];
    
    
    [searchMatArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
        
        
        
        
        matNameArray = [searchMatArray valueForKey:@"ArtworkName"];
        matSizeArray = [searchMatArray valueForKey:@"ArtworkSize"];
        matFormatArray = [searchMatArray valueForKey:@"Format"];
        matFullImageArray = [searchMatArray valueForKey:@"FullImageURL"];
        matIconArray = [searchMatArray valueForKey:@"IconURL"];
        matIDArray = [searchMatArray valueForKey:@"ProductID"];
        matColorArray = [searchMatArray valueForKey:@"Color"];
        matBGColorArray = [searchMatArray valueForKey:@"BGColor"];
        matCompanyArray = [searchMatArray valueForKey:@"CompanyName"];
        matSellerArray = [searchMatArray valueForKey:@"Seller"];
        
        
        [activityIndicator stopAnimating];
        
        
    }];

    
    }
    
    
}



- (IBAction)presentLogoCollectionViewController:(UIButton *)sender{
    
    UIStoryboard *storyboard = self.storyboard;
    LogoCollectionViewController *searchvc = [storyboard instantiateViewControllerWithIdentifier:@"LogoViewBoard"];
    
    // Configure the new view controller here.
    [self presentViewController:searchvc animated:YES completion:nil];
    
    
}
- (IBAction)undoMaskClicked:(id)sender{
    
    NSArray *directoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *imagePathUndo =  [directoryPath objectAtIndex:0];
    imagePathUndo= [imagePathUndo stringByAppendingPathComponent:@"undoLogoImage.png"];
    
    
    NSData *data = [NSData dataWithContentsOfFile:imagePathUndo];
    UIImage *logoImageUndo = [UIImage imageWithData:data];
    chosenImageView.image=logoImageUndo;
    
    //write new Image for use on logo
    UIImage*croppedLogoImage = chosenImageView.image;
    
    //rewrite image to crop it correctly
    UIGraphicsBeginImageContext(croppedLogoImage.size);
    [croppedLogoImage drawAtPoint:CGPointZero];
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //return [UIImage imageWithCGImage:myColorMaskedImage];
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/logoImage.png"]];
    [UIImagePNGRepresentation(newImg) writeToFile:imagePath atomically:NO];
    
    
    
}
//hits this on crop not on draw mask???
- (IBAction)maskButtonClicked:(id)sender
{
    
    
    chosenImageView.image = [self maskImage:chosenImageView.image withMask:[UIImage imageNamed:@"MaskWhiteSquare13"]];
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
    
    chosenImageView.image = newImg;

    maskSquareImageView.hidden= YES;
    
    
    
    
    
}

- (IBAction)maskSquareButton:(id)sender{
    
    
    //save existing image for possible undo
    UIImage*undoLogoImage = chosenImageView.image;
    NSString  *imagePathUndo = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/undoLogoImage.png"]];
    [UIImagePNGRepresentation(undoLogoImage) writeToFile:imagePathUndo atomically:NO];
    //end undo code
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
    
    //NSLog(@"chosenImage %@",selectedImage);
    
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
    
    //NSLog(@"chosenImage %@",selectedImage);
    
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
    
    //NSLog(@"chosenImage %@",selectedImage);
    
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/logoImage.png"]];
    //[UIImageJPEGRepresentation(newImage, 1.0) writeToFile:imagePath atomically:YES];
    
    [UIImagePNGRepresentation(newImage) writeToFile:imagePath atomically:YES];
    
    [logoPicButton setBackgroundImage:newImage forState:UIControlStateNormal];
    // [profilePictureHandle writeData:UIImagePNGRepresentation(croppedImage)];
    
    
    
    
}





- (IBAction)screenShot:(UIButton *)sender{
    
    alertInteractive=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Add a name for your Logo"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
    alertInteractive.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    
    
    
    alertInteractive.tag = 1;
    [alertInteractive show];

    
    //begin capture entire webview
    //CGRect screenRect = self->overlayWebView.frame;
    
    //CGRect screenRect = CGRectMake(680.0f, 413.0f, 504.0f, 504.0f);
    CGRect screenRect = CGRectMake(666.0f, 374.0f, 604.0f, 458.0f);

    UIGraphicsBeginImageContext(screenRect.size);

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] set];
    CGContextFillRect(ctx, screenRect);

    [googleWebView.layer renderInContext:ctx];

    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    
   
    
    chosenImageView.image = newImage;
    //chosenImage = newImage;
    
    //NSLog(@"chosenImage %@",selectedImage);
    
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/logoImage.png"]];
    
    [UIImagePNGRepresentation(newImage) writeToFile:imagePath atomically:YES];
    
    [logoPicButton setBackgroundImage:newImage forState:UIControlStateNormal];
  
    
    
   
    
}

//Not Used
/*- (IBAction)drawCircle:(UIButton*)sender{
    
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

    
}*/



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
    
    
    
    //writes masked image to documents
    NSString  *imagePath1 = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/myMaskImage.jpg"]];
    
    
    [UIImagePNGRepresentation(myClippingImage) writeToFile:imagePath1 atomically:YES];
    
    
    CGContextRestoreGState(context);

    
    UIGraphicsEndImageContext();
    
  
    
    
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
    
    [chosenImageView.layer renderInContext:ctx];
   // [googleWebView.layer renderInContext:ctx];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    chosenImageView.image = newImage;
    //NSLog(@"chosenImage %@",selectedImage);
    
    
    
    [[UIColor clearColor] set];
    
    CGRect screenRect = CGRectMake(180.0f, 290.0f, 228.0f, 228.0f);
    
    
    CGContextFillRect(ctx, screenRect);
    
    
    
    [chosenImageView setOpaque:NO];
   
    [chosenImageView setBackgroundColor:[UIColor clearColor]];
    
    
    UIImage *image1 = UIGraphicsGetImageFromCurrentImageContext();
    
    NSString  *imagePath3 = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/logoImageClear.png"]];
    
    
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
    
    
   
    
     interactiveHeaderString = @"Create Mat";
    
    
    
    [self performSegueWithIdentifier:@"ImagePickedSegue" sender:sender];
    
    
    
    
    
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
        NSString *strURL = @"http://www.images.google.com";
        //NSString *strURL = @"http://www.google.com";
        NSURL *url = [NSURL URLWithString:strURL];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
        [self->googleWebView loadRequest:urlRequest];
        
        
    }
    
    else {
        
        overlay1WebView.hidden= YES;
        editLogoButton.hidden =YES;
        editImageView.hidden = YES;
        NSString *strURL = @"http://www.images.google.com";
        //NSString *strURL = @"http://www.google.com";
        NSURL *url = [NSURL URLWithString:strURL];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
        [self->googleWebView loadRequest:urlRequest];
        
        
    }

    
    
}

-(BOOL) countOfAlert {
    for (UIWindow* window in [UIApplication sharedApplication].windows) {
        NSArray* subviews = window.subviews;
        if ([subviews count] > 0) {
            
            BOOL alert = [[subviews objectAtIndex:0] isKindOfClass:[UIAlertView class]];
            BOOL action = [[subviews objectAtIndex:0] isKindOfClass:[UIActionSheet class]];
            
            if (alert || action)
                return YES;
        }
    }
    return NO;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    
}

- (void)dealloc {
    
}


@end
