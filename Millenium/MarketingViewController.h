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

    
}



@property (nonatomic, strong) IBOutlet iCarousel *carousel;
@property (nonatomic, strong) IBOutlet UILabel *label;

- (IBAction)pressedButton:(id)sender;

@end
