//
//  PDFBigViewController.m
//  Millenium
//
//  Created by Jami Sue Becker on 6/10/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import "PDFBigViewController.h"

@interface PDFBigViewController ()

@end

@implementation PDFBigViewController

@synthesize pdfImageView,selectedString,selectedPdfString;


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
   
    UIImage *pdfImage= [UIImage imageNamed:selectedPdfString];
    pdfImageView.image =pdfImage;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)goPDFViewController:(UIButton *)sender {
    
    UIStoryboard *storyboard = self.storyboard;
    PDFViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"PDFStoryboard"];
    [self presentViewController:vc animated:YES completion:nil];
    
}


- (IBAction)goHome:(UIButton *)sender {
    
    UIStoryboard *storyboard = self.storyboard;
    ViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"HomeStoryboard"];
    [self presentViewController:vc animated:YES completion:nil];
    
    
}

-(IBAction)goMail:(UIButton*)sender event:(id)event {
    
    CGRect screenRect2 = CGRectMake(0.0,0,1028,720);
    UIGraphicsBeginImageContext(screenRect2.size);
    
    
    CGContextRef ctx1 = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] set];
    CGContextFillRect(ctx1, screenRect2);
    
    [self.view.layer renderInContext:ctx1];
    
    UIImage *pdfImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();

    MFMailComposeViewController*mailComposer;
    
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/pdfImage.jpg"]];
    [UIImageJPEGRepresentation(pdfImage, 1.0) writeToFile:imagePath atomically:YES];

    
    
    /*mailComposer = [[MFMailComposeViewController alloc] init];
    mailComposer.mailComposeDelegate=self;*/
    
    NSString *emailTitle = @"Cintas Flier Request";
    
    NSArray *directoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *imagePath2 =  [directoryPath objectAtIndex:0];
    imagePath2= [imagePath2 stringByAppendingPathComponent:@"pdfImage.jpg"];
    
    NSData *data = [NSData dataWithContentsOfFile:imagePath2];
    UIImage *image = [UIImage imageWithData:data];
    
    
    
    
    
    
    /*NSString*firstNameString= firstNameField.text;
    NSString*lastNameString= lastNameField.text;
    NSString*emailString= emailField.text;
    NSString*phoneString= telephoneField.text;
    
    NSString*addressString= addressField.text;
    NSString*cityString= cityField.text;
    NSString*countryString= countryField.text;
    NSString*notesString= notesField.text;*/
    
    
    //NSLog(@"%@",lastNameString);
    
   /* NSString*messageString = [NSString stringWithFormat:@"%@  %@, %@, %@, %@, %@, %@, %@",firstNameString,lastNameString,emailString,phoneString,addressString,cityString,countryString,notesString];
    
    NSString *messageBody = messageString;*/
    
    
    
    //NSArray *toRecipents = [NSArray arrayWithObject:emailString];
    //NSArray *toRecipents = @"yummy@nomadcandy.com";
    
   MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc addAttachmentData:data mimeType:@"image/jpeg" fileName:@"pdfImage.jpg"];
    //[mc setMessageBody:messageBody isHTML:NO];
    
    NSMutableArray*recipients=[[NSMutableArray alloc]init];
    [mc setToRecipients:recipients];
    
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
