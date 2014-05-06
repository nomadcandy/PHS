//
//  ImagePickerViewController.h
//  Millenium
//
//  Created by Jami Sue Becker on 3/21/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "InteractiveViewController.h"
#import "MyDraggableImage.h"
#import "MaskView.h"
#import <QuartzCore/QuartzCore.h>

@interface ImagePickerViewController : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate,NSURLConnectionDelegate,NSURLConnectionDataDelegate, UIGestureRecognizerDelegate>
{
    
    AppDelegate *appdelegate;
    MyDraggableImage*MyDragRect;
    //UIImage *chosenImage;
    //UIImage*newImage;
    UIImage*selectedImage;
    UIImage*myClippingImage;
    //CGRect*rectFrame;
    CGRect*rectFrame;
    CGPoint*startPoint;
    CGPoint*endPoint;
    
    CGPoint firstPoint;
    CGPoint secondPoint;
    CGPoint thirdPoint;
    CGPoint fourthPoint;
    
    UITouch *touch;
    UITouch *touch1;
    UITouch *touch2;
    UITouch *touch3;
    UITouch *touch4;
    
    //IBOutlet UIView*maskView;
    
    NSMutableArray*touchesArray;
    
    
    CGFloat*rectPoint1;
    CGFloat*rectPoint2;
    CGFloat*rectPoint3;
    CGFloat*rectPoint4;
    
    IBOutlet UIImageView*mask1ImageView;
    IBOutlet UIImageView*chosenImageView;
    IBOutlet UIImageView*editImageView;
    IBOutlet UIImageView*longHoldImageView;
    IBOutlet UILabel*chosenImageLabel;
    IBOutlet UIWebView*googleWebView;
    IBOutlet UIView*overlayWebView;
    IBOutlet UIView*overlay1WebView;
    
    IBOutlet UIButton*editLogoButton;
    IBOutlet UIButton*googleButton;
    IBOutlet UIButton*homeButton;
    
    UIImagePickerController*picker;
    
    CGFloat _lastScale;
	CGFloat _lastRotation;
	CGFloat _firstX;
	CGFloat _firstY;
    
    UIView *canvas;
    
    CGImageRef masked;
}


- (IBAction)selectPhoto:(UIButton *)sender;
- (IBAction)goWeb:(UIButton *)sender;
- (IBAction)editLogo:(UIButton *)sender;
- (IBAction)drawEllipse:(CGContextRef)context;
- (IBAction)drawCircle:(UIButton *)sender;
- (IBAction)drawRect:(UIButton*)sender;
- (IBAction)getPoints:(UIButton*)sender;
- (IBAction)cropScreenShot:(UIButton*)sender;
- (IBAction)maskImage:(id)sender ;

- (IBAction)screenShotRect:(UIButton *)sender;

@property (nonatomic, retain) IBOutlet UIView *canvas;
@property (nonatomic, strong) IBOutlet UIButton *logoPicButton;

@property(nonatomic, strong) NSMutableData *imageData;
@property(nonatomic, assign) float length;
//@property (nonatomic, strong) UIImage *chosenImage;
@property (nonatomic, strong) UIImage *selectedImage;
@property (nonatomic, strong) IBOutlet UIImageView *chosenImageView;
- (void)setNeedsDisplay;
- (void)saveLocally:(NSData *)imgData;
//- (UIImage*) maskImage:(UIImage *)image withMask:(UIImage *)maskImage;
- (IBAction)maskButtonClicked:(id)sender;
- (IBAction) imageMoved:(id) sender withEvent:(UIEvent *) event;


@end
