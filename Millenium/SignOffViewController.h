//
//  SignOffViewController.h
//  Millenium
//
//  Created by Jami Sue Becker on 4/5/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "SignView.h"

@interface SignOffViewController : UIViewController


@property (nonatomic, strong) IBOutlet UIView *signOffView;
- (IBAction)goHome:(UIButton *)sender;
-(IBAction)goMail:(UIButton*)sender event:(id)event;
- (IBAction)signOff:(UIButton*)sender;

@end
