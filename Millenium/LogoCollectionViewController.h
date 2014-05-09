//
//  LogoCollectionViewController.h
//  Millenium
//
//  Created by Jami Sue Becker on 3/14/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//
#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "LogoCell.h"
#import "MatCell.h"
#import "LogoHeaderCell.h"
#import "InteractiveViewController.h"
#import "DIYMenu.h"
#import "Logo.h"
#import "LogoSearch.h"
#import "LogoFavorite.h"


@protocol ButtonPickerDelegate <NSObject>


@end


/*@protocol StringSetDelegate <NSObject>
- (void)didSetNameString:(NSString *)nameString;*/

//@end

@interface LogoCollectionViewController : UICollectionViewController <DIYMenuDelegate,ButtonPickerDelegate, UITextFieldDelegate,UICollectionViewDataSource,UICollectionViewDelegate/*, StringSetDelegate*/>

{
    
    
    /*NSString*sellerString;
    NSString*nameString;
    NSString*companyString;
    NSString*numberString;*/
    
    NSString*artworkNameAddFavString;
    NSString*urlFavString;
    
    NSString*searchHereString;
    
    NSString*artworkNameUnFavString;
    NSString*urlUnFavString;

    
    IBOutlet UITextField *searchOutField;
    //UITextField *searchHereField;
    LogoSearch*logoSearch;
    //UIButton* button;
    
    int selectedIndex;
    int indexPathSend;
    int rowSelectedHere;
    int rowSelectedSend;
    
    //int jsonLogoCount;
    
    /*NSMutableArray *artworkNameArray;
    NSMutableArray *artworkSizeArray;
    NSMutableArray *artworkFormatArray;
    NSMutableArray *artworkFullImageArray;
    NSMutableArray *artworkIconArray;
    NSMutableArray *artworkIDArray;
    NSMutableArray *artworkInfoArray;*/
    
    
    //__unsafe_unretained id <StringPickerProtocol> _delegate;
    //__unsafe_unretained id <ButtonPickerDelegate> _delegate;
    //__unsafe_unretained id <ButtonPickerDelegate> _delegate;
    //__unsafe_unretained id <StringSetDelegate> _delegateString;
  
    
    
}




@property (nonatomic, strong) IBOutlet UIViewController *InteractiveViewController;

@property (nonatomic, assign) int intMat;
@property (nonatomic, assign) int intLogo;

@property (nonatomic, assign) int selectedIndex;
@property (nonatomic, assign) int indexPathSend;
@property (nonatomic, assign) int rowSelectedHere;
@property (nonatomic, assign) int rowSelectedSend;

//@property (nonatomic, assign) int jsonLogoCount;

@property (nonatomic, retain) IBOutlet UITextField *searchOutField;
@property (nonatomic, retain) UITextField *searchHereField;
@property (nonatomic, retain) UITextField *searchField;

@property (nonatomic, copy) NSArray *searchImagesArray;
@property (nonatomic, copy) NSArray *nearMeImagesArray;
@property (nonatomic, copy) NSArray *searchNamesArray;
@property (nonatomic, copy) NSArray *nearMeNamesArray;


@property (nonatomic, retain) NSMutableArray *artworkNameArray;
@property (nonatomic, copy) NSMutableArray *artworkSellerArray;
@property (nonatomic, copy) NSMutableArray *artworkCompanyArray;
@property (nonatomic, copy) NSMutableArray *artworkNumberArray;
@property (nonatomic, copy) NSMutableArray *artworkSizeArray;
@property (nonatomic, copy) NSMutableArray *artworkFormatArray;
@property (nonatomic, copy) NSMutableArray *artworkFullImageArray;
@property (nonatomic, copy) NSMutableArray *artworkIconArray;
@property (nonatomic, copy) NSMutableArray *artworkIDArray;
@property (nonatomic, copy) NSMutableArray *artworkInfoArray;


@property (nonatomic, retain) NSMutableArray *matNameArray;
@property (nonatomic, copy) NSMutableArray *matSellerArray;
@property (nonatomic, copy) NSMutableArray *matCompanyArray;
@property (nonatomic, copy) NSMutableArray *matSizeArray;
@property (nonatomic, copy) NSMutableArray *matFormatArray;
@property (nonatomic, copy) NSMutableArray *matFullImageArray;
@property (nonatomic, copy) NSMutableArray *matIconArray;
@property (nonatomic, copy) NSMutableArray *matIDArray;
@property (nonatomic, copy) NSMutableArray *matInfoArray;

@property (nonatomic, strong) NSMutableArray *favoritesArray;
@property (nonatomic, strong) NSMutableArray *favoritesRemoveArray;

@property (nonatomic, strong) NSMutableArray *favoritesMatArray;
@property (nonatomic, strong) NSMutableArray *favoritesLogoArray;
@property (nonatomic, strong) NSMutableArray *favoritesLogoRemoveArray;

@property (nonatomic, copy) NSDictionary *artworkNameDictionary;

@property (nonatomic, copy) NSString*logoUseString;
@property (nonatomic, copy) NSString*searchHereString;

//@property (nonatomic, strong) UIButton*button;



@property (nonatomic,strong) IBOutlet UIButton *goBackButton;
@property (nonatomic,strong) IBOutlet UIButton *logoChooseButton;
@property (nonatomic,strong) IBOutlet UIButton *matChooseButton;
//@property (nonatomic,strong) IBOutlet UIButton *logoChoose1Button;

@property (nonatomic, copy) NSString *artworkNameAddFavString;
@property (nonatomic, copy) NSString *urlFavString;
@property (nonatomic, copy) NSString *artworkNameUnFavString;
@property (nonatomic, copy) NSString *urlUnFavString;

@property (nonatomic, copy) NSString *sellerString;
@property (nonatomic, copy) NSString *nameString;
@property (nonatomic, copy) NSString *companyString;
@property (nonatomic, copy) NSString *numberString;
@property (nonatomic, copy) NSString *sizeString;


//@property (nonatomic, assign) id <StringSetDelegate> delegateString;
@property (nonatomic, weak) id <ButtonPickerDelegate> delegate;
//@property (nonatomic, weak) id <StringPickerProtocol> delegate;

//@property (weak,nonatomic) id delegate;


-(IBAction)goFav:(id)sender;
-(IBAction)goInteractive:(id)sender;
-(IBAction)goHome:(UIButton *)sender;
-(IBAction)addFavorite:(id)sender;
-(IBAction)removeFavorite:(id)sender;
-(BOOL)textFieldShouldReturn:(UITextField*)searchField;



@end
