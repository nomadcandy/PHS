//
//  LogoCollectionViewController.m
//  Millenium
//
//  Created by Jami Sue Becker on 3/14/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import "FavCollectionViewController.h"

@interface FavCollectionViewController ()

@end

@implementation FavCollectionViewController

@synthesize searchingString;
@synthesize headerLabel;

@synthesize favLogoCount;
@synthesize favMatCount;

@synthesize intMat;
@synthesize intLogo;

@synthesize artworkCount;
@synthesize matCount;
@synthesize higherCount;

@synthesize searchField;
@synthesize searchHereString;
@synthesize searchHereField;
@synthesize searchOutField;

@synthesize addFavMatButton;
@synthesize addFavMatLabel;
@synthesize removeFavMatButton;
@synthesize removeFavMatLabel;

@synthesize artworkNameAddFavString;
@synthesize artworkCompanyAddFavString;
@synthesize artworkSellerAddFavString;
@synthesize artworkIDAddFavString;
@synthesize artworkLocationIDAddFavString;
@synthesize artworkColorAddFavString;
@synthesize artworkSizeAddFavString;

@synthesize urlMatString;
@synthesize urlString;

@synthesize matLabelString;

@synthesize matUrlAddFavString;
@synthesize matNameAddFavString;
@synthesize matCompanyAddFavString;
@synthesize matSellerAddFavString;
@synthesize matIDAddFavString;
@synthesize matLocationIDAddFavString;

@synthesize matColorAddFavString;
@synthesize matBGColorAddFavString;
@synthesize matSizeAddFavString;

@synthesize urlFavString;
@synthesize nearMeImagesArray;
@synthesize nearMeNamesArray;
@synthesize selectedIndex;
@synthesize delegate = _delegate;
//@synthesize delegateString=_delegateString;

@synthesize rowSelectedHere;
@synthesize rowSelectedSend;
@synthesize indexPathSend;

@synthesize logoUseString;

@synthesize logoColorString;
@synthesize matColorString;
@synthesize matBGColorString;

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
@synthesize artworkLocationIDArray;
@synthesize artworkInfoArray;
@synthesize artworkColorArray;

@synthesize matNameArray;
@synthesize matSellerArray;
@synthesize matCompanyArray;
@synthesize matSizeArray;
@synthesize matFormatArray;
@synthesize matFullImageArray;
@synthesize matIconArray;
@synthesize matIDArray;
@synthesize matLocationIDArray;
@synthesize matInfoArray;
@synthesize matColorArray;
@synthesize matBGColorArray;

@synthesize favoritesLogoArray;
@synthesize favoritesMatArray;

@synthesize firstNameString;
@synthesize lastNameString;
@synthesize userIDString;
@synthesize locationIDString;
@synthesize locationNameString;
@synthesize locationNumberString;

// NSString *kMatCollectionViewCellID = @"matCollectionViewCellID";
NSString* kFavCollectionViewCellID = @"logoCollectionViewCellID";
NSString* kFavHeaderCellID = @"logoHeaderCellID";

- (id)initWithNibName:(NSString*)nibNameOrNil
               bundle:(NSBundle*)nibBundleOrNil
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
    // indexPathSend = 0;

    artworkNameArray = nil;
    artworkSizeArray = nil;
    artworkFormatArray = nil;
    artworkFullImageArray = nil;
    artworkIconArray = nil;
    artworkIDArray = nil;
    artworkLocationIDArray = nil;
    artworkSellerArray = nil;
    artworkColorArray = nil;
    artworkCompanyArray = nil;

    matNameArray = nil;

    matSizeArray = nil;
    matFormatArray = nil;
    matFullImageArray = nil;
    matIconArray = nil;
    matIDArray = nil;
    matLocationIDArray = nil;
    matSellerArray = nil;
    matCompanyArray = nil;
    matColorArray = nil;
    matBGColorArray = nil;

    [DIYMenu dismiss];

    UIActivityIndicatorView* activityIndicator = [[UIActivityIndicatorView alloc]
        initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.alpha = 1.0;
    activityIndicator.center = CGPointMake(50, 60);
    activityIndicator.hidesWhenStopped = NO;
    [self.view addSubview:activityIndicator];
    [activityIndicator startAnimating];

    if (locationIDString == nil) {
        locationIDString =
            [[NSUserDefaults standardUserDefaults] stringForKey:@"locationID"];
    }

    searchingString = @"searchingFavString";
    // TODO load into CoreData anything that is in Favorites.

    // Fetch the devices from persistent data store
    NSManagedObjectContext* managedObjectContext = [self managedObjectContext];
    NSFetchRequest* fetchRequest =
        [[NSFetchRequest alloc] initWithEntityName:@"LogoFavorite"];
    self.favoritesLogoArray =
        [[managedObjectContext executeFetchRequest:fetchRequest
                                             error:nil] mutableCopy];

    NSManagedObjectContext* managedObjectContext1 = [self managedObjectContext];
    NSFetchRequest* fetchRequestMat =
        [[NSFetchRequest alloc] initWithEntityName:@"MatFavorite"];
    self.favoritesMatArray =
        [[managedObjectContext1 executeFetchRequest:fetchRequestMat
                                              error:nil] mutableCopy];

    // NSLog(@"favoritesLogoArray %@",favoritesLogoArray);
    // NSLog(@"favoritesMatArray %@",favoritesMatArray);
    // NSLog(@"logoSearch %@",logoSearch);

    [favoritesLogoArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL* stop) {

      artworkNameArray = [favoritesLogoArray valueForKey:@"artworkName"];
      artworkSizeArray = [favoritesLogoArray valueForKey:@"artworkSize"];
      artworkFormatArray = [favoritesLogoArray valueForKey:@"format"];
      artworkFullImageArray = [favoritesLogoArray valueForKey:@"fullImageURL"];
      artworkIconArray = [favoritesLogoArray valueForKey:@"iconURL"];
      artworkIDArray = [favoritesLogoArray valueForKey:@"productID"];
      artworkLocationIDArray = [favoritesLogoArray valueForKey:@"locationID"];
      artworkSellerArray = [favoritesLogoArray valueForKey:@"seller"];
      artworkColorArray = [favoritesLogoArray valueForKey:@"color"];
      artworkCompanyArray = [favoritesLogoArray valueForKey:@"company"];

      artworkCount = favoritesLogoArray.count;
        // NSLog(@"logoCount: %i", favoritesLogoArray.count);
    }];

    [favoritesMatArray
        enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL* stop) {

          matNameArray = [favoritesMatArray valueForKey:@"artworkName"];

          matSizeArray = [favoritesMatArray valueForKey:@"artworkSize"];
          matFormatArray = [favoritesMatArray valueForKey:@"format"];
          matFullImageArray = [favoritesMatArray valueForKey:@"fullImageURL"];
          matIconArray = [favoritesMatArray valueForKey:@"iconURL"];
          matIDArray = [favoritesMatArray valueForKey:@"productID"];
          matLocationIDArray = [favoritesMatArray valueForKey:@"locationID"];
          matSellerArray = [favoritesMatArray valueForKey:@"seller"];
          matCompanyArray = [favoritesMatArray valueForKey:@"company"];
          matColorArray = [favoritesMatArray valueForKey:@"color"];
          matBGColorArray = [favoritesMatArray valueForKey:@"bgColor"];

          matCount = favoritesMatArray.count;
            // NSLog(@"matCount: %i", favoritesMatArray.count);
        }];

    [self.collectionView reloadData];

    UIImageView* whitePadView =
        [[UIImageView alloc] initWithFrame:CGRectMake(00, 0, 1024, 170)];
    whitePadView.backgroundColor = [UIColor lightGrayColor];
    whitePadView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    whitePadView.layer.shadowOffset = CGSizeMake(0, 1);
    whitePadView.layer.shadowOpacity = 1.0;
    whitePadView.alpha = 0.5;
    whitePadView.clipsToBounds = NO;
    [self.view addSubview:whitePadView];

    // headers for Logos and Mats
    UILabel* logoLabel =
        [[UILabel alloc] initWithFrame:CGRectMake(90, 140, 280, 30)];
    logoLabel.font = [UIFont fontWithName:@"Avenir-Light" size:25];
    logoLabel.text = @"INTERACTIVE LOGOS";
    [self.view addSubview:logoLabel];

    UILabel* matLabel =
        [[UILabel alloc] initWithFrame:CGRectMake(550, 140, 200, 30)];
    matLabel.font = [UIFont fontWithName:@"Avenir-Light" size:25];
    matLabel.text = @"MATS";
    [self.view addSubview:matLabel];

    searchHereField =
        [[UITextField alloc] initWithFrame:CGRectMake(326, 44, 200, 30)];
    searchHereField.borderStyle = UITextBorderStyleRoundedRect;
    searchHereField.font = [UIFont fontWithName:@"Avenir-Light" size:25];
    searchHereField.placeholder = @"SEARCH";
    searchHereField.autocorrectionType = UITextAutocorrectionTypeNo;
    searchHereField.keyboardType = UIKeyboardTypeDefault;
    searchHereField.returnKeyType = UIReturnKeyDone;
    // searchHereField.clearButtonMode = UITextFieldViewModeWhileEditing;
    searchHereField.contentVerticalAlignment =
        UIControlContentVerticalAlignmentCenter;
    searchHereField.delegate = self;
    [self.view addSubview:searchHereField];

    UIButton* favHereButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [favHereButton addTarget:self
                      action:@selector(goFav:)
            forControlEvents:UIControlEventTouchDown];

    UIImage* favHereImage = [UIImage imageNamed:@"AssetsFavButton.png"];
    [favHereButton setBackgroundImage:favHereImage forState:UIControlStateNormal];
    //[favHereButton setImage:favHereImage forState:UIControlStateSelected];
    favHereButton.frame = CGRectMake(90.0, 33.0, 50.0, 50.0);
    favHereButton.showsTouchWhenHighlighted = YES;
    [self.view addSubview:favHereButton];

    UIButton* repHereButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [repHereButton addTarget:self
                      action:@selector(goRep:)
            forControlEvents:UIControlEventTouchDown];

    UIImage* repHereImage = [UIImage imageNamed:@"AssetsRepButton.png"];
    [repHereButton setBackgroundImage:repHereImage forState:UIControlStateNormal];
    repHereButton.frame = CGRectMake(226.0, 33.0, 45.0, 45.0);
    repHereButton.showsTouchWhenHighlighted = YES;
    [self.view addSubview:repHereButton];

    UIButton* nearHereButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [nearHereButton addTarget:self
                       action:@selector(goNearMe:)
             forControlEvents:UIControlEventTouchDown];

    UIImage* nearHereImage = [UIImage imageNamed:@"AssetsCompassButton.png"];
    [nearHereButton setBackgroundImage:nearHereImage
                              forState:UIControlStateNormal];
    nearHereButton.frame = CGRectMake(158.0, 33.0, 50.0, 50.0);
    nearHereButton.showsTouchWhenHighlighted = YES;
    [self.view addSubview:nearHereButton];

    UIButton* searchHereButton =
        [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [searchHereButton addTarget:self
                         action:@selector(goSearch:)
               forControlEvents:UIControlEventTouchDown];

    UIImage* searchHereImage = [UIImage imageNamed:@"AssetsSearchButton.png"];
    [searchHereButton setBackgroundImage:searchHereImage
                                forState:UIControlStateNormal];
    searchHereButton.frame = CGRectMake(530.0, 35.0, 50.0, 50.0);
    searchHereButton.showsTouchWhenHighlighted = YES;
    [self.view addSubview:searchHereButton];

    UIButton* cintasHomeButton =
        [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [cintasHomeButton addTarget:self
                         action:@selector(goHome:)
               forControlEvents:UIControlEventTouchDown];

    UIImage* cintasImage = [UIImage imageNamed:@"CintasLogoBlackClear.png"];
    [cintasHomeButton setBackgroundImage:cintasImage
                                forState:UIControlStateNormal];
    cintasHomeButton.frame = CGRectMake(888.0, 20.0, 137.0, 60.0);
    [self.view addSubview:cintasHomeButton];

    headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 80, 300, 30)];
    headerLabel.font = [UIFont fontWithName:@"Avenir-Regular" size:24];
    headerLabel.text = @"FAVORITES";
    headerLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:headerLabel];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (id)initWithLogo:(Logo*)logo
{
    self = [super init];

    if (self) {
        //_firstName = [people.firstName copy];
        // lastName = [people.lastName copy];
        // homeEmail = [people.homeEmail copy];
        // workEmail = [people.workEmail copy];
    }

    return self;
}

