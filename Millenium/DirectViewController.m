//
//  DirectViewController.m
//  Millenium
//
//  Created by Jami Sue Becker on 4/5/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import "DirectViewController.h"

@interface DirectViewController ()

@end

@implementation DirectViewController

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
    NSString *strURL = @"http://www.google.com";
    NSURL *url = [NSURL URLWithString:strURL];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self->directWebView loadRequest:urlRequest];
	// Do any additional setup after loading the view.
}


-(IBAction)goHome:(id)sender{
    
    
    
    UIStoryboard *storyboard = self.storyboard;
    ViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"HomeStoryboard"];
    [self presentViewController:vc animated:YES completion:nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
