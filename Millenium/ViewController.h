//
//  ViewController.h
//  Millenium
//
//  Created by Jami Sue Becker on 3/10/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "iCarousel.h"
#import "PDFViewController.h"
#import "DirectViewController.h"
#import "RentalViewController.h"
#import "ScrollViewController.h"
#import "InteractiveViewController.h"
#import "MarketingViewController.h"
#import "SearchViewController.h"
#import "SketchRequestViewController.h"
#import "LoginViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "LogoSearch.h"
#import "AppDelegate.h"
#import "Reachability.h"

@protocol ArrayDelegate <NSObject>

@end

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, ArrayDelegate, NSFetchedResultsControllerDelegate, UIAlertViewDelegate>

                            {
    //LogoSearch* newLogoSearch;

    IBOutlet UIButton* cleanButton;
    IBOutlet UIButton* goButton;
    IBOutlet UIViewController* InteractiveViewController;
    IBOutlet UIImageView* charlesView;
    IBOutlet UIImageView* charlesBGView;
    IBOutlet UIImageView* loginView;
    IBOutlet UITextField* loginField;
    IBOutlet UITextField* passwordField;

    NSMutableArray* artworkNameArray;
    NSMutableArray* artworkSizeArray;
    NSMutableArray* artworkFormatArray;
    NSMutableArray* artworkFullImageArray;
    NSMutableArray* artworkIconArray;
    NSMutableArray* artworkIDArray;
    NSMutableArray* artworkInfoArray;
    NSMutableArray* artworkSellerArray;
    NSMutableArray* artworkCompanyArray;

    NSMutableArray* artworkNameDictionary;

    NSString* artworkNameAddString;
    NSString* artworkFullImageString;

    int jsonLogoCount;
    int logoCountInt;
    int matCountInt;

    int artworkCount;
    int matCount;

    __unsafe_unretained id<ArrayDelegate> _delegate;
}

//@property (nonatomic, strong) NSArray *onlyAudioFiles;
//@property (strong, nonatomic) IBOutlet UIPickerView *audioFileList;

@property (nonatomic) Reachability* hostReachability;
@property (nonatomic) Reachability* internetReachability;
@property (nonatomic) Reachability* wifiReachability;

@property (nonatomic, strong) IBOutlet UILabel* connectionSummaryLabel;

@property (copy, nonatomic) NSURL* movieURL;
@property (strong, nonatomic) MPMoviePlayerController* movieController;

@property (nonatomic, strong) IBOutlet UIViewController* InteractiveViewController;
@property (nonatomic, strong) IBOutlet iCarousel* carousel;
@property (nonatomic, strong) IBOutlet UILabel* label;

//@property (nonatomic, strong) IBOutlet UIImageView* loginView;
@property (nonatomic, strong) IBOutlet UITextField* loginField;
@property (nonatomic, strong) IBOutlet UITextField* passwordField;
@property (nonatomic, strong) IBOutlet UIButton* goButton;

@property (nonatomic, strong) IBOutlet UITextField* searchField;
@property (nonatomic, strong) IBOutlet UIButton* goSearchButton;

@property (nonatomic, strong) NSString* goToPageString;

@property (nonatomic, copy) NSString* firstNameString;
@property (nonatomic, copy) NSString* lastNameString;
@property (nonatomic, copy) NSString* locationIDString;
@property (nonatomic, copy) NSString* locationNameString;
@property (nonatomic, copy) NSString* locationNumberString;

@property (nonatomic, copy) NSString* userIDString;

@property (nonatomic, copy) NSMutableArray* favoritesArray;

@property (nonatomic, copy) NSMutableArray* artworkNameArray;
@property (nonatomic, copy) NSMutableArray* artworkSizeArray;
@property (nonatomic, copy) NSMutableArray* artworkFormatArray;
@property (nonatomic, copy) NSMutableArray* artworkFullImageArray;
@property (nonatomic, copy) NSMutableArray* artworkIconArray;
@property (nonatomic, copy) NSMutableArray* artworkIDArray;
@property (nonatomic, copy) NSMutableArray* artworkInfoArray;
@property (nonatomic, copy) NSMutableArray* artworkSellerArray;
@property (nonatomic, copy) NSMutableArray* artworkCompanyArray;
@property (nonatomic, copy) NSMutableArray* artworkColorArray;
@property (nonatomic, copy) NSMutableArray* artworkLocationIDArray;

@property (nonatomic, copy) NSMutableArray* matNameArray;
@property (nonatomic, copy) NSMutableArray* matSizeArray;
@property (nonatomic, copy) NSMutableArray* matFormatArray;
@property (nonatomic, copy) NSMutableArray* matFullImageArray;
@property (nonatomic, copy) NSMutableArray* matIconArray;
@property (nonatomic, copy) NSMutableArray* matIDArray;
@property (nonatomic, copy) NSMutableArray* matInfoArray;
@property (nonatomic, copy) NSMutableArray* matSellerArray;
@property (nonatomic, copy) NSMutableArray* matCompanyArray;
@property (nonatomic, copy) NSMutableArray* matColorArray;
@property (nonatomic, copy) NSMutableArray* matBGColorArray;
@property (nonatomic, copy) NSMutableArray* matLocationIDArray;

@property (nonatomic, strong) NSFetchedResultsController* fetchedResultsController;
//@property (nonatomic, strong) NSManagedObjectContext* managedObjectContext;

@property (nonatomic, copy) NSString* artworkNameAddString;
@property (nonatomic, copy) NSString* artworkFullImageString;

@property (nonatomic, assign) int jsonLogoCount;
@property (nonatomic, assign) int logoCountInt;
@property (nonatomic, assign) int matCountInt;

@property (nonatomic, assign) int artworkCount;
@property (nonatomic, assign) int matCount;

@property (nonatomic, strong) IBOutlet UIActivityIndicatorView* activityIndicator;

- (void)insertNewManagedObject:(NSString*)fileName;

- (NSData*)getLogoData:(NSString*)fileName;

- (IBAction)goSearch:(id)sender;
- (IBAction)goNearMe:(id)sender;

- (IBAction)showLogin:(id)sender;
- (IBAction)goLogin:(id)sender;
- (IBAction)hideLogin:(id)sender;

- (IBAction)playClean:(id)sender;
- (IBAction)playPro:(id)sender;
- (IBAction)playFriendly:(id)sender;

- (IBAction)presentInteractiveViewController:(UIButton*)sender;
//-(IBAction)presentSearchViewController:(UIButton *)sender;
- (IBAction)presentLogoCollectionViewController:(UIButton*)sender;

@end
