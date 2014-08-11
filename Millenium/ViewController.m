//
//  ViewController.m
//  Millenium
//
//  Created by Jami Sue Becker on 3/10/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import "ViewController.h"
#import "InteractiveViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize InteractiveViewController;
@synthesize carousel;
@synthesize label;
@synthesize loginField;
@synthesize passwordField;
@synthesize goButton;
@synthesize searchField;
@synthesize goSearchButton;


@synthesize firstNameString;
@synthesize lastNameString;
@synthesize locationIDString;
@synthesize locationNameString;
@synthesize locationNumberString;


@synthesize artworkNameArray;
@synthesize artworkSizeArray;
@synthesize artworkFormatArray;
@synthesize artworkFullImageArray;
@synthesize artworkIconArray;
@synthesize artworkIDArray;
@synthesize artworkInfoArray;
@synthesize artworkSellerArray;
@synthesize artworkCompanyArray;
@synthesize artworkColorArray;


@synthesize matNameArray;
@synthesize matSizeArray;
@synthesize matFormatArray;
@synthesize matFullImageArray;
@synthesize matIconArray;
@synthesize matIDArray;
@synthesize matInfoArray;
@synthesize matSellerArray;
@synthesize matCompanyArray;
@synthesize matColorArray;
@synthesize matBGColorArray;


@synthesize favoritesArray;

@synthesize artworkNameAddString;
@synthesize artworkFullImageString;

@synthesize jsonLogoCount;
@synthesize logoCountInt;
@synthesize matCountInt;

@synthesize artworkCount;
@synthesize matCount;




@synthesize fetchedResultsController;
@synthesize managedObjectContext;

@synthesize userIDString;

@synthesize activityIndicator;
@synthesize connectionSummaryLabel;

/*@synthesize managedObjectContext=_managedObjectContext;
@synthesize managedObjectModel=_managedObjectModel;
@synthesize persistentStoreCoordinator=_persistentStoreCoordinator;*/


- (void)dealloc
{
    carousel.delegate = nil;
    carousel.dataSource = nil;
    
}


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [activityIndicator stopAnimating];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    //Change the host name here to change the server you want to monitor.
    NSString *remoteHostName = @"www.apple.com";
    NSString *remoteHostLabelFormatString = NSLocalizedString(@"Remote Host: %@", @"Remote host label format string");
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

    
    searchField.textAlignment = NSTextAlignmentCenter;
    
    charlesBGView.hidden =YES;
    charlesView.hidden=YES;
    
    loginView.hidden =YES;
    //loginField.hidden=YES;
    //passwordField.hidden =YES;
    //goButton.hidden =YES;

    
    
    //configure carousel
    carousel.type = iCarouselTypeCoverFlow2;
    //[carousel reloadData];
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
        NetworkStatus netStatus = [reachability currentReachabilityStatus];
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




/*- (void)viewWillAppear:(BOOL)animated
{
    //[super viewDidLoad];
    
    //configure carousel
    carousel.type = iCarouselTypeCoverFlow2;
    //[carousel reloadData];
}*/

/*-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}*/


-(IBAction)showLogin:(id)sender{

    
    loginView.hidden =NO;
    loginField.hidden=NO;
    passwordField.hidden =NO;
    goButton.hidden =NO;
    
}

-(IBAction)goLogin:(id)sender{
    
    
    UIStoryboard *storyboard = self.storyboard;
    LoginViewController *loginLoad = [storyboard instantiateViewControllerWithIdentifier:@"LoginStoryboard"];
    
    // Configure the new view controller here.
    [self presentViewController:loginLoad animated:YES completion:nil];
    
}




-(IBAction)hideLogin:(id)sender{
    
    
    loginView.hidden =YES;
    loginField.hidden=YES;
    passwordField.hidden = YES;
    goButton.hidden =YES;
    
}


