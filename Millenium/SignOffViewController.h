//
//  SignOffViewController.h
//  Millenium
//
//  Created by Jami Sue Becker on 4/5/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//
#import <MessageUI/MessageUI.h>
#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "SignView.h"
#import "InteractiveViewController.h"

@interface SignOffViewController : UIViewController <MFMailComposeViewControllerDelegate> {
}

@property (nonatomic, strong) IBOutlet UIImageView* matImageView;
@property (nonatomic, strong) IBOutlet UIImageView* logoImageView;
@property (nonatomic, strong) IBOutlet UIView* signOffView;
@property (nonatomic, strong) UIImage* matImage;
@property (nonatomic, strong) UIImage* logoImage;

- (IBAction)goHome:(UIButton*)sender;
- (IBAction)goMail:(UIButton*)sender event:(id)event;
- (IBAction)signOff:(UIButton*)sender;

@end
