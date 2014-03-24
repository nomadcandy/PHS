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

@interface ImagePickerViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    
    AppDelegate *appdelegate;
    UIImage *chosenImage;
    IBOutlet UIImageView*chosenImageView;
    IBOutlet UIImageView*editImageView;
    IBOutlet UILabel*chosenImageLabel;
    IBOutlet UIWebView*googleWebView;
    UIImagePickerController*picker;
}


- (IBAction)selectPhoto:(UIButton *)sender;
- (IBAction)goWeb:(UIButton *)sender;
- (IBAction)editLogo:(UIButton *)sender;
- (IBAction)drawEllipse:(CGContextRef)context;
- (IBAction)drawCircle:(UIButton *)sender;

@end
