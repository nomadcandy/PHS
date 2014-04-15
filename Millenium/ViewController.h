//
//  ViewController.h
//  Millenium
//
//  Created by Jami Sue Becker on 3/10/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import "DirectViewController.h"
#import "RentalViewController.h"
#import "InteractiveViewController.h"
#import "MarketingViewController.h"
#import "SearchViewController.h"
#import "SketchRequestViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>


@interface ViewController : UIViewController <iCarouselDataSource, iCarouselDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate>

{
    IBOutlet UIButton*cleanButton;
    IBOutlet UIButton*goButton;
    IBOutlet UIViewController*InteractiveViewController;
    IBOutlet UIImageView*charlesView;
    IBOutlet UIImageView*charlesBGView;
    IBOutlet UIImageView*loginView;
    IBOutlet UITextField*loginField;
    IBOutlet UITextField*passwordField;
    
}

@property (copy,   nonatomic) NSURL *movieURL;
@property (strong, nonatomic) MPMoviePlayerController *movieController;

@property (nonatomic, strong) IBOutlet UIViewController *InteractiveViewController;
@property (nonatomic, strong) IBOutlet iCarousel *carousel;
@property (nonatomic, strong) IBOutlet UILabel *label;

@property (nonatomic, strong) IBOutlet UIImageView *loginView;
@property (nonatomic, strong) IBOutlet UITextField *loginField;
@property (nonatomic, strong) IBOutlet UITextField *passwordField;
@property (nonatomic, strong) IBOutlet UIButton *goButton;




-(IBAction)showLogin:(id)sender;
-(IBAction)goLogin:(id)sender;
-(IBAction)hideLogin:(id)sender;


-(IBAction)playClean:(id)sender;
-(IBAction)playPro:(id)sender;
-(IBAction)playFriendly:(id)sender;

-(IBAction)pressedButton:(id)sender;
-(IBAction)toggledSwitch:(id)sender;
-(IBAction)changedSlider:(id)sender;
-(IBAction)presentInteractiveViewController:(UIButton *)sender;


@end


