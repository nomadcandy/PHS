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

@interface InteractiveViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate,  iCarouselDataSource,iCarouselDataSource,DIYMenuDelegate>{
    
    IBOutlet UIView *interactiveView;
    
    MyDraggableImage*MyDragRect;
    IBOutlet UIButton*logoButton;
    AppDelegate *appdelegate;
    UIImage *chosenImage;
}

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


@property (nonatomic, strong) NSString *actionSelectedString;
@property (nonatomic, strong) NSString *matSizeString;
@property (nonatomic, strong) NSString *matColorString;

@property (nonatomic, strong) NSString *matColorUseString;
@property (nonatomic, strong) NSString *matSizeUseString;

@property (nonatomic, strong) UIImage *chosenImage;


@property (nonatomic, strong) IBOutlet iCarousel *carouselSize;
@property (nonatomic, strong) IBOutlet iCarousel *carouselColor;
@property (nonatomic, strong) IBOutlet iCarousel *carouselLogo;

-(IBAction)backButton:(id)sender;
- (IBAction) imageMoved:(id) sender withEvent:(UIEvent *) event;

@end
