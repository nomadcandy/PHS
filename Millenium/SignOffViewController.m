//
//  SignOffViewController.m
//  Millenium
//
//  Created by Jami Sue Becker on 4/5/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import "SignOffViewController.h"

@interface SignOffViewController ()

@end

@implementation SignOffViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
	// Do any additional setup after loading the view.
}



- (IBAction)signOff:(UIButton*)sender{
    
    //overlay1WebView.hidden = NO;
    //overlaySignView.hidden = NO;
    
    //[editImageView setImage:selectedImage];
    
    SignView *signView = [[SignView alloc]initWithFrame:self.view.frame];
    signView.hidden = NO;
    [signView setOpaque:NO];
    
    //[signOffView addSubview:signView];
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    //CGContextFillRect(context, self.bounds);
    
    
}


- (IBAction)cropScreenShot:(UIButton*)sender{
    
   /* overlay1WebView.hidden = NO;
    overlayWebView.hidden = NO;
    
    [editImageView setImage:selectedImage];*/
    
    SignView *signView = [[MaskView alloc]initWithFrame:self.view.frame];
    signView.hidden = NO;
    [signView setOpaque:NO];
    
    //[overlay1WebView addSubview:maskView];
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] set];
    
    //CGContextFillRect(ctx, maskUse);
    //CGContextFillRect (__bridge CAShapeLayer *)(addPath[]);
    
    //[googleWebView.layer renderInContext:ctx];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    
    //chosenImageView.image = newImage;
    //chosenImage = newImage;
    //NSLog(@"chosenImage %@",selectedImage);
    
}


- (IBAction)goHome:(UIButton *)sender {
    
    UIStoryboard *storyboard = self.storyboard;
    ViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"HomeStoryboard"];
    [self presentViewController:vc animated:YES completion:nil];
    
    
}


-(IBAction)goMail:(UIButton*)sender event:(id)event {
    
    
    MFMailComposeViewController*mailComposer;
    
    
    
    
    mailComposer = [[MFMailComposeViewController alloc] init];
    mailComposer.mailComposeDelegate=self;
    
    NSString *emailTitle = @"Mat Approved";
    
    //NSString*firstNameString= firstNameField.text;
    //NSString*lastNameString= lastNameField.text;
    
    
    //NSLog(@"%@",lastNameString);
    
    
   // TODO add images to email to send
    //UIImage*matImage=[UIImage imageNamed:@"jadeteahouselogo.png"];
    //UIImage*matImage=[UIImage imageNamed:@"signature.png"];
    
    //NSString*messageString = [NSString stringWithFormat:@"%@  %@, %@, %@, %@, %@, %@, %@",firstNameString,lastNameString,emailString,phoneString,addressString,cityString,countryString,notesString];
    
    NSString*messageString = @"This mat requires your approval";
    
    
    //TODO add string and images to email
    NSString *messageBody = messageString;
    
    
    
    //NSArray *toRecipents = [NSArray arrayWithObject:emailString];
    //NSArray *toRecipents = @"yummy@nomadcandy.com";
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    
    //[mc setToRecipients:toRecipents];
    
    NSMutableArray*recipients=[[NSMutableArray alloc]init];
    
    [mailComposer setToRecipients:recipients];
    
    [self presentViewController:mc animated:YES completion:NULL];
    
    /*UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Your invites have been sent" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
     
     [alert show];*/
    
    
}

// The mail compose view controller delegate method
- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error
{
    [self dismissModalViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
