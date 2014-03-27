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
    //[firstNameField setKeyboardType:UIKeyboardAppearanceLight];
    
    firstNameField.keyboardAppearance = UIKeyboardAppearanceDefault;
	// Do any additional setup after loading the view.
}

- (IBAction)goHome:(UIButton *)sender {
    
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
