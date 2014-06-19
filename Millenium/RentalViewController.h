//
//  RentalViewController.h
//  Millenium
//
//  Created by Jami Sue Becker on 4/5/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface RentalViewController : UIViewController{
    
    IBOutlet UIWebView*rentalWebView;
}

-(IBAction)goHome:(id)sender;
-(IBAction)goRefresh:(id)sender;

@end
