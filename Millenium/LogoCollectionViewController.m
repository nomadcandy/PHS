//
//  LogoCollectionViewController.m
//  Millenium
//
//  Created by Jami Sue Becker on 3/14/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import "LogoCollectionViewController.h"


@interface LogoCollectionViewController ()

@end

@implementation LogoCollectionViewController


@synthesize intMat;
@synthesize intLogo;


@synthesize searchHereString;
@synthesize searchHereField;
@synthesize searchOutField;
@synthesize artworkNameAddFavString;
@synthesize artworkCompanyAddFavString;
@synthesize artworkSellerAddFavString;
@synthesize urlFavString;
//@synthesize jsonLogoCount;
@synthesize nearMeImagesArray;
@synthesize nearMeNamesArray;
//@synthesize button;
//@synthesize logoChooseButton;
@synthesize selectedIndex;
@synthesize delegate=_delegate;
//@synthesize delegateString=_delegateString;

@synthesize rowSelectedHere;
@synthesize rowSelectedSend;
@synthesize indexPathSend;

@synthesize logoUseString;

@synthesize sellerString;
@synthesize nameString;
@synthesize companyString;
@synthesize numberString;
@synthesize sizeString;
@synthesize interactiveHeaderString;

@synthesize artworkNameDictionary;

@synthesize artworkNameArray;
@synthesize artworkSellerArray;
@synthesize artworkCompanyArray;
@synthesize artworkNumberArray;
@synthesize artworkSizeArray;
@synthesize artworkFormatArray;
@synthesize artworkFullImageArray;
@synthesize artworkIconArray;
@synthesize artworkIDArray;
@synthesize artworkInfoArray;


@synthesize matNameArray;
@synthesize matSellerArray;
@synthesize matCompanyArray;
@synthesize matSizeArray;
@synthesize matFormatArray;
@synthesize matFullImageArray;
@synthesize matIconArray;
@synthesize matIDArray;
@synthesize matInfoArray;


NSString *kMatCollectionViewCellID = @"matCollectionViewCellID";
NSString *kLogoCollectionViewCellID = @"logoCollectionViewCellID";
NSString *kLogoHeaderCellID = @"logoHeaderCellID";

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
    
    [DIYMenu dismiss];
    
    NSLog(@"artworkNameDictionary %@",artworkNameDictionary);
    NSLog(@"artworkNameArray %@",artworkNameArray);
    NSLog(@"artworkIconArray %@",artworkIconArray);
    
    /*nearMeNamesArray= @[@"Helix", @"MindCraft", @"Rainbow Hands",
                        @"DJ Pop", @"School Anime", @"Spartan Golf Club",
                        @"Pheonix Designs", @"Old", @"Old",
                        @"Old", @"Old", @"Old",
                        @"Old", @"Old", @"Old"];*/
    
    nearMeImagesArray= @[@"SampleLogo1.png", @"SampleLogo2.png", @"SampleLogo3.png",
                         @"SampleLogo4.png", @"SampleLogo5.png", @"SampleLogo6.png", @"SampleLogo7.png", @"SampleLogo8.png",@"SampleLogo9.png",@"SampleLogo10.png",@"SampleLogo11.png",@"SampleLogo12.png",@"SampleLogo13.png",@"SampleLogo14.png",@"SampleLogo15.png",@"SampleLogo16.png"];
    
    
	// Do any additional setup after loading the view.
    searchHereField = [[UITextField alloc] initWithFrame:CGRectMake(320, 30, 200, 30)];
    searchHereField.borderStyle = UITextBorderStyleRoundedRect;
    searchHereField.font = [UIFont systemFontOfSize:15];
    searchHereField.placeholder = @"search";
    searchHereField.autocorrectionType = UITextAutocorrectionTypeNo;
    searchHereField.keyboardType = UIKeyboardTypeDefault;
    searchHereField.returnKeyType = UIReturnKeyDone;
    //searchHereField.clearButtonMode = UITextFieldViewModeWhileEditing;
    searchHereField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    searchHereField.delegate = self;
    [self.view addSubview:searchHereField];
   
    
    
    UIButton *favHereButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [favHereButton addTarget:self
                         action:@selector(goFav:)
               forControlEvents:UIControlEventTouchDown];
    
    
    UIImage*favHereImage = [UIImage imageNamed:@"AssetsFavButton.png"];
    [favHereButton setBackgroundImage:favHereImage forState:UIControlStateNormal];
    //[favHereButton setImage:favHereImage forState:UIControlStateSelected];
    favHereButton.frame = CGRectMake(45.0, 33.0, 50.0, 50.0);
    [self.view addSubview:favHereButton];
    
    
    UIButton *repHereButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [repHereButton addTarget:self
                      action:@selector(goRep:)
            forControlEvents:UIControlEventTouchDown];
    
    
    UIImage*repHereImage = [UIImage imageNamed:@"AssetsRepButton.png"];
    [repHereButton setBackgroundImage:repHereImage forState:UIControlStateNormal];
    repHereButton.frame = CGRectMake(113.0, 33.0, 45.0, 45.0);
    [self.view addSubview:repHereButton];
    
    
    UIButton *nearHereButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [nearHereButton addTarget:self
                      action:@selector(goNearMe:)
            forControlEvents:UIControlEventTouchDown];
    
    
    UIImage*nearHereImage = [UIImage imageNamed:@"AssetsCompassButton.png"];
    [nearHereButton setBackgroundImage:nearHereImage forState:UIControlStateNormal];
    nearHereButton.frame = CGRectMake(181.0, 33.0, 50.0, 50.0);
    [self.view addSubview:nearHereButton];
    
    
    UIButton *searchModeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [searchModeButton addTarget:self
                       action:@selector(goSearchMode:)
             forControlEvents:UIControlEventTouchDown];
    
    
    UIImage*searchModeImage = [UIImage imageNamed:@"AssetsSearchButton.png"];
    [searchModeButton setBackgroundImage:searchModeImage forState:UIControlStateNormal];
    searchModeButton.frame = CGRectMake(249.0, 33.0, 50.0, 50.0);
    [self.view addSubview:searchModeButton];
    
    
    

    
    UIButton *searchHereButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [searchHereButton addTarget:self
               action:@selector(goSearch:)
     forControlEvents:UIControlEventTouchDown];
    
    
    UIImage*searchHereImage = [UIImage imageNamed:@"AssetsDefaultButton.png"];
    [searchHereButton setBackgroundImage:searchHereImage forState:UIControlStateNormal];
    searchHereButton.frame = CGRectMake(520.0, 30.0, 40.0, 40.0);
    [self.view addSubview:searchHereButton];
    
    
    UIButton *searchVariationButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [searchVariationButton addTarget:self
                         action:@selector(goSearchVariation:)
               forControlEvents:UIControlEventTouchDown];
    
    
    UIImage*searchVariationImage = [UIImage imageNamed:@"AssetsDefaultButton.png"];
    [searchVariationButton setBackgroundImage:searchVariationImage forState:UIControlStateNormal];
    searchVariationButton.frame = CGRectMake(570.0, 30.0, 40.0, 40.0);
    [self.view addSubview:searchVariationButton];

    
    
    UIButton *cintasHomeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [cintasHomeButton addTarget:self
                         action:@selector(goHome:)
               forControlEvents:UIControlEventTouchDown];
    
    UIImage*cintasImage = [UIImage imageNamed:@"CintasLogoBlackClear.png"];
    [cintasHomeButton setBackgroundImage:cintasImage forState:UIControlStateNormal];
    //[searchHereButton setImage:AssetsDefaultButton.png" forState:UIControlStateNormal];
    cintasHomeButton.frame = CGRectMake(888.0, 36.0, 137.0, 60.0);
    [self.view addSubview:cintasHomeButton];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //searchHereField.text = @"killme";
    
   // NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"distance" ascending:YES];
   // NSArray *sortDescriptorsArray = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    
    
    //NSFetchRequest*fetchAgainRequest = [[NSFetchRequest alloc]init];
    
    //[fetchAgainRequest setSortDescriptors:sortDescriptorsArray];
    
    //add Entity to Read
   /* NSEntityDescription*entity=
    [NSEntityDescription
     entityForName:@"LogoSearch"
     inManagedObjectContext:self.managedObjectContext];
    
    //add Entity to Read
    [fetchAgainRequest setEntity:entity];
    
    NSError*requestError = nil;
    NSArray*favoritesArray =
    [self.managedObjectContext executeFetchRequest:fetchAgainRequest
                                             error:&requestError];
    
     NSLog(@"favoritesArray %@",favoritesArray);*/
       
    
    // Fetch the devices from persistent data store
    /*NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"LogoFavorite"];
    self.favoritesArray = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    //self->artworkName = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    
    NSLog(@"favoritesArray %@",_favoritesArray);
   // NSLog(@"logoSearch %@",logoSearch);
    
    [self.collectionView reloadData];*/
}


- (id)initWithLogo:(Logo *)logo

{
    
    self = [super init];
    
    if (self) {
        
        
        //_firstName = [people.firstName copy];
        //lastName = [people.lastName copy];
        //homeEmail = [people.homeEmail copy];
        //workEmail = [people.workEmail copy];
        
        
    }
    
    return self;
    
}


- (void)startStandardUpdates
{
    // Create the location manager if this object does not
    // already have one.
    /*if (nil == locationManager)
        locationManager = [[CLLocationManager alloc] init];
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    
    // Set a movement threshold for new events.
    locationManager.distanceFilter = 500; // meters
    
    [locationManager startUpdatingLocation];*/
}

-(IBAction)goFav:(id)sender{
    
    //TODO load into CoreData anything that is in Favorites.
    
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"LogoFavorite"];
    //self.favoritesArray = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    self.favoritesLogoArray = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
   /* NSFetchRequest *fetchRequestMat = [[NSFetchRequest alloc] initWithEntityName:@"MatFavorite"];
    //self.favoritesArray = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    self.favoritesMatArray = [[managedObjectContext executeFetchRequest:fetchRequestMat error:nil] mutableCopy];*/
    
    
    
    NSLog(@"favoritesLogoArray %@",_favoritesLogoArray);
    NSLog(@"favoritesMatArray %@",_favoritesMatArray);
    // NSLog(@"logoSearch %@",logoSearch);
    
    
    
    [_favoritesLogoArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
        
        NSLog(@"%@", object);
        NSLog(@"searchLogoArray %@",_favoritesLogoArray);
        
        
        artworkNameArray = [_favoritesLogoArray valueForKey:@"ArtworkName"];
        
        
        NSLog(@"artWorkNameArray: %@", artworkNameArray);
        
        
        //adding an array to COREDATA
        //NSString *predicateString = [NSString stringWithFormat @"artworkNameArray == $EMPLOYEE_ID"];
        /*  NSString *predicateString = [NSString stringWithFormat @"artworkNameArray == ArtworkName"];
         NSPredicate *predicate = [NSPredicate predicateWithFormat:predicateString];
         
         for (NSString *anArtworkName in logoSearchs) {
         NSDictionary *variables = @{ @"ArtworkName" : anArtworkName };
         NSPredicate *localPredicate = [predicate predicateWithSubstitutionVariables:variables];*/
        
        
        
        
        
        artworkSizeArray = [_favoritesLogoArray valueForKey:@"ArtworkSize"];
        NSLog(@"artworkSizeArray %@",artworkSizeArray);
        
        
        
        
        artworkFormatArray = [_favoritesLogoArray valueForKey:@"Format"];
        NSLog(@"artworkFormatString %@",artworkFormatArray);
        
        
        
        
        artworkFullImageArray = [_favoritesLogoArray valueForKey:@"FullImageURL"];
        NSLog(@"fullImageArray %@",artworkFullImageArray);
        
        
        artworkIconArray = [_favoritesLogoArray valueForKey:@"IconURL"];
        
        
        artworkIDArray = [_favoritesLogoArray valueForKey:@"ProductID"];
        //NSLog(@"idString %@",idString);
        
        
        artworkSellerArray = [_favoritesLogoArray valueForKey:@"Seller"];
        
        //artworkCompanyArray = [searchLogoArray valueForKey:@"Company"];
        
        
    }];

    
    
    [self.collectionView reloadData];

    
    
}


-(IBAction)goRep:(id)sender{
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    //request.region = regionToSearchIn;
    //request.region = 500;
    request.naturalLanguageQuery = @"restaurants"; // or business name
    MKLocalSearch *localSearch = [[MKLocalSearch alloc] initWithRequest:request];
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        // do something with the results / error
    }];
    
}



-(IBAction)goNearMe:(id)sender{

    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    //request.region = regionToSearchIn;
    //request.region = 500;
    request.naturalLanguageQuery = @"restaurants"; // or business name
    MKLocalSearch *localSearch = [[MKLocalSearch alloc] initWithRequest:request];
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
    // do something with the results / error
    }];
    
}


-(IBAction)goSearchMode:(id)sender{
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    //request.region = regionToSearchIn;
    //request.region = 500;
    request.naturalLanguageQuery = @"restaurants"; // or business name
    MKLocalSearch *localSearch = [[MKLocalSearch alloc] initWithRequest:request];
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        // do something with the results / error
    }];
    
}



-(IBAction)goSearch:(id)sender{
    
   
     NSString*searchYeahString= searchHereField.text;
     NSLog(@"searchString %@",searchYeahString);
    
     //NSString*searchString=_logoHeaderCell.searchField.text;
    //searchString= searchHereField.text;
    //NSString*searchString= _searchField.text;
    //NSLog(@"searchString %@",searchString);
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
    
    
    
    
    
    //Search Logos
    
    NSString*urlSearchString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/?searchLogoString=%@&Orderby=match", searchYeahString];

    
    
    NSURL *urlSearch = [[NSURL alloc] initWithString:urlSearchString];
    
    NSLog(@"URLLOGIN: %@",urlSearch);
    NSError *error = nil;
    NSData *data = [NSData dataWithContentsOfURL:urlSearch];
    
    //parse Dictionary from web
   /* NSDictionary *searchLogoDictionary = [NSJSONSerialization
                                          JSONObjectWithData:data
                                          options:NSJSONReadingAllowFragments
                                          error: &error];*/
    
    
    //parse Array from web
    NSArray *searchLogoArray = [NSJSONSerialization
                                JSONObjectWithData:data
                                options:NSJSONReadingAllowFragments
                                error: &error];
    
    
   
    NSLog(@"%@SEARCHLOGOARRAY",searchLogoArray);
    
    
    //Search Mats
    
    NSString*urlSearchMatString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/MatSearchResults/?searchMatString=%@&Orderby=match", searchYeahString];
    
    
    
    NSURL *urlSearchMat = [[NSURL alloc] initWithString:urlSearchMatString];
    
    NSLog(@"URLLOGIN: %@",urlSearchMat);
    NSError *errorMat = nil;
    NSData *dataMat = [NSData dataWithContentsOfURL:urlSearchMat];
    
    //parse Dictionary from web
    /* NSDictionary *searchLogoDictionary = [NSJSONSerialization
     JSONObjectWithData:data
     options:NSJSONReadingAllowFragments
     error: &error];*/
    
    
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
        
        
        }];
        
    [searchMatArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
            
            NSLog(@"%@", object);
            NSLog(@"searchLogoArray %@",searchMatArray);
            
            
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

        
        [self.collectionView reloadData];
        
        
    }];
    
    //declare variable and return count of images returned
    int jsonLogoCount;
    jsonLogoCount = artworkNameArray.count;
    
    NSLog(@"jsonLogoCount %d",jsonLogoCount);
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
    
    //ADD TO CORE DATA?
    /*for (int i=0;i<jsonLogoCount;i++) {
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
    //Search Mats
    
    /*NSString*urlSearchMatString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/?VariationOf=%@&Orderby=match", searchYeahString];
    
    
    NSURL *urlSearchMats = [[NSURL alloc] initWithString:urlSearchMatString];
    
    NSLog(@"URLMats: %@",urlSearchMats);
    NSError *errorMats = nil;
    NSData *dataMats = [NSData dataWithContentsOfURL:urlSearchMats];
    
    
    
    //parse Array from web
    NSArray *searchMatArray = [NSJSONSerialization
                                JSONObjectWithData:dataMats
                                options:NSJSONReadingAllowFragments
                                error: &error];
    
    
    
    NSLog(@"%@SearchMatArray",searchMatArray);
    
    
    
    [searchMatArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
        
        NSLog(@"%@", object);
        NSLog(@"searchMatArray %@",searchMatArray);
        
        
        matNameArray = [searchMatArray valueForKey:@"ArtworkName"];
        
        
        NSLog(@"matNameArray: %@", matNameArray);
        
        
        //adding an array to COREDATA
        //NSString *predicateString = [NSString stringWithFormat @"artworkNameArray == $EMPLOYEE_ID"];
        /*  NSString *predicateString = [NSString stringWithFormat @"artworkNameArray == ArtworkName"];
         NSPredicate *predicate = [NSPredicate predicateWithFormat:predicateString];
         
         for (NSString *anArtworkName in logoSearchs) {
         NSDictionary *variables = @{ @"ArtworkName" : anArtworkName };
         NSPredicate *localPredicate = [predicate predicateWithSubstitutionVariables:variables];*/
        
        
        
        
        
        /*matSizeArray = [searchMatArray valueForKey:@"ArtworkSize"];
        NSLog(@"artworkSizeArray %@",matSizeArray);
        
        
        
        
        matFormatArray = [searchMatArray valueForKey:@"Format"];
        NSLog(@"artworkFormatString %@",artworkFormatArray);
        
        
        
        
        matFullImageArray = [searchMatArray valueForKey:@"FullImageURL"];
        NSLog(@"fullImageArray %@",artworkFullImageArray);
        
        
        matIconArray = [searchLogoArray valueForKey:@"IconURL"];
        
        
        matIDArray = [searchLogoArray valueForKey:@"ProductID"];
        //NSLog(@"idString %@",idString);
        
        [self.collectionView reloadData];*/
        
        
  /*  }];
    
    //declare variable and return count of images returned
    int jsonMatCount;
    jsonMatCount = matNameArray.count;
    
    NSLog(@"jsonLogoCount %d",jsonMatCount);*/

    
    
}
   

