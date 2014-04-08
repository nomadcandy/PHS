//
//  DirectViewController.h
//  Millenium
//
//  Created by Jami Sue Becker on 4/5/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface DirectViewController : UIViewController{
    
    IBOutlet UIWebView*directWebView;
}

-(IBAction)goHome:(id)sender;

@end
