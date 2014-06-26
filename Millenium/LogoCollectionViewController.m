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




@synthesize searchingString;
//@synthesize searchingString;


@synthesize intMat;
@synthesize intLogo;

@synthesize artworkCount;
@synthesize matCount;
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


@synthesize firstNameString;
@synthesize lastNameString;
@synthesize userIDString;
@synthesize locationIDString;
@synthesize locationNameString;
@synthesize locationNumberString;



@synthesize favoritesMatArray;
@synthesize favoritesLogoArray;


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
    
    
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activityIndicator.alpha = 1.0;
    activityIndicator.center = CGPointMake(160, 360);
    activityIndicator.hidesWhenStopped = NO;
    [self.view addSubview:activityIndicator];
    
     NSLog(@"locationIDString: %@", locationIDString);
    
    
    //removeFavLogoLabel.hidden= YES;
    
    NSLog(@"locationIDString %@",locationIDString);
    //NSLog(@"artworkNameDictionary %@",artworkNameDictionary);
    //NSLog(@"artworkNameArray %@",artworkNameArray);
    //NSLog(@"artworkIconArray %@",artworkIconArray);
    //NSLog(@"matNameArray %@",matNameArray);
    
    //NSLog(@"matSellerArray %@",matSellerArray);
    
    
    if (locationIDString==nil) {
   
        
        locationIDString = [[NSUserDefaults standardUserDefaults]
                            stringForKey:@"locationID"];
        NSLog(@"locationIDString: %@", locationIDString);
    }
    
    
    UIImageView *whitePadView = [[UIImageView alloc] initWithFrame:CGRectMake(00, 0, 1024, 170)];
    whitePadView.backgroundColor = [UIColor lightGrayColor];
    whitePadView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    whitePadView.layer.shadowOffset = CGSizeMake(0, 1);
    whitePadView.layer.shadowOpacity = 1.0;
    whitePadView.alpha = 0.5;
    whitePadView.clipsToBounds = NO;
    [self.view addSubview:whitePadView];
    
    
    //headers for Logos and Mats
    UILabel*logoLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 140, 280, 30)];
    logoLabel.font = [UIFont fontWithName:@"Avenir-Light" size:25];
    logoLabel.text = @"INTERACTIVE LOGOS";
    [self.view addSubview:logoLabel];
    
    UILabel*matLabel = [[UILabel alloc] initWithFrame:CGRectMake(550, 140, 200, 30)];
    matLabel.font = [UIFont fontWithName:@"Avenir-Light" size:25];
    matLabel.text = @"MATS";
    [self.view addSubview:matLabel];

    
    searchHereField = [[UITextField alloc] initWithFrame:CGRectMake(326, 44, 200, 30)];
    searchHereField.borderStyle = UITextBorderStyleRoundedRect;
    searchHereField.font = [UIFont fontWithName:@"Avenir-Light" size:25];
    searchHereField.placeholder = @"SEARCH";
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
    [favHereButton setBackgroundImage:favHereImage forState:UIControlStateSelected];
     [favHereButton setBackgroundImage:favHereImage forState:UIControlStateHighlighted];
    //[favHereButton setImage:favHereImage forState:UIControlStateSelected];
    favHereButton.frame = CGRectMake(90.0, 33.0, 50.0, 50.0);
    [self.view addSubview:favHereButton];
    
    
    UIButton *repHereButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [repHereButton addTarget:self
                      action:@selector(goRep:)
            forControlEvents:UIControlEventTouchDown];
    
    
    UIImage*repHereImage = [UIImage imageNamed:@"AssetsRepButton.png"];
    [repHereButton setBackgroundImage:repHereImage forState:UIControlStateNormal];
    repHereButton.frame = CGRectMake(226.0, 33.0, 45.0, 45.0);
    [self.view addSubview:repHereButton];
    
    
    UIButton *nearHereButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [nearHereButton addTarget:self
                      action:@selector(goNearMe:)
            forControlEvents:UIControlEventTouchDown];
    
    
    UIImage*nearHereImage = [UIImage imageNamed:@"AssetsCompassButton.png"];
    [nearHereButton setBackgroundImage:nearHereImage forState:UIControlStateNormal];
    nearHereButton.frame = CGRectMake(158.0, 33.0, 50.0, 50.0);
    [self.view addSubview:nearHereButton];
    
    
    /*UIButton *searchModeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [searchModeButton addTarget:self
                       action:@selector(goSearchMode:)
             forControlEvents:UIControlEventTouchDown];*/
    
    /*UIButton *searchModeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [searchModeButton addTarget:self
                         action:@selector(removeAllFavorites:)
               forControlEvents:UIControlEventTouchDown];
    
    
    UIImage*searchModeImage = [UIImage imageNamed:@"AssetsSearchButton.png"];
    [searchModeButton setBackgroundImage:searchModeImage forState:UIControlStateNormal];
    searchModeButton.frame = CGRectMake(249.0, 33.0, 50.0, 50.0);
    [self.view addSubview:searchModeButton];*/
    
    
    

    
    UIButton *searchHereButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [searchHereButton addTarget:self
               action:@selector(goSearch:)
     forControlEvents:UIControlEventTouchDown];
    
    
    UIImage*searchHereImage = [UIImage imageNamed:@"AssetsSearchButton.png"];
    [searchHereButton setBackgroundImage:searchHereImage forState:UIControlStateNormal];
    searchHereButton.frame = CGRectMake(530.0, 35.0, 50.0, 50.0);
    [self.view addSubview:searchHereButton];
    
    
   /* UIButton *searchVariationButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [searchVariationButton addTarget:self
                         action:@selector(goSearchVariation:)
               forControlEvents:UIControlEventTouchDown];
    
    
    UIImage*searchVariationImage = [UIImage imageNamed:@"AssetsDefaultButton.png"];
    [searchVariationButton setBackgroundImage:searchVariationImage forState:UIControlStateNormal];
    searchVariationButton.frame = CGRectMake(570.0, 30.0, 40.0, 40.0);
    [self.view addSubview:searchVariationButton];*/

    
    
    UIButton *cintasHomeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [cintasHomeButton addTarget:self
                         action:@selector(goHome:)
               forControlEvents:UIControlEventTouchDown];
    
    UIImage*cintasImage = [UIImage imageNamed:@"CintasLogoBlackClear.png"];
    [cintasHomeButton setBackgroundImage:cintasImage forState:UIControlStateNormal];
    //[searchHereButton setImage:AssetsDefaultButton.png" forState:UIControlStateNormal];
    cintasHomeButton.frame = CGRectMake(888.0, 20.0, 137.0, 60.0);
    [self.view addSubview:cintasHomeButton];
    
    UILabel*headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(932, 70, 200, 30)];
    headerLabel.font = [UIFont fontWithName:@"Avenir-Light" size:24];
    headerLabel.text = @"LOGOS";
    [self.view addSubview:headerLabel];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
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




-(IBAction)goFav:(id)sender{
    
    
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activityIndicator.alpha = 1.0;
    activityIndicator.center = CGPointMake(160, 360);
    activityIndicator.hidesWhenStopped = NO;
    [self.view addSubview:activityIndicator];
    [activityIndicator startAnimating];
    searchingString=@"searchingFavString";
    //TODO load into CoreData anything that is in Favorites.
    
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"LogoFavorite"];
    self.favoritesLogoArray = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    NSManagedObjectContext *managedObjectContext1 = [self managedObjectContext];
    NSFetchRequest *fetchRequestMat = [[NSFetchRequest alloc] initWithEntityName:@"MatFavorite"];
    //self.favoritesArray = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    self.favoritesMatArray = [[managedObjectContext1 executeFetchRequest:fetchRequestMat error:nil] mutableCopy];
    
    
    
    NSLog(@"favoritesLogoArray %@",favoritesLogoArray);
    NSLog(@"favoritesMatArray %@",favoritesMatArray);
    // NSLog(@"logoSearch %@",logoSearch);
    
    
    
    [favoritesLogoArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
        
        //NSLog(@"%@", object);
        //NSLog(@"searchLogoArray %@",favoritesLogoArray);
        
        
        artworkNameArray = [favoritesLogoArray valueForKey:@"ArtworkName"];
        //NSLog(@"artWorkNameArray: %@", artworkNameArray);
        artworkSizeArray = [favoritesLogoArray valueForKey:@"ArtworkSize"];
        artworkFormatArray = [favoritesLogoArray valueForKey:@"Format"];
        artworkFullImageArray = [favoritesLogoArray valueForKey:@"FullImageURL"];
        artworkIconArray = [favoritesLogoArray valueForKey:@"IconURL"];
        artworkIDArray = [favoritesLogoArray valueForKey:@"ProductID"];
        artworkLocationIDArray = [favoritesLogoArray valueForKey:@"LocationID"];
        artworkSellerArray = [favoritesLogoArray valueForKey:@"Seller"];
        artworkColorArray = [favoritesLogoArray valueForKey:@"Color"];
        artworkCompanyArray = [favoritesLogoArray valueForKey:@"Company"];
        
        artworkCount = artworkNameArray.count;
        
        
        NSLog(@"artworkFullImageArray %@",artworkFullImageArray);
        
    }];
    
    [favoritesMatArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
        
        //NSLog(@"%@", object);
        //NSLog(@"searchLogoArray %@",favoritesMatArray);
        
        
        matNameArray = [favoritesMatArray valueForKey:@"ArtworkName"];
        //NSLog(@"matNameArray: %@", matNameArray);
        
        matSizeArray = [favoritesMatArray valueForKey:@"ArtworkSize"];
        matFormatArray = [favoritesMatArray valueForKey:@"Format"];
        matFullImageArray = [favoritesMatArray valueForKey:@"FullImageURL"];
        matIconArray = [favoritesMatArray valueForKey:@"IconURL"];
        matIDArray = [favoritesMatArray valueForKey:@"ProductID"];
        matLocationIDArray = [favoritesMatArray valueForKey:@"LocationID"];
        matSellerArray = [favoritesMatArray valueForKey:@"Seller"];
        matCompanyArray = [favoritesMatArray valueForKey:@"Company"];
        matColorArray = [favoritesMatArray valueForKey:@"Color"];
        //matBGColorArray = [_favoritesMatArray valueForKey:@"BGColor"];
        
        matCount = matNameArray.count;
        [activityIndicator stopAnimating];
        
        
    }];

    
    
    
    //[self.collectionView reloadData];
    
    
    UIStoryboard *storyboard = self.storyboard;
    FavCollectionViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"FavViewBoard"];
    [self presentViewController:svc animated:YES completion:nil];


    
    
}



