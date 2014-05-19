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


@synthesize artworkNameArray;
@synthesize artworkSizeArray;
@synthesize artworkFormatArray;
@synthesize artworkFullImageArray;
@synthesize artworkIconArray;
@synthesize artworkIDArray;
@synthesize artworkInfoArray;
@synthesize artworkSellerArray;
@synthesize artworkCompanyArray;


@synthesize matNameArray;
@synthesize matSizeArray;
@synthesize matFormatArray;
@synthesize matFullImageArray;
@synthesize matIconArray;
@synthesize matIDArray;
@synthesize matInfoArray;
@synthesize matSellerArray;
@synthesize matCompanyArray;


@synthesize favoritesArray;

@synthesize artworkNameAddString;
@synthesize artworkFullImageString;

@synthesize jsonLogoCount;
@synthesize logoCountInt;
@synthesize matCountInt;


@synthesize fetchedResultsController;
@synthesize managedObjectContext;

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
    
    NSString*loginString= loginField.text;
    NSString*passwordString= passwordField.text;
    
    loginView.hidden =YES;
    //loginField.hidden=YES;
    //passwordField.hidden =YES;
    //goButton.hidden =YES;

        
        
        
    
        
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
    
    
    NSString*urlLoginString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/Login/?username=%@&password=%@", loginString,passwordString];
    
    
    NSURL *urlLogin = [[NSURL alloc] initWithString:urlLoginString];
    
    
    //[theRequest setHTTPMethod:@"POST"];
    //[theRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    
    NSLog(@"URLLOGIN: %@",urlLogin);
    
   
    
   NSError *error = nil;
    
 
    
   NSData *data = [NSData dataWithContentsOfURL:urlLogin];
    
    
    
    //parse Dictionary from web
    NSDictionary *loginDictionary = [NSJSONSerialization
                                     JSONObjectWithData:data
                                     options:NSJSONReadingAllowFragments
                                     error: &error];
    
    NSLog(@"%@LoginDICTIONARY",loginDictionary);
    
    
    //crashes here
    //creates array of all Dictionary objects nested as well
    //NSArray* loginArray = [loginDictionary allKeys];
    
    
    
   /* [loginArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
        NSLog(@"%@", object);
        
        NSLog(@"keysPhotosArray %@",loginArray);
        
        NSDictionary *resultDictionary = [loginDictionary objectForKey:object];*/
    
    
        /*NSString *artistString = [resultDictionary objectForKey:@"artist"];
        NSLog(@"artistString %@",artistString);
        NSString *titleString = [resultDictionary objectForKey:@"title"];
        NSLog(@"titleString %@",titleString);
        
        NSString *albumArtistSpaceString = [artistString stringByAppendingString:@"   "];
        
        NSString *albumArtistString = [albumArtistSpaceString stringByAppendingString:titleString];
        
        NSString *copyrightString = [resultDictionary objectForKey:@"copyright"];
        NSLog(@"copyrightString %@",copyrightString);
        
        NSString *copyLabelSpaceString = [copyrightString stringByAppendingString:@"   "];
        
        
        NSString *labelNameString = [resultDictionary objectForKey:@"label_name"];
        NSLog(@"labelName %@",labelNameString);
        
        
        NSString *copyLabelString = [copyLabelSpaceString stringByAppendingString:labelNameString];
        
        NSArray *photosArray = [resultDictionary objectForKey:@"photos"];
        NSLog(@"photosArray %@",photosArray);
        
        NSDictionary *photosDictonary1 = [resultDictionary objectForKey:@"photos"];
        NSLog(@"photosDictionary1 %@",photosDictonary1);*/
        

        
        
    
    
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


