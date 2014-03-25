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

@interface ImagePickerViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    
    AppDelegate *appdelegate;
    MyDraggableImage*MyDragRect;
    UIImage *chosenImage;
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
    IBOutlet UILabel*chosenImageLabel;
    IBOutlet UIWebView*googleWebView;
    IBOutlet UIView*overlayWebView;
    IBOutlet UIView*overlay1WebView;
    
    IBOutlet UIButton*editLogoButton;
    IBOutlet UIButton*googleButton;
    
    UIImagePickerController*picker;
}


- (IBAction)selectPhoto:(UIButton *)sender;
- (IBAction)goWeb:(UIButton *)sender;
- (IBAction)editLogo:(UIButton *)sender;
- (IBAction)drawEllipse:(CGContextRef)context;
- (IBAction)drawCircle:(UIButton *)sender;
- (IBAction)drawRect:(UIButton*)sender;
- (IBAction)getPoints:(UIButton*)sender;

- (void)setNeedsDisplay;

@end
