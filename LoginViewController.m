//
//  LoginViewController.m
//  Millenium
//
//  Created by Jami Sue Becker on 6/11/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize  firstNameString,lastNameString,locationIDString,locationNameString,locationNumberString,errorMessageString,userIDString,accessString,locationIDArray,loginField,passwordField,goButton;

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
    
    loginField.textAlignment = NSTextAlignmentCenter;
    passwordField.textAlignment = NSTextAlignmentCenter;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)goLogin:(id)sender{
    
    NSString*loginFieldString= loginField.text;
    NSString*passwordFieldString= passwordField.text;
    //NSLog(@"loginFieldString %@",loginFieldString);
    if (loginFieldString==NULL|| passwordFieldString==NULL || [loginFieldString length] == 0 || [passwordFieldString length] == 0)
        
        
    {
        
        UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Your Login or Password is invalid please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
        
        [alert show];

        
        
        
        } else {
            
            
           
            
            
            loginField.textAlignment = NSTextAlignmentCenter;
            passwordField.textAlignment = NSTextAlignmentCenter;
            
            
            NSString*loginString= loginField.text;
            NSString*passwordString= passwordField.text;
            
            
            
            NSString*urlLoginString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/Login/?username=%@&password=%@", loginString,passwordString];
            
            
            NSURL *urlLogin = [[NSURL alloc] initWithString:urlLoginString];
            NSLog(@"URLLOGIN: %@",urlLogin);
            NSError *error = nil;
            NSData *data = [NSData dataWithContentsOfURL:urlLogin];
            
            
            //parse Array from web
            NSArray *loginArray = [NSJSONSerialization
                                   JSONObjectWithData:data
                                   options:NSJSONReadingAllowFragments
                                   error: &error];
            
            
            
            [loginArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
                
                NSLog(@"%@", object);
                NSLog(@"loginArray %@",loginArray);
                
                
                firstNameString = [loginArray valueForKey:@"FirstName"];
                lastNameString = [loginArray valueForKey:@"LastName"];
                locationIDArray = [loginArray valueForKey:@"LocationID"];
                locationNameString = [loginArray valueForKey:@"LocationName"];
                locationNumberString = [loginArray valueForKey:@"LocationNumber"];
                //errorMessageString = [loginArray valueForKey:@"ErrorMessage"];
                
                NSArray*accessArray = [loginArray valueForKey:@"AccessStatus"];
                accessString = [accessArray objectAtIndex:0];
                
                
                NSArray*userIDArray = [loginArray valueForKey:@"UserID"];
                userIDString = [userIDArray objectAtIndex:0];
                NSLog(@"userIDString %@",userIDString);
                
                
                
                
                
                
            }];
            
            if ([accessString isEqualToString:@"YES"]) {
                
                
                //NSString *userIDToSave = locationIDString;
                [[NSUserDefaults standardUserDefaults] setObject:userIDString forKey:@"userID"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                locationIDString = [locationIDArray objectAtIndex:0];
                NSLog(@"locationIDString %@",locationIDString);
                NSString *valueToSave = locationIDString;
                [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"locationID"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                [self performSegueWithIdentifier:@"HomeSegue" sender:sender];
                
                UIStoryboard *storyboard = self.storyboard;
                ViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"HomeStoryboard"];
                [self presentViewController:svc animated:YES completion:nil];

            
        }
        
        
        
        
    }
    
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    
    if ([segue.identifier isEqualToString:@"HomeSegue"]) {
        
        ViewController *goingController = segue.destinationViewController;
       
        goingController.firstNameString = firstNameString;
        goingController.lastNameString = lastNameString;
        goingController.locationIDString = locationIDString;
        NSLog(@"locationIDString %@",locationIDString);
        goingController.locationNameString = locationNameString;
        goingController.locationNumberString = locationNumberString;
        goingController.userIDString = userIDString;
        
      
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
