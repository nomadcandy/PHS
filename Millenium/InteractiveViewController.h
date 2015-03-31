//
//  InteractiveViewController.h
//  Millenium
//
//  Created by Jami Sue Becker on 3/10/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "iCarousel.h"
#import "MyDraggableImage.h"
#import "DIYMenu.h"
#import "LogoCollectionViewController.h"
#import "DraftCollectionViewController.h"
#import "ImagePickerViewController.h"
#import "SignOffViewController.h"

#import "AppDelegate.h"

@class InteractiveViewController;

/*@protocol logoStringDelegate <NSObject>

- (void)didSetString:(NSString *)logoUseString;*/

/*@protocol StringPickerProtocol <NSObject>

- (void)setString:(NSString *)string;*/

//- (void)didSetCompanyString:(NSString *)companyString;

//@end

/*@protocol StringSetDelegate <NSObject>
 
 - (void)didSetNameString:(NSString *)nameString;*/

@interface InteractiveViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, iCarouselDataSource, iCarouselDataSource, /*DIYMenuDelegate,*/ UIGestureRecognizerDelegate, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate> {
    //NSURLRequest* request;

    IBOutlet UIView* interactiveView;
    IBOutlet UIImageView* interactiveMatView;

    IBOutlet UIImageView* croppedImageView;

    MyDraggableImage* MyDragRect;
    IBOutlet UIButton* logoButton;

    UITextField* textNoteField;
    UITextField* textDecField;

    IBOutlet UITextField* searchField;
    IBOutlet UITextField* hexField;
    IBOutlet UIButton* searchButton;

    IBOutlet UIButton* aquamarineButton;
    //IBOutlet UIButton *steelBlueButton;

    AppDelegate* appdelegate;
    //UIImage *selectedImage;

    CGFloat _keepScale;
    CGFloat _lastScale;
    CGFloat _lastRotation;
    CGFloat _firstX;
    CGFloat _firstY;

    CGFloat matScale;

    //CGPoint center;

    UIView* canvas;

    int artworkCount;
    int matCount;

    CGImageRef masked;

    //NSString*sellerString;
    //NSString*nameString;
    /*NSString*companyString;
    NSString*numberString;*/

    //NSString *logoUseStringHere;

    //__unsafe_unretained id <StringPickerProtocol> _delegate;
    //__unsafe_unretained id <StringSetDelegate> delegate;
}

//@property (nonatomic, weak) id <StringPickerProtocol> delegate;
//@property (nonatomic, weak) id <StringSetDelegate> delegate;

@property (nonatomic, readonly) NSArray* textFields;

@property (nonatomic, weak) NSString* logoUseStringHere;
@property (nonatomic, weak) NSString* urlMatStringAppend;

@property (nonatomic, weak) NSString* sizeGetMatString;

@property (nonatomic, strong) UITextField* textPMSField;
@property (nonatomic, strong) UITextField* textNoteField;
@property (nonatomic, strong) UITextField* textDecField;

@property (nonatomic, strong) IBOutlet UIActivityIndicatorView* activityIndicator;

@property (nonatomic, strong) IBOutlet UITextField* hexField;
@property (nonatomic, strong) IBOutlet UITextField* searchField;
@property (nonatomic, strong) IBOutlet UIButton* searchButton;

@property (nonatomic, strong) IBOutlet UITextField* sellerField;
@property (nonatomic, strong) IBOutlet UITextField* companyField;
@property (nonatomic, strong) IBOutlet UITextField* nameField;
@property (nonatomic, strong) IBOutlet UITextField* nameHideField;
@property (nonatomic, strong) IBOutlet UITextField* numberField;

@property (nonatomic, strong) IBOutlet UITextField* widthField;
@property (nonatomic, strong) IBOutlet UITextField* heightField;

@property (nonatomic, strong) IBOutlet UITextField* widthCircleField;
@property (nonatomic, strong) IBOutlet UITextField* heightCircleField;

@property (nonatomic, strong) IBOutlet UITextField* textOrientField;

@property (nonatomic, weak) UITextField* selectedTextField;

@property (nonatomic, strong) IBOutlet UIView* decTextLayerView;
@property (nonatomic, strong) IBOutlet UIView* noteLayerView;
@property (nonatomic, strong) IBOutlet UIView* snapshotView;
@property (nonatomic, strong) IBOutlet UIView* interactiveView;
@property (nonatomic, strong) IBOutlet UIButton* uploadLogoButton;
@property (nonatomic, strong) IBOutlet UIButton* internetLogoButton;
@property (nonatomic, strong) IBOutlet UIButton* nearLogoButton;
@property (nonatomic, strong) IBOutlet UIButton* searchLogoButton;
@property (nonatomic, strong) IBOutlet UIButton* rugSizeButton;
@property (nonatomic, strong) IBOutlet UIButton* rugColorButton;

