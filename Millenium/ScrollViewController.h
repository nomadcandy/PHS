//
//  VideoScrollViewController.h
//  Millenium
//
//  Created by Jami Sue Becker on 6/6/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "iCarousel.h"
#import "MarketingViewController.h"
#import "ViewController.h"

@interface
ScrollViewController : UIViewController<UIScrollViewDelegate>{
    
    
}
@property (strong, nonatomic) MPMoviePlayerController *movieController;

@property (nonatomic, strong) IBOutlet UIScrollView*movieScrollView;
@property (nonatomic, strong) IBOutlet UIButton * walkOffLogoMatButton;
@property (nonatomic, strong) IBOutlet UIButton * waterGuardLogoInlayButton;

- (IBAction)buttonTappedWalkOffLogoMat:(UIButton *)sender;



@end