- (IBAction)goFav:(id)sender
{
    artworkNameArray = nil;
    artworkSizeArray = nil;
    artworkFormatArray = nil;
    artworkFullImageArray = nil;
    artworkIconArray = nil;
    artworkIDArray = nil;
    artworkLocationIDArray = nil;
    artworkSellerArray = nil;
    artworkColorArray = nil;
    artworkCompanyArray = nil;

    matNameArray = nil;

    matSizeArray = nil;
    matFormatArray = nil;
    matFullImageArray = nil;
    matIconArray = nil;
    matIDArray = nil;
    matLocationIDArray = nil;
    matSellerArray = nil;
    matCompanyArray = nil;
    matColorArray = nil;
    matBGColorArray = nil;

    searchingString = @"searchingFavString";
    // TODO load into CoreData anything that is in Favorites.

    // Fetch the devices from persistent data store
    NSManagedObjectContext* managedObjectContext = [self managedObjectContext];
    NSFetchRequest* fetchRequest =
        [[NSFetchRequest alloc] initWithEntityName:@"LogoFavorite"];
    self.favoritesLogoArray =
        [[managedObjectContext executeFetchRequest:fetchRequest
                                             error:nil] mutableCopy];

    NSManagedObjectContext* managedObjectContext1 = [self managedObjectContext];
    NSFetchRequest* fetchRequestMat =
        [[NSFetchRequest alloc] initWithEntityName:@"MatFavorite"];
    self.favoritesMatArray =
        [[managedObjectContext1 executeFetchRequest:fetchRequestMat
                                              error:nil] mutableCopy];

    [favoritesLogoArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL* stop) {

      artworkNameArray = [favoritesLogoArray valueForKey:@"artworkName"];
      artworkSizeArray = [favoritesLogoArray valueForKey:@"artworkSize"];
      artworkFormatArray = [favoritesLogoArray valueForKey:@"format"];
      artworkFullImageArray = [favoritesLogoArray valueForKey:@"fullImageURL"];
      artworkIconArray = [favoritesLogoArray valueForKey:@"iconURL"];
      artworkIDArray = [favoritesLogoArray valueForKey:@"productID"];
      artworkLocationIDArray = [favoritesLogoArray valueForKey:@"locationID"];
      artworkSellerArray = [favoritesLogoArray valueForKey:@"seller"];
      artworkColorArray = [favoritesLogoArray valueForKey:@"color"];
      artworkCompanyArray = [favoritesLogoArray valueForKey:@"company"];

      artworkCount = favoritesLogoArray.count;
      favLogoCount = favoritesLogoArray.count;
    }];

    [favoritesMatArray
        enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL* stop) {

          matNameArray = [favoritesMatArray valueForKey:@"artworkName"];

          matSizeArray = [favoritesMatArray valueForKey:@"artworkSize"];
          matFormatArray = [favoritesMatArray valueForKey:@"format"];
          matFullImageArray = [favoritesMatArray valueForKey:@"fullImageURL"];
          matIconArray = [favoritesMatArray valueForKey:@"iconURL"];
          matIDArray = [favoritesMatArray valueForKey:@"productID"];
          matLocationIDArray = [favoritesMatArray valueForKey:@"locationID"];
          matSellerArray = [favoritesMatArray valueForKey:@"seller"];
          matCompanyArray = [favoritesMatArray valueForKey:@"company"];
          matColorArray = [favoritesMatArray valueForKey:@"color"];
          matBGColorArray = [favoritesMatArray valueForKey:@"bgColor"];
          matCount = favoritesMatArray.count;
          favMatCount = favoritesMatArray.count;
        }];

    [self.collectionView reloadData];
}