/*- (IBAction)addLogoSearchEntry:(id)sender
{
    // Add Entry to PhoneBook Data base and reset all fields
    
    //  1
    LogoSearch *logoSearch = [NSEntityDescription insertNewObjectForEntityForName:@"LogoSearch"
                                                      inManagedObjectContext:self.managedObjectContext];
    //  2
   /* logoSearch.artworkName = self.artworkName.text;
    logoSearch.artworkSize = self.artworkSize.text;
    logoSearch.artworkFormat = self.artworkFormat.text;
    logoSearch.artworkFullImageURL = self.artworkFullImageURL.text;*/
    //  3
   /* NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);*/
    //}
    //  4
   /* self.firstNameTextfield.text = @"";
    self.lastNameTextfield.text = @"";
    self.cityTextfield.text = @"";
    self.phoneNumber1.text = @"";
    self.phoneNumber2.text = @"";*/
    //  5
    //[self.view endEditing:YES];
//}

- (NSUInteger) countWords: (NSString *) searchString {
    NSScanner *scanner = [NSScanner scannerWithString: searchString];
    NSCharacterSet *whiteSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSUInteger count = 0; while ([scanner scanUpToCharactersFromSet: whiteSpace intoString: nil]) { count++; } return count;
    
    //searchString=
}


-(IBAction)goSearch:(id)sender{
    
    [activityIndicator startAnimating];
    
    if( searchField.text!= Nil || [searchField.text length] == 0 ) {
        
        
        
        NSString*searchOneString= searchField.text;
        
        int stringLength = [searchOneString length];
        NSRange range = NSMakeRange(0, stringLength);
        NSString *newString = [searchOneString stringByReplacingOccurrencesOfString:@" " withString:@"%20" options:NSCaseInsensitiveSearch range:range];
        
        newString = [newString stringByReplacingOccurrencesOfString:@"'" withString:@"" options:NSCaseInsensitiveSearch range:range];
        
        newString = [newString stringByReplacingOccurrencesOfString:@"!" withString:@"" options:NSCaseInsensitiveSearch range:range];
        
        newString = [newString stringByReplacingOccurrencesOfString:@"-" withString:@"" options:NSCaseInsensitiveSearch range:range];
        
        
        NSLog(@"Old String: '%@' --> New String: '%@'", searchOneString, newString);
        
       
      

        
        NSString*urlSearchString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/?searchString=%@&Orderby=mostPopular&interactiveOnly=1&locationID=-1&userID=0", newString];

    
        NSURL *urlSearch = [[NSURL alloc] initWithString:urlSearchString];
        NSURLRequest *request = [NSURLRequest requestWithURL:
                                 urlSearch];
        
        
       
        
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse *response,
                                                   NSData *data,
                                                   NSError *connectionError) {
                                   // handle response
                               }];
        
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithURL:urlSearch
                completionHandler:^(NSData *data,
                                    NSURLResponse *response,
                                    NSError *error) {
                    // handle response
                    
                }] resume];
        
        
        NSError *error = nil;
        NSData *data = [NSData dataWithContentsOfURL:urlSearch];
        //parse Array from web
        NSArray *searchLogoArray = [NSJSONSerialization
                                    JSONObjectWithData:data
                                    options:NSJSONReadingAllowFragments
                                    error: &error];
        
        
        
        
    
    
    //NSLog(@"%@SEARCHLOGOARRAY",searchLogoArray);
    
    artworkCount=searchLogoArray.count;
    
    
   
        
        NSString*urlSearchMatString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/?searchString=%@&Orderby=mostPopular&interactiveOnly=0&locationID=-1&userID=0", newString];
    
    
        NSURL *urlSearchMat = [[NSURL alloc] initWithString:urlSearchMatString];
        NSURLRequest *requestMat = [NSURLRequest requestWithURL:
                                    urlSearchMat];
        
        
        // NSLog(@"URLSearchMat: %@",urlSearchMat);
        NSError *errorMat = nil;
        NSData *dataMat = [NSData dataWithContentsOfURL:urlSearchMat];//
        
        //NSLog(@"URLLOGIN: %@",urlSearch);
        
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse *response,
                                                   NSData *dataMat,
                                                   NSError *connectionError) {
                                   // handle response
                               }];
        
        NSURLSession *sessionMat = [NSURLSession sharedSession];
        [[sessionMat dataTaskWithURL:urlSearchMat
                   completionHandler:^(NSData *dataMat,
                                       NSURLResponse *response,
                                       NSError *errorMat) {
                       // handle response
                       
                   }] resume];
        
        
        //NSError *errorMat = nil;
        //NSData *dataMat = [NSData dataWithContentsOfURL:urlSearch];
        
        
        //parse Array from web
        NSArray *searchMatArray = [NSJSONSerialization
                                   JSONObjectWithData:dataMat
                                   options:NSJSONReadingAllowFragments
                                   error: &errorMat];
        
        
        
        matCount= searchMatArray.count;
        
    
  
    
    matCount=searchMatArray.count;

    
    [searchLogoArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
        
        
       
        artworkNameArray = [searchLogoArray valueForKey:@"ArtworkName"];
        artworkSizeArray = [searchLogoArray valueForKey:@"ArtworkSize"];
        artworkFormatArray = [searchLogoArray valueForKey:@"Format"];
        artworkFullImageArray = [searchLogoArray valueForKey:@"FullImageURL"];
        artworkIconArray = [searchLogoArray valueForKey:@"IconURL"];
        artworkIDArray = [searchLogoArray valueForKey:@"ProductID"];
        artworkSellerArray = [searchLogoArray valueForKey:@"Seller"];
        artworkCompanyArray = [searchLogoArray valueForKey:@"CompanyName"];
        artworkColorArray = [searchLogoArray valueForKey:@"Color"];
        
        
        
        
        
  }];
    
    
    
    [searchMatArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
        
        
        matNameArray = [searchMatArray valueForKey:@"ArtworkName"];
        matSizeArray = [searchMatArray valueForKey:@"ArtworkSize"];
        matFormatArray = [searchMatArray valueForKey:@"Format"];
        matFullImageArray = [searchMatArray valueForKey:@"FullImageURL"];
        
        matIconArray = [searchMatArray valueForKey:@"IconURL"];
        matCompanyArray = [searchMatArray valueForKey:@"CompanyName"];
        matSellerArray = [searchMatArray valueForKey:@"Seller"];
        matIDArray = [searchMatArray valueForKey:@"ProductID"];
        
        matColorArray = [searchMatArray valueForKey:@"Color"];
        matBGColorArray = [searchMatArray valueForKey:@"BGColor"];
       

         [activityIndicator stopAnimating];
        
        
        
        
        
    }];
        
        
        
    } else{
        
        
        //NSLog(@"Button was clicked, lets display our alert view");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Search Field Empty"
                                                            message:@"You need to enter a valued in the search Field"
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"Ok", nil];
        
        [alertView show];
        
    }

    
    
    
    
}

