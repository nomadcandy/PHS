//
//  DraftCollectionViewController.m
//  CintasMats
//
//  Created by Jami Sue Becker on 12/12/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import "DraftCollectionViewController.h"
#import "ViewController.h"

@interface DraftCollectionViewController ()

@end

@implementation DraftCollectionViewController


@synthesize emailTitle;
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
//@synthesize delegate = _delegate;
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

@synthesize draftArray;


@synthesize firstNameString;
@synthesize lastNameString;
@synthesize userIDString;
@synthesize locationIDString;
@synthesize locationNameString;
@synthesize locationNumberString;

//NSString *kMatCollectionViewCellID = @"matCollectionViewCellID";
NSString* kDraftCollectionViewCellID = @"draftCollectionViewCellID";
NSString* kDraftHeaderCellID = @"draftHeaderCellID";


//static NSString * const reuseIdentifier = @"Cell";

- (id)initWithNibName:(NSString*)nibNameOrNil
               bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    [[NSFetchRequest alloc] initWithEntityName:@"Draft"];
    self.draftArray =
    [[managedObjectContext executeFetchRequest:fetchRequest
                                         error:nil] mutableCopy];
    
    
    
    // NSLog(@"favoritesLogoArray %@",favoritesLogoArray);
    // NSLog(@"favoritesMatArray %@",favoritesMatArray);
    NSLog(@"draftArray %@",draftArray);
    
    [draftArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL* stop) {
        
        artworkNameArray = [draftArray valueForKey:@"draftName"];
         NSLog(@"artworkNameArray: %@", artworkNameArray);
        //artworkSizeArray = [draftArray valueForKey:@"artworkSize"];
        //artworkFormatArray = [draftArray valueForKey:@"format"];
        artworkFullImageArray = [draftArray valueForKey:@"fullImageURL"];
        NSLog(@"artworkFullImageArray: %@", artworkFullImageArray);
        //artworkIconArray = [draftArray valueForKey:@"iconURL"];
        //artworkIDArray = [draftArray valueForKey:@"productID"];
        //artworkLocationIDArray = [draftArray valueForKey:@"locationID"];
        //artworkSellerArray = [draftArray valueForKey:@"seller"];
        //artworkColorArray = [draftArray valueForKey:@"color"];
        //artworkCompanyArray = [draftArray valueForKey:@"company"];
        
        artworkCount = draftArray.count;
        NSLog(@"logoCount: %i", artworkCount);
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
    logoLabel.text = @"SIGNED DRAFTS";
    [self.view addSubview:logoLabel];
    
   /* UILabel* matLabel =
    [[UILabel alloc] initWithFrame:CGRectMake(550, 140, 200, 30)];
    matLabel.font = [UIFont fontWithName:@"Avenir-Light" size:25];
    matLabel.text = @"MATS";
    [self.view addSubview:matLabel];*/
    
   /* searchHereField =
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
    [self.view addSubview:searchHereButton];*/
    
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
    headerLabel.text = @"DRAFTS";
    headerLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:headerLabel];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //TODO Not in other file...
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
                                          withReuseIdentifier:@"draftHeaderCellID"
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
        CGSize retval = CGSizeMake(1004, 768);
        //CGSize retval = CGSizeMake(1004, 420);
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
        DraftHeaderCell* draftHeaderCell =
        [collectionView dequeueReusableCellWithReuseIdentifier:kDraftHeaderCellID
                                                  forIndexPath:indexPath];
        
        return draftHeaderCell;
    }
    
    DraftCell* draftCell = [collectionView
                        dequeueReusableCellWithReuseIdentifier:kDraftCollectionViewCellID
                        forIndexPath:indexPath];
    
    // unhide all incase next parse is larger then previous parse
    draftCell.draftTitleLabel.hidden = NO;
    draftCell.draftChooseButton.hidden = NO;
    draftCell.removeDraftButton.hidden = NO;
    draftCell.addDraftLabel.hidden = NO;
    draftCell.removeDraftLabel.hidden = NO;
    draftCell.goBackLogoLabel.hidden = NO;
    draftCell.goBack.hidden = NO;
    draftCell.goBackLogo.hidden = NO;
    
    /* if ([searchingString isEqualToString:@"searchingFavString"]) {
     favCell.addFavMatButton.hidden = YES;
     favCell.addFavMatLabel.hidden = YES;
     }*/
    
    if (indexPath.item <=
        artworkNameArray.count - 1 /*|| indexPath.item == 0*/) {
        NSString* draftLabelString =
        [artworkNameArray objectAtIndex:indexPath.item];
        
        draftCell.draftTitleLabel.text = draftLabelString;
        NSLog(@"logoLabelString:%@", draftLabelString);
        
    } else {
        //draftCell.draftTitleLabel.hidden = YES;
    }
    
    //hide logo controls if no data
    if (indexPath.item > artworkFullImageArray.count - 1) {
        draftCell.draftChooseButton.hidden = YES;
        draftCell.removeDraftButton.hidden = YES;
        draftCell.removeDraftLabel.hidden = YES;
        //draftCell.draftTitleLabel.hidden = YES;
        draftCell.goBackLogoLabel.hidden = YES;
        draftCell.goBack.hidden = YES;
        draftCell.goBackLogo.hidden = YES;
    } else if (indexPath.item <=
               artworkFullImageArray.count - 1 /*&& indexPath.item == 0*/) {
        draftCell.draftChooseButton.hidden = NO;
        draftCell.removeDraftButton.hidden = NO;
        draftCell.removeDraftLabel.hidden = NO;
        draftCell.draftTitleLabel.hidden = NO;
        draftCell.goBackLogoLabel.hidden = NO;
        draftCell.goBack.hidden = NO;
        draftCell.goBackLogo.hidden = NO;
        
        //draftCell.draftChooseButton.hidden = NO;
        //draftCell.removeDraftButton.hidden = NO;
        //draftCell.removeDraftLabel.hidden = NO;
        //draftCell.draftTitleLabel.hidden = NO;
        draftCell.goBackMatLabel.hidden = NO;
        draftCell.goBack.hidden = NO;
        
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
            [draftCell.draftChooseButton setImage:logoImage
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
            [draftCell.draftChooseButton setImage:iconLogoImage
                                      forState:UIControlStateNormal];
        }
    }
    //removed to debug
   [[draftCell draftChooseButton] addTarget:self
                                   action:@selector(draftSelected:event:)
                         forControlEvents:UIControlEventTouchUpInside];
    
    if (draftCell.draftChooseButton) {
        selectedIndex = [indexPath row];
        _draftChooseButton.tag = [indexPath row];
        
        UIButton* button = [draftCell draftChooseButton];
        button.tag = selectedIndex;
        intMat = 0;
        intLogo = 1;
    }
    // TODO Crashing here
    NSLog(@"matNameArray %@", matNameArray);
    NSLog(@"matNameArray %i", matNameArray.count);
    
    if ((matNameArray.count > indexPath.item) &&
        [[matNameArray[indexPath.item] class] isSubclassOfClass:[NSString class]]) {
        matLabelString = matNameArray[indexPath.item];
        draftCell.draftTitleLabel.text = matLabelString;
    } else {
        //draftCell.draftTitleLabel.hidden = YES;
        // matLabelString=@"";
    }
    
    if ([searchingString isEqualToString:@"searchingFavString"]) {
        //draftCell.addDraftButton.hidden = YES;
        //draftCell.addDraftLabel.hidden = YES;
    }
    
    //   if([NSNull null] != [matFullImageArray objectAtIndex:indexPath.item] &&
    //   indexPath.item <= matFullImageArray.count-1  && matFullImageArray.count
    //   >0){
    
    if (matFullImageArray.count > indexPath.item &&
        [[matFullImageArray[indexPath.item] class]
         isSubclassOfClass:[NSString class]]) {
            urlMatString = matFullImageArray[indexPath.item];
            
            NSLog(@"urlMatString %@", urlMatString);
            
            draftCell.draftChooseButton.hidden = NO;
            draftCell.removeDraftButton.hidden = NO;
            draftCell.removeDraftLabel.hidden = NO;
            draftCell.draftTitleLabel.hidden = NO;
            draftCell.goBackMatLabel.hidden = NO;
            draftCell.goBack.hidden = NO;
            
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
                [draftCell.draftChooseButton setImage:logoImage
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
                [draftCell.draftChooseButton setImage:iconImage
                                         forState:UIControlStateNormal];
            }
            
            // TODO goBackMat.hidden= YES;
        } else //dont' have a string
        {
            // else if ( indexPath.item <= matFullImageArray.count-1 ){
            
            //draftCell.draftChooseButton.hidden = YES;
            draftCell.removeDraftButton.hidden = YES;
            draftCell.removeDraftLabel.hidden = YES;
            
            draftCell.goBackMatLabel.hidden = YES;
            draftCell.goBack.hidden = YES;
            
            // urlMatString =[self
            // matStringForIndex:indexPath.item];//[matFullImageArray
            // objectAtIndex:indexPath.item];
            
            // we shouldn't ever try to operate on a nil mat string
            // if(!urlMatString) urlMatString = @"";
            
            // if([NSNull null] != [matFullImageArray objectAtIndex:indexPath.item])
        }
    //removed to Debug
   /* [[draftCell draftChooseButton] addTarget:self
                                  action:@selector(matSelected:event:)
                        forControlEvents:UIControlEventTouchUpInside];
    
    if (draftCell.draftChooseButton) {
        selectedIndex = [indexPath row];
        _matChooseButton.tag = [indexPath row];
        
        UIButton* button = [draftCell draftChooseButton];
        button.tag = selectedIndex;
        intMat = 1;
        intLogo = 0;
    }*/
    
    return draftCell;
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