-(IBAction)goSearch:(id)sender{
    
    NSString*searchString= searchField.text;
    //NSString*passwordString= passwordField.text;
    
    //loginView.hidden =YES;
    //loginField.hidden=YES;
    //passwordField.hidden =YES;
    //goButton.hidden =YES;
    
    
    
    
    
    
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
    
    
    
    
    
    
    
    
   /* NSString*urlSearchString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/?searchLogoString=%@&Orderby=match", searchString];*/
    
    NSString*urlSearchString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/?searchString=%@&Orderby=match&interactiveOnly=1&locationID=-1", searchString];

    
    
    //http://ipad.cintasmats.com/LogoSearchResults/?searchString=Best%20Buy&Orderby=match&interactiveOnly=1&locationID=-1
    
    NSURL *urlSearch = [[NSURL alloc] initWithString:urlSearchString];
    
    
    NSLog(@"URLLOGIN: %@",urlSearch);
    
    
    
    NSError *error = nil;
    
    
    
    NSData *data = [NSData dataWithContentsOfURL:urlSearch];
    
        
    //parse Array from web
    NSArray *searchLogoArray = [NSJSONSerialization
                                          JSONObjectWithData:data
                                          options:NSJSONReadingAllowFragments
                                          error: &error];
    
    
    
    int logoCountInt = searchLogoArray.count;
    
    
    NSLog(@"%@SEARCHLOGOARRAY",searchLogoArray);
    
    
    
    
    //Search Mats
    
    
    
    /*NSString*urlSearchMatString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/MatSearchResults/?searchMatString=%@&Orderby=match", searchString];*/
    
    NSString*urlSearchMatString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/?searchString=%@&Orderby=match&interactiveOnly=0&locationID=-1", searchString];
    
    
    
    NSURL *urlSearchMat = [[NSURL alloc] initWithString:urlSearchMatString];
    
    NSLog(@"URLSearchMat: %@",urlSearchMat);
    NSError *errorMat = nil;
    NSData *dataMat = [NSData dataWithContentsOfURL:urlSearchMat];
    
    
    
    //parse Array from web
    NSArray *searchMatArray = [NSJSONSerialization
                               JSONObjectWithData:dataMat
                               options:NSJSONReadingAllowFragments
                               error: &error];
    
    
    
    NSLog(@"%@SearchMatArray",searchMatArray);

    
    [searchLogoArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
        
        NSLog(@"%@", object);
        NSLog(@"searchLogoArray %@",searchLogoArray);
       
       
        artworkNameArray = [searchLogoArray valueForKey:@"ArtworkName"];
      
        
        NSLog(@"artWorkNameArray: %@", artworkNameArray);
        
        
        //adding an array to COREDATA
        //NSString *predicateString = [NSString stringWithFormat @"artworkNameArray == $EMPLOYEE_ID"];
      /*  NSString *predicateString = [NSString stringWithFormat @"artworkNameArray == ArtworkName"];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:predicateString];
        
        for (NSString *anArtworkName in logoSearchs) {
            NSDictionary *variables = @{ @"ArtworkName" : anArtworkName };
            NSPredicate *localPredicate = [predicate predicateWithSubstitutionVariables:variables];*/
        
        
        
       
        
        artworkSizeArray = [searchLogoArray valueForKey:@"ArtworkSize"];
        NSLog(@"artworkSizeArray %@",artworkSizeArray);
        
        
       
        
       artworkFormatArray = [searchLogoArray valueForKey:@"Format"];
        NSLog(@"artworkFormatString %@",artworkFormatArray);
        
        
        
        
        artworkFullImageArray = [searchLogoArray valueForKey:@"FullImageURL"];
        NSLog(@"fullImageArray %@",artworkFullImageArray);
        
        
        artworkIconArray = [searchLogoArray valueForKey:@"IconURL"];
                
        
        artworkIDArray = [searchLogoArray valueForKey:@"ProductID"];
        //NSLog(@"idString %@",idString);
        
        
        artworkSellerArray = [searchLogoArray valueForKey:@"Seller"];
        
        //artworkCompanyArray = [searchLogoArray valueForKey:@"Company"];
        
        
  }];
    
    
    
    [searchMatArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
        
        NSLog(@"%@", object);
        NSLog(@"searchMatArray %@",searchMatArray);
        
        
        matNameArray = [searchMatArray valueForKey:@"ArtworkName"];
        
        
        NSLog(@"artWorkNameArray: %@", matNameArray);
        
        
        //adding an array to COREDATA
        //NSString *predicateString = [NSString stringWithFormat @"artworkNameArray == $EMPLOYEE_ID"];
        /*  NSString *predicateString = [NSString stringWithFormat @"artworkNameArray == ArtworkName"];
         NSPredicate *predicate = [NSPredicate predicateWithFormat:predicateString];
         
         for (NSString *anArtworkName in logoSearchs) {
         NSDictionary *variables = @{ @"ArtworkName" : anArtworkName };
         NSPredicate *localPredicate = [predicate predicateWithSubstitutionVariables:variables];*/
        
        
        
        
        
        matSizeArray = [searchMatArray valueForKey:@"ArtworkSize"];
        NSLog(@"matSizeArray %@",matSizeArray);
        
        
        
        
        matFormatArray = [searchMatArray valueForKey:@"Format"];
        NSLog(@"matFormatString %@",matFormatArray);
        
        
        
        
        matFullImageArray = [searchMatArray valueForKey:@"FullImageURL"];
        NSLog(@"fullImageArray %@",matFullImageArray);
        
        
        matIconArray = [searchMatArray valueForKey:@"IconURL"];
        
        
        matIDArray = [searchMatArray valueForKey:@"ProductID"];
        //NSLog(@"idString %@",idString);
        
        
        
        
        
    }];

    
    //declare variable and return count of images returned
    //int jsonLogoCount;
    //jsonLogoCount = artworkNameArray.count;
    
   // NSLog(@"jsonLogoCount %d",jsonLogoCount);
     /*for (int i = 0;i<jsonLogoCount;i++){
        
        
        
        NSDictionary*logosNameDictionary  = [artworkNameArray objectAtIndex:i];
        
        NSLog(@"logosDictionary %@",logosNameDictionary);
        
    }*/
    
        //NSManagedObject *myManagedObject;
        /*for (int i=0;i<jsonLogoCount;i++) {
        
                    artworkNameAddString =[artworkNameArray objectAtIndex:i];
                    NSLog(@"artworkNameAddString= %@", artworkNameAddString);
            
                     //calls method to add the string to CoreData
                    //[self insertNewManagedObject:[artworkNameArray objectAtIndex:i]];
                    [self insertNewManagedObject:artworkNameAddString];
            
               }*/
    
   /* for (int i=0;i<jsonLogoCount;i++) {
        //delete existing data
        
        
        
        
            
            
        
        
        // loops to add values
        artworkNameAddString =[artworkNameArray objectAtIndex:i];
        NSLog(@"artworkNameAddString= %@", artworkNameAddString);
        
        artworkFullImageString =[artworkFullImageArray objectAtIndex:i];
        NSLog(@"artworkFullImageString = %@", artworkFullImageString );
        
        NSManagedObjectContext *context = [self managedObjectContext];
       
        // Create a new managed object
        NSManagedObject *newLogoSearch = [NSEntityDescription insertNewObjectForEntityForName:@"LogoSearch" inManagedObjectContext:context];
        
        // Delete object from database
        //[context deleteObject:[self.LogoSearch objectAtIndex:indexPath.row]];
        
        [newLogoSearch setValue:self.artworkNameAddString forKey:@"artworkName"];
        [newLogoSearch setValue:self.artworkFullImageString forKey:@"fullImageURL"];
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
        
        
        NSLog(@"favoritesArray %@",favoritesArray);

        
    }*/
    
    
    
}