-(IBAction)goNearMe:(id)sender{
    
    
    if( locationIDString!= Nil || [locationIDString length] == 0 ) {
        
        
        
        
       
        
        //Search Logos
        NSString*urlSearchString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/?searchString=%%%i&Orderby=mostPopular&interactiveOnly=1&locationID=%@&userID=0",20,locationIDString];
        
        
        NSURL *urlSearch = [[NSURL alloc] initWithString:urlSearchString];
        
        
        NSError *error = nil;
        NSData *data = [NSData dataWithContentsOfURL:urlSearch];
        
        
        
        
        //parse Array from web
        NSArray *searchLogoArray = [NSJSONSerialization
                                    JSONObjectWithData:data
                                    options:NSJSONReadingAllowFragments
                                    error: &error];
        
        
        
        artworkCount=searchLogoArray.count;
        
        //Search Mats
        NSString*urlSearchMatString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/?searchString=%%%i&Orderby=mostPopular&interactiveOnly=0&locationID=%@&userID=0",20,locationIDString];
        
        
        
        NSURL *urlSearchMat = [[NSURL alloc] initWithString:urlSearchMatString];
        
        //NSLog(@"URLLOGIN: %@",urlSearchMat);
        NSError *errorMat = nil;
        NSData *dataMat = [NSData dataWithContentsOfURL:urlSearchMat];
        
        
        
        
        //parse Array from web
        NSArray *searchMatArray = [NSJSONSerialization
                                   JSONObjectWithData:dataMat
                                   options:NSJSONReadingAllowFragments
                                   error: &error];
        
        
        
        matCount=searchMatArray.count;
        
        [searchLogoArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
            
            
            
            
            artworkNameArray = [searchLogoArray valueForKey:@"ArtworkName"];
            artworkSizeArray = [searchLogoArray valueForKey:@"ArtworkSize"];
            artworkFormatArray = [searchLogoArray valueForKey:@"Format"];
            artworkFullImageArray = [searchLogoArray valueForKey:@"FullImageURL"];
            artworkIconArray = [searchLogoArray valueForKey:@"IconURL"];
            artworkIDArray = [searchLogoArray valueForKey:@"ProductID"];
            artworkColorArray = [searchLogoArray valueForKey:@"Color"];
            
            
            
        }];
        
        [searchMatArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
            
            
            
            matNameArray = [searchMatArray valueForKey:@"ArtworkName"];
            matCount= matNameArray.count;
            matSizeArray = [searchMatArray valueForKey:@"ArtworkSize"];
            matFormatArray = [searchMatArray valueForKey:@"Format"];
            matFullImageArray = [searchMatArray valueForKey:@"FullImageURL"];
            matIconArray = [searchMatArray valueForKey:@"IconURL"];
            matIDArray = [searchMatArray valueForKey:@"ProductID"];
            matBGColorArray = [searchMatArray valueForKey:@"BGColor"];
            artworkColorArray = [searchMatArray valueForKey:@"Color"];
            
           
            
            
            
            
        }];

        
        
        
            
      
        
    } else{
        
        
        //NSLog(@"Button was clicked, lets display our alert view");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Search Field Empty"
                                                            message:@"You need to enter a valued in the search Field"
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"Ok", nil];
        
        [alertView show];
        
    }


}