-(IBAction)goRep:(id)sender{
    
    
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activityIndicator.alpha = 1.0;
    activityIndicator.center = CGPointMake(160, 360);
    activityIndicator.hidesWhenStopped = NO;
    [self.view addSubview:activityIndicator];
    [activityIndicator startAnimating];
    
    userIDString = [[NSUserDefaults standardUserDefaults]
                        stringForKey:@"userID"];
    
    NSLog(@"userIDString: %@", userIDString);
    
    
   
    
    //Search Logos
    NSString*urlSearchString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/?searchString=%%%i&Orderby=mostPopular&interactiveOnly=1&locationID=-1&userID=%@",20,userIDString];
    
    NSURL *urlSearch = [[NSURL alloc] initWithString:urlSearchString];
    NSURLRequest *request = [NSURLRequest requestWithURL:
                             urlSearch];
    
    
    //NSLog(@"URLLOGIN: %@",urlSearch);
    
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
    
    
    
    
    artworkCount= searchLogoArray.count;

   /* NSURL *urlSearch = [[NSURL alloc] initWithString:urlSearchString];
    
    NSLog(@"UrlSearch: %@",urlSearch);
    NSError *error = nil;
    NSData *data = [NSData dataWithContentsOfURL:urlSearch];
    
    
    
    
    //parse Array from web
    NSArray *searchLogoArray = [NSJSONSerialization
                                JSONObjectWithData:data
                                options:NSJSONReadingAllowFragments
                                error: &error];*/
    
    
    
    
    
    //Search Mats
    NSString*urlSearchMatString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/?searchString=%%%i&Orderby=mostPopular&interactiveOnly=0&locationID=-1&userID=%@",20,userIDString];
    
    
    
    NSURL *urlSearchMat = [[NSURL alloc] initWithString:urlSearchMatString];
    NSURLRequest *requestMat = [NSURLRequest requestWithURL:
                                urlSearchMat];
    
    
    
    NSError *errorMat = nil;
    NSData *dataMat = [NSData dataWithContentsOfURL:urlSearchMat];//
    
    //NSLog(@"URLLOGIN: %@",urlSearch);
    
    [NSURLConnection sendAsynchronousRequest:requestMat
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
                   
               }] resume];
    
    
    
    
    
    //parse Array from web
    NSArray *searchMatArray = [NSJSONSerialization
                               JSONObjectWithData:dataMat
                               options:NSJSONReadingAllowFragments
                               error: &errorMat];
    
    
    
    
    
    matCount= searchMatArray.count;

   /*
    NSURL *urlSearchMat = [[NSURL alloc] initWithString:urlSearchMatString];
    
    NSLog(@"URLLOGIN: %@",urlSearchMat);
    NSError *errorMat = nil;
    NSData *dataMat = [NSData dataWithContentsOfURL:urlSearchMat];
    
    
    
    
    //parse Array from web
    NSArray *searchMatArray = [NSJSONSerialization
                               JSONObjectWithData:dataMat
                               options:NSJSONReadingAllowFragments
                               error: &error];*/
    
    
    if(data!=nil)
        
    {
        
        
        
        [searchLogoArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
            
            
            
            
            artworkNameArray = [searchLogoArray valueForKey:@"ArtworkName"];
            artworkCount= artworkNameArray.count;
            artworkSizeArray = [searchLogoArray valueForKey:@"ArtworkSize"];
            artworkFormatArray = [searchLogoArray valueForKey:@"Format"];
            artworkFullImageArray = [searchLogoArray valueForKey:@"FullImageURL"];
            artworkIconArray = [searchLogoArray valueForKey:@"IconURL"];
            artworkIDArray = [searchLogoArray valueForKey:@"ProductID"];
            artworkColorArray = [searchLogoArray valueForKey:@"Color"];
            
            artworkCount = artworkNameArray.count;
            
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
            
            matCount = matNameArray.count;
            
            [activityIndicator stopAnimating];
            
            
        }];
        
        [self.collectionView reloadData];
        
    }
    
    else {
        
        
        UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Your personal data is not available please login once more to the application" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
        
        [alert show];
        
        
    }

}



-(IBAction)goNearMe:(id)sender{
   
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activityIndicator.alpha = 1.0;
    activityIndicator.center = CGPointMake(160, 360);
    activityIndicator.hidesWhenStopped = NO;
    [self.view addSubview:activityIndicator];
    [activityIndicator startAnimating];
    
    locationIDString = [[NSUserDefaults standardUserDefaults]
                        stringForKey:@"locationID"];
    
    //NSLog(@"locationIDString: %@", locationIDString);
   
    
    
    
    //Search Logos
    NSString*urlSearchString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/?searchString=%%%i&Orderby=mostPopular&interactiveOnly=1&locationID=%@&userID=0",20,locationIDString];
    
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
    
    
    

    artworkCount= searchLogoArray.count;

    
   /* NSURL *urlSearch = [[NSURL alloc] initWithString:urlSearchString];
    
    //NSLog(@"URLLOGIN: %@",urlSearch);
    NSError *error = nil;
    NSData *data = [NSData dataWithContentsOfURL:urlSearch];
    
    
    
    
    //parse Array from web
    NSArray *searchLogoArray = [NSJSONSerialization
                                JSONObjectWithData:data
                                options:NSJSONReadingAllowFragments
                                error: &error];*/
    
    
    
    
    
    //Search Mats
    NSString*urlSearchMatString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/?searchString=%%%i&Orderby=mostPopular&interactiveOnly=0&locationID=%@&userID=0",20,locationIDString];
    
    NSURL *urlSearchMat = [[NSURL alloc] initWithString:urlSearchMatString];
    NSURLRequest *requestMat = [NSURLRequest requestWithURL:
                                urlSearchMat];
    
    
    
    NSError *errorMat = nil;
    NSData *dataMat = [NSData dataWithContentsOfURL:urlSearchMat];//
    
    //NSLog(@"URLLOGIN: %@",urlSearch);
    
    [NSURLConnection sendAsynchronousRequest:requestMat
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
                   
               }] resume];
    
    
    
    
    
    //parse Array from web
    NSArray *searchMatArray = [NSJSONSerialization
                               JSONObjectWithData:dataMat
                               options:NSJSONReadingAllowFragments
                               error: &errorMat];
    
    
    
    
    
    matCount= searchMatArray.count;

    
   /* NSURL *urlSearchMat = [[NSURL alloc] initWithString:urlSearchMatString];
    
    NSLog(@"URLLOGIN: %@",urlSearchMat);
    NSError *errorMat = nil;
    NSData *dataMat = [NSData dataWithContentsOfURL:urlSearchMat];
    
    
    
    
    //parse Array from web
    NSArray *searchMatArray = [NSJSONSerialization
                               JSONObjectWithData:dataMat
                               options:NSJSONReadingAllowFragments
                               error: &error];*/
    
    
    if(data!=nil)
        
    {
        
        
       
        [searchLogoArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
        
        
        
        
            artworkNameArray = [searchLogoArray valueForKey:@"ArtworkName"];
            artworkCount= artworkNameArray.count;
            artworkSizeArray = [searchLogoArray valueForKey:@"ArtworkSize"];
            artworkFormatArray = [searchLogoArray valueForKey:@"Format"];
            artworkFullImageArray = [searchLogoArray valueForKey:@"FullImageURL"];
            artworkIconArray = [searchLogoArray valueForKey:@"IconURL"];
            artworkIDArray = [searchLogoArray valueForKey:@"ProductID"];
            artworkColorArray = [searchLogoArray valueForKey:@"Color"];
        
            artworkCount = artworkNameArray.count;
        
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
            matColorArray = [searchMatArray valueForKey:@"Color"];
        
            matCount = matNameArray.count;
        
            [activityIndicator stopAnimating];
        
        
        }];
    
        [self.collectionView reloadData];
        
    }
    
    else {
        
        
        UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Your location is not available please login once more to the application" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
        
        [alert show];

        
    }
    
    
    
}







-(IBAction)goSearch:(id)sender{
    
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activityIndicator.alpha = 1.0;
    activityIndicator.center = CGPointMake(160, 360);
    activityIndicator.hidesWhenStopped = NO;
    [self.view addSubview:activityIndicator];
   
    
    
    [activityIndicator startAnimating];
    
    if( searchHereField.text!= Nil || [searchHereField.text length] == 0 ) {
        
        
        NSString*searchOneString= searchHereField.text;
        
        NSInteger nWords = 1;
        NSRange wordRange = NSMakeRange(0, nWords);
        NSArray *searchStringArray = [[searchOneString componentsSeparatedByString:@" "] subarrayWithRange:wordRange];
        
        NSString*searchYeahString= [searchStringArray objectAtIndex:0];
        
        
        //Search Logos
        
        NSString*urlSearchString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/?searchString=%@&Orderby=mostPopular&interactiveOnly=1&locationID=-1&userID=0", searchYeahString];
        
        
        NSURL *urlSearch = [[NSURL alloc] initWithString:urlSearchString];
        NSURLRequest *request = [NSURLRequest requestWithURL:
                                 urlSearch];
        
        
        //NSLog(@"URLLOGIN: %@",urlSearch);
        
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
        
        
        
        
        
        
        artworkCount= searchLogoArray.count;
        
        
        NSString*urlSearchMatString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/?searchString=%@&Orderby=mostPopular&interactiveOnly=0&locationID=-1&userID=0", searchYeahString];
        
        NSURL *urlSearchMat = [[NSURL alloc] initWithString:urlSearchMatString];
        NSURLRequest *requestMat = [NSURLRequest requestWithURL:
                                    urlSearchMat];
        
        
       
        NSError *errorMat = nil;
        NSData *dataMat = [NSData dataWithContentsOfURL:urlSearchMat];//
        
        //NSLog(@"URLLOGIN: %@",urlSearch);
        
        [NSURLConnection sendAsynchronousRequest:requestMat
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
                       
                   }] resume];
        
        
       
        
        
        //parse Array from web
        NSArray *searchMatArray = [NSJSONSerialization
                                   JSONObjectWithData:dataMat
                                   options:NSJSONReadingAllowFragments
                                   error: &errorMat];
        
        
        
        
        
        matCount= searchMatArray.count;
        //NSLog(@"%@SearchMatArray",searchMatArray);
        
        
        
        
        
        
        
        
        
        [searchLogoArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
            
            //NSLog(@"%@", object);
            //NSLog(@"searchLogoArray %@",searchLogoArray);
            
            
            artworkNameArray = [searchLogoArray valueForKey:@"ArtworkName"];
            artworkCount= artworkNameArray.count;
            
            
            //NSLog(@"artWorkNameArray: %@", artworkNameArray);
            artworkSizeArray = [searchLogoArray valueForKey:@"ArtworkSize"];
            //NSLog(@"artworkSizeArray %@",artworkSizeArray);
            artworkFormatArray = [searchLogoArray valueForKey:@"Format"];
            //NSLog(@"artworkFormatString %@",artworkFormatArray);
            artworkFullImageArray = [searchLogoArray valueForKey:@"FullImageURL"];
            //NSLog(@"fullImageArray %@",artworkFullImageArray);
            artworkIconArray = [searchLogoArray valueForKey:@"IconURL"];
            artworkIDArray = [searchLogoArray valueForKey:@"ProductID"];
            artworkCompanyArray = [searchLogoArray valueForKey:@"CompanyName"];
            artworkSellerArray = [searchLogoArray valueForKey:@"Seller"];
            artworkColorArray = [searchLogoArray valueForKey:@"Color"];
            
            
            
        }];
        
        
        
        [searchMatArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
            
            //NSLog(@"%@", object);
            //NSLog(@"searchMatArray %@",searchMatArray);
            
            
            matNameArray = [searchMatArray valueForKey:@"ArtworkName"];
            matCount= matNameArray.count;
            //NSLog(@"matNameArray: %@", matNameArray);
            //NSLog(@"matNameArrayCount: %d", matNameArray.count);
            
            matSizeArray = [searchMatArray valueForKey:@"ArtworkSize"];
            //NSLog(@"matSizeArray %@",matSizeArray);
            
            matFormatArray = [searchMatArray valueForKey:@"Format"];
            //NSLog(@"matFormatString %@",matFormatArray);
            
            matFullImageArray = [searchMatArray valueForKey:@"FullImageURL"];
            //NSLog(@"fullImageArray %@",matFullImageArray);
            
            
            matIconArray = [searchMatArray valueForKey:@"IconURL"];
            
            matCompanyArray = [searchMatArray valueForKey:@"CompanyName"];
            matSellerArray = [searchMatArray valueForKey:@"Seller"];
            //NSLog(@"matNameSellerArrayCount: %d", matSellerArray.count);
            
            matIDArray = [searchMatArray valueForKey:@"ProductID"];
            matColorArray = [searchMatArray valueForKey:@"Color"];
            matBGColorArray = [searchMatArray valueForKey:@"BGColor"];
            
            [activityIndicator stopAnimating];

            
            
        }];
        
        
    } else{
        
        UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter text in the search field" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
        
        [alert show];
    }
    

        
        [self.collectionView reloadData];
    
   
    
    

    
    
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



