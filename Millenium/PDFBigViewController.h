//
//  PDFBigViewController.h
//  Millenium
//
//  Created by Jami Sue Becker on 6/10/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDFViewController.h"
#import "ViewController.h"
#import <Social/Social.h>
#import <MessageUI/MessageUI.h>

@interface PDFBigViewController : UIViewController <MFMailComposeViewControllerDelegate> {
}

@property (nonatomic, copy) NSString* selectedString;
@property (nonatomic, copy) NSString* selectedPdfString;
@property (nonatomic, strong) IBOutlet UIImageView* pdfImageView;

- (IBAction)goHome:(UIButton*)sender;
- (IBAction)goPDFViewController:(UIButton*)sender;

@end