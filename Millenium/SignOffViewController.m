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

@synthesize matImageView, logoImageView;

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

    NSArray* directoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* imagePath = [directoryPath objectAtIndex:0];
    imagePath = [imagePath stringByAppendingPathComponent:@"orderImage.jpg"];

    NSData* data = [NSData dataWithContentsOfFile:imagePath];
    UIImage* image = [UIImage imageWithData:data];

    matImageView.image = image;
    matImageView.contentMode = UIViewContentModeScaleAspectFit;
    //matImageView.contentMode = UIViewContentModeRedraw;
    //matImageView.contentMode = UIViewContentModeScaleAspectFill;
}

- (IBAction)signOff:(UIButton*)sender
{
    //overlay1WebView.hidden = NO;
    //overlaySignView.hidden = NO;

    //[editImageView setImage:selectedImage];

    SignView* signView = [[SignView alloc] initWithFrame:self.view.frame];
    signView.hidden = NO;
    [signView setOpaque:NO];

    //[signOffView addSubview:signView];

    //CGContextRef context = UIGraphicsGetCurrentContext();

    //CGContextFillRect(context, self.bounds);
}

- (IBAction)goHome:(UIButton*)sender
{
    UIStoryboard* storyboard = self.storyboard;
    ViewController* vc = [storyboard instantiateViewControllerWithIdentifier:@"HomeStoryboard"];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)goMail:(UIButton*)sender event:(id)event
{
    //CGRect screenRect2 = self.view.frame;
    //CGRect screenRect1 = CGRectMake(637.0,357.0,998,580);
    CGRect screenRect2 = CGRectMake(0.0, 0, 1028, 720);

    UIGraphicsBeginImageContext(screenRect2.size);
    //UIGraphicsBeginImageContext(interactiveMatView.size);

    CGContextRef ctx1 = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] set];
    CGContextFillRect(ctx1, screenRect2);

    [self.view.layer renderInContext:ctx1];

    UIImage* matImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    //save image to documents

    NSString* imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/matImage.jpg"]];
    [UIImageJPEGRepresentation(matImage, 1.0) writeToFile:imagePath atomically:YES];

    MFMailComposeViewController* mailComposer;

    mailComposer = [[MFMailComposeViewController alloc] init];
    mailComposer.mailComposeDelegate = self;

    NSString* emailTitle = @"Mat Approved";

    //NSString*firstNameString= firstNameField.text;
    //NSString*lastNameString= lastNameField.text;

    //NSLog(@"%@",lastNameString);

    //NSString*messageString = [NSString stringWithFormat:@"%@  %@, %@, %@, %@, %@, %@, %@",firstNameString,lastNameString,emailString,phoneString,addressString,cityString,countryString,notesString];

    NSString* messageString = @"This mat requires your approval";

    //TODO add string and images to email
    NSString* messageBody = messageString;

    //NSArray *toRecipents = [NSArray arrayWithObject:emailString];
    //NSArray *toRecipents = @"yummy@nomadcandy.com";

    MFMailComposeViewController* mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];

    //[mc setToRecipients:toRecipents];

    NSMutableArray* recipients = [[NSMutableArray alloc] init];

    NSArray* directoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* imagePath1 = [directoryPath objectAtIndex:0];
    imagePath1 = [imagePath1 stringByAppendingPathComponent:@"matImage.jpg"];

    NSData* data = [NSData dataWithContentsOfFile:imagePath1];
    //UIImage *image = [UIImage imageWithData:data];

    // Determine the file name and extension
    /* NSArray *filepart = [file componentsSeparatedByString:@"."];
    NSString *filename = [filepart objectAtIndex:0];
    NSString *extension = [filepart objectAtIndex:1];
    
    // Get the resource path and read the file using NSData
    NSString *filePath = [[NSBundle mainBundle] pathForResource:orderImage ofType:extension];
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];*/

    // Determine the MIME type
    /* NSString *mimeType;
    if ([extension isEqualToString:@"jpg"]) {
        mimeType = @"image/jpeg";
    } else if ([extension isEqualToString:@"png"]) {
        mimeType = @"image/png";
    } else if ([extension isEqualToString:@"doc"]) {
        mimeType = @"application/msword";
    } else if ([extension isEqualToString:@"ppt"]) {
        mimeType = @"application/vnd.ms-powerpoint";
    } else if ([extension isEqualToString:@"html"]) {
        mimeType = @"text/html";
    } else if ([extension isEqualToString:@"pdf"]) {
        mimeType = @"application/pdf";
    }*/

    // Add attachment
    [mc addAttachmentData:data mimeType:@"image/jpeg" fileName:@"matImage.jpg"];

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
    //[self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
