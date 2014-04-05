//
//  InteractiveViewController.h
//  Millenium
//
//  Created by Jami Sue Becker on 3/10/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "iCarousel.h"
#import "MyDraggableImage.h"
#import "DIYMenu.h"
#import "LogoCollectionViewController.h"
#import "ImagePickerViewController.h"
#import "AppDelegate.h"

@class InteractiveViewController;

/*@protocol logoStringDelegate <NSObject>

- (void)didSetString:(NSString *)logoUseString;*/


@protocol StringPickerProtocol <NSObject>

- (void)setString:(NSString *)string;


@end






@interface InteractiveViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate,  iCarouselDataSource,iCarouselDataSource,DIYMenuDelegate,StringPickerProtocol>{
    
    IBOutlet UIView *interactiveView;
    
    MyDraggableImage*MyDragRect;
    IBOutlet UIButton*logoButton;
    
    AppDelegate *appdelegate;
    UIImage *selectedImage;
    
    //NSString *logoUseStringHere;
    
     //__unsafe_unretained id <StringPickerProtocol> _delegate;
}

@property (nonatomic, weak) id <StringPickerProtocol> delegate;

@property (nonatomic, weak) NSString *logoUseStringHere;

@property (nonatomic, strong) IBOutlet UITextField *widthField;
@property (nonatomic, strong) IBOutlet UITextField *heightField;

@property (nonatomic, strong) IBOutlet UIView *interactiveView;
@property (nonatomic, strong) IBOutlet UIButton *uploadLogoButton;
@property (nonatomic, strong) IBOutlet UIButton *internetLogoButton;
@property (nonatomic, strong) IBOutlet UIButton *nearLogoButton;
@property (nonatomic, strong) IBOutlet UIButton *searchLogoButton;
@property (nonatomic, strong) IBOutlet UIButton *rugSizeButton;
@property (nonatomic, strong) IBOutlet UIButton *rugColorButton;

@property (nonatomic, strong) IBOutlet UIButton *homeButton;
@property (nonatomic, strong) IBOutlet UIButton *logoButton;
@property (nonatomic, strong) IBOutlet UIButton *matButton;
@property (nonatomic, strong) IBOutlet UIButton *logoPicButton;

@property (nonatomic, strong) IBOutlet UIButton *size2by3;
@property (nonatomic, strong) IBOutlet UIButton *size3by5;
@property (nonatomic, strong) IBOutlet UIButton *size4by6;
@property (nonatomic, strong) IBOutlet UIButton *size3by10;



@property (nonatomic, strong) NSString *actionSelectedString;
@property (nonatomic, strong) NSString *matSizeString;
@property (nonatomic, strong) NSString *matColorString;

@property (nonatomic, strong) NSString *matColorUseString;
@property (nonatomic, strong) NSString *matSizeUseString;

@property (nonatomic, strong) UIImage *selectedImage;


@property (nonatomic, strong) IBOutlet iCarousel *carouselSize;
@property (nonatomic, strong) IBOutlet iCarousel *carouselColor;
@property (nonatomic, strong) IBOutlet iCarousel *carouselLogo;

-(IBAction)backButton:(id)sender;
- (IBAction) imageMoved:(id) sender withEvent:(UIEvent *) event;

@end