-(IBAction)goSearchVariation:(id)sender{
    
    NSString*searchString= _searchField.text;
    NSLog(@"searchCellString %@",searchString);
    
    NSString*searchYeahString= searchHereField.text;
    NSLog(@"searchString %@",searchYeahString);
    
    //NSString*searchString=_logoHeaderCell.searchField.text;
    //searchString= searchHereField.text;
    //NSString*searchString= _searchField.text;
    //NSLog(@"searchString %@",searchString);
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
    
    
    
    
    
    
    
    NSString*urlSearchString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/?VariationOf=%@&Orderby=match", searchYeahString];
    
    
    NSURL *urlSearch = [[NSURL alloc] initWithString:urlSearchString];
    
    NSLog(@"URLLOGIN: %@",urlSearch);
    NSError *error = nil;
    NSData *data = [NSData dataWithContentsOfURL:urlSearch];
    
        
    //parse Array from web
    NSArray *searchLogoArray = [NSJSONSerialization
                                JSONObjectWithData:data
                                options:NSJSONReadingAllowFragments
                                error: &error];
    
    
    
    NSLog(@"%@SEARCHLOGOARRAY",searchLogoArray);
    
    
    
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
        
        [self.collectionView reloadData];
        
        
    }];
    
    //declare variable and return count of images returned
    int jsonLogoCount;
    jsonLogoCount = artworkNameArray.count;
    
    NSLog(@"jsonLogoCount %d",jsonLogoCount);
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
    
    //ADD TO CORE DATA?
    /*for (int i=0;i<jsonLogoCount;i++) {
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





-(IBAction)goInteractive:(id)sender{
    
  
    
    [DIYMenu dismiss];
    
    
   UIStoryboard *storyboard = self.storyboard;
     InteractiveViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"InteractiveViewBoard"];
     [self presentViewController:svc animated:YES completion:nil];
   

}


- (IBAction)goHome:(UIButton *)sender {
    
    UIStoryboard *storyboard = self.storyboard;
    ViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"HomeStoryboard"];
    [self presentViewController:vc animated:YES completion:nil];
    
}

-(IBAction)addFavorite:(id)sender{
    
    
    NSLog(@"indexPathSend %d",indexPathSend);
    
    urlFavString =[artworkFullImageArray objectAtIndex:indexPathSend];
    artworkNameAddFavString =[artworkNameArray objectAtIndex:indexPathSend];
    
    NSLog(@"urlFavString %@",urlFavString);
    NSLog(@"urlFavString %@",artworkNameAddFavString);
    /*NSString*artworkCompanyAddFavString =[artworkCompanyArray objectAtIndex:indexPathSend];
    NSString*artworkSellerAddFavString =[artworkSellerArray objectAtIndex:indexPathSend];
    NSString*artworkNumberAddFavString =[artworkNumberArray objectAtIndex:indexPathSend];*/
    
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    NSManagedObject *newLogoFavorite = [NSEntityDescription insertNewObjectForEntityForName:@"LogoFavorite" inManagedObjectContext:context];
    
    
    [newLogoFavorite setValue:self.artworkNameAddFavString forKey:@"artworkName"];
    //[newLogoFavorite setValue:self.urlFavString forKey:@"fullImageURL"];
    /*[newLogoFavorite setValue:self.artworkCompanyAddFavString forKey:@"company"];
    [newLogoFavorite setValue:self.artworkSellerAddFavString forKey:@"seller"];*/

    
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    //Fetch Data entered to test
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"LogoFavorite"];
    self.favoritesArray = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    //self->artworkName = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    
    NSLog(@"favoritesArray %@",_favoritesArray);
    
}

//crashes
-(IBAction)removeFavorite:(id)sender{
    
    
    /*Millenium[14492:90b] indexPathSend 0
    2014-04-30 17:18:37.290 Millenium[14492:90b] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: 'keypath pid not found in entity <NSSQLEntity LogoFavorite id=1>'*/

    
    
    NSLog(@"indexPathSend %d",indexPathSend);
    
    urlUnFavString =[artworkFullImageArray objectAtIndex:indexPathSend];
    artworkNameUnFavString =[artworkNameArray objectAtIndex:indexPathSend];
    NSManagedObjectContext *context = [self managedObjectContext];
    //NSNumber *soughtPid=[NSNumber numberWithInt:53];
    //NSEntityDescription *artworkNameEntity=[NSEntityDescription entityForName:@"LogoFavorite" inManagedObjectContext:context];
    
    NSEntityDescription *logoFavoriteEntity=[NSEntityDescription entityForName:@"LogoFavorite" inManagedObjectContext:context];
    NSFetchRequest *fetch=[[NSFetchRequest alloc] init];
    [fetch setEntity:logoFavoriteEntity];
    NSPredicate *p=[NSPredicate predicateWithFormat:@"pid == %@", urlUnFavString];
    [fetch setPredicate:p];
    //... add sorts if you want them
    NSError *fetchError;
    NSArray *fetchedFavorites=[self.managedObjectContext executeFetchRequest:fetch error:&fetchError];
    // handle error
    
    
    for (NSManagedObject *favorite in fetchedFavorites) {
        [context deleteObject:favorite];
    }
    
    //Fetch Data entered to test
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"LogoFavorite"];
    self.favoritesArray = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    //self->artworkName = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    
    NSLog(@"favoritesArray %@",_favoritesArray);

    
    

    
}






- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    
    
    
    [self.collectionView reloadData];
    //cell for header
    if (section == 0){
        
        return 0;
    }
        
    //{
    //NSLog(@"jsonLogoCount %i",jsonLogoCount);
    //NSLog(@"artworkNameArray %@",artworkNameArray);

    /*int jsonLogoCount;
    jsonLogoCount = artworkNameArray.count;
    return jsonLogoCount;*/
    
    /*int jsonArtDictCount;
    jsonArtDictCount = artworkNameDictionary.count;
    return jsonArtDictCount;*/
        
        //return 22;
    //}
    
    
   else
    {
        
        
        //return logoNearMeArray.count;
        //return jsonLogoCount;
        if (artworkNameArray.count<matNameArray.count){
                return matNameArray.count;
        }else{
            
            return artworkNameArray.count;
            
        }
        
}
    
}

