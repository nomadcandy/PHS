//
//  ViewController.h
//  Millenium
//
//  Created by Jami Sue Becker on 3/10/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import "InteractiveViewController.h"
#import "MarketingViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>


@interface ViewController : UIViewController <iCarouselDataSource, iCarouselDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate>

{
    IBOutlet UIButton*cleanButton;
    IBOutlet UIViewController*InteractiveViewController;
}

@property (copy,   nonatomic) NSURL *movieURL;
@property (strong, nonatomic) MPMoviePlayerController *movieController;

@property (nonatomic, strong) IBOutlet UIViewController *InteractiveViewController;
@property (nonatomic, strong) IBOutlet iCarousel *carousel;
@property (nonatomic, strong) IBOutlet UILabel *label;

- (IBAction)playClean:(id)sender;

- (IBAction)pressedButton:(id)sender;
- (IBAction)toggledSwitch:(id)sender;
- (IBAction)changedSlider:(id)sender;
- (IBAction)presentInteractiveViewController:(UIButton *)sender;


@end


