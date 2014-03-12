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

@interface InteractiveViewController : UIViewController<iCarouselDataSource,iCarouselDataSource>{
    
    IBOutlet UIView *interactiveView;
}

@property (nonatomic, strong) IBOutlet UIView *interactiveView;
@property (nonatomic, strong) IBOutlet UIButton *uploadLogoButton;
@property (nonatomic, strong) IBOutlet UIButton *internetLogoButton;
@property (nonatomic, strong) IBOutlet UIButton *nearLogoButton;
@property (nonatomic, strong) IBOutlet UIButton *searchLogoButton;
@property (nonatomic, strong) IBOutlet iCarousel *carousel;

-(IBAction)backButton:(id)sender;

@end