- (UICollectionReusableView *)collectionView: (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        LogoHeaderCell *logoHeaderCell = [collectionView dequeueReusableSupplementaryViewOfKind:
                                  UICollectionElementKindSectionHeader withReuseIdentifier:@"logoHeaderCellID" forIndexPath:indexPath];
        
            logoHeaderCell.pageTitleLabel.text = @" ";
        
        
        [[logoHeaderCell backButton] addTarget:self action:@selector(goInteractive1:event:) forControlEvents:UIControlEventTouchUpInside];
        
         [[logoHeaderCell cintasButton] addTarget:self action:@selector(goHome:) forControlEvents:UIControlEventTouchUpInside];
        
        
       //[[logoHeaderCell searchButton] addTarget:self action:@selector(goSearch:) forControlEvents:UIControlEventTouchUpInside];
        
        //searchOutField = searchOutField;
        
        //searchString=logoHeaderCell.searchField.text;
        
        //logoHeaderCell.searchField.text = @"palm"; // or other data from your model*/
        
            reusableview = logoHeaderCell;
            
        
    }
    
    
    
    //NSString *searchTerm = self.searches[indexPath.section]; [headerView setSearchText:searchTerm];
    return reusableview;
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 2;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //NSString *titleSection =@"Media";
    //UIImage*mediaThumbnail =[UIImage imageNamed:@"MapTestImage.png"];
    //UIImage*mediaThumbnail = character.mediaThumbnailsArray;
    
    
    
    CGSize size;
    if (indexPath.section==0) {
        //if ([element.type isEqualToString:@"selector"]) {
        //CGSize retval =  CGSizeMake(1024, 600);
        CGSize retval =  CGSizeMake(1004, 130);
        retval.height += 1; retval.width += 1; return retval;
        
    }
    
    else {
        
        CGSize retval =  CGSizeMake(1004, 420);
        retval.height += 10; retval.width += 10; return retval;
    }
    
    
    return size;
}


- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    if (section==0)
    {
        //inset of sections to account for the nav bar
        //top,left,right bottom
        return UIEdgeInsetsMake(200, 10, 10, 10);
        
    }
    
    else  {
        
        
        return UIEdgeInsetsMake(10, 10, 10, 10);
    }
    
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    
    //collectionView.allowsMultipleSelection = YES;
    if (indexPath.section == 0)
        
        
        
    {
        LogoHeaderCell *logoHeaderCell = [collectionView dequeueReusableCellWithReuseIdentifier:kLogoHeaderCellID forIndexPath:indexPath];
        
        
        
        return logoHeaderCell;
        
        
    }
    
    else  {
    
        nearMeImagesArray= @[@"SampleLogo1.png", @"SampleLogo2.png", @"SampleLogo3.png",
                        @"SampleLogo4.png", @"SampleLogo5.png", @"SampleLogo6.png", @"SampleLogo7.png", @"SampleLogo8.png",@"SampleLogo9.png",@"SampleLogo10.png",@"SampleLogo11.png",@"SampleLogo12.png",@"SampleLogo13.png",@"SampleLogo14.png",@"SampleLogo15.png",@"SampleLogo16.png"];

  
        
        
        
        LogoCell *logoCell = [collectionView dequeueReusableCellWithReuseIdentifier:kLogoCollectionViewCellID forIndexPath:indexPath];
        
        

        logoCell.logoLabel.text = [artworkNameArray objectAtIndex:indexPath.item];
    
        NSLog(@"logoLabel %@",logoCell.logoLabel.text);
    
        NSString*urlString =[artworkFullImageArray objectAtIndex:indexPath.item];
    
        NSString*httpString= @"http://";
    
      
        NSString *urlStringAppend = [httpString stringByAppendingString:urlString];
        
        NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlStringAppend]];
    
        UIImage * iconImage;
    
        iconImage = [UIImage imageWithData:data];
    
        NSLog(@"%@iconImage",iconImage);
    
      
    
        [logoCell.logoChooseButton setImage:iconImage forState:UIControlStateNormal];
    
       
    
    
    
   [[logoCell logoChooseButton] addTarget:self action:@selector(logoSelected:event:) forControlEvents:UIControlEventTouchUpInside];
        
        if (logoCell.logoChooseButton)
            
        {
            
            selectedIndex=[indexPath row];
            _logoChooseButton.tag=[indexPath row];
            NSLog(@"addButton.tag:%ld",(long)_logoChooseButton.tag);
            NSLog(@"indexPathSender1:%@",indexPath);
            NSLog(@"rowSelectedHere %i",rowSelectedHere);
            
            NSLog(@"indexPathSender:%ld",(long)logoCell.tag);
            
            UIButton*button = [logoCell logoChooseButton];
            button.tag = selectedIndex;
            intMat=0;
            intLogo=1;

            
            
        }
       /* logoCell.matLabel.text = [matNameArray objectAtIndex:indexPath.item];
        
        NSLog(@"logoLabel %@",logoCell.matLabel.text);
        
        NSString*urlMatString =[matFullImageArray objectAtIndex:indexPath.item];
        
        NSString*httpMatString= @"http://";
        
        
        NSString *urlMatStringAppend = [httpMatString stringByAppendingString:urlMatString];
        
        NSData * dataMat = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlMatStringAppend]];
        
        UIImage * iconMatImage;
        
        iconMatImage = [UIImage imageWithData:dataMat];
        
        NSLog(@"%@iconImage",iconMatImage);
        
        
        
        [logoCell.matChooseButton setImage:iconMatImage forState:UIControlStateNormal];
        
        
        
        
        
        [[logoCell matChooseButton] addTarget:self action:@selector(matSelected:event:) forControlEvents:UIControlEventTouchUpInside];
        
        if (logoCell.matChooseButton)
            
        {
            
            selectedIndex=[indexPath row];
            _matChooseButton.tag=[indexPath row];
            NSLog(@"addButton.tag:%ld",(long)_matChooseButton.tag);
            NSLog(@"indexPathSender1:%@",indexPath);
            NSLog(@"rowSelectedHere %i",rowSelectedHere);
            
            NSLog(@"indexPathSender:%ld",(long)logoCell.tag);
            
            UIButton*button = [logoCell matChooseButton];
            button.tag = selectedIndex;
            intMat=1;
            intLogo=0;
            
            
            
        }*/

               
        return logoCell;
            
            
        
   // } else {
        
        /*MatCell *matCell = [collectionView dequeueReusableCellWithReuseIdentifier:kMatCollectionViewCellID forIndexPath:indexPath];
        
        matCell.logoLabel.text = [nearMeNamesArray objectAtIndex:indexPath.item];
        
        
        
        NSString*nearMeImageString=[nearMeImagesArray objectAtIndex:indexPath.item];
        NSLog(@"mediaImageString %@",nearMeImageString);
        
        NSString*selectedImageString= @"SampleLogo8A.png";
        
        
        
        [matCell.logoChooseButton setBackgroundImage:[UIImage imageNamed:nearMeImageString]forState:UIControlStateNormal];
        
        [matCell.logoChooseButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        
        
        
        [[matCell logoChooseButton] addTarget:self action:@selector(logoSelected:event:) forControlEvents:UIControlEventTouchUpInside];
        
        if (matCell.logoChooseButton)
            
        {
            
            selectedIndex=[indexPath row];
            _logoChooseButton.tag=[indexPath row];
            NSLog(@"addButton.tag:%ld",(long)_logoChooseButton.tag);
            NSLog(@"indexPathSender1:%@",indexPath);
            NSLog(@"rowSelectedHere %i",rowSelectedHere);
            
            NSLog(@"indexPathSender:%ld",(long)matCell.tag);
            
            UIButton*button = [matCell logoChooseButton];
            button.tag = selectedIndex;
            
            
            
        }
        
        return matCell;
        
    
    }*/
    
}
}