@property (nonatomic, strong) IBOutlet UIButton* homeButton;
@property (nonatomic, strong) IBOutlet UIButton* logoButton;
@property (nonatomic, strong) IBOutlet UIButton* matButton;
@property (nonatomic, strong) IBOutlet UIButton* logoPicButton;

@property (nonatomic, strong) IBOutlet UIButton* hexButton;

@property (nonatomic, strong) IBOutlet UIImageView* chosenImageView;
@property (nonatomic, strong) IBOutlet UIImageView* snapShotTestImageView;

@property (nonatomic, strong) IBOutlet UIImageView* colorButtonHideView;

@property (nonatomic, strong) IBOutlet UIImageView* matView1;
@property (nonatomic, strong) IBOutlet UIImageView* matBGImageView;
@property (nonatomic, strong) IBOutlet UIImageView* matBGLogoView;
@property (nonatomic, strong) IBOutlet UIImageView* steelBlueImageView;
@property (nonatomic, strong) IBOutlet UIImageView* tempPickerImageView;

@property (nonatomic, strong) IBOutlet UIImageView* croppedImageView;

@property (nonatomic, strong) IBOutlet UIImageView* myIconImageView;

@property (nonatomic, strong) IBOutlet UIImageView* titleBar;
@property (nonatomic, strong) IBOutlet UILabel* titleLabel;
@property (nonatomic, strong) IBOutlet UILabel* headerLabel;

@property (nonatomic, strong) IBOutlet UIButton* size2by3;
@property (nonatomic, strong) IBOutlet UIButton* size3by5;
@property (nonatomic, strong) IBOutlet UIButton* size4by6;
@property (nonatomic, strong) IBOutlet UIButton* size3by10;
@property (nonatomic, strong) IBOutlet UIImageView* size2by3View;
@property (nonatomic, strong) IBOutlet UIImageView* size3by5View;
@property (nonatomic, strong) IBOutlet UIImageView* size4by6View;
@property (nonatomic, strong) IBOutlet UIImageView* size3by10View;

@property (nonatomic, strong) IBOutlet UIImageView* landscapeImageView;
@property (nonatomic, strong) IBOutlet UIImageView* portraitImageView;

@property (nonatomic, strong) IBOutlet UIButton* logoColorButton1;
@property (nonatomic, strong) IBOutlet UIButton* logoColorButton2;
@property (nonatomic, strong) IBOutlet UIButton* logoColorButton3;
@property (nonatomic, strong) IBOutlet UIButton* logoColorButton4;
@property (nonatomic, strong) IBOutlet UIButton* logoColorButton5;
@property (nonatomic, strong) IBOutlet UIButton* logoColorButton6;
@property (nonatomic, strong) IBOutlet UIButton* logoColorButton7;
@property (nonatomic, strong) IBOutlet UIButton* logoColorButton8;

@property (nonatomic, strong) IBOutlet UIButton* matColorButton1;
@property (nonatomic, strong) IBOutlet UIButton* matColorButton2;
@property (nonatomic, strong) IBOutlet UIButton* matColorButton3;
@property (nonatomic, strong) IBOutlet UIButton* matColorButton4;
@property (nonatomic, strong) IBOutlet UIButton* matColorButton5;
@property (nonatomic, strong) IBOutlet UIButton* matColorButton6;
@property (nonatomic, strong) IBOutlet UIButton* matColorButton7;
@property (nonatomic, strong) IBOutlet UIButton* matColorButton8;
@property (nonatomic, assign) IBOutlet UIButton* bgColorButton;

@property (nonatomic, assign) IBOutlet UIButton* logoColorMoveButton;