- (IBAction)goRep:(id)sender
{
    artworkNameArray = nil;
    artworkSizeArray = nil;
    artworkFormatArray = nil;
    artworkFullImageArray = nil;
    artworkIconArray = nil;
    artworkIDArray = nil;
    artworkLocationIDArray = nil;
    artworkSellerArray = nil;
    artworkColorArray = nil;
    artworkCompanyArray = nil;

    matNameArray = nil;

    matSizeArray = nil;
    matFormatArray = nil;
    matFullImageArray = nil;
    matIconArray = nil;
    matIDArray = nil;
    matLocationIDArray = nil;
    matSellerArray = nil;
    matCompanyArray = nil;
    matColorArray = nil;
    matBGColorArray = nil;

    headerLabel.text = @"YOUR SKETCHES";

    UIActivityIndicatorView* activityIndicator = [[UIActivityIndicatorView alloc]
        initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activityIndicator.alpha = 1.0;
    activityIndicator.center = CGPointMake(160, 360);
    activityIndicator.hidesWhenStopped = NO;
    [self.view addSubview:activityIndicator];
    [activityIndicator startAnimating];

    userIDString = [[NSUserDefaults standardUserDefaults] stringForKey:@"userID"];

    // NSLog(@"userIDString: %@", userIDString);

    // Search Logos
    NSString* urlSearchString = [NSString
        stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/"
                         @"?searchString=%%%i&Orderby=mostPopular&"
                         @"interactiveOnly=1&locationID=-1&userID=%@",
                         20,
                         userIDString];

    NSURL* urlSearch = [[NSURL alloc] initWithString:urlSearchString];
    NSURLRequest* request = [NSURLRequest requestWithURL:urlSearch];

    // NSLog(@"URLLOGIN: %@",urlSearch);

    [NSURLConnection
        sendAsynchronousRequest:request
                          queue:[NSOperationQueue mainQueue]
              completionHandler:^(NSURLResponse* response, NSData* data,
                                  NSError* connectionError) {// handle response
                                }];

    NSURLSession* session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:urlSearch
            completionHandler:^(NSData* data, NSURLResponse* response,
                                NSError* error) {// handle response
                              }] resume];

    NSError* error = nil;
    NSData* data = [NSData dataWithContentsOfURL:urlSearch];
    // parse Array from web
    NSArray* searchLogoArray =
        [NSJSONSerialization JSONObjectWithData:data
                                        options:NSJSONReadingAllowFragments
                                          error:&error];

    // NSLog(@"searchLogoArray %@",searchLogoArray);

    artworkCount = searchLogoArray.count;
    // NSLog(@"artworkCount %i",artworkCount);

    // Search Mats
    NSString* urlSearchMatString = [NSString
        stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/"
                         @"?searchString=%%%i&Orderby=mostPopular&"
                         @"interactiveOnly=0&locationID=-1&userID=%@",
                         20,
                         userIDString];

    NSURL* urlSearchMat = [[NSURL alloc] initWithString:urlSearchMatString];
    NSURLRequest* requestMat = [NSURLRequest requestWithURL:urlSearchMat];

    NSError* errorMat = nil;
    NSData* dataMat = [NSData dataWithContentsOfURL:urlSearchMat]; //

    [NSURLConnection
        sendAsynchronousRequest:requestMat
                          queue:[NSOperationQueue mainQueue]
              completionHandler:^(NSURLResponse* response, NSData* dataMat,
                                  NSError* connectionError) {// handle response
                                }];

    NSURLSession* sessionMat = [NSURLSession sharedSession];
    [[sessionMat dataTaskWithURL:urlSearchMat
               completionHandler:^(NSData* dataMat, NSURLResponse* response, NSError* errorMat) {}] resume];

    // parse Array from web
    NSArray* searchMatArray =
        [NSJSONSerialization JSONObjectWithData:dataMat
                                        options:NSJSONReadingAllowFragments
                                          error:&errorMat];

    matCount = searchMatArray.count;

    if (data != nil) {
        [searchLogoArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL* stop) {

        artworkNameArray = [searchLogoArray valueForKey:@"ArtworkName"];
        artworkSizeArray = [searchLogoArray valueForKey:@"ArtworkSize"];
        artworkFormatArray = [searchLogoArray valueForKey:@"Format"];
        artworkFullImageArray = [searchLogoArray valueForKey:@"FullImageURL"];
        artworkIconArray = [searchLogoArray valueForKey:@"IconURL"];
        artworkIDArray = [searchLogoArray valueForKey:@"ProductID"];
        artworkColorArray = [searchLogoArray valueForKey:@"Color"];
        }];
    }

    if (dataMat != nil) {
        [searchMatArray
            enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL* stop) {

            matNameArray = [searchMatArray valueForKey:@"ArtworkName"];
            NSLog(@"matNameArray: %@", matNameArray);
            matSizeArray = [searchMatArray valueForKey:@"ArtworkSize"];
            matFormatArray = [searchMatArray valueForKey:@"Format"];
            matFullImageArray = [searchMatArray valueForKey:@"FullImageURL"];
            matIconArray = [searchMatArray valueForKey:@"IconURL"];
            matIDArray = [searchMatArray valueForKey:@"ProductID"];
            matBGColorArray = [searchMatArray valueForKey:@"BGColor"];
            artworkColorArray = [searchMatArray valueForKey:@"Color"];

            [activityIndicator stopAnimating];
            }];
    }

    [self.collectionView reloadData];

    [self performSegueWithIdentifier:@"collectionPickedSegue" sender:self];

    UIStoryboard* storyboard = self.storyboard;
    LogoCollectionViewController* svc =
        [storyboard instantiateViewControllerWithIdentifier:@"LogoViewBoard"];
    [self presentViewController:svc animated:YES completion:nil];

    /*else {


   UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Your
   personal data is not available please login once more to the application"
   delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];

   [alert show];


   }*/
}

- (IBAction)goNearMe:(id)sender
{
    artworkNameArray = nil;
    artworkSizeArray = nil;
    artworkFormatArray = nil;
    artworkFullImageArray = nil;
    artworkIconArray = nil;
    artworkIDArray = nil;
    artworkLocationIDArray = nil;
    artworkSellerArray = nil;
    artworkColorArray = nil;
    artworkCompanyArray = nil;

    matNameArray = nil;

    matSizeArray = nil;
    matFormatArray = nil;
    matFullImageArray = nil;
    matIconArray = nil;
    matIDArray = nil;
    matLocationIDArray = nil;
    matSellerArray = nil;
    matCompanyArray = nil;
    matColorArray = nil;
    matBGColorArray = nil;

    locationIDString =
        [[NSUserDefaults standardUserDefaults] stringForKey:@"locationID"];

    // NSLog(@"locationIDString: %@", locationIDString);

    // Search Logos
    NSString* urlSearchString = [NSString
        stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/"
                         @"?searchString=%%%i&Orderby=mostPopular&"
                         @"interactiveOnly=1&locationID=%@&userID=0",
                         20,
                         locationIDString];

    NSURL* urlSearch = [[NSURL alloc] initWithString:urlSearchString];
    NSURLRequest* request = [NSURLRequest requestWithURL:urlSearch];

    [NSURLConnection
        sendAsynchronousRequest:request
                          queue:[NSOperationQueue mainQueue]
              completionHandler:^(NSURLResponse* response, NSData* data,
                                  NSError* connectionError) {// handle response
                                }];

    NSURLSession* session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:urlSearch
            completionHandler:^(NSData* data, NSURLResponse* response,
                                NSError* error) {// handle response
                              }] resume];

    NSError* error = nil;
    NSData* data = [NSData dataWithContentsOfURL:urlSearch];
    // parse Array from web
    NSArray* searchLogoArray =
        [NSJSONSerialization JSONObjectWithData:data
                                        options:NSJSONReadingAllowFragments
                                          error:&error];

    artworkCount = searchLogoArray.count;

    // Search Mats
    NSString* urlSearchMatString = [NSString
        stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/"
                         @"?searchString=%%%i&Orderby=mostPopular&"
                         @"interactiveOnly=0&locationID=%@&userID=0",
                         20,
                         locationIDString];

    NSURL* urlSearchMat = [[NSURL alloc] initWithString:urlSearchMatString];
    NSURLRequest* requestMat = [NSURLRequest requestWithURL:urlSearchMat];

    NSError* errorMat = nil;
    NSData* dataMat = [NSData dataWithContentsOfURL:urlSearchMat]; //

    // NSLog(@"URLLOGIN: %@",urlSearch);

    [NSURLConnection
        sendAsynchronousRequest:requestMat
                          queue:[NSOperationQueue mainQueue]
              completionHandler:^(NSURLResponse* response, NSData* dataMat,
                                  NSError* connectionError) {// handle response
                                }];

    NSURLSession* sessionMat = [NSURLSession sharedSession];
    [[sessionMat dataTaskWithURL:urlSearchMat
               completionHandler:^(NSData* dataMat, NSURLResponse* response, NSError* errorMat) {}] resume];

    // parse Array from web
    NSArray* searchMatArray =
        [NSJSONSerialization JSONObjectWithData:dataMat
                                        options:NSJSONReadingAllowFragments
                                          error:&errorMat];

    matCount = searchMatArray.count;

    [searchLogoArray
        enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL* stop) {

          artworkNameArray = [searchLogoArray valueForKey:@"ArtworkName"];
          artworkSizeArray = [searchLogoArray valueForKey:@"ArtworkSize"];
          artworkFormatArray = [searchLogoArray valueForKey:@"Format"];
          artworkFullImageArray = [searchLogoArray valueForKey:@"FullImageURL"];
          artworkIconArray = [searchLogoArray valueForKey:@"IconURL"];
          artworkIDArray = [searchLogoArray valueForKey:@"ProductID"];
          artworkColorArray = [searchLogoArray valueForKey:@"Color"];
          artworkCompanyArray = [searchLogoArray valueForKey:@"CompanyName"];
          artworkSellerArray = [searchLogoArray valueForKey:@"Seller"];
        }];

    [searchMatArray
        enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL* stop) {

          matNameArray = [searchMatArray valueForKey:@"ArtworkName"];
          // matCount= matNameArray.count;
          matSizeArray = [searchMatArray valueForKey:@"ArtworkSize"];
          matFormatArray = [searchMatArray valueForKey:@"Format"];
          matFullImageArray = [searchMatArray valueForKey:@"FullImageURL"];
          matIconArray = [searchMatArray valueForKey:@"IconURL"];
          matIDArray = [searchMatArray valueForKey:@"ProductID"];
          matBGColorArray = [searchMatArray valueForKey:@"BGColor"];
          matCompanyArray = [searchMatArray valueForKey:@"CompanyName"];
          matSellerArray = [searchMatArray valueForKey:@"Seller"];

          artworkColorArray = [searchMatArray valueForKey:@"Color"];
        }];
    [self.collectionView reloadData];

    [self performSegueWithIdentifier:@"collectionPickedSegue" sender:self];

    UIStoryboard* storyboard = self.storyboard;
    LogoCollectionViewController* svc =
        [storyboard instantiateViewControllerWithIdentifier:@"LogoViewBoard"];
    [self presentViewController:svc animated:YES completion:nil];

    //[self.collectionView reloadData];
}