-(IBAction)removeAllFavorites:(id)sender{
    
    
    
    
    
    
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"LogoFavorite"];
    //self.favoritesArray = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    self.favoritesLogoArray = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    
    
   /* NSFetchRequest * removeAllLogos = [[NSFetchRequest alloc] init];
    [removeAllLogos setEntity:[NSEntityDescription entityForName:@"LogoFavorite" inManagedObjectContext:context]];*/
    [fetchRequest setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    
    NSError * error = nil;
    //NSArray * Logos = [context executeFetchRequest:fetchRequest error:&error];
    //[removeAllLogos release];
    //error handling goes here
    for (NSManagedObject * logo in self.favoritesLogoArray) {
        [context deleteObject:logo];
    }
    NSError *saveError = nil;
    [context save:&saveError];
    
    
    NSManagedObjectContext *matContext = [self managedObjectContext];
    
    
    NSFetchRequest * removeAllMats = [[NSFetchRequest alloc] init];
    [removeAllMats setEntity:[NSEntityDescription entityForName:@"MatFavorite" inManagedObjectContext:matContext]];
    [removeAllMats setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    
    NSError * errorMats = nil;
    NSArray * Mats = [matContext executeFetchRequest:removeAllMats error:&error];
    
    for (NSManagedObject * mat in Mats) {
        [context deleteObject:mat];
    }
    NSError *saveErrorMat = nil;
    [context save:&saveErrorMat];

}

    


-(IBAction)addMatFavorite:(id)sender{
    
    //NSLog(@"matNameArray %@",matNameArray);
    //NSLog(@"matNameArrayCount %d",matNameArray.count);
    //NSLog(@"indexPathSend %d",indexPathSend);
    
    
    
    
    if([NSNull null] != [matFullImageArray objectAtIndex:indexPathSend])
        
    {
        matUrlAddFavString =[matFullImageArray objectAtIndex:indexPathSend];
        
    } else {
        
        matUrlAddFavString =@"No Image has been provided";
        
        
    }

    //NSLog(@"matUrlAddFavString %@",matUrlAddFavString);
    //NSLog(@"matFullImageArrayCount %d",matFullImageArray.count);
    
    
    
    if([NSNull null] != [matNameArray objectAtIndex:indexPathSend])
        
    {
        matNameAddFavString =[matNameArray objectAtIndex:indexPathSend];
        
    } else {
        
        matNameAddFavString =@"No Name has been provided";

        
    }
    
    
    //NSLog(@"matNameAddFavString %@",matNameAddFavString);
    //NSLog(@"matNameArrayCount %d",matNameArray.count);
    
    if([NSNull null] != [matSellerArray objectAtIndex:indexPathSend])
        
    {
        matSellerAddFavString =[matSellerArray objectAtIndex:indexPathSend];
        
    } else {
        
        matSellerAddFavString =@"Seller";
        

    }

    
        //NSLog(@" matSellerAddFavString %@",matSellerAddFavString);
        //NSLog(@" matSellerArrayCount %d",matSellerArray.count);
    
    
    if([NSNull null] != [matCompanyArray objectAtIndex:indexPathSend])
        
        {
            matCompanyAddFavString =[matCompanyArray objectAtIndex:indexPathSend];
        
         
        } else {
        
        
                matCompanyAddFavString =@"Company";
        
        
    }
    //NSLog(@"matCompanyAddFavString %@",matCompanyAddFavString);
    //NSLog(@"matCompanyArrayCount %d",matCompanyArray.count);
    
    
    if([NSNull null] != [matIDArray objectAtIndex:indexPathSend])
        
    {
        matIDAddFavString =[matIDArray objectAtIndex:indexPathSend];
        
    } else {
        
        
        
        matIDAddFavString =@"No product ID has been provided";
        
    }

    
    //NSLog(@" matIDAddFavString %@",matIDAddFavString);
    //NSLog(@" matIDArrayCount %d",matIDArray.count);
    
    if([NSNull null] != [matLocationIDArray objectAtIndex:indexPathSend])
        
    {
        matLocationIDAddFavString =[matLocationIDArray objectAtIndex:indexPathSend];

        
    } else {
        
        matLocationIDAddFavString =@"No location is available";
    }
    
    
   // NSLog(@" matLocationIDAddFavString %@",matLocationIDAddFavString);
    
    if([NSNull null] != [matColorArray objectAtIndex:indexPathSend])
        
    {
        matColorAddFavString =[matColorArray objectAtIndex:indexPathSend];
        
    } else {
        
        matColorAddFavString =@"No Colors are provided";
        
        
    }
        //NSLog(@" matColorAddFavString %@",matColorAddFavString);
    
    if([NSNull null] != [matBGColorArray objectAtIndex:indexPathSend])
        
    {
        matBGColorAddFavString =[matBGColorArray objectAtIndex:indexPathSend];
        
    } else {
        
        matBGColorAddFavString =@"No BG Colors are provided";
        
        
    }
    
    //NSLog(@" matBGColorAddFavString %@",matBGColorAddFavString);
    
    
    if([NSNull null] != [matSizeArray objectAtIndex:indexPathSend])
        
    {
        
        matSizeAddFavString =[matSizeArray objectAtIndex:indexPathSend];
        
        
    } else {
        
        matSizeAddFavString =@"4'x 6'";
        
    }
    
    
    //NSLog(@" matSizeAddFavString %@",matSizeAddFavString);
    
    
   
    
    

    
    
   /* if (matUrlAddFavString==NULL)
    {
        
        matUrlAddFavString= @"No Image Is Available";
        
    }
    
    if (matNameAddFavString==NULL)
    {
        
        matNameAddFavString= @"The Artwork has no name";
        
    }*/
    
    
    //if (matCompanyAddFavString==NULL)
    
    
        
    /*if ([matCompanyAddFavString isEqualToString:@"class name = NSNull"])
    {
        
        matCompanyAddFavString= @"No Company Name Is Available";
        
    }*/
    
   /* if (matSellerAddFavString==NULL)
    {
        
        matSellerAddFavString= @"Sales Person Unknown";
        
    }
    
    
    if (matIDAddFavString==NULL)
    {
        
        matIDAddFavString= @"No ID Provided";
        
    }

    if (matLocationIDAddFavString==NULL)
    {
        
        matLocationIDAddFavString= @"No Location Provided";
        
    }
    
    if (matColorAddFavString==NULL)
    {
        
        matColorAddFavString= @"No Colors are provided";
        
    }
    
    if (matBGColorAddFavString==NULL)
    {
        
        matBGColorAddFavString= @"No Background Color is provided";
        
    }
    
    if (matSizeAddFavString==NULL)
    {
        
        matSizeAddFavString= @"4' x 6'";
        
    }*/

    
    //NSLog(@"urlFavString %@",matUrlAddFavString);
    //NSLog(@"urlFavString %@",matNameAddFavString);
    /*NSString*artworkCompanyAddFavString =[artworkCompanyArray objectAtIndex:indexPathSend];
     NSString*artworkSellerAddFavString =[artworkSellerArray objectAtIndex:indexPathSend];
     NSString*artworkNumberAddFavString =[artworkNumberArray objectAtIndex:indexPathSend];*/
    
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    NSManagedObject *newMatFavorite = [NSEntityDescription insertNewObjectForEntityForName:@"MatFavorite" inManagedObjectContext:context];
    
    [newMatFavorite setValue:self.matUrlAddFavString forKey:@"fullImageURL"];
    [newMatFavorite setValue:self.matNameAddFavString forKey:@"artworkName"];
    [newMatFavorite setValue:self.matCompanyAddFavString forKey:@"company"];
    [newMatFavorite setValue:self.matSellerAddFavString forKey:@"seller"];
    [newMatFavorite setValue:self.matIDAddFavString forKey:@"productID"];
    [newMatFavorite setValue:self.matLocationIDAddFavString forKey:@"locationID"];
    [newMatFavorite setValue:self.matColorAddFavString forKey:@"color"];
    [newMatFavorite setValue:self.matBGColorAddFavString forKey:@"bgColor"];
    [newMatFavorite setValue:self.matSizeAddFavString forKey:@"artworkSize"];
    
    
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        //NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    //Fetch Data entered to test
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"MatFavorite"];
    self.favoritesMatArray = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    //self->artworkName = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    
   // NSLog(@"favoritesMatArray %@",favoritesMatArray);
    
}