@property (nonatomic, strong) IBOutlet UIButton* steelBlueButton;
@property (nonatomic, strong) IBOutlet UIButton* suedeButton;
@property (nonatomic, strong) IBOutlet UIButton* whiteButton;
@property (nonatomic, strong) IBOutlet UIButton* roseButton;
@property (nonatomic, strong) IBOutlet UIButton* royalBlueButton;
@property (nonatomic, strong) IBOutlet UIButton* sandalWoodButton;
@property (nonatomic, strong) IBOutlet UIButton* silverButton;
@property (nonatomic, strong) IBOutlet UIButton* orangeButton;
@property (nonatomic, strong) IBOutlet UIButton* purpleButton;
@property (nonatomic, strong) IBOutlet UIButton* redButton;
@property (nonatomic, strong) IBOutlet UIButton* goldButton;
@property (nonatomic, strong) IBOutlet UIButton* greyButton;
@property (nonatomic, strong) IBOutlet UIButton* lightBlueButton;
@property (nonatomic, strong) IBOutlet UIButton* navyButton;
@property (nonatomic, strong) IBOutlet UIButton* emeraldGreenButton;
@property (nonatomic, strong) IBOutlet UIButton* forestGreenButton;
@property (nonatomic, strong) IBOutlet UIButton* cranberryButton;
@property (nonatomic, strong) IBOutlet UIButton* darkGoldButton;
@property (nonatomic, strong) IBOutlet UIButton* charcoalButton;
@property (nonatomic, strong) IBOutlet UIButton* chocolateButton;
@property (nonatomic, strong) IBOutlet UIButton* clayButton;
@property (nonatomic, strong) IBOutlet UIButton* blackButton;
@property (nonatomic, strong) IBOutlet UIButton* brownButton;
@property (nonatomic, strong) IBOutlet UIButton* burgundyButton;
@property (nonatomic, strong) IBOutlet UIButton* aquamarineButton;
@property (nonatomic, strong) IBOutlet UIButton* turquoiseButton;
@property (nonatomic, strong) IBOutlet UIButton* yellowButton;

@property (nonatomic, strong) UIButton* firstColorNameString;
@property (nonatomic, strong) UIButton* secondColorNameString;
@property (nonatomic, strong) UIButton* thirdColorNameString;
@property (nonatomic, strong) UIButton* fourthColorNameString;
@property (nonatomic, strong) UIButton* fifthColorNameString;
@property (nonatomic, strong) UIButton* sixthColorNameString;
@property (nonatomic, strong) UIButton* seventhColorNameString;

@property (nonatomic, strong) UIButton* firstColorLogoButton;
@property (nonatomic, strong) UIButton* secondColorLogoButton;
@property (nonatomic, strong) UIButton* thirdColorLogoButton;
@property (nonatomic, strong) UIButton* fourthColorLogoButton;
@property (nonatomic, strong) UIButton* fifthColorLogoButton;
@property (nonatomic, strong) UIButton* sixthColorLogoButton;
@property (nonatomic, strong) UIButton* seventhColorLogoButton;

@property (nonatomic, copy) NSMutableArray* artworkNameArray;
@property (nonatomic, copy) NSMutableArray* artworkSellerArray;
@property (nonatomic, copy) NSMutableArray* artworkCompanyArray;
@property (nonatomic, copy) NSMutableArray* artworkSizeArray;
@property (nonatomic, copy) NSMutableArray* artworkFormatArray;
@property (nonatomic, copy) NSMutableArray* artworkFullImageArray;
@property (nonatomic, copy) NSMutableArray* artworkIconArray;
@property (nonatomic, copy) NSMutableArray* artworkIDArray;
@property (nonatomic, copy) NSMutableArray* artworkInfoArray;
@property (nonatomic, copy) NSMutableArray* artworkColorArray;

@property (nonatomic, copy) NSMutableArray* logoColorArray;
@property (nonatomic, copy) NSMutableArray* logoColorButtonArray;
@property (nonatomic, copy) NSMutableArray* logoColorNameArray;
@property (nonatomic, copy) NSMutableArray* logoColorNumberArray;

@property (nonatomic, copy) NSMutableArray* matColorNameArray;
@property (nonatomic, copy) NSMutableArray* matColorNumberArray;

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

@property (nonatomic, strong) NSMutableArray* favoritesMatArray;

@property (nonatomic, retain) NSArray* familyNamesArray;
@property (nonatomic, retain) NSMutableArray* fontSizeArray;
@property (nonatomic, retain) NSMutableArray* colorNamesArray;
@property (nonatomic, retain) NSArray* colorNamesImagesArray;
@property (nonatomic, retain) NSMutableArray* colorNumbersArray;

@property (nonatomic, retain) NSMutableArray* redArray;
@property (nonatomic, retain) NSMutableArray* greenArray;
@property (nonatomic, retain) NSMutableArray* blueArray;

@property (nonatomic, retain) NSString* emailString;
@property (nonatomic, retain) NSString* emailTitle;

@property (nonatomic, retain) NSString* chosenFontString;
@property (nonatomic, assign) int chosenColorInt;
@property (nonatomic, assign) int chosenFontSize;

@property (nonatomic, retain) NSString* redInt;
@property (nonatomic, retain) NSString* greenInt;
@property (nonatomic, retain) NSString* blueInt;

@property (nonatomic, retain) UITextField* selectedDecTextField;

@property (nonatomic, assign) int redValue;
@property (nonatomic, assign) int greenValue;
@property (nonatomic, assign) int blueValue;

