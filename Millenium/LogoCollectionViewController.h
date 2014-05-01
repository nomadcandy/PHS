//
//  LogoCollectionViewController.h
//  Millenium
//
//  Created by Jami Sue Becker on 3/14/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

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



@interface LogoCollectionViewController : UICollectionViewController <DIYMenuDelegate,ButtonPickerDelegate, UITextFieldDelegate>

{
    
    
    NSString*artworkNameAddFavString;
    NSString*urlFavString;
    
    NSString*artworkNameUnFavString;
    NSString*urlUnFavString;

    IBOutlet UITextField *searchField;
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
    __unsafe_unretained id <ButtonPickerDelegate> _delegate;
    
    
}


//@property (nonatomic, weak) id <StringPickerProtocol> delegate;

@property (nonatomic, strong) IBOutlet UIViewController *InteractiveViewController;

@property (nonatomic, assign) int selectedIndex;
@property (nonatomic, assign) int indexPathSend;
@property (nonatomic, assign) int rowSelectedHere;
@property (nonatomic, assign) int rowSelectedSend;

@property (nonatomic, assign) int jsonLogoCount;


@property (nonatomic, retain) IBOutlet UITextField *searchField;

@property (nonatomic, copy) NSArray *searchImagesArray;
@property (nonatomic, copy) NSArray *nearMeImagesArray;
@property (nonatomic, copy) NSArray *searchNamesArray;
@property (nonatomic, copy) NSArray *nearMeNamesArray;


@property (nonatomic, retain) NSMutableArray *artworkNameArray;
@property (nonatomic, copy) NSMutableArray *artworkSizeArray;
@property (nonatomic, copy) NSMutableArray *artworkFormatArray;
@property (nonatomic, copy) NSMutableArray *artworkFullImageArray;
@property (nonatomic, copy) NSMutableArray *artworkIconArray;
@property (nonatomic, copy) NSMutableArray *artworkIDArray;
@property (nonatomic, copy) NSMutableArray *artworkInfoArray;

@property (nonatomic, strong) NSMutableArray *favoritesArray;
@property (nonatomic, strong) NSMutableArray *favoritesRemoveArray;

@property (nonatomic, copy) NSDictionary *artworkNameDictionary;

@property (nonatomic, copy) NSString*logoUseString;

//@property (nonatomic, strong) UIButton*button;



@property (nonatomic,strong) IBOutlet UIButton *goBackButton;
@property (nonatomic,strong) IBOutlet UIButton *logoChooseButton;
@property (nonatomic,strong) IBOutlet UIButton *logoChoose1Button;

@property (nonatomic, copy) NSString *artworkNameAddFavString;
@property (nonatomic, copy) NSString *urlFavString;
@property (nonatomic, copy) NSString *artworkNameUnFavString;
@property (nonatomic, copy) NSString *urlUnFavString;


@property (nonatomic, assign) id <ButtonPickerDelegate> delegate;

-(IBAction)goInteractive:(id)sender;
-(IBAction)goHome:(UIButton *)sender;
-(IBAction)addFavorite:(id)sender;
-(IBAction)removeFavorite:(id)sender;



@end
