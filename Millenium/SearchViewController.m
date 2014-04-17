//
//  SearchViewController.m
//  Millenium
//
//  Created by Jami Sue Becker on 3/14/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController


@synthesize sketchReferenceField;
@synthesize containingField;
@synthesize locationField;
@synthesize typeField;
@synthesize firstDateField;
@synthesize secondDateField;
@synthesize sizeField;
@synthesize bestMatchButton;
@synthesize dateButton;
@synthesize popularityButton;

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


-(IBAction)goSearch:(id)sender{
    
    
    
    NSString*sketchReferenceString= sketchReferenceField.text;
    NSString*containingString= containingField.text;
    NSString*locationString= locationField.text;
    NSString*typeString= typeField.text;
    NSString*firstDateString= firstDateField.text;
    NSString*secondDateString= secondDateField.text;
    NSString*sizeString= sizeField.text;
    
    
    /*BOOL error = NO;
     
     if(loginField.text == nil || [loginField.text length] == 0)
     {
     error = YES;
     //[nameErrorBG setBackgroundColor:[UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:0.1f]];
     }
     
     if(passwordField.text == nil || [passwordField.text length] == 0)
     {
     error = YES;
     //[passwordErrorBG setBackgroundColor:[UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:0.1f]];
     }*/
    
    
    
    /*if(error)
     {
     [self showError];
     return;
     }*/
    
    
    
    
    
    //NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://ipad.cintasmats.com/Login/?username=oclipse&password=password"]];
    
    
    //http://ipad.cintasmats.com/LogoSearchResults/?searchString=Shell&Orderby=match
    
    //NSString*loginString= loginField.text;
    //NSString*passwordString= passwordField.text;
    
    //NSString*loginString= @"oclipse";
    //NSString*passwordString= @"password";
    
    //NSString*urlSearchString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/Login/?username=%@&password=%@", loginString,passwordString];
    
    //NSString*urlSearchString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/Login/?username=oclipse&password=password"];
    
    
    
    //NSURL *urlSearch = [[NSURL alloc] initWithString:urlSearchString];
    //NSLog(@"URLLOGIN: %@",urlSearch);
    
    //NSError *error = nil;
    
    
    //NSData *data = [NSData dataWithContentsOfURL:urlSearch];
    
    
    
    //parse Dictionary from web
    /*NSDictionary *loginDictionary = [NSJSONSerialization
                                     JSONObjectWithData:data
                                     options:NSJSONReadingAllowFragments
                                     error: &error];
    
    NSLog(@"%@LoginDICTIONARY",loginDictionary);*/
    
   
    
    
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