-(NSData *)getLogoData:(NSString *)fileName{
    NSString *root = [[NSBundle mainBundle] bundlePath];
    NSString *filePath = [[NSString alloc] initWithString:[root stringByAppendingString:[@"/"stringByAppendingString:fileName]]];
    
    //NSLog(@"%@",filePath);
    
    NSData *logoData = [[NSData alloc] initWithContentsOfFile:filePath];
    return logoData;
    
}
//TODO add to any viewController where we need to access ManagedObject
//get the managed objext from the appDelegate to be used here in ViewController
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
//not used looping now instead
-(void)insertNewManagedObject:(NSString *)fileName{
    
    
    
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    NSManagedObject *newLogoSearch = [NSEntityDescription insertNewObjectForEntityForName:@"LogoSearch" inManagedObjectContext:context];
    
    [newLogoSearch setValue:self.artworkNameAddString forKey:@"artworkName"];
    //[newDevice setValue:self.versionTextField.text forKey:@"version"];
    //[newDevice setValue:self.companyTextField.text forKey:@"company"];
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    //Fetch Data entered to test
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"LogoSearch"];
    self.favoritesArray = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    //self->artworkName = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    
    //NSLog(@"favoritesArray %@",favoritesArray);

    

}


/*-(void)insertNewManagedObject:(NSString *)fileName{
 
    LogoSearch*newLogoSearch = [NSEntityDescription
                             insertNewObjectForEntityForName:@"LogoSearch"
                             inManagedObjectContext:self.managedObjectContext];


//[newLogoSearch setValue:@"test" forKey:@"artworkName"];




if (newLogoSearch!=nil){
    
    
    newLogoSearch.artworkName = artworkNameAddString;
    
    
    NSError*savingError =nil;
    
    
    if ([self.managedObjectContext save:&savingError]) {
        
        
        NSLog(@"Successfully saved the context");
        
    }else{
        
        NSLog(@"Failed to save the context. Error = %@", savingError);
        
        
    }}

else{
    
    NSLog(@"Failed to create the new person.");
}
}
*/