//- (IBAction)draftSelected:(UIButton*)sender
//called programmatically
- (IBAction)draftSelected:(UIButton*)sender event:(id)event
{
    indexPathSend = (int)sender.tag;
    NSLog(@"indexPathSend: %d ",indexPathSend);
    nameString = [artworkNameArray objectAtIndex:indexPathSend];
    NSString* urlDraftString = [artworkFullImageArray objectAtIndex:indexPathSend];
    NSLog(@"urlDraftString: %@",urlDraftString);
    //new code
    
    if ([urlDraftString rangeOfString:@"cintas"].location == NSNotFound) {
        NSArray* directoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString* imagePath = [directoryPath objectAtIndex:0];
        //imagePath= [imagePath stringByAppendingPathComponent:@"logoImage.png"];
        imagePath = [imagePath stringByAppendingPathComponent:urlDraftString];
        //NSLog(@"urlMatStringInMethod:%@",urlMatString);
        
        NSData* data = [NSData dataWithContentsOfFile:imagePath];
        //no data here
        UIImage* draftImage = [UIImage imageWithData:data];
        
        //NSLog(@"%@iconImage",iconImage);
        NSString* imagePathDraftSend = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/draftImageSend.jpg"]];
        [UIImagePNGRepresentation(draftImage) writeToFile:imagePathDraftSend atomically:YES];
        
    } else {
        NSString* httpString = @"http://";
        //crashes here
        NSString* urlStringAppend = [httpString stringByAppendingString:urlDraftString];
        NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlStringAppend]];
        UIImage* draftImage;
        draftImage = [UIImage imageWithData:data];
        //NSLog(@"%@iconImage",iconImage);
        NSString* imagePathDraft = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/draftImageSend.png"]];
        [UIImagePNGRepresentation(draftImage) writeToFile:imagePathDraft atomically:YES];
    }
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
        imagePath = [imagePath stringByAppendingPathComponent:urlMatString];
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