- (IBAction)goSearchMode:(id)sender
{
    MKLocalSearchRequest* request = [[MKLocalSearchRequest alloc] init];
    // request.region = regionToSearchIn;
    // request.region = 500;
    request.naturalLanguageQuery = @"restaurants"; // or business name
    MKLocalSearch* localSearch = [[MKLocalSearch alloc] initWithRequest:request];
    [localSearch
        startWithCompletionHandler:^(MKLocalSearchResponse* response,
                                     NSError* error) {
                                       // do something with the results / error
                                   }];
}

- (IBAction)goLocation:(id)sender
{
}

- (IBAction)goSearch:(id)sender
{
    artworkNameArray = nil;
    artworkSizeArray = nil;
    artworkFormatArray = nil;
    artworkFullImageArray = nil;
    artworkIconArray = nil;
    artworkIDArray = nil;
    artworkLocationIDArray = nil;
    artworkSellerArray = nil;
    artworkColorArray = nil;
    artworkCompanyArray = nil;

    matNameArray = nil;

    matSizeArray = nil;
    matFormatArray = nil;
    matFullImageArray = nil;
    matIconArray = nil;
    matIDArray = nil;
    matLocationIDArray = nil;
    matSellerArray = nil;
    matCompanyArray = nil;
    matColorArray = nil;
    matBGColorArray = nil;

    if (searchHereField.text != Nil || [searchHereField.text length] == 0) {
        NSString* searchOneString = searchHereField.text;

        int stringLength = [searchOneString length];
        NSRange range = NSMakeRange(0, stringLength);
        NSString* newString = [searchOneString
            stringByReplacingOccurrencesOfString:@" "
                                      withString:@"%20"
                                         options:NSCaseInsensitiveSearch
                                           range:range];

        newString =
            [newString stringByReplacingOccurrencesOfString:@"'"
                                                 withString:@""
                                                    options:NSCaseInsensitiveSearch
                                                      range:range];

        newString =
            [newString stringByReplacingOccurrencesOfString:@"!"
                                                 withString:@""
                                                    options:NSCaseInsensitiveSearch
                                                      range:range];

        newString =
            [newString stringByReplacingOccurrencesOfString:@"-"
                                                 withString:@""
                                                    options:NSCaseInsensitiveSearch
                                                      range:range];

        NSLog(@"Old String: '%@' --> New String: '%@'", searchOneString, newString);

        // Search Logos

        NSString* urlSearchString = [NSString
            stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/"
                             @"?searchString=%@&Orderby=mostPopular&"
                             @"interactiveOnly=1&locationID=-1&userID=0",
                             newString];

        NSURL* urlSearch = [[NSURL alloc] initWithString:urlSearchString];
        NSURLRequest* request = [NSURLRequest requestWithURL:urlSearch];

        [NSURLConnection
            sendAsynchronousRequest:request
                              queue:[NSOperationQueue mainQueue]
                  completionHandler:^(NSURLResponse* response, NSData* data,
                                      NSError* connectionError) {// handle response
                                    }];

        NSURLSession* session = [NSURLSession sharedSession];
        [[session dataTaskWithURL:urlSearch
                completionHandler:^(NSData* data, NSURLResponse* response,
                                    NSError* error) {// handle response
                                  }] resume];

        NSError* error = nil;
        NSData* data = [NSData dataWithContentsOfURL:urlSearch];
        // parse Array from web
        NSArray* searchLogoArray =
            [NSJSONSerialization JSONObjectWithData:data
                                            options:NSJSONReadingAllowFragments
                                              error:&error];

        // Search Mats

        NSString* urlSearchMatString = [NSString
            stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/"
                             @"?searchString=%@&Orderby=mostPopular&"
                             @"interactiveOnly=0&locationID=-1&userID=0",
                             newString];

        NSURL* urlSearchMat = [[NSURL alloc] initWithString:urlSearchMatString];
        NSURLRequest* requestMat = [NSURLRequest requestWithURL:urlSearchMat];

        NSError* errorMat = nil;
        NSData* dataMat = [NSData dataWithContentsOfURL:urlSearchMat]; //

        // NSLog(@"URLLOGIN: %@",urlSearch);

        [NSURLConnection
            sendAsynchronousRequest:requestMat
                              queue:[NSOperationQueue mainQueue]
                  completionHandler:^(NSURLResponse* response, NSData* dataMat,
                                      NSError* connectionError) {// handle response
                                    }];

        NSURLSession* sessionMat = [NSURLSession sharedSession];
        [[sessionMat dataTaskWithURL:urlSearchMat
                   completionHandler:^(NSData* dataMat, NSURLResponse* response, NSError* errorMat) {}] resume];

        // parse Array from web
        NSArray* searchMatArray =
            [NSJSONSerialization JSONObjectWithData:dataMat
                                            options:NSJSONReadingAllowFragments
                                              error:&errorMat];

        [searchLogoArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL* stop) {

        artworkNameArray = [searchLogoArray valueForKey:@"ArtworkName"];
        artworkSizeArray = [searchLogoArray valueForKey:@"ArtworkSize"];
        artworkFormatArray = [searchLogoArray valueForKey:@"Format"];
        artworkFullImageArray = [searchLogoArray valueForKey:@"FullImageURL"];
        artworkIconArray = [searchLogoArray valueForKey:@"IconURL"];
        artworkIDArray = [searchLogoArray valueForKey:@"ProductID"];
        artworkColorArray = [searchLogoArray valueForKey:@"Color"];
        artworkCompanyArray = [searchLogoArray valueForKey:@"CompanyName"];
        artworkSellerArray = [searchLogoArray valueForKey:@"Seller"];
        }];

        [searchMatArray
            enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL* stop) {

            matNameArray = [searchMatArray valueForKey:@"ArtworkName"];

            // adding an array to COREDATA
            // NSString *predicateString = [NSString stringWithFormat
            // @"artworkNameArray == $EMPLOYEE_ID"];
            /*  NSString *predicateString = [NSString stringWithFormat
             @"artworkNameArray == ArtworkName"];
             NSPredicate *predicate = [NSPredicate
             predicateWithFormat:predicateString];

             for (NSString *anArtworkName in logoSearchs) {
             NSDictionary *variables = @{ @"ArtworkName" : anArtworkName };
             NSPredicate *localPredicate = [predicate
             predicateWithSubstitutionVariables:variables];*/

            matSizeArray = [searchMatArray valueForKey:@"ArtworkSize"];
            matFormatArray = [searchMatArray valueForKey:@"Format"];
            matFullImageArray = [searchMatArray valueForKey:@"FullImageURL"];
            matIconArray = [searchMatArray valueForKey:@"IconURL"];
            matIDArray = [searchMatArray valueForKey:@"ProductID"];
            matSellerArray = [searchMatArray valueForKey:@"Seller"];
            matCompanyArray = [searchMatArray valueForKey:@"Company"];
            matColorArray = [searchMatArray valueForKey:@"Color"];
            matBGColorArray = [searchMatArray valueForKey:@"BGColor"];
            matLocationIDArray = [searchMatArray valueForKey:@"BGColor"];

                //[self.collectionView reloadData];
            }];

        [self performSegueWithIdentifier:@"collectionPickedSegue" sender:self];

        UIStoryboard* storyboard = self.storyboard;
        LogoCollectionViewController* svc =
            [storyboard instantiateViewControllerWithIdentifier:@"LogoViewBoard"];
        [self presentViewController:svc animated:YES completion:nil];
    }
}

- (IBAction)goInteractive:(id)sender
{
    [DIYMenu dismiss];

    UIStoryboard* storyboard = self.storyboard;
    InteractiveViewController* svc = [storyboard
        instantiateViewControllerWithIdentifier:@"InteractiveViewBoard"];
    [self presentViewController:svc animated:YES completion:nil];
}

- (IBAction)goHome:(UIButton*)sender
{
    UIStoryboard* storyboard = self.storyboard;
    ViewController* vc =
        [storyboard instantiateViewControllerWithIdentifier:@"HomeStoryboard"];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)removeAllFavorites:(id)sender
{
    NSManagedObjectContext* context = [self managedObjectContext];
    NSFetchRequest* fetchRequest =
        [[NSFetchRequest alloc] initWithEntityName:@"LogoFavorite"];
    self.favoritesLogoArray =
        [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];

    [fetchRequest setIncludesPropertyValues:NO]; // only fetch the managedObjectID

    NSError* error = nil;
    // NSArray * Logos = [context executeFetchRequest:fetchRequest error:&error];
    //[removeAllLogos release];
    // error handling goes here
    for (NSManagedObject* logo in self.favoritesLogoArray) {
        [context deleteObject:logo];
    }
    NSError* saveError = nil;
    [context save:&saveError];

    NSManagedObjectContext* matContext = [self managedObjectContext];

    NSFetchRequest* removeAllMats = [[NSFetchRequest alloc] init];
    [removeAllMats setEntity:[NSEntityDescription entityForName:@"MatFavorite"
                                         inManagedObjectContext:matContext]];
    [removeAllMats setIncludesPropertyValues:NO]; // only fetch the
                                                  // managedObjectID

    NSError* errorMats = nil;
    NSArray* Mats = [matContext executeFetchRequest:removeAllMats error:&error];

    for (NSManagedObject* mat in Mats) {
        [context deleteObject:mat];
    }
    NSError* saveErrorMat = nil;
    [context save:&saveErrorMat];
}

