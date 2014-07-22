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

@synthesize  connectionSummaryLabel,firstNameString,lastNameString,locationIDString,locationNameString,locationNumberString,errorMessageString,userIDString,accessString,locationIDArray,loginField,passwordField,goButton,activityIndicator;

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
    
    
    
    [activityIndicator stopAnimating];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    //Change the host name here to change the server you want to monitor.
    NSString *remoteHostName = @"www.apple.com";
   /* NSString *remoteHostLabelFormatString = NSLocalizedString(@"Remote Host: %@", @"Remote host label format string");*/
    //self.remoteHostLabel.text = [NSString stringWithFormat:remoteHostLabelFormatString, remoteHostName];
    
	self.hostReachability = [Reachability reachabilityWithHostName:remoteHostName];
	[self.hostReachability startNotifier];
	[self updateInterfaceWithReachability:self.hostReachability];
    
    self.internetReachability = [Reachability reachabilityForInternetConnection];
	[self.internetReachability startNotifier];
	[self updateInterfaceWithReachability:self.internetReachability];
    
    self.wifiReachability = [Reachability reachabilityForLocalWiFi];
	[self.wifiReachability startNotifier];
	[self updateInterfaceWithReachability:self.wifiReachability];

    
    loginField.textAlignment = NSTextAlignmentCenter;
    passwordField.textAlignment = NSTextAlignmentCenter;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



/*!
 * Called by Reachability whenever status changes.
 */
- (void) reachabilityChanged:(NSNotification *)note
{
	Reachability* curReach = [note object];
	NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
	[self updateInterfaceWithReachability:curReach];
}


- (void)updateInterfaceWithReachability:(Reachability *)reachability
{
    if (reachability == self.hostReachability)
	{
		//[self configureTextField:self.remoteHostStatusField imageView:self.remoteHostImageView reachability:reachability];
        //NetworkStatus netStatus = [reachability currentReachabilityStatus];
        BOOL connectionRequired = [reachability connectionRequired];
        
        //self.connectionSummaryLabel.hidden = (netStatus != ReachableViaWWAN);
        NSString* baseLabelText = @"Internet Connection Established";
        
        if (connectionRequired)
        {
            baseLabelText = NSLocalizedString(@"Cellular data network is available.\nInternet traffic will be routed through it after a connection is established.", @"Reachability text if a connection is required");
        }
        else
        {
            baseLabelText = NSLocalizedString(@"Cellular data network is active.\nInternet traffic will be routed through it.", @"Reachability text if a connection is not required");
        }
        self.connectionSummaryLabel.text = baseLabelText;
    }
    
	if (reachability == self.internetReachability)
	{
		//[self configureTextField:self.internetConnectionStatusField imageView:self.internetConnectionImageView reachability:reachability];
         self.connectionSummaryLabel.text = @"Internet Connection Established";
	}
    
	if (reachability == self.wifiReachability)
	{
		//[self configureTextField:self.localWiFiConnectionStatusField imageView:self.localWiFiConnectionImageView reachability:reachability];
        self.connectionSummaryLabel.text = @"Internet Connection Established";
	}
}


- (void)configureTextField:(UITextField *)textField imageView:(UIImageView *)imageView reachability:(Reachability *)reachability
{
    NetworkStatus netStatus = [reachability currentReachabilityStatus];
    BOOL connectionRequired = [reachability connectionRequired];
    NSString* statusString = @"";
    
    switch (netStatus)
    {
        case NotReachable:        {
            /*statusString = NSLocalizedString(@"Access Not Available", @"Text field text for access is not available");
            imageView.image = [UIImage imageNamed:@"stop-32.png"] ;*/
            /*
             Minor interface detail- connectionRequired may return YES even when the host is unreachable. We cover that up here...
             */
            //connectionRequired = NO;
            self.connectionSummaryLabel.text = @"Internet Connection Required";
            break;
        }
            
        case ReachableViaWWAN:        {
            /*statusString = NSLocalizedString(@"Reachable WWAN", @"");
            imageView.image = [UIImage imageNamed:@"WWAN5.png"];*/
            self.connectionSummaryLabel.text = @"Internet Connection Established";
            break;
        }
        case ReachableViaWiFi:        {
            //statusString= NSLocalizedString(@"Reachable WiFi", @"");
            //imageView.image = [UIImage imageNamed:@"Airport.png"];
            self.connectionSummaryLabel.text = @"Internet Connection Established";
            break;
        }
    }
    
    if (connectionRequired)
    {
        /*NSString *connectionRequiredFormatString = NSLocalizedString(@"%@, Connection Required", @"Concatenation of status string with connection requirement");
        statusString= [NSString stringWithFormat:connectionRequiredFormatString, statusString];*/
        
        self.connectionSummaryLabel.text = @"Internet Connection Required";
    }
    textField.text= statusString;
}



-(IBAction)goLogin:(id)sender{
    
    [activityIndicator startAnimating];
    
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
    
    [activityIndicator stopAnimating];

    
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
