//
//  LoginViewController.h
//  Millenium
//
//  Created by Jami Sue Becker on 6/11/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface LoginViewController : UIViewController



@property (nonatomic, strong) IBOutlet UITextField *loginField;
@property (nonatomic, strong) IBOutlet UITextField *passwordField;
@property (nonatomic, strong) IBOutlet UIButton *goButton;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (nonatomic, copy) NSString *firstNameString;
@property (nonatomic, copy) NSString *lastNameString;
@property (nonatomic, copy) NSString *locationIDString;
@property (nonatomic, copy) NSString *locationNameString;
@property (nonatomic, copy) NSString *locationNumberString;
@property (nonatomic, copy) NSString *errorMessageString;
@property (nonatomic, copy) NSString *userIDString;
@property (nonatomic, copy) NSString *accessString;
@property (nonatomic, copy) NSArray*locationIDArray;



@end