- (IBAction)addMatFavorite:(id)sender
{
    if ([NSNull null] != [matFullImageArray objectAtIndex:indexPathSend]) {
        matUrlAddFavString = [matFullImageArray objectAtIndex:indexPathSend];

    } else {
        matUrlAddFavString = @"No Image has been provided";
    }

    if ([NSNull null] != [matNameArray objectAtIndex:indexPathSend]) {
        matNameAddFavString = [matNameArray objectAtIndex:indexPathSend];

    } else {
        matNameAddFavString = @"No Name has been provided";
    }

    if ([NSNull null] != [matSellerArray objectAtIndex:indexPathSend]) {
        matSellerAddFavString = [matSellerArray objectAtIndex:indexPathSend];

    } else {
        matSellerAddFavString = @"Seller";
    }

    if ([NSNull null] != [matCompanyArray objectAtIndex:indexPathSend]) {
        matCompanyAddFavString = [matCompanyArray objectAtIndex:indexPathSend];

    } else {
        matCompanyAddFavString = @"Company";
    }

    if ([NSNull null] != [matIDArray objectAtIndex:indexPathSend]) {
        matIDAddFavString = [matIDArray objectAtIndex:indexPathSend];

    } else {
        matIDAddFavString = @"No product ID has been provided";
    }

    if ([NSNull null] != [matLocationIDArray objectAtIndex:indexPathSend]) {
        matLocationIDAddFavString =
            [matLocationIDArray objectAtIndex:indexPathSend];

    } else {
        matLocationIDAddFavString = @"No location is available";
    }

    if ([NSNull null] != [matColorArray objectAtIndex:indexPathSend]) {
        matColorAddFavString = [matColorArray objectAtIndex:indexPathSend];

    } else {
        matColorAddFavString = @"No Colors are provided";
    }

    if ([NSNull null] != [matBGColorArray objectAtIndex:indexPathSend]) {
        matBGColorAddFavString = [matBGColorArray objectAtIndex:indexPathSend];

    } else {
        matBGColorAddFavString = @"";
    }

    if ([NSNull null] != [matSizeArray objectAtIndex:indexPathSend]) {
        matSizeAddFavString = [matSizeArray objectAtIndex:indexPathSend];

    } else {
        matSizeAddFavString = @"4'x 6'";
    }

    NSManagedObjectContext* context = [self managedObjectContext];

    // Create a new managed object
    NSManagedObject* newMatFavorite =
        [NSEntityDescription insertNewObjectForEntityForName:@"MatFavorite"
                                      inManagedObjectContext:context];

    [newMatFavorite setValue:self.matUrlAddFavString forKey:@"fullImageURL"];
    [newMatFavorite setValue:self.matNameAddFavString forKey:@"artworkName"];

    [newMatFavorite setValue:self.matCompanyAddFavString forKey:@"company"];
    [newMatFavorite setValue:self.matSellerAddFavString forKey:@"seller"];
    [newMatFavorite setValue:self.matIDAddFavString forKey:@"productID"];
    [newMatFavorite setValue:self.matLocationIDAddFavString forKey:@"locationID"];

    [newMatFavorite setValue:self.matColorAddFavString forKey:@"color"];
    [newMatFavorite setValue:self.matBGColorAddFavString forKey:@"bgColor"];
    [newMatFavorite setValue:self.matSizeAddFavString forKey:@"artworkSize"];

    /*[newLogoFavorite setValue:self.artworkCompanyAddFavString
   forKey:@"company"];
   [newLogoFavorite setValue:self.artworkSellerAddFavString forKey:@"seller"];*/

    NSError* error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        // NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    // Fetch Data entered to test
    NSManagedObjectContext* managedObjectContext = [self managedObjectContext];
    NSFetchRequest* fetchRequest =
        [[NSFetchRequest alloc] initWithEntityName:@"MatFavorite"];
    self.favoritesMatArray =
        [[managedObjectContext executeFetchRequest:fetchRequest
                                             error:nil] mutableCopy];
    // self->artworkName = [[managedObjectContext executeFetchRequest:fetchRequest
    // error:nil] mutableCopy];

    // NSLog(@"favoritesMatArray %@",favoritesMatArray);
}

- (IBAction)removeMatFavorite:(id)sender
{
    // NSLog(@"nameString %@",nameString);

    NSManagedObjectContext* managedObjectContext = [self managedObjectContext];

    NSFetchRequest* fetch = [[NSFetchRequest alloc] init];
    NSEntityDescription* matFavoriteEntity =
        [NSEntityDescription entityForName:@"MatFavorite"
                    inManagedObjectContext:managedObjectContext];

    NSSortDescriptor* nameSort =
        [[NSSortDescriptor alloc] initWithKey:@"artworkName" ascending:YES];

    NSArray* sortDescriptors = [[NSArray alloc] initWithObjects:nameSort, nil];

    fetch.sortDescriptors = sortDescriptors;

    NSPredicate* p =
        [NSPredicate predicateWithFormat:@"artworkName == %@", nameString];
    [fetch setPredicate:p];

    [fetch setEntity:matFavoriteEntity];

    NSError* fetchError;

    NSArray* fetchedFavoritesArray =
        [self.managedObjectContext executeFetchRequest:fetch error:&fetchError];

    // NSLog(@"fetchedFavoritesArray %@",fetchedFavoritesArray);

    for (MatFavorite* matFavoriteDelete in fetchedFavoritesArray) {
        // NSLog(@"artworkName %@",matFavoriteDelete.artworkName);
        [managedObjectContext deleteObject:matFavoriteDelete];
    }

    [self saveContext];

    //[self updateTable];

    [self.collectionView reloadData];

    //[self goFav:(id)sender];
    [self viewDidLoad];
}

- (void)saveContext
{
    NSLog(@"save context hit");

    NSManagedObjectContext* managedObjectContext = self.managedObjectContext;
    // Save the context.
    NSError* error = nil;
    if (![managedObjectContext save:&error]) {
        NSLog(@"Unresolved context save error yikes! %@, %@", error, [error userInfo]);
        abort();
    } else {
        //[managedObjectContext mergeChangesFromContext];
        [self.collectionView reloadData];
    }
}

- (void)saveNotification
{
    NSLog(@"update table hit");

    [self.collectionView reloadData];
}

- (void)updateTable
{
    NSLog(@"update table hit");

    [self.collectionView reloadData];
}

- (IBAction)addLogoFavorite:(id)sender
{
    // NSLog(@"indexPathSend %d",indexPathSend);

    urlFavString = [artworkFullImageArray objectAtIndex:indexPathSend];

    if (urlFavString != nil) {
        urlFavString = [artworkFullImageArray objectAtIndex:indexPathSend];

    } else {
        urlFavString = @"Name";
    }

    artworkNameAddFavString = [artworkNameArray objectAtIndex:indexPathSend];

    if (artworkNameAddFavString != nil) {
        artworkNameAddFavString = [artworkNameArray objectAtIndex:indexPathSend];

    } else {
        artworkNameAddFavString = @"Name";
    }

    artworkColorAddFavString = [artworkColorArray objectAtIndex:indexPathSend];

    if (artworkColorAddFavString != nil) {
        artworkColorAddFavString = [artworkColorArray objectAtIndex:indexPathSend];

    } else {
        artworkColorAddFavString = @"Color";
    }

    artworkSizeAddFavString = [artworkSizeArray objectAtIndex:indexPathSend];

    if (artworkSizeAddFavString != nil) {
        artworkSizeAddFavString = [artworkSizeArray objectAtIndex:indexPathSend];

    } else {
        artworkSizeAddFavString = @"Size";
    }

    // NSLog(@"urlFavString %@",urlFavString);
    // NSLog(@"urlFavString %@",artworkNameAddFavString);

    artworkCompanyAddFavString =
        [artworkCompanyArray objectAtIndex:indexPathSend];

    if (artworkCompanyAddFavString != nil) {
        artworkCompanyAddFavString =
            [artworkCompanyArray objectAtIndex:indexPathSend];

    } else {
        artworkCompanyAddFavString = @"Company";
    }

    artworkSellerAddFavString = [artworkSellerArray objectAtIndex:indexPathSend];

    if (artworkSellerAddFavString != nil) {
        artworkSellerAddFavString =
            [artworkSellerArray objectAtIndex:indexPathSend];
    } else {
        artworkSellerAddFavString = @"Seller";
    }

    NSManagedObjectContext* context = [self managedObjectContext];

    // Create a new managed object
    NSManagedObject* newLogoFavorite =
        [NSEntityDescription insertNewObjectForEntityForName:@"LogoFavorite"
                                      inManagedObjectContext:context];

    [newLogoFavorite setValue:self.artworkNameAddFavString forKey:@"artworkName"];
    [newLogoFavorite setValue:self.urlFavString forKey:@"fullImageURL"];
    [newLogoFavorite setValue:self.artworkCompanyAddFavString forKey:@"company"];
    [newLogoFavorite setValue:self.artworkSellerAddFavString forKey:@"seller"];
    [newLogoFavorite setValue:self.artworkColorAddFavString forKey:@"color"];
    [newLogoFavorite setValue:self.artworkSizeAddFavString forKey:@"artworkSize"];

    NSError* error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        // NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    // Fetch Data entered to test
    NSManagedObjectContext* managedObjectContext = [self managedObjectContext];
    NSFetchRequest* fetchRequest =
        [[NSFetchRequest alloc] initWithEntityName:@"LogoFavorite"];
    self.favoritesArray =
        [[managedObjectContext executeFetchRequest:fetchRequest
                                             error:nil] mutableCopy];

    // NSLog(@"favoritesArray %@",_favoritesArray);
}