-(IBAction)removeMatFavorite:(id)sender{
    
    
    /*Millenium[14492:90b] indexPathSend 0
     2014-04-30 17:18:37.290 Millenium[14492:90b] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: 'keypath pid not found in entity <NSSQLEntity LogoFavorite id=1>'*/
    
    
    
    NSLog(@"indexPathSend %d",indexPathSend);
    
    //urlUnFavString =[artworkFullImageArray objectAtIndex:indexPathSend];
    artworkNameUnFavString =[artworkNameArray objectAtIndex:indexPathSend];
    NSManagedObjectContext *context = [self managedObjectContext];
    //NSNumber *soughtPid=[NSNumber numberWithInt:53];
    //NSEntityDescription *artworkNameEntity=[NSEntityDescription entityForName:@"LogoFavorite" inManagedObjectContext:context];
    
    NSEntityDescription *logoFavoriteEntity=[NSEntityDescription entityForName:@"MatFavorite" inManagedObjectContext:context];
    NSFetchRequest *fetch=[[NSFetchRequest alloc] init];
    [fetch setEntity:logoFavoriteEntity];
    NSPredicate *p=[NSPredicate predicateWithFormat:@"pid == %@", artworkNameUnFavString];
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
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"MatFavorite"];
    self.favoritesArray = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    //self->artworkName = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    
    //NSLog(@"favoritesArray %@",_favoritesArray);
    
    
    
    
    
}



-(IBAction)addLogoFavorite:(id)sender{
    
    
    //NSLog(@"indexPathSend %d",indexPathSend);
    
    
    if([NSNull null] != [artworkFullImageArray objectAtIndex:indexPathSend])
        
    {
        //matColorAddFavString =[matColorArray objectAtIndex:indexPathSend];
        urlFavString =[artworkFullImageArray objectAtIndex:indexPathSend];
        
    } else {
        
        urlFavString =@"No Image is provided";
        
        
    }
    
    if([NSNull null] != [artworkNameArray objectAtIndex:indexPathSend])
        
    {
        //matColorAddFavString =[matColorArray objectAtIndex:indexPathSend];
        artworkNameAddFavString =[artworkNameArray objectAtIndex:indexPathSend];
        
    } else {
        
        artworkNameAddFavString =@"No Name is provided";
        
        
    }
    
    
    if([NSNull null] != [artworkColorArray objectAtIndex:indexPathSend])
        
    {
        
        artworkColorAddFavString =[artworkColorArray objectAtIndex:indexPathSend];
        
    } else {
        
        artworkColorAddFavString =@"No Color is provided";
        
        
    }
    
    if([NSNull null] != [artworkSizeArray objectAtIndex:indexPathSend])
        
    {
        
        artworkSizeAddFavString =[artworkSizeArray objectAtIndex:indexPathSend];
        
    } else {
        
        artworkSizeAddFavString =@"4'x 6'";
        
        
    }
    
    if([NSNull null] != [artworkCompanyArray objectAtIndex:indexPathSend])
        
    {
        
        artworkCompanyAddFavString =[artworkCompanyArray objectAtIndex:indexPathSend];
        
        
    } else {
        
        artworkCompanyAddFavString =@"Company";
        
        
    }


    if([NSNull null] != [artworkSellerArray objectAtIndex:indexPathSend])
        
    {
        
        artworkSellerAddFavString =[artworkSellerArray objectAtIndex:indexPathSend];
        
    } else {
        
        artworkSellerAddFavString =@"Seller";
        
        
    }
    
    if([NSNull null] != [artworkIDArray objectAtIndex:indexPathSend])
        
    {
        
        artworkIDAddFavString =[artworkIDArray objectAtIndex:indexPathSend];
        
    } else {
        
        artworkIDAddFavString =@"no ID has been provided";
        
        
    }

       
    
    //NSLog(@"urlFavString %@",urlFavString);
    //NSLog(@"urlFavString %@",artworkNameAddFavString);
    
    
   /* NSString*artworkNumberAddFavString =[artworkNumberArray objectAtIndex:indexPathSend];*/
    
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    NSManagedObject *newLogoFavorite = [NSEntityDescription insertNewObjectForEntityForName:@"LogoFavorite" inManagedObjectContext:context];
    
    
    [newLogoFavorite setValue:self.artworkNameAddFavString forKey:@"artworkName"];
    [newLogoFavorite setValue:self.urlFavString forKey:@"fullImageURL"];
    [newLogoFavorite setValue:self.artworkCompanyAddFavString forKey:@"company"];
    [newLogoFavorite setValue:self.artworkSellerAddFavString forKey:@"seller"];
    [newLogoFavorite setValue:self.artworkColorAddFavString forKey:@"color"];
    [newLogoFavorite setValue:self.artworkSizeAddFavString forKey:@"artworkSize"];
    [newLogoFavorite setValue:self.artworkIDAddFavString forKey:@"productID"];


    
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        //NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    //Fetch Data entered to test
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"LogoFavorite"];
    self.favoritesArray = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    //self->artworkName = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    
    //NSLog(@"favoritesArray %@",_favoritesArray);
    
}


