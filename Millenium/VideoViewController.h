//
//  VideoViewController.h
//  Millenium
//
//  Created by Jami Sue Becker on 3/27/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "iCarousel.h"
#import "MarketingViewController.h"
#import "ViewController.h"



@interface VideoViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>{


    IBOutlet UIViewController*viewController;
    
}

@property (copy,   nonatomic) NSURL *movieURL;
@property (strong, nonatomic) MPMoviePlayerController *movieController;
@property (nonatomic, strong) IBOutlet UILabel *label;


@property (nonatomic, strong) IBOutlet iCarousel *carouselLogo;
@property (nonatomic, strong) IBOutlet iCarousel *carouselIndoor;
@property (nonatomic, strong) IBOutlet iCarousel *carouselIndoorOutdoor;
@property (nonatomic, strong) IBOutlet iCarousel *carouselIndoorScraper;
@property (nonatomic, strong) IBOutlet iCarousel *carouselUtilityMats;
@property (nonatomic, strong) IBOutlet iCarousel *carouselAntiFatigue;

- (IBAction)pressedButton:(id)sender;
- (IBAction)goHome:(UIButton *)sender;
- (IBAction)buttonTappedWalkOffLogoMat:(UIButton *)sender;



@end