@property (nonatomic, assign) int artworkCount;
@property (nonatomic, assign) int matCount;

@property (nonatomic, assign) float x;
//@property (nonatomic, assign) CGPoint center;
//@property (nonatomic, assign) UIControl *control;

@property (nonatomic, assign) double doubleMat;

@property (nonatomic, assign) NSDecimalNumber* PercentMat;

@property (nonatomic, strong) NSString* locationIDString;
@property (nonatomic, strong) NSString* userIDString;

@property (nonatomic, strong) NSString* matBGTextColorString;
@property (nonatomic, assign) NSString* matBGColorString;
@property (nonatomic, strong) NSString* matUseBGColorString;
@property (nonatomic, strong) NSString* logoBGColorString;

@property (nonatomic, strong) NSString* actionSelectedString;
@property (nonatomic, strong) NSString* matSizeString;
@property (nonatomic, strong) NSString* matColorString;
@property (nonatomic, strong) NSString* logoColorString;

@property (nonatomic, strong) NSString* matColorUseString;
@property (nonatomic, strong) NSString* matSizeUseString;

@property (nonatomic, strong) NSString* draftUrlAddFavString;
@property (nonatomic, strong) NSString* draftNameAddFavString;

@property (nonatomic, strong) NSString* matUrlAddFavString;
@property (nonatomic, strong) NSString* matNameAddFavString;
@property (nonatomic, strong) NSString* matSellerAddFavString;
@property (nonatomic, strong) NSString* matCompanyAddFavString;
@property (nonatomic, strong) NSString* matIDAddFavString;
@property (nonatomic, strong) NSString* matLocationIDAddFavString;

@property (nonatomic, strong) NSString* BGString;
@property (nonatomic, strong) NSString* matColorAddFavString;
@property (nonatomic, strong) NSString* matBGColorAddFavString;
@property (nonatomic, strong) NSString* matSizeAddFavString;

@property (nonatomic, strong) NSString* logoColorSelectedString;
@property (nonatomic, strong) NSString* logoColor1String;
@property (nonatomic, strong) NSString* logoColor2String;
@property (nonatomic, strong) NSString* logoColor3String;
@property (nonatomic, strong) NSString* logoColor4String;
@property (nonatomic, strong) NSString* logoColor5String;
@property (nonatomic, strong) NSString* logoColor6String;
@property (nonatomic, strong) NSString* logoColor7String;

@property (nonatomic, strong) NSString* nameString;
@property (nonatomic, strong) NSString* sellerString;
@property (nonatomic, strong) NSString* companyString;
@property (nonatomic, strong) NSString* numberString;
@property (nonatomic, strong) NSString* sizeString;

@property (nonatomic, strong) NSString* orientString;

@property (nonatomic, strong) NSString* interactiveHeaderString;

@property (nonatomic, strong) UIImage* selectedImage;
@property (nonatomic, strong) UIImage* myBGColor;

@property (nonatomic, strong) UIImage* matImage;
@property (nonatomic, strong) UIImage* pickerImage;

@property (nonatomic, strong) IBOutlet UIPickerView* fontPicker;
@property (nonatomic, strong) IBOutlet UIPickerView* colorPicker;

@property (nonatomic, strong) IBOutlet iCarousel* carouselSize;
@property (nonatomic, strong) IBOutlet iCarousel* carouselColor;
@property (nonatomic, strong) IBOutlet iCarousel* carouselLogo;

@property (nonatomic, retain) NSArray* pickerViewFontArray;
@property (nonatomic, retain) NSArray* pickerViewColorArray;

@property (nonatomic, strong) UIAttachmentBehavior* attachmentBehavior;
@property (nonatomic, strong) UIDynamicAnimator* animator;

@property (nonatomic, assign) CGPoint logoPicCenter;

- (IBAction)goSearch:(id)sender;

//- (IBAction)addHexField:(id)sender;

- (IBAction)goAcquireSketches:(id)sender;
- (IBAction)goSketches:(id)sender;
- (IBAction)goSignMat:(id)sender;
- (IBAction)backButton:(id)sender;
- (IBAction)imageMoved:(id)sender withEvent:(UIEvent*)event;
- (IBAction)goMail:(UIButton*)sender event:(id)event;
- (IBAction)cropSquare:(id)sender;

- (IBAction)Portrait:(id)sender;
- (IBAction)Landscape:(id)sender;
- (IBAction)twoByTwo:(id)sender;
- (IBAction)threeByFive:(id)sender;
- (IBAction)fourBySix:(id)sender;
- (IBAction)threeByTen:(id)sender;

- (IBAction)hideNotes:(UITextField*)textField;

- (void)ifButtonCollides;

@end