-(IBAction)removeFavorite:(id)sender{
    
    
    /*Millenium[14492:90b] indexPathSend 0
    2014-04-30 17:18:37.290 Millenium[14492:90b] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: 'keypath pid not found in entity <NSSQLEntity LogoFavorite id=1>'*/

    
    
    //NSLog(@"indexPathSend %d",indexPathSend);
    
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
    
    
    //NSLog(@"favoritesArray %@",_favoritesArray);

    
    

    
}






- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    
    
    
    [self.collectionView reloadData];
    //cell for header
    if (section == 0){
        
        return 0;
    }
        
        
    
   else
    {
        
         return artworkNameArray.count;
         return matNameArray.count;
        //return matNameArray.count;
        //return logoNearMeArray.count;
        //return jsonLogoCount;
        if (artworkNameArray.count < matNameArray.count){
            
            return matNameArray.count;
            //NSLog(@"matCount %i",matNameArray.count);
            
        }else{
            
            return artworkNameArray.count;
            //NSLog(@"logoCount %i",artworkNameArray.count);
            
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
    /*if (searchingString isEqualToString:@"s"){
    
    
    } else{*/
    //collectionView.allowsMultipleSelection = YES;
    if (indexPath.section == 0)
        
        
        
    {
        LogoHeaderCell *logoHeaderCell = [collectionView dequeueReusableCellWithReuseIdentifier:kLogoHeaderCellID forIndexPath:indexPath];
        
        
        
        return logoHeaderCell;
        
        
    }
    
    else  {
    
        
        
        
        
        LogoCell *logoCell = [collectionView dequeueReusableCellWithReuseIdentifier:kLogoCollectionViewCellID forIndexPath:indexPath];
        
        
        
        
        if ( indexPath.item < artworkNameArray.count){
        
        
            
        
            NSString*logoLabelString=[artworkNameArray objectAtIndex:indexPath.item];
            
            logoCell.logoLabel.text =logoLabelString;
        }
        
        
        if ([searchingString isEqualToString:@"searchingFavString"]){
            
            
            
            logoCell.addFavMatButton.hidden=YES;
            logoCell.addFavMatLabel.hidden=YES;
           
            
            
        }
        
        
        
        
        
       // if([NSNull null] != [artworkFullImageArray objectAtIndex:indexPath.item]) {
        
        if ( indexPath.item < artworkFullImageArray.count){
            
            NSString*urlString =[artworkFullImageArray objectAtIndex:indexPath.item];
            NSString*httpString= @"http://";
            NSString *urlStringAppend = [httpString stringByAppendingString:urlString];
            NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlStringAppend]];
            UIImage * iconImage;
            iconImage = [UIImage imageWithData:data];
            
            
            [logoCell.logoChooseButton setImage:iconImage forState:UIControlStateNormal];

        }
   
        
        
        
   [[logoCell logoChooseButton] addTarget:self action:@selector(logoSelected:event:) forControlEvents:UIControlEventTouchUpInside];
        
        if (logoCell.logoChooseButton)
            
        {
            
            selectedIndex=[indexPath row];
            _logoChooseButton.tag=[indexPath row];
           /* NSLog(@"addButton.tag:%ld",(long)_logoChooseButton.tag);
            NSLog(@"indexPathSender1:%@",indexPath);
            NSLog(@"rowSelectedHere %i",rowSelectedHere);
            
            NSLog(@"indexPathSender:%ld",(long)logoCell.tag);*/
            
            UIButton*button = [logoCell logoChooseButton];
            button.tag = selectedIndex;
            intMat=0;
            intLogo=1;

            
            
        }
        
        
        //if([NSNull null] != [matNameArray objectAtIndex:indexPath.item]) {
        
        if ( indexPath.item < matNameArray.count){
            NSString*matLabelString=[matNameArray objectAtIndex:indexPath.item];
            //NSLog(@"matNameArray:%@",matNameArray);
            logoCell.matLabel.text =matLabelString;
        }
        
        
        

     
        //if([NSNull null] != [matFullImageArray objectAtIndex:indexPath.item]) {
        
        if ( indexPath.item < matFullImageArray.count){
            NSString*urlMatString =[matFullImageArray objectAtIndex:indexPath.item];
            
            NSString*httpString= @"http://";
            
            
            NSString *urlMatStringAppend = [httpString stringByAppendingString:urlMatString];
            
            //NSLog(@"%@ urlStringAppend",urlMatStringAppend);
            
            NSData * dataMat = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlMatStringAppend]];
            
            UIImage * iconImage;
            
            iconImage = [UIImage imageWithData:dataMat];
            
            
            [logoCell.matChooseButton setImage:iconImage forState:UIControlStateNormal];
            
        }
        

        
        
      
        

        
        
        [[logoCell matChooseButton] addTarget:self action:@selector(matSelected:event:) forControlEvents:UIControlEventTouchUpInside];
        
        if (logoCell.matChooseButton)
            
        {
            
            selectedIndex=[indexPath row];
            _matChooseButton.tag=[indexPath row];
            //NSLog(@"addButton.tag:%ld",(long)_matChooseButton.tag);
            //NSLog(@"indexPathSender1:%@",indexPath);
            //NSLog(@"rowSelectedHere %i",rowSelectedHere);
            
            //NSLog(@"indexPathSender:%ld",(long)logoCell.tag);
            
            UIButton*button = [logoCell matChooseButton];
            button.tag = selectedIndex;
            intMat=1;
            intLogo=0;
            
            
            
        }
        
        return logoCell;
            
            
        
       
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
    
    interactiveHeaderString = @"Create Mat";

    //NSLog(@"addButton.tag:%ld",(long)sender.tag);
    
    int myInt = (int)sender.tag;
    indexPathSend = (int)sender.tag;
    //int indexSend = addButton.tag;
    
    //NSLog(@"sender %@",sender);
    //NSLog(@"indexPathSend %d",indexPathSend);
    //NSString*nearMeImageString=[nearMeImagesArray objectAtIndex:selectedIndex];
    
    nameString =[artworkNameArray objectAtIndex:indexPathSend];
    //NSLog(@" nameStringLogoSelected %@",nameString);
    
    if (indexPathSend <artworkFullImageArray.count){
        
        logoUseString =[artworkFullImageArray objectAtIndex:indexPathSend];
        
        
        if (logoUseString==NULL)
        {
            
            logoUseString= @"No Picture is Provided";
            
        }
        
    }

    
    
    if (indexPathSend <artworkSellerArray.count){
    
        sellerString =[artworkSellerArray objectAtIndex:indexPathSend];
        
        
        if (sellerString==NULL)
        {
            
            sellerString= @"No Seller Provided";
            
        }
        
    }
    
    if (indexPathSend <artworkCompanyArray.count){
        
        companyString =[artworkCompanyArray objectAtIndex:indexPathSend];
        
        if (companyString==NULL)
        {
            
            companyString= @"No Company Provided";
            
        }

    }
    
     if (indexPathSend <artworkIDArray.count){
         
         numberString =[artworkIDArray objectAtIndex:indexPathSend];
         
         if (numberString==NULL)
         {
             
             numberString= @"No ID is provided";
             
         }
         
     }
    
    if (indexPathSend <artworkSizeArray.count){
        
        sizeString =[artworkSizeArray objectAtIndex:indexPathSend];
        
        if (sizeString==NULL)
        {
            
            sizeString= @"4'x6'";
            
        }
        
    }
    
    if (indexPathSend <artworkColorArray.count){
    
        logoColorString =[artworkColorArray objectAtIndex:indexPathSend];
        
        if (logoColorString==NULL)
        {
            
            logoColorString= @"No colors available";
            
        }
        
        
    }
    
    if (indexPathSend <artworkFullImageArray.count){
        
        NSString*urlString =[artworkFullImageArray objectAtIndex:indexPathSend];
        NSString*httpString= @"http://";
        NSString *urlStringAppend = [httpString stringByAppendingString:urlString];
        NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlStringAppend]];
        UIImage * iconImage;
        iconImage = [UIImage imageWithData:data];
        //NSLog(@"%@iconImage",iconImage);
    
    
        NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/logoImage.png"]];
        [UIImagePNGRepresentation(iconImage) writeToFile:imagePath atomically:YES];
        
        
    }

    
    
    
    
    
}