-(IBAction)goInteractive1:(UIButton*)sender event:(id)event {
    //added to enable passing data to other viewController forces ViewDidLoad with new Data
    [self performSegueWithIdentifier:@"logoPickedSegue" sender:sender];
    
    UIStoryboard *storyboard = self.storyboard;
     InteractiveViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"InteractiveViewBoard"];
     [self presentViewController:svc animated:YES completion:nil];
    
}



-(IBAction)logoSelected:(UIButton*)sender event:(id)event {
    
    
    NSLog(@"addButton.tag:%ld",(long)sender.tag);
    
    int myInt = (int)sender.tag;
    indexPathSend = (int)sender.tag;
    //int indexSend = addButton.tag;
    
    NSLog(@"sender %@",sender);
    NSLog(@"indexPathSend %d",indexPathSend);
    //NSString*nearMeImageString=[nearMeImagesArray objectAtIndex:selectedIndex];
    
    nameString =[artworkNameArray objectAtIndex:indexPathSend];
    NSLog(@" nameStringLogoSelected %@",nameString);
    
    sellerString =[artworkSellerArray objectAtIndex:indexPathSend];
    companyString =[artworkCompanyArray objectAtIndex:indexPathSend];
    numberString =[artworkIDArray objectAtIndex:indexPathSend];
    sizeString =[artworkSizeArray objectAtIndex:indexPathSend];
    
    NSString*urlString =[artworkFullImageArray objectAtIndex:indexPathSend];
    
    NSString*httpString= @"http://";
    
    //NSLog(@"urlString %@",urlString);
    
    NSString *urlStringAppend = [httpString stringByAppendingString:urlString];
    
    
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlStringAppend]];
    
    UIImage * iconImage;
    
    iconImage = [UIImage imageWithData:data];
    
    NSLog(@"%@iconImage",iconImage);

    
    
    //logoUseString=[artworkFullImageArray objectAtIndex:indexPathSend];
    //NSLog(@"logoUseString %@",logoUseString);
    
    
    
    
    //UIImage*newImage=[UIImage imageNamed:iconImage];
    
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/logoImage.png"]];
    [UIImagePNGRepresentation(iconImage) writeToFile:imagePath atomically:YES];

    
    
    
    
    
}


