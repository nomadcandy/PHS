//
//  MarketingViewController.h
//  Millenium
//
//  Created by Jami Sue Becker on 3/26/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import "RequestFlierViewController.h"
#import "ViewController.h"
#import "VideoViewController.h"

@interface MarketingViewController : UIViewController <iCarouselDataSource, iCarouselDelegate>{
    
    IBOutlet UIView*logoMatsView;
    IBOutlet UIView*indoorMatsView;
    IBOutlet UIView*indoorOutdoorMatsView;
    IBOutlet UIView*indoorScraperMatsView;
    IBOutlet UIView*utilityMatsView;
    IBOutlet UIView*antiFatigueView;
    
    IBOutlet UIButton*logoMatsButton;
    IBOutlet UIButton*indoorMatsButton;
    IBOutlet UIButton*indoorOutdoorMatsButton;
    IBOutlet UIButton*indoorScraperMatsButton;
    IBOutlet UIButton*utilityMatsButton;
    IBOutlet UIButton*antiFatigueButton;
    
    IBOutlet UIButton*goVideoButton;
    
    IBOutlet UIViewController*viewController;

    
}




@property (nonatomic, strong) IBOutlet UILabel *label;


@property (nonatomic, strong) IBOutlet iCarousel *carouselLogo;
@property (nonatomic, strong) IBOutlet iCarousel *carouselIndoor;
@property (nonatomic, strong) IBOutlet iCarousel *carouselIndoorOutdoor;
@property (nonatomic, strong) IBOutlet iCarousel *carouselIndoorScraper;
@property (nonatomic, strong) IBOutlet iCarousel *carouselUtilityMats;
@property (nonatomic, strong) IBOutlet iCarousel *carouselAntiFatigue;

- (IBAction)pressedButton:(id)sender;
- (IBAction)goHome:(UIButton *)sender;

@end
