//
//  DraftCollectionViewController.h
//  CintasMats
//
//  Created by Jami Sue Becker on 12/12/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//




#import <UIKit/UIKit.h>
#import "ViewController.h"
//#import "FavCell.h"
//#import "MatCell.h"
#import "DraftCell.h"
#import "DraftHeaderCell.h"
#import "InteractiveViewController.h"
#import "FavCollectionViewController.h"
#import "DIYMenu.h"
#import "Logo.h"
#import "LogoSearch.h"
#import "LogoFavorite.h"
#import "MatFavorite.h"

/*@protocol ButtonDraftPickerDelegate <NSObject>

@end*/


@interface DraftCollectionViewController : UICollectionViewController <DIYMenuDelegate, /*ButtonDraftPickerDelegate,*/ UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegate > {
    /*NSString*sellerString;
     NSString*nameString;
     NSString*companyString;
     NSString*numberString;*/
    
    MatFavorite* matFavorite;
    
    NSString* artworkNameAddFavString;
    NSString* urlFavString;
    
    NSString* searchHereString;
    
    NSString* artworkNameUnFavString;
    NSString* urlUnFavString;
    
    IBOutlet UITextField* searchOutField;
    LogoSearch* logoSearch;
    
    int selectedIndex;
    int indexPathSend;
    int rowSelectedHere;
    int rowSelectedSend;
    
    int artworkCount;
    int matCount;
    
    int higherCount;
}

@property (nonatomic, strong) IBOutlet UIViewController* InteractiveViewController;

@property (nonatomic, assign) int intMat;
@property (nonatomic, assign) int intLogo;

@property (nonatomic, assign) int selectedIndex;
@property (nonatomic, assign) int indexPathSend;
@property (nonatomic, assign) int rowSelectedHere;
@property (nonatomic, assign) int rowSelectedSend;

@property (nonatomic, assign) int artworkCount;
@property (nonatomic, assign) int matCount;
@property (nonatomic, assign) int higherCount;

@property (nonatomic, assign) int favLogoCount;
@property (nonatomic, assign) int favMatCount;

//@property (nonatomic, assign) int jsonLogoCount;

@property (nonatomic, retain) IBOutlet UITextField* searchOutField;
@property (nonatomic, retain) UITextField* searchHereField;
@property (nonatomic, retain) UITextField* searchField;

@property (nonatomic, copy) NSArray* searchImagesArray;
@property (nonatomic, copy) NSArray* nearMeImagesArray;
@property (nonatomic, copy) NSArray* searchNamesArray;
@property (nonatomic, copy) NSArray* nearMeNamesArray;

@property (nonatomic, copy) NSMutableArray* artworkNameArray;
@property (nonatomic, copy) NSMutableArray* artworkSellerArray;
@property (nonatomic, copy) NSMutableArray* artworkCompanyArray;
@property (nonatomic, copy) NSMutableArray* artworkNumberArray;
@property (nonatomic, copy) NSMutableArray* artworkSizeArray;
@property (nonatomic, copy) NSMutableArray* artworkFormatArray;
@property (nonatomic, copy) NSMutableArray* artworkFullImageArray;
@property (nonatomic, copy) NSMutableArray* artworkIconArray;
@property (nonatomic, copy) NSMutableArray* artworkIDArray;
@property (nonatomic, copy) NSMutableArray* artworkLocationIDArray;
@property (nonatomic, copy) NSMutableArray* artworkInfoArray;
@property (nonatomic, copy) NSMutableArray* artworkColorArray;

@property (nonatomic, retain) NSMutableArray* matNameArray;
@property (nonatomic, copy) NSMutableArray* matSellerArray;
@property (nonatomic, copy) NSMutableArray* matCompanyArray;
@property (nonatomic, copy) NSMutableArray* matSizeArray;
@property (nonatomic, copy) NSMutableArray* matFormatArray;
@property (nonatomic, copy) NSMutableArray* matFullImageArray;
@property (nonatomic, copy) NSMutableArray* matIconArray;
@property (nonatomic, copy) NSMutableArray* matIDArray;
@property (nonatomic, copy) NSMutableArray* matLocationIDArray;
@property (nonatomic, copy) NSMutableArray* matInfoArray;
@property (nonatomic, copy) NSMutableArray* matColorArray;
@property (nonatomic, copy) NSMutableArray* matBGColorArray;