-(IBAction)matSelected:(UIButton*)sender event:(id)event {
    
    
    NSLog(@"addButton.tag:%ld",(long)sender.tag);
    
    int myInt = (int)sender.tag;
    indexPathSend = (int)sender.tag;
    //int indexSend = addButton.tag;
    
    NSLog(@"sender %@",sender);
    NSLog(@"indexPathSend %d",indexPathSend);
    //NSString*nearMeImageString=[nearMeImagesArray objectAtIndex:selectedIndex];
    
    nameString =[matNameArray objectAtIndex:indexPathSend];
    NSLog(@" nameStringLogoSelected %@",nameString);
    
    sellerString =[matSellerArray objectAtIndex:indexPathSend];
    companyString =[matCompanyArray objectAtIndex:indexPathSend];
    numberString =[matIDArray objectAtIndex:indexPathSend];
    sizeString =[matSizeArray objectAtIndex:indexPathSend];
    interactiveHeaderString = @"Edit Mat";
    
    NSString*urlString =[matFullImageArray objectAtIndex:indexPathSend];
    
    NSString*httpString= @"http://";
    
    //NSLog(@"urlString %@",urlString);
    
    NSString *urlStringAppend = [httpString stringByAppendingString:urlString];
    
    
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlStringAppend]];
    
    UIImage * iconImage;
    
    iconImage = [UIImage imageWithData:data];
    
    NSLog(@"%@iconImage",iconImage);
    
    
    
    //logoUseString=[artworkFullImageArray objectAtIndex:indexPathSend];
    //NSLog(@"logoUseString %@",logoUseString);
    
    
    
    
    //UIImage*newImage=[UIImage imageNamed:iconImage];
    
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/logoImage.png"]];
    [UIImagePNGRepresentation(iconImage) writeToFile:imagePath atomically:YES];
    
    
    
    /*UIStoryboard *storyboard = self.storyboard;
     InteractiveViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"InteractiveViewBoard"];
     [self presentViewController:svc animated:YES completion:nil];*/
    
    
    
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"logoPickedSegue"]) {
        
        
        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        InteractiveViewController *destViewController = segue.destinationViewController;
         //destViewController.delegate = self;
        // NSLog(@"chosenImage %@",chosenImage);
        //NSLog(@"chosenImage %@",newImage);
        //destViewController.chosenImage = chosenImage;
        
        
        
        //NSString*nearMeImageString=[nearMeImagesArray objectAtIndex:selectedIndex];
        
        
        
        logoUseString=[nearMeImagesArray objectAtIndex:indexPathSend];
        NSLog(@"logoUseString %@",logoUseString);
        destViewController.logoUseStringHere=logoUseString;
        
        //nameString=[artworkNameArray objectAtIndex:indexPathSend];
        //nameString =[artworkNameArray objectAtIndex:indexPathSend];
        NSLog(@"nameStringSend %@",nameString);
        destViewController.nameString=nameString;
        destViewController.companyString=companyString;
        destViewController.sellerString=sellerString;
        destViewController.numberString=numberString;
        destViewController.sizeString=sizeString;

        
        /*numberString=[artworkNumberArray objectAtIndex:indexPathSend];
        NSLog(@"logoUseStringSend %@",numberString);
        destViewController.numberField.text=numberString;
        
        sellerString=[artworkSellerArray objectAtIndex:indexPathSend];
        NSLog(@"logoUseStringSend %@",sellerString);
        destViewController.sellerField.text=sellerString;
        
        companyString=[artworkCompanyArray objectAtIndex:indexPathSend];
        NSLog(@"logoUseStringSend %@",companyString);
        destViewController.companyField.text=companyString;*/
        
        

       
        //NSLog(@"chosenImage %@",logoUseString);
        
        //destViewController.delegate = self;
        
        /*UIStoryboard *storyboard = self.storyboard;
         InteractiveViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"InteractiveViewBoard"];
         [self presentViewController:svc animated:YES completion:nil];*/
        
    }
}
//gets managedObjectContext from the appDelegate
- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

/*- (void)didSetLogoUseString:(InteractiveViewController *)controller{
    
    
     //[self dismissViewControllerAnimated:YES completion:nil];
    
}*/
/*-(void)textFieldDidChange:(UITextField *)searchField{
    [(UICollectionViewCell*)[searchField superview] superview];
}*/

-(void)textFieldDidChange:(UITextField *)searchHereField{
    
   
    searchHereString=searchHereField.text;
     NSLog(@"searchHereField %@",searchHereString);
}

//- (void)didSetSearchString:(InteractiveViewController *)controller{
    
            //searchString=_searchField.text;
        
    
        //[self dismissViewControllerAnimated:YES completion:nil];
        
   // }

    //[self dismissViewControllerAnimated:YES completion:nil];
    







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