-(NSData *)getLogoData:(NSString *)fileName{
    NSString *root = [[NSBundle mainBundle] bundlePath];
    NSString *filePath = [[NSString alloc] initWithString:[root stringByAppendingString:[@"/"stringByAppendingString:fileName]]];
    
    NSLog(@"%@",filePath);
    
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
    
    
    NSLog(@"favoritesArray %@",favoritesArray);

    

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
//hell0



/*- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
	UIButton *button = (UIButton *)view;
	if (button == nil)
	{
        
        
         
		//no button available to recycle, so create new one
		UIImage *image = [UIImage imageNamed:@"WhiteCircleRugSample2.png"];
		button = [UIButton buttonWithType:UIButtonTypeCustom];
		button.frame = CGRectMake(0.0f, 0.0f, image.size.width, image.size.height);
		[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[button setBackgroundImage:image forState:UIControlStateNormal];
		button.titleLabel.font = [button.titleLabel.font fontWithSize:50];
		[button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
	}
	
	//set button label
	[button setTitle:[NSString stringWithFormat:@"%i", index] forState:UIControlStateNormal];
	
	return button;
}*/


- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
	UIButton *button = (UIButton *)view;
	if (button == nil)
	{
		//no button available to recycle, so create new one
		//UIImage *image = [UIImage imageNamed:@"CarouselBGWhite.png"];
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        UIImage *image = [UIImage imageNamed:@"carouselbgnopicuse.png"];
        

		button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.5, image.size.height/1.5);
		
		[button setBackgroundImage:image forState:UIControlStateNormal];
         button.alpha = 0.8;
        
        //[button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        
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


/*- (IBAction)buttonTappedSix:(UIButton *)sender{
    
    
    
    
       [self presentViewController:InteractiveViewController animated:YES completion:nil];
    
    
    
}*/




//Method Works
- (IBAction)presentInteractiveViewController:(UIButton *)sender{
    
    UIStoryboard *storyboard = self.storyboard;
    InteractiveViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"InteractiveViewBoard"];
    
    // Configure the new view controller here.
    [self presentViewController:svc animated:YES completion:nil];
    
    
   }

