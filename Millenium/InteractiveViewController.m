//
//  InteractiveViewController.m
//  Millenium
//
//  Created by Jami Sue Becker on 3/10/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import "InteractiveViewController.h"
#import "ViewController.h"


@interface InteractiveViewController ()

@end

@implementation InteractiveViewController

@synthesize interactiveView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    
    if (self) {
        // Custom initialization
        
        //UIStoryboard*interactive = [UIStoryboard storyboardWithName:@"mystoryboard"
                                                      //bundle:nil];
        
        //[self.storyboard instantiateViewControllerWithIdentifier:@"interactive"];
        //UIViewController* vc = [interactive instantiateViewControllerWithIdentifier:@"InteractiveViewController"];
   }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //UIView *view = InteractiveViewController.view;
    //[self.storyboard instantiateViewControllerWithIdentifier:@"interactive"];
    // Do any additional setup after loading the view.
}

/*- (void)loadView
{
    /*CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    UIView *contentView = [[UIView alloc] initWithFrame:applicationFrame];
    contentView.backgroundColor = [UIColor redColor];
    self.view = contentView;*/
    
    //view = [[view alloc] initWithFrame:applicationFrame viewController:self];
    //[self.view addSubview:view];
//}

-(IBAction)backButton:(id)sender{
    
     //[self dismissModalViewControllerAnimated:NO];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
