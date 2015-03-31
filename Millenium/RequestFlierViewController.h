//
//  RequestFlierViewController.h
//  Millenium
//
//  Created by Jami Sue Becker on 3/26/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import <Social/Social.h>
#import <MessageUI/MessageUI.h>

@interface RequestFlierViewController : UIViewController <MFMailComposeViewControllerDelegate> {
    IBOutlet UITextField* firstNameField;
    IBOutlet UITextField* lastNameField;
    IBOutlet UITextField* emailField;
    IBOutlet UITextField* telephoneField;
    IBOutlet UITextField* addressField;
    IBOutlet UITextField* cityField;
    IBOutlet UITextField* stateField;
    IBOutlet UITextField* countryField;
    IBOutlet UITextField* zipField;
    IBOutlet UITextField* notesField;

    IBOutlet UIButton* submitButton;
}

- (IBAction)goHome:(UIButton*)sender;

@end