- (IBAction)presentDirectViewController:(UIButton *)sender{
    
    UIStoryboard *storyboard = self.storyboard;
    DirectViewController *dvc = [storyboard instantiateViewControllerWithIdentifier:@"DirectStoryBoard"];
    
    // Configure the new view controller here.
    [self presentViewController:dvc animated:YES completion:nil];
    
    
}

- (IBAction)presentRentalViewController:(UIButton *)sender{
    
    UIStoryboard *storyboard = self.storyboard;
    RentalViewController *rvc = [storyboard instantiateViewControllerWithIdentifier:@"RentalStoryBoard"];
    
    // Configure the new view controller here.
    [self presentViewController:rvc animated:YES completion:nil];
    
    
}


- (IBAction)presentLogoCollectionViewController:(UIButton *)sender{
    
    UIStoryboard *storyboard = self.storyboard;
    LogoCollectionViewController *searchvc = [storyboard instantiateViewControllerWithIdentifier:@"LogoViewBoard"];
    
    // Configure the new view controller here.
    [self presentViewController:searchvc animated:YES completion:nil];
    
    
}


- (IBAction)presentSketchRequestViewController:(UIButton *)sender{
    
    UIStoryboard *storyboard = self.storyboard;
    SketchRequestViewController *srvc = [storyboard instantiateViewControllerWithIdentifier:@"SketchRequestStoryBoard"];
    
    // Configure the new view controller here.
    [self presentViewController:srvc animated:YES completion:nil];
    
    
}
//Not Using Now
#pragma mark-
#pragma mark Segue

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([segue.identifier isEqualToString:@"InteractiveSegue"]) {
        
        InteractiveViewController *destViewController = segue.destinationViewController;
        [self presentViewController:destViewController animated:YES completion:nil];
        
        
        
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

        
        goingController.matNameArray = matNameArray;
        goingController.matSizeArray = matSizeArray;
        goingController.matFormatArray = matFormatArray;
        goingController.matIconArray = matIconArray;
        goingController.matFullImageArray = matFullImageArray;
        ///goingController.matIconImageArray = matIconImageArray;
        goingController.matIDArray = matIDArray;
        goingController.matCompanyArray = matCompanyArray;
        goingController.matSellerArray = matSellerArray;

        
        
        
    }
    
}


#pragma mark -
#pragma mark Button tap event

- (void)buttonTapped:(UIButton *)sender
{
    
    NSInteger index = [carousel indexOfItemViewOrSubview:sender];
    
    if (index==2){
        
        
        
        UIStoryboard *storyboard = self.storyboard;
        MarketingViewController *mvc = [storyboard instantiateViewControllerWithIdentifier:@"MarketingViewBoard"];
        
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






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