- (IBAction)goMailDraft:(UIButton*)sender
{
    
    if ([MFMailComposeViewController canSendMail]) {

    MFMailComposeViewController* mailComposer;
    
    mailComposer = [[MFMailComposeViewController alloc] init];
    mailComposer.mailComposeDelegate = self;
    
    //emailTitle = _emailString;
    
    emailTitle = @"Mat Approved";
    
    NSString* messageString = @"This mat has been approved";
    
    //TODO add string and images to email
    NSString* messageBody = messageString;
    
    //Display Email Composer
    MFMailComposeViewController* mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    
    //[mc setToRecipients:toRecipents];
    
    NSMutableArray* recipients = [[NSMutableArray alloc] init];
    
    NSArray* directoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* imagePathDraftSend = [directoryPath objectAtIndex:0];
    imagePathDraftSend= [imagePathDraftSend stringByAppendingPathComponent:@"draftImageSend.jpg"];
    
    NSData* data = [NSData dataWithContentsOfFile:imagePathDraftSend];
    //UIImage *image = [UIImage imageWithData:data];
    
    /*NSString* imagePath3 = [directoryPath objectAtIndex:0];
    imagePath1 = [imagePath3 stringByAppendingPathComponent:@"matNoteImage.jpg"];*/
    
    //NSData* dataNote = [NSData dataWithContentsOfFile:imagePath3];
    
    // Add attachment
    [mc addAttachmentData:data mimeType:@"image/jpeg" fileName:@"draftImage.jpg"];
    [mailComposer setToRecipients:recipients];
    
    [self presentViewController:mc animated:YES completion:NULL];
    
} else {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Please set up an email account on this device to enable this feature." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
    
    [alert show];
}

}

- (IBAction)removeDraft:(id)sender
{
    // NSLog(@"nameString %@",nameString);
    
    NSManagedObjectContext* managedObjectContext = [self managedObjectContext];
    
    NSFetchRequest* fetch = [[NSFetchRequest alloc] init];
    NSEntityDescription* draftEntity =
    [NSEntityDescription entityForName:@"Draft"
                inManagedObjectContext:managedObjectContext];
    
    NSSortDescriptor* nameSort =
    [[NSSortDescriptor alloc] initWithKey:@"draftName" ascending:YES];
    
    NSArray* sortDescriptors = [[NSArray alloc] initWithObjects:nameSort, nil];
    
    fetch.sortDescriptors = sortDescriptors;
    
    NSPredicate* p =
    [NSPredicate predicateWithFormat:@"draftName == %@", nameString];
    [fetch setPredicate:p];
    
    [fetch setEntity:draftEntity];
    
    NSError* fetchError;
    
    NSArray* fetchedDraftsArray =
    [self.managedObjectContext executeFetchRequest:fetch error:&fetchError];
    
    // NSLog(@"fetchedFavoritesArray %@",fetchedFavoritesArray);
    
    for (Draft* draftDelete in fetchedDraftsArray) {
         NSLog(@"draftName %@",draftDelete.draftName);
        [managedObjectContext deleteObject:draftDelete];
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


- (IBAction)goHome:(UIButton*)sender
{
    UIStoryboard* storyboard = self.storyboard;
    ViewController* vc = [storyboard instantiateViewControllerWithIdentifier:@"HomeStoryboard"];
    [self presentViewController:vc animated:YES completion:nil];
}


// The mail compose view controller delegate method
- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error
{
    //[self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}
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

/*- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}*/
@end
