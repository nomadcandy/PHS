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
    
    IBOutlet UIImageView*maskCircleImageView;
    IBOutlet UIImageView*maskSquareImageView;
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
    
    IBOutlet UITextField*searchField;
    
    IBOutlet UITextField*sellerField;
    IBOutlet UITextField*nameField;
    IBOutlet UITextField*companyField;
    IBOutlet UITextField*numberField;
    
    
    NSString*sellerString;
    NSString*nameString;
    NSString*companyString;
    NSString*numberString;
   
    int artworkCount;
    int matCount;
    
    
    
    
    UIImagePickerController*picker;
    
    CGFloat _lastScale;
	CGFloat _lastRotation;
	CGFloat _firstX;
	CGFloat _firstY;
    
    UIView *canvas;
    
    CGImageRef masked;
}


- (IBAction)presentLogoCollectionViewController:(UIButton *)sender;

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

-(IBAction)goSearch:(id)sender;

@property (nonatomic, copy) NSMutableArray *artworkNameArray;
@property (nonatomic, copy) NSMutableArray *artworkSizeArray;
@property (nonatomic, copy) NSMutableArray *artworkFormatArray;
@property (nonatomic, copy) NSMutableArray *artworkFullImageArray;
@property (nonatomic, copy) NSMutableArray *artworkIconArray;
@property (nonatomic, copy) NSMutableArray *artworkIDArray;
@property (nonatomic, copy) NSMutableArray *artworkInfoArray;
@property (nonatomic, copy) NSMutableArray *artworkCompanyArray;
@property (nonatomic, copy) NSMutableArray *artworkSellerArray;




@property (nonatomic, copy) NSMutableArray *matNameArray;
@property (nonatomic, copy) NSMutableArray *matSizeArray;
@property (nonatomic, copy) NSMutableArray *matFormatArray;
@property (nonatomic, copy) NSMutableArray *matFullImageArray;
@property (nonatomic, copy) NSMutableArray *matIconArray;
@property (nonatomic, copy) NSMutableArray *matIDArray;
@property (nonatomic, copy) NSMutableArray *matInfoArray;
@property (nonatomic, copy) NSMutableArray *matSellerArray;
@property (nonatomic, copy) NSMutableArray *matCompanyArray;
@property (nonatomic, copy) NSMutableArray *matColorArray;
@property (nonatomic, copy) NSMutableArray *matBGColorArray;


@property (nonatomic, assign) int artworkCount;
@property (nonatomic, assign) int matCount;

@property (nonatomic, retain) IBOutlet UITextField *searchField;

@property (nonatomic, retain) IBOutlet UITextField *sellerField;
@property (nonatomic, retain) IBOutlet UITextField *nameField;
@property (nonatomic, retain) IBOutlet UITextField *companyField;
@property (nonatomic, retain) IBOutlet UITextField *numberField;

@property (nonatomic, retain) NSString *sellerString;
@property (nonatomic, retain) NSString *nameString;
@property (nonatomic, retain) NSString *companyString;
@property (nonatomic, retain) NSString *numberString;



@property (nonatomic, retain) IBOutlet UIImageView *maskSquareImageView;
@property (nonatomic, strong) IBOutlet UIImageView *maskCircleImageView;

@property (nonatomic, retain) IBOutlet UIButton *maskCircleButton;
@property (nonatomic, strong) IBOutlet UIButton *maskSquareButton;

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