@property (nonatomic, strong) NSMutableArray* favoritesArray;
@property (nonatomic, strong) NSMutableArray* favoritesRemoveArray;

//@property (nonatomic, strong) NSMutableArray* favoritesMatArray;
@property (nonatomic, strong) NSMutableArray* draftArray;
@property (nonatomic, strong) NSMutableArray* favoritesLogoRemoveArray;

@property (nonatomic, copy) NSDictionary* artworkNameDictionary;

@property (nonatomic, copy) NSString* searchingString;
//@property (nonatomic, copy) NSString *searchingOtherString;

@property (nonatomic, copy) NSString* urlMatString;
@property (nonatomic, copy) NSString* firstNameString;
@property (nonatomic, copy) NSString* lastNameString;
@property (nonatomic, assign) NSString* locationIDString;
@property (nonatomic, assign) NSString* userIDString;
@property (nonatomic, copy) NSString* locationNameString;
@property (nonatomic, copy) NSString* locationNumberString;

@property (nonatomic, copy) NSString* logoUseString;
@property (nonatomic, copy) NSString* searchHereString;

@property (nonatomic, strong) IBOutlet UIButton* goBackButton;
@property (nonatomic, strong) IBOutlet UIButton* draftChooseButton;
@property (nonatomic, strong) IBOutlet UIButton* matChooseButton;

@property (nonatomic, strong) IBOutlet UIButton* removeFavMatButton;
@property (nonatomic, strong) IBOutlet UIButton* addFavMatButton;

@property (nonatomic, strong) UILabel* headerLabel;

@property (nonatomic, strong) IBOutlet UILabel* removeFavMatLabel;
@property (nonatomic, strong) IBOutlet UILabel* addFavMatLabel;

@property (nonatomic, copy) NSString* matLabelString;

@property (nonatomic, copy) NSString* artworkNameAddFavString;
@property (nonatomic, copy) NSString* artworkCompanyAddFavString;
@property (nonatomic, copy) NSString* artworkSellerAddFavString;
@property (nonatomic, copy) NSString* artworkIDAddFavString;
@property (nonatomic, copy) NSString* artworkLocationIDAddFavString;

@property (nonatomic, copy) NSString* artworkSizeAddFavString;
@property (nonatomic, copy) NSString* artworkColorAddFavString;

@property (nonatomic, copy) NSString* matNameAddFavString;
@property (nonatomic, copy) NSString* matCompanyAddFavString;
@property (nonatomic, copy) NSString* matSellerAddFavString;
@property (nonatomic, copy) NSString* matIDAddFavString;
@property (nonatomic, copy) NSString* matLocationIDAddFavString;

@property (nonatomic, copy) NSString* matSizeAddFavString;
@property (nonatomic, copy) NSString* matColorAddFavString;
@property (nonatomic, copy) NSString* matBGColorAddFavString;

@property (nonatomic, copy) NSString* matUrlAddFavString;
@property (nonatomic, copy) NSString* urlFavString;

@property (nonatomic, copy) NSString* artworkNameUnFavString;
@property (nonatomic, copy) NSString* urlUnFavString;

@property (nonatomic, copy) NSString* sellerString;

@property (nonatomic, copy) NSString* logoColorString;
@property (nonatomic, copy) NSString* matColorString;
@property (nonatomic, copy) NSString* matBGColorString;

@property (nonatomic, copy) NSString* nameString;
@property (nonatomic, copy) NSString* companyString;
@property (nonatomic, copy) NSString* numberString;
@property (nonatomic, copy) NSString* sizeString;
@property (nonatomic, copy) NSString* interactiveHeaderString;

@property (nonatomic, copy) NSString* urlString;

@property (nonatomic, retain) NSString* emailTitle;

@property (nonatomic, strong) NSFetchedResultsController* fetchedResultsController;
@property (nonatomic, strong) NSManagedObjectContext* managedObjectContext;

//@property (nonatomic, weak) id<ButtonDraftPickerDelegate> delegate;

- (IBAction)goFav:(id)sender;
- (IBAction)goInteractive:(id)sender;
- (IBAction)goHome:(UIButton*)sender;
- (IBAction)addLogoFavorite:(id)sender;
- (IBAction)removeFavorite:(id)sender;
- (IBAction)removeAllFavorites:(id)sender;

- (IBAction)addMatFavorite:(id)sender;
- (IBAction)removeMatFavorite:(id)sender;

- (BOOL)textFieldShouldReturn:(UITextField*)searchField;

@end