-(IBAction)playFriendly:(id)sender{
    
    self.movieController = [[MPMoviePlayerController alloc] init];
    
    NSString *moviePath = [[NSBundle mainBundle] pathForResource:@"CharlesHead" ofType:@"m4v"];
    NSURL *movieURL = [NSURL fileURLWithPath:moviePath];
    self.movieController = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
    
    [self.movieController.view setFrame:CGRectMake (285, 213, 482, 274)];
    self.movieController.movieSourceType = MPMovieSourceTypeFile;
    [self.view addSubview:self.movieController.view];
    [self.movieController play];
    
    //hides play button
    [_movieController setControlStyle:MPMovieControlStyleNone];
    _movieController.view.backgroundColor = [UIColor clearColor];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:_movieController];
    
    
}



-(IBAction)playPro:(id)sender{
    
    self.movieController = [[MPMoviePlayerController alloc] init];
    
    NSString *moviePath = [[NSBundle mainBundle] pathForResource:@"Professional_video" ofType:@"mp4"];
    //NSString *moviePath = [[NSBundle mainBundle] pathForResource:@"matsensesall" ofType:@"mp4"];
    NSURL *movieURL = [NSURL fileURLWithPath:moviePath];
    self.movieController = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
    //[self.movieController.view setFrame:CGRectMake (392, 200, 240, 136)];
    //[self.movieController.view setFrame:CGRectMake (370, 255, 360, 204)];
     [self.movieController.view setFrame:CGRectMake (285, 213, 482, 274)];
    //[self.movieController.view setFrame:CGRectMake (272, 200, 480, 272)];
    self.movieController.movieSourceType = MPMovieSourceTypeFile;
    [self.view addSubview:self.movieController.view];
    [self.movieController play];
    
    //hides play button
    [_movieController setControlStyle:MPMovieControlStyleNone];
    _movieController.view.backgroundColor = [UIColor clearColor];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:_movieController];
    
    
}


-(IBAction)playClean:(id)sender{
    
    self.movieController = [[MPMoviePlayerController alloc] init];
    
    NSString *moviePath = [[NSBundle mainBundle] pathForResource:@"MatAnimationUseSmall" ofType:@"m4v"];
    //NSString *moviePath = [[NSBundle mainBundle] pathForResource:@"matsensesall" ofType:@"mp4"];
    NSURL *movieURL = [NSURL fileURLWithPath:moviePath];
    self.movieController = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
    //[self.movieController.view setFrame:CGRectMake (392, 200, 240, 136)];
    //[self.movieController.view setFrame:CGRectMake (370, 255, 360, 204)];
    [self.movieController.view setFrame:CGRectMake (285, 213, 482, 274)];
    //[self.movieController.view setFrame:CGRectMake (272, 200, 480, 272)];
    self.movieController.movieSourceType = MPMovieSourceTypeFile;
    [self.view addSubview:self.movieController.view];
    [self.movieController play];
    
    //hides play button
     [_movieController setControlStyle:MPMovieControlStyleNone];
    _movieController.view.backgroundColor = [UIColor clearColor];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:_movieController];
   
    
}


- (void) moviePlayBackDidFinish:(NSNotification*)notification {
    
    MPMoviePlayerController *player = [notification object];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:player];
    
    if ([player
         respondsToSelector:@selector(setFullscreen:animated:)])
    {
        [player.view removeFromSuperview];
        player.fullscreen = NO;
    }
}







- (void)viewDidUnload
{
    [super viewDidUnload];
    self.carousel = nil;
    self.label = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}

#pragma mark -
#pragma mark iCarousel methods

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //generate 100 item views
    //normally we'd use a backing array
    //as shown in the basic iOS example
    //but for this example we haven't bothered
    return 6;
}


- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
	UIButton *button = (UIButton *)view;
	if (button == nil)
	{
		
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        UIImage *image = [UIImage imageNamed:@"carouselbgnopicuse.png"];
        

		button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.5, image.size.height/1.5);
		
		[button setBackgroundImage:image forState:UIControlStateNormal];
         button.alpha = 0.8;
        
       
        
        
        button.layer.shadowColor = [UIColor darkGrayColor].CGColor;
        //button.layer.shadowOpacity = 0.8;
        button.layer.shadowOpacity = 0.1;
        //button.layer.shadowRadius = 12;
        button.layer.shadowRadius = 3;
        //button.layer.shadowOffset = CGSizeMake(12.0f, 12.0f);
        button.layer.shadowOffset = CGSizeMake(3.0f, 4.0f);

        button.titleLabel.shadowOffset = CGSizeMake(1.0, 1.0);
        [button setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        
        //[button.titleLabel setFont:[UIFont fontWithName:@"Avenir" size:18.0]];
        [button.titleLabel setFont:[UIFont fontWithName:@"Helvetica-bold" size:18.0]];
		[button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        //return button;
	}
	
	//set button label
	//[button setTitle:[NSString stringWithFormat:@"%i", index] forState:UIControlStateNormal];
    
    if (index ==0){
        
        [button setTitle:[NSString stringWithFormat:@"Direct Purchase Mat"] forState:UIControlStateNormal];
        //[button addTarget:self action:@selector(buttonTapped0:) forControlEvents:UIControlEventTouchUpInside];
        //return button;
        
        [button addTarget:self action:@selector(presentDirectViewController:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (index ==1){
        
        [button setTitle:[NSString stringWithFormat:@"Rental Mat"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(presentRentalViewController:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (index ==2){
        
        [button setTitle:[NSString stringWithFormat:@"Marketing"] forState:UIControlStateNormal];
        
    }
    
   
    
    if (index == 3){
        
        [button setTitle:[NSString stringWithFormat:@"Sketch Search"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(presentSearchViewController:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    if (index == 4){
        
        [button setTitle:[NSString stringWithFormat:@"Sketch Request"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(presentSketchRequestViewController:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (index == 5){
        
        [button setTitle:[NSString stringWithFormat:@"Interactive Mat Tool"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(presentInteractiveViewController:) forControlEvents:UIControlEventTouchUpInside];
        //[button addTarget:self action:@selector(buttonTappedSix:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
    
	return button;
}






//Method Works
- (IBAction)presentScrollViewController:(UIButton *)sender{
    
    UIStoryboard *storyboard = self.storyboard;
    ScrollViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PleaseLoad"];
    
    // Configure the new view controller here.
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
    
}

- (IBAction)presentPDFViewController:(UIButton *)sender{
    
    UIStoryboard *storyboard = self.storyboard;
    PDFViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFStoryboard"];
    
    // Configure the new view controller here.
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
    
}



- (IBAction)presentInteractiveViewController:(UIButton *)sender{
    
    UIStoryboard *storyboard = self.storyboard;
    InteractiveViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"InteractiveViewBoard"];
    
    // Configure the new view controller here.
    [self presentViewController:svc animated:YES completion:nil];
    
    
   }

- (IBAction)presentDirectViewController:(UIButton *)sender{
    
    UIStoryboard *storyboard = self.storyboard;
    DirectViewController *dvc = [storyboard instantiateViewControllerWithIdentifier:@"DirectStoryBoard"];
    [self presentViewController:dvc animated:YES completion:nil];
    
    
}

- (IBAction)presentRentalViewController:(UIButton *)sender{
    
    UIStoryboard *storyboard = self.storyboard;
    RentalViewController *rvc = [storyboard instantiateViewControllerWithIdentifier:@"RentalStoryBoard"];
    [self presentViewController:rvc animated:YES completion:nil];
    
    
}


- (IBAction)presentLogoCollectionViewController:(UIButton *)sender{
    
    UIStoryboard *storyboard = self.storyboard;
    LogoCollectionViewController *searchvc = [storyboard instantiateViewControllerWithIdentifier:@"LogoViewBoard"];
    [self presentViewController:searchvc animated:YES completion:nil];
    
    
}


- (IBAction)presentSketchRequestViewController:(UIButton *)sender{
    
    UIStoryboard *storyboard = self.storyboard;
    SketchRequestViewController *srvc = [storyboard instantiateViewControllerWithIdentifier:@"SketchRequestStoryBoard"];
    
    [self presentViewController:srvc animated:YES completion:nil];
    
    
}
//Not Using Now
#pragma mark-
#pragma mark Segue

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([segue.identifier isEqualToString:@"InteractiveSegue"]) {
        
        InteractiveViewController *goingController = segue.destinationViewController;
        //[self presentViewController:goingController animated:YES completion:nil];
        
        NSLog(@"locationIDString %@",locationIDString);
        goingController.locationIDString = locationIDString;
        goingController.userIDString = userIDString;
        
        
        
        
    }
    
    if ([segue.identifier isEqualToString:@"SearchSegue"]) {
        
        LogoCollectionViewController *goingController = segue.destinationViewController;
        //[self presentViewController:goingController animated:YES completion:nil];
        
        
        goingController.artworkNameArray = artworkNameArray;
        goingController.artworkSizeArray = artworkSizeArray;
        goingController.artworkFormatArray = artworkFormatArray;
        goingController.artworkIconArray = artworkIconArray;
        goingController.artworkFullImageArray = artworkFullImageArray;
        goingController.artworkIDArray = artworkIDArray;
        goingController.artworkCompanyArray = artworkCompanyArray;
        goingController.artworkSellerArray = artworkSellerArray;
        goingController.artworkColorArray = artworkColorArray;
        goingController.artworkCount = artworkCount;

        
        goingController.matNameArray = matNameArray;
        goingController.matSizeArray = matSizeArray;
        goingController.matFormatArray = matFormatArray;
        goingController.matIconArray = matIconArray;
        goingController.matFullImageArray = matFullImageArray;
        goingController.matIDArray = matIDArray;
        goingController.matCompanyArray = matCompanyArray;
        goingController.matSellerArray = matSellerArray;
        goingController.matColorArray = matColorArray;
        goingController.matBGColorArray = matBGColorArray;
        goingController.matCount = matCount;
        
        goingController.firstNameString = firstNameString;
        goingController.lastNameString = lastNameString;
        goingController.locationIDString = locationIDString;
        goingController.locationNameString = locationNameString;
        goingController.locationNumberString = locationNumberString;
        
        goingController.userIDString = userIDString;
        
        
        

        
        
        
    }
    
}


#pragma mark -
#pragma mark Button tap event

- (void)buttonTapped:(UIButton *)sender
{
    
    NSInteger index = [carousel indexOfItemViewOrSubview:sender];
    
    if (index==2){
        
        
        
        UIStoryboard *storyboard = self.storyboard;
        PDFViewController *mvc = [storyboard instantiateViewControllerWithIdentifier:@"PDFStoryboard"];
        
        // Configure the new view controller here.
        [self presentViewController:mvc animated:YES completion:nil];
        
        
        
        
        
        
        
    }
    
    
    if (index==5){
        
        
        
        UIStoryboard *storyboard = self.storyboard;
        InteractiveViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"InteractiveViewBoard"];
        
        // Configure the new view controller here.
        [self presentViewController:svc animated:YES completion:nil];
        
        
        
        
    }
    
    if (index==6){
        
       

        UIStoryboard *storyboard = self.storyboard;
        InteractiveViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"InteractiveViewBoard"];
        
        // Configure the new view controller here.
        [self presentViewController:svc animated:YES completion:nil];
        
        
        
        
    }

    
   
  
}



#pragma mark -
#pragma mark Control events

/*- (IBAction)pressedButton:(id)sender

{
    
    NSInteger index = [carousel indexOfItemViewOrSubview:sender];
    if (index==6){
        
        
        [self presentViewController:InteractiveViewController animated:YES completion:nil];
        
        
        
    }
    
}*/


-(void)viewDidDisappear:(BOOL)animated{
    
    [activityIndicator stopAnimating];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