- (IBAction)removeFavorite:(id)sender
{
    // NSLog(@"nameString %@",nameString);

    NSManagedObjectContext* managedObjectContext = [self managedObjectContext];

    NSFetchRequest* fetch = [[NSFetchRequest alloc] init];
    NSEntityDescription* matFavoriteEntity =
        [NSEntityDescription entityForName:@"LogoFavorite"
                    inManagedObjectContext:managedObjectContext];

    NSSortDescriptor* nameSort =
        [[NSSortDescriptor alloc] initWithKey:@"artworkName" ascending:YES];

    NSArray* sortDescriptors = [[NSArray alloc] initWithObjects:nameSort, nil];

    fetch.sortDescriptors = sortDescriptors;

    NSPredicate* p =
        [NSPredicate predicateWithFormat:@"artworkName == %@", nameString];
    [fetch setPredicate:p];

    [fetch setEntity:matFavoriteEntity];

    NSError* fetchError;

    NSArray* fetchedFavoritesArray =
        [self.managedObjectContext executeFetchRequest:fetch error:&fetchError];

    // NSLog(@"fetchedFavoritesArray %@",fetchedFavoritesArray);

    for (LogoFavorite* logoFavoriteDelete in fetchedFavoritesArray) {
        // NSLog(@"artworkName %@",logoFavoriteDelete.artworkName);
        [managedObjectContext deleteObject:logoFavoriteDelete];
        
    }
    
    [managedObjectContext save:nil];

    [self viewDidLoad];
}

- (NSInteger)collectionView:(UICollectionView*)view
     numberOfItemsInSection:(NSInteger)section
{
    [self.collectionView reloadData];
    // cell for header
    if (section == 0) {
        return 0;
    } else {
        // NSLog(@"artworkCount %i",artworkCount);
        // NSLog(@"matCount %i",matCount);
        if (artworkCount < matCount) {
            higherCount = matCount;
        } else {
            // return artworkNameArray.count;
            // NSLog(@"logoCount %i",artworkNameArray.count);
            higherCount = artworkCount;
        }

        // NSLog(@"higherCount %i",higherCount);
        return higherCount;
    }
}

- (UICollectionReusableView*)collectionView:(UICollectionView*)collectionView
          viewForSupplementaryElementOfKind:(NSString*)kind
                                atIndexPath:(NSIndexPath*)indexPath
{
    UICollectionReusableView* reusableview = nil;

    if (kind == UICollectionElementKindSectionHeader) {
        LogoHeaderCell* logoHeaderCell = [collectionView
            dequeueReusableSupplementaryViewOfKind:
                UICollectionElementKindSectionHeader
                               withReuseIdentifier:@"logoHeaderCellID"
                                      forIndexPath:indexPath];

        logoHeaderCell.pageTitleLabel.text = @" ";

        [[logoHeaderCell backButton] addTarget:self
                                        action:@selector(goInteractive1:event:)
                              forControlEvents:UIControlEventTouchUpInside];

        [[logoHeaderCell cintasButton] addTarget:self
                                          action:@selector(goHome:)
                                forControlEvents:UIControlEventTouchUpInside];

        reusableview = logoHeaderCell;
    }

    return reusableview;
}

- (NSInteger)numberOfSectionsInCollectionView:
                 (UICollectionView*)collectionView
{
    return 2;
}

- (CGSize)collectionView:(UICollectionView*)collectionView
                    layout:(UICollectionViewLayout*)collectionViewLayout
    sizeForItemAtIndexPath:(NSIndexPath*)indexPath
{
    CGSize size;
    if (indexPath.section == 0) {
        // if ([element.type isEqualToString:@"selector"]) {
        // CGSize retval =  CGSizeMake(1024, 600);
        CGSize retval = CGSizeMake(1004, 130);
        retval.height += 1;
        retval.width += 1;
        return retval;

    } else {
        CGSize retval = CGSizeMake(1004, 420);
        retval.height += 10;
        retval.width += 10;
        return retval;
    }

    return size;
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView
                        layout:(UICollectionViewLayout*)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        // inset of sections to account for the nav bar
        // top,left,right bottom
        return UIEdgeInsetsMake(200, 10, 10, 10);

    } else {
        return UIEdgeInsetsMake(10, 10, 10, 10);
    }
}

- (NSString*)matStringForIndex:(NSInteger)index
{
    return [matFullImageArray objectAtIndex:index];
}

- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView
                 cellForItemAtIndexPath:(NSIndexPath*)indexPath;
{
    if (indexPath.section == 0) {
        FavHeaderCell* favHeaderCell =
            [collectionView dequeueReusableCellWithReuseIdentifier:kFavHeaderCellID
                                                      forIndexPath:indexPath];

        return favHeaderCell;
    }

    FavCell* favCell = [collectionView
        dequeueReusableCellWithReuseIdentifier:kFavCollectionViewCellID
                                  forIndexPath:indexPath];

    // unhide all incase next parse is larger then previous parse
    favCell.logoChooseButton.hidden = NO;
    favCell.removeFavLogoButton.hidden = NO;
    favCell.removeFavLogoLabel.hidden = NO;
    favCell.logoLabel.hidden = NO;
    favCell.goBackLogoLabel.hidden = NO;
    favCell.goBack.hidden = NO;
    favCell.goBackLogo.hidden = NO;

    /* if ([searchingString isEqualToString:@"searchingFavString"]) {
            favCell.addFavMatButton.hidden = YES;
            favCell.addFavMatLabel.hidden = YES;
        }*/

    if (indexPath.item <=
        artworkNameArray.count - 1 /*|| indexPath.item == 0*/) {
        NSString* logoLabelString =
            [artworkNameArray objectAtIndex:indexPath.item];

        favCell.logoLabel.text = logoLabelString;

    } else {
        favCell.logoLabel.hidden = YES;
    }

    //hide logo controls if no data
    if (indexPath.item > artworkFullImageArray.count - 1) {
        favCell.logoChooseButton.hidden = YES;
        favCell.removeFavLogoButton.hidden = YES;
        favCell.removeFavLogoLabel.hidden = YES;
        favCell.logoLabel.hidden = YES;
        favCell.goBackLogoLabel.hidden = YES;
        favCell.goBack.hidden = YES;
        favCell.goBackLogo.hidden = YES;
    } else if (indexPath.item <=
               artworkFullImageArray.count - 1 /*&& indexPath.item == 0*/) {
        favCell.logoChooseButton.hidden = NO;
        favCell.removeFavLogoButton.hidden = NO;
        favCell.removeFavLogoLabel.hidden = NO;
        favCell.logoLabel.hidden = NO;
        favCell.goBackLogoLabel.hidden = NO;
        favCell.goBack.hidden = NO;
        favCell.goBackLogo.hidden = NO;

        favCell.matChooseButton.hidden = NO;
        favCell.removeFavMatButton.hidden = NO;
        favCell.removeFavMatLabel.hidden = NO;
        favCell.matTitleLabel.hidden = NO;
        favCell.goBackMatLabel.hidden = NO;
        favCell.goBack.hidden = NO;

        if ([NSNull null] !=
            [artworkFullImageArray objectAtIndex:indexPath.item]) {
            if (artworkFullImageArray.count == 0 || artworkNameArray.count == 0) {
                urlString = @"";
                NSLog(@"urlString:%@", urlString);

            } else if (artworkFullImageArray.count > 0) {
                urlString = [artworkFullImageArray objectAtIndex:indexPath.item];
                NSLog(@"urlString:%@", urlString);
            }

        } else {
            urlString = @" ";
        }

        //find uRL to get retrieve it
        if ([urlString rangeOfString:@"cintas"].location == NSNotFound) {
            // not working
            NSArray* directoryPath = NSSearchPathForDirectoriesInDomains(
                NSDocumentDirectory, NSUserDomainMask, YES);
            NSString* imagePath = [directoryPath objectAtIndex:0];
            // imagePath= [imagePath
            // stringByAppendingPathComponent:@"logoImage.png"];
            imagePath = [imagePath stringByAppendingPathComponent:urlString];
            // NSLog(@"urlMatStringInMethod:%@",urlMatString);

            NSData* data = [NSData dataWithContentsOfFile:imagePath];
            // no data here
            UIImage* logoImage = [UIImage imageWithData:data];
            [favCell.logoChooseButton setImage:logoImage
                                      forState:UIControlStateNormal];

        } else {
            NSString* httpString = @"http://";
            NSString* urlLogoStringAppend =
                [httpString stringByAppendingString:urlString];

            // NSLog(@" urlStringAppend%@ ",urlLogoStringAppend);

            NSData* dataLogo = [NSData
                dataWithContentsOfURL:[NSURL URLWithString:urlLogoStringAppend]];

            UIImage* iconLogoImage;

            iconLogoImage = [UIImage imageWithData:dataLogo];
            [favCell.logoChooseButton setImage:iconLogoImage
                                      forState:UIControlStateNormal];
        }
    }

    [[favCell logoChooseButton] addTarget:self
                                   action:@selector(logoSelected:event:)
                         forControlEvents:UIControlEventTouchUpInside];

    if (favCell.logoChooseButton) {
        selectedIndex = [indexPath row];
        _logoChooseButton.tag = [indexPath row];

        UIButton* button = [favCell logoChooseButton];
        button.tag = selectedIndex;
        intMat = 0;
        intLogo = 1;
    }
    // TODO Crashing here
    NSLog(@"matNameArray %@", matNameArray);
    NSLog(@"matNameArray %i", matNameArray.count);

    if ((matNameArray.count > indexPath.item) &&
        [[matNameArray[indexPath.item] class] isSubclassOfClass:[NSString class]]) {
        /*
        if([NSNull null] != [matNameArray objectAtIndex:indexPath.item] &&
        indexPath.item <= matNameArray.count-1 &&
        matNameArray.count>indexPath.item)/*&& matNameArray.count > 0 &&
        !matNameArray//* /

        {
        */

        matLabelString = matNameArray[indexPath.item];
        favCell.matTitleLabel.text = matLabelString;
    } else {
        favCell.matTitleLabel.hidden = YES;
        // matLabelString=@"";
    }

    if ([searchingString isEqualToString:@"searchingFavString"]) {
        favCell.addFavMatButton.hidden = YES;
        favCell.addFavMatLabel.hidden = YES;
    }

    //   if([NSNull null] != [matFullImageArray objectAtIndex:indexPath.item] &&
    //   indexPath.item <= matFullImageArray.count-1  && matFullImageArray.count
    //   >0){

    if (matFullImageArray.count > indexPath.item &&
        [[matFullImageArray[indexPath.item] class]
            isSubclassOfClass:[NSString class]]) {
        urlMatString = matFullImageArray[indexPath.item];

        NSLog(@"urlMatString %@", urlMatString);

        favCell.matChooseButton.hidden = NO;
        favCell.removeFavMatButton.hidden = NO;
        favCell.removeFavMatLabel.hidden = NO;
        favCell.matTitleLabel.hidden = NO;
        favCell.goBackMatLabel.hidden = NO;
        favCell.goBack.hidden = NO;

        if ([urlMatString rangeOfString:@"cintas"].location == NSNotFound) {
            // not working
            NSArray* directoryPath = NSSearchPathForDirectoriesInDomains(
                NSDocumentDirectory, NSUserDomainMask, YES);
            NSString* imagePath = [directoryPath objectAtIndex:0];
            // imagePath= [imagePath
            // stringByAppendingPathComponent:@"logoImage.png"];
            imagePath = [imagePath stringByAppendingPathComponent:urlMatString];
            // NSLog(@"urlMatStringInMethod:%@",urlMatString);

            NSData* data = [NSData dataWithContentsOfFile:imagePath];
            // no data here
            UIImage* logoImage = [UIImage imageWithData:data];
            [favCell.matChooseButton setImage:logoImage
                                     forState:UIControlStateNormal];

        } else {
            // TODO Crashes here..
            // NSAssert(urlMatString != nil, @"We aren't finding the mat string
            // properly");

            NSString* httpString = @"http://";
            NSString* urlMatStringAppend =
                [httpString stringByAppendingString:urlMatString];

            NSLog(@"%@ urlStringAppend", urlMatStringAppend);

            NSData* dataMat = [NSData
                dataWithContentsOfURL:[NSURL URLWithString:urlMatStringAppend]];

            UIImage* iconImage;

            iconImage = [UIImage imageWithData:dataMat];
            [favCell.matChooseButton setImage:iconImage
                                     forState:UIControlStateNormal];
        }

        // TODO goBackMat.hidden= YES;
    } else //dont' have a string
        {
        // else if ( indexPath.item <= matFullImageArray.count-1 ){

        favCell.matChooseButton.hidden = YES;
        favCell.removeFavMatButton.hidden = YES;
        favCell.removeFavMatLabel.hidden = YES;

        favCell.goBackMatLabel.hidden = YES;
        favCell.goBack.hidden = YES;

        // urlMatString =[self
        // matStringForIndex:indexPath.item];//[matFullImageArray
        // objectAtIndex:indexPath.item];

        // we shouldn't ever try to operate on a nil mat string
        // if(!urlMatString) urlMatString = @"";

        // if([NSNull null] != [matFullImageArray objectAtIndex:indexPath.item])
    }

    [[favCell matChooseButton] addTarget:self
                                  action:@selector(matSelected:event:)
                        forControlEvents:UIControlEventTouchUpInside];

    if (favCell.matChooseButton) {
        selectedIndex = [indexPath row];
        _matChooseButton.tag = [indexPath row];

        UIButton* button = [favCell matChooseButton];
        button.tag = selectedIndex;
        intMat = 1;
        intLogo = 0;
    }

    return favCell;
}

- (IBAction)goInteractive1:(UIButton*)sender event:(id)event
{
    if (nameString == nil) {
        UIAlertView* alert = [[UIAlertView alloc]
                initWithTitle:@"Alert"
                      message:
                          @"Please select your sketch or Mat before proceeding"
                     delegate:self
            cancelButtonTitle:@"OK"
            otherButtonTitles:Nil, nil];

        [alert show];

    } else {
        // added to enable passing data to other viewController forces ViewDidLoad
        // with new Data
        [self performSegueWithIdentifier:@"logoPickedSegue" sender:sender];

        UIStoryboard* storyboard = self.storyboard;
        InteractiveViewController* svc = [storyboard
            instantiateViewControllerWithIdentifier:@"InteractiveViewBoard"];
        [self presentViewController:svc animated:YES completion:nil];
    }
}

- (IBAction)logoSelected:(UIButton*)sender event:(id)event
{
    interactiveHeaderString = @"Create Mat";
    indexPathSend = (int)sender.tag;

    nameString = [artworkNameArray objectAtIndex:indexPathSend];
    // NSLog(@" nameStringLogoSelected %@",nameString);
    matBGColorString = @" ";
    matColorString = @" ";

    /* if (indexPathSend <artworkFullImageArray.count-1 &&
     artworkFullImageArray.count > 0){

         logoUseString =[artworkFullImageArray objectAtIndex:indexPathSend];


         if (logoUseString==NULL)
         {

             logoUseString= @"No Picture is Provided";

         }

     }*/

    sellerString = [artworkSellerArray objectAtIndex:indexPathSend];
    if ([[NSNull null] isEqual:sellerString]) {
        sellerString = nil;
    }

    companyString = [artworkCompanyArray objectAtIndex:indexPathSend];
    if ([[NSNull null] isEqual:companyString]) {
        companyString = nil;
    }
    numberString = [artworkIDArray objectAtIndex:indexPathSend];
    if ([[NSNull null] isEqual:numberString]) {
        numberString = nil;
    }

    sizeString = [artworkSizeArray objectAtIndex:indexPathSend];
    if ([[NSNull null] isEqual:sizeString]) {
        sizeString = @"4'x 6'";
    }

    logoColorString = [artworkColorArray objectAtIndex:indexPathSend];
    if ([[NSNull null] isEqual:logoColorString]) {
        numberString = nil;
    }

    /*if (indexPathSend <artworkColorArray.count-1){

            logoColorString =[artworkColorArray objectAtIndex:indexPathSend];

            if (logoColorString==NULL)
            {

                logoColorString= @"No colors available";

            }


        }*/

    urlString = [artworkFullImageArray objectAtIndex:indexPathSend];

    /*if(logoUseString==NULL){


        NSString*pngString= @".png";



        urlString = [logoUseString stringByAppendingString:pngString];



    }*/
    if ([urlString rangeOfString:@"cintas"].location == NSNotFound) {
        NSArray* directoryPath = NSSearchPathForDirectoriesInDomains(
            NSDocumentDirectory, NSUserDomainMask, YES);
        NSString* imagePath = [directoryPath objectAtIndex:0];
        // imagePath= [imagePath stringByAppendingPathComponent:@"logoImage.png"];
        imagePath = [imagePath stringByAppendingPathComponent:urlString];
        // imagePath= [imagePath stringByAppendingPathComponent:nameString];
        // NSLog(@"urlMatStringInMethod:%@",urlMatString);

        NSData* data = [NSData dataWithContentsOfFile:imagePath];
        // no data here
        UIImage* logoImage = [UIImage imageWithData:data];

        // NSLog(@"%@iconImage",iconImage);
        imagePath = [NSHomeDirectory()
            stringByAppendingPathComponent:
                [NSString stringWithFormat:@"Documents/logoImage.png"]];
        [UIImagePNGRepresentation(logoImage) writeToFile:imagePath
                                              atomically:YES];

    } else {
        NSString* httpString = @"http://";
        NSString* urlStringAppend =
            [httpString stringByAppendingString:urlString];

        NSData* data =
            [NSData dataWithContentsOfURL:[NSURL URLWithString:urlStringAppend]];

        UIImage* iconImage;

        iconImage = [UIImage imageWithData:data];

        // NSLog(@"%@iconImage",iconImage);
        NSString* imagePath = [NSHomeDirectory()
            stringByAppendingPathComponent:
                [NSString stringWithFormat:@"Documents/logoImage.png"]];
        [UIImagePNGRepresentation(iconImage) writeToFile:imagePath
                                              atomically:YES];
    }

    /*if ([[NSNull null] isEqual:logoUseString]) {
        logoUseString = nil;
    }

    if (indexPathSend <artworkFullImageArray.count-1){

            //urlString =[artworkFullImageArray objectAtIndex:indexPathSend];
            NSString*httpString= @"http://";
            NSString *urlStringAppend = [httpString
    stringByAppendingString:logoUseString];
            NSData * data = [NSData dataWithContentsOfURL:[NSURL
    URLWithString:urlStringAppend]];
            UIImage * iconImage;
            iconImage = [UIImage imageWithData:data];
            //NSLog(@"%@iconImage",iconImage);


            NSString  *imagePath = [NSHomeDirectory()
    stringByAppendingPathComponent:[NSString
    stringWithFormat:@"Documents/logoImage.png"]];
            [UIImagePNGRepresentation(iconImage) writeToFile:imagePath
    atomically:YES];


        }*/
}

