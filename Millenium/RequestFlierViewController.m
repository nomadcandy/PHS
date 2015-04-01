//
//  RequestFlierViewController.m
//  Millenium
//
//  Created by Jami Sue Becker on 3/26/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import "RequestFlierViewController.h"

@interface RequestFlierViewController ()

@end

@implementation RequestFlierViewController

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[firstNameField setKeyboardType:UIKeyboardAppearanceLight];

    firstNameField.keyboardAppearance = UIKeyboardAppearanceDefault;
    // Do any additional setup after loading the view.
}

- (IBAction)goHome:(UIButton*)sender
{
    UIStoryboard* storyboard = self.storyboard;
    ViewController* vc = [storyboard instantiateViewControllerWithIdentifier:@"HomeStoryboard"];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)goMail:(UIButton*)sender event:(id)event
{
    MFMailComposeViewController* mailComposer;

    mailComposer = [[MFMailComposeViewController alloc] init];
    mailComposer.mailComposeDelegate = self;

    NSString* emailTitle = @"Cintas Flier Request";

    NSString* firstNameString = firstNameField.text;
    NSString* lastNameString = lastNameField.text;
    NSString* emailString = emailField.text;
    NSString* phoneString = telephoneField.text;

    NSString* addressString = addressField.text;
    NSString* cityString = cityField.text;
    NSString* countryString = countryField.text;
    NSString* notesString = notesField.text;

    NSLog(@"%@", lastNameString);

    NSString* messageString = [NSString stringWithFormat:@"%@  %@, %@, %@, %@, %@, %@, %@", firstNameString, lastNameString, emailString, phoneString, addressString, cityString, countryString, notesString];

    NSString* messageBody = messageString;

    //NSArray *toRecipents = [NSArray arrayWithObject:emailString];
    //NSArray *toRecipents = @"yummy@nomadcandy.com";

    MFMailComposeViewController* mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];

    //[mc setToRecipients:toRecipents];

    NSMutableArray* recipients = [[NSMutableArray alloc] init];

    [mailComposer setToRecipients:recipients];

    [self presentViewController:mc animated:YES completion:NULL];

    /*UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Your invites have been sent" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
     
     [alert show];*/
}

// The mail compose view controller delegate method
- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