-(IBAction)matSelected:(UIButton*)sender event:(id)event {
    
    interactiveHeaderString = @"Edit Mat";
    //NSLog(@"addButton.tag:%ld",(long)sender.tag);
    
    int myInt = (int)sender.tag;
    indexPathSend = (int)sender.tag;
    //int indexSend = addButton.tag;
    
    //NSLog(@"sender %@",sender);
    //NSLog(@"indexPathSend %d",indexPathSend);
    //NSString*nearMeImageString=[nearMeImagesArray objectAtIndex:selectedIndex];
    
    nameString =[matNameArray objectAtIndex:indexPathSend];
    //NSLog(@" nameStringLogoSelected %@",nameString);
    
    sellerString =[matSellerArray objectAtIndex:indexPathSend];
    companyString =[matCompanyArray objectAtIndex:indexPathSend];
    numberString =[matIDArray objectAtIndex:indexPathSend];
    sizeString =[matSizeArray objectAtIndex:indexPathSend];
    matColorString =[matColorArray objectAtIndex:indexPathSend];
    //NSLog(@"matColorString %@",matColorString);
    matBGColorString =[matBGColorArray objectAtIndex:indexPathSend];
    //NSLog(@"matBGColorString %@",matBGColorString);
    //interactiveHeaderString = @"Edit Mat";
    
    NSString*urlString =[matFullImageArray objectAtIndex:indexPathSend];
    //new code
    
    if ([urlString rangeOfString:@"cintas"].location == NSNotFound)
        
    {
        
        
        
        
        
        NSArray *directoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString *imagePath =  [directoryPath objectAtIndex:0];
        //imagePath= [imagePath stringByAppendingPathComponent:@"logoImage.png"];
        imagePath= [imagePath stringByAppendingPathComponent:urlString];
        //NSLog(@"urlMatStringInMethod:%@",urlMatString);
        
        NSData *data = [NSData dataWithContentsOfFile:imagePath];
        //no data here
        UIImage *logoImage = [UIImage imageWithData:data];
        
        //NSLog(@"%@iconImage",iconImage);
        NSString  *imagePath1 = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/matImage.png"]];
        [UIImagePNGRepresentation(logoImage) writeToFile:imagePath1 atomically:YES];
        
    }else {
        
        NSString*httpString= @"http://";
         NSString *urlStringAppend = [httpString stringByAppendingString:urlString];
         
         
         NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlStringAppend]];
         
         UIImage * iconImage;
         
         iconImage = [UIImage imageWithData:data];
         
         //NSLog(@"%@iconImage",iconImage);
         NSString  *imagePath1 = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/matImage.png"]];
         [UIImagePNGRepresentation(iconImage) writeToFile:imagePath1 atomically:YES];

        
    }

    
    
    
    
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"logoPickedSegue"]) {
        
        
        
        InteractiveViewController *goingController = segue.destinationViewController;
        
        
        
        logoUseString=[nearMeImagesArray objectAtIndex:indexPathSend];
        goingController.logoUseStringHere=logoUseString;
        
        
        //NSLog(@"nameStringSend %@",nameString);
        goingController.nameString=nameString;
        goingController.companyString=companyString;
        goingController.sellerString=sellerString;
        goingController.numberString=numberString;
        goingController.sizeString=sizeString;
        goingController.logoColorString=logoColorString;
        goingController.matColorString=matColorString;
        goingController.matBGColorString=matBGColorString;
        goingController.interactiveHeaderString=interactiveHeaderString;
        
        /*goingController.artworkNameArray = artworkNameArray;
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
        goingController.matCount = matCount;*/

        
        
        
        
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
     //NSLog(@"searchHereField %@",searchHereString);
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