// handle NsNull correctly
- (IBAction)matSelected:(UIButton*)sender event:(id)event
{
    interactiveHeaderString = @"Edit Mat";
    // NSLog(@"addButton.tag:%ld",(long)sender.tag);

    // int myInt = (int)sender.tag;
    indexPathSend = (int)sender.tag;
    NSLog(@"indexPathSend:%i", indexPathSend);

    /* if([NSNull null] != [matNameArray objectAtIndex:indexPathSend])

     {
         nameString =[matNameArray objectAtIndex:indexPathSend];


     } else {


         nameString =@" ";


     }*/

    nameString = [matNameArray objectAtIndex:indexPathSend];
    if ([[NSNull null] isEqual:nameString]) {
        nameString = nil;
    }

    sellerString = [matSellerArray objectAtIndex:indexPathSend];
    if ([[NSNull null] isEqual:sellerString]) {
        sellerString = nil;
    }

    companyString = [matCompanyArray objectAtIndex:indexPathSend];
    if ([[NSNull null] isEqual:companyString]) {
        companyString = nil;
    }
    numberString = [matIDArray objectAtIndex:indexPathSend];
    if ([[NSNull null] isEqual:numberString]) {
        numberString = nil;
    }

    sizeString = [matSizeArray objectAtIndex:indexPathSend];
    if ([[NSNull null] isEqual:sizeString]) {
        sizeString = @"4'x 6'";
    }

    logoColorString = [matColorArray objectAtIndex:indexPathSend];
    if ([[NSNull null] isEqual:matColorString]) {
        logoColorString = nil;
    }
    // NSLog(@"logoColorString %@",logoColorString);
    // NSLog(@"matBGColorArray %@",matBGColorArray);
    matBGColorString = [matBGColorArray objectAtIndex:indexPathSend];
    // NSLog(@"matBGColorString %@",matBGColorString);
    if ([[NSNull null] isEqual:matBGColorString]) {
        matBGColorString = nil;
    }

    interactiveHeaderString = @"Edit Mat";

    // TODO add if urlMatString case nameString
    urlMatString = [matFullImageArray objectAtIndex:indexPathSend];

    if (urlMatString == NULL || urlMatString == nil) {
        /*  NSString*matUrlAppendAddFavString= nameField.text;
         NSLog(@"matUrlAppendAddFavString %@",matUrlAppendAddFavString);*/
        NSString* pngString = @".png";
        // NSLog(@"nameFieldText %@",nameField.text);
        // NSLog(@"nameFieldText %@",nameHideField.text);

        urlMatString = [nameString stringByAppendingString:pngString];
    }

    //
    // NSString*urlString =urlMatString;
    // new code
    if ([urlMatString rangeOfString:@"cintas"].location == NSNotFound) {
        NSArray* directoryPath = NSSearchPathForDirectoriesInDomains(
            NSDocumentDirectory, NSUserDomainMask, YES);
        NSString* imagePath = [directoryPath objectAtIndex:0];
        // imagePath= [imagePath stringByAppendingPathComponent:@"logoImage.png"];
        imagePath = [imagePath stringByAppendingPathComponent:urlString];
        // imagePath= [imagePath stringByAppendingPathComponent:nameString];
        // NSLog(@"urlMatStringInMethod:%@",urlMatString);

        NSData* data = [NSData dataWithContentsOfFile:imagePath];
        // no data here
        UIImage* logoImage = [UIImage imageWithData:data];

        // NSLog(@"%@iconImage",iconImage);
        NSString* imagePath1 = [NSHomeDirectory()
            stringByAppendingPathComponent:
                [NSString stringWithFormat:@"Documents/matImage.png"]];
        [UIImagePNGRepresentation(logoImage) writeToFile:imagePath1
                                              atomically:YES];

    } else {
        NSString* httpString = @"http://";
        NSString* urlStringAppend =
            [httpString stringByAppendingString:urlMatString];

        NSData* data =
            [NSData dataWithContentsOfURL:[NSURL URLWithString:urlStringAppend]];

        UIImage* iconImage;

        iconImage = [UIImage imageWithData:data];

        // NSLog(@"%@iconImage",iconImage);
        NSString* imagePath1 = [NSHomeDirectory()
            stringByAppendingPathComponent:
                [NSString stringWithFormat:@"Documents/matImage.png"]];
        [UIImagePNGRepresentation(iconImage) writeToFile:imagePath1
                                              atomically:YES];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"logoPickedSegue"]) {
        InteractiveViewController* goingController =
            segue.destinationViewController;

        if (logoUseString != NULL) {
            goingController.logoUseStringHere = logoUseString;

        } else {
            goingController.logoUseStringHere = @" ";
        }

        if (nameString != NULL) {
            goingController.nameString = nameString;

        } else {
            goingController.nameString = @" ";
        }

        // NSLog(@"logoUseString %@",logoUseString);

        // NSLog(@"nameStringSend %@",nameString);
        // goingController.nameString=nameString;
        // goingController.companyString=companyString;

        if (companyString != NULL) {
            goingController.companyString = companyString;

        } else {
            goingController.companyString = @" ";
        }

        if (sellerString != NULL) {
            goingController.sellerString = sellerString;

        } else {
            goingController.sellerString = @" ";
        }

        if (numberString != NULL) {
            goingController.numberString = numberString;

        } else {
            goingController.numberString = @" ";
        }

        if (sizeString != NULL) {
            goingController.sizeString = sizeString;

        } else {
            goingController.sizeString = @" ";
        }

        if (logoColorString != NULL) {
            goingController.logoColorString = logoColorString;

        } else {
            goingController.logoColorString = @" ";
        }

        if (matColorString != NULL) {
            goingController.matColorString = matColorString;

        } else {
            goingController.matColorString = @" ";
        }
        goingController.matBGColorString = matBGColorString;
        /*if(matBGColorString!=NULL)

      {
          goingController.matBGColorString=matBGColorString;

      }else{

          goingController.matBGColorString=@" ";

      }*/
        if (interactiveHeaderString != NULL) {
            goingController.interactiveHeaderString = interactiveHeaderString;

        } else {
            goingController.interactiveHeaderString = @"Create Mat";
        }

        // goingController.numberString=numberString;
    }

    if ([segue.identifier isEqualToString:@"collectionPickedSegue"]) {
        LogoCollectionViewController* goingController =
            segue.destinationViewController;

        goingController.artworkNameArray = artworkNameArray;
        goingController.artworkSizeArray = artworkSizeArray;
        goingController.artworkFormatArray = artworkFormatArray;
        goingController.artworkIconArray = artworkIconArray;
        goingController.artworkFullImageArray = artworkFullImageArray;
        goingController.artworkIDArray = artworkIDArray;
        goingController.artworkCompanyArray = artworkCompanyArray;
        goingController.artworkSellerArray = artworkSellerArray;
        goingController.artworkColorArray = artworkColorArray;
        goingController.artworkLocationIDArray = artworkLocationIDArray;
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
        goingController.matBGColorArray = matColorArray;
        goingController.matLocationIDArray = matLocationIDArray;
        goingController.matCount = matCount;
    }
}
// gets managedObjectContext from the appDelegate
- (NSManagedObjectContext*)managedObjectContext
{
    NSManagedObjectContext* context = nil;
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

- (void)textFieldDidChange:(UITextField*)searchHereField
{
    searchHereString = searchHereField.text;
    // NSLog(@"searchHereField %@",searchHereString);
}

//- (void)didSetSearchString:(InteractiveViewController *)controller{

// searchString=_searchField.text;

//[self dismissViewControllerAnimated:YES completion:nil];

// }

//[self dismissViewControllerAnimated:YES completion:nil];

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
