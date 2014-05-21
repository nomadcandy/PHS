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




@interface InteractiveViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate,  iCarouselDataSource,iCarouselDataSource,DIYMenuDelegate,UIGestureRecognizerDelegate>{
    
    IBOutlet UIView *interactiveView;
    IBOutlet UIImageView *interactiveMatView;
    
    MyDraggableImage*MyDragRect;
    IBOutlet UIButton*logoButton;
    
    UITextField *textNoteField;
    UITextField *textDecField;
    
    IBOutlet UITextField *searchField;
    IBOutlet UITextField *hexField;
    IBOutlet UIButton *searchButton;
    
    IBOutlet UIButton *aquamarineButton;
    //IBOutlet UIButton *steelBlueButton;
    
    AppDelegate *appdelegate;
    UIImage *selectedImage;
    
    CGFloat _lastScale;
	CGFloat _lastRotation;
	CGFloat _firstX;
	CGFloat _firstY;
    
    UIView *canvas;
    
    int artworkCount;
    int matCount;
    
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

@property (nonatomic, weak) NSString *logoUseStringHere;

@property (nonatomic, strong) UITextField *textNoteField;
@property (nonatomic, strong) UITextField *textDecField;

@property (nonatomic, strong) IBOutlet UITextField *hexField;
@property (nonatomic, strong) IBOutlet UITextField *searchField;
@property (nonatomic, strong) IBOutlet UIButton *searchButton;

@property (nonatomic, strong) IBOutlet UITextField *sellerField;
@property (nonatomic, strong) IBOutlet UITextField *companyField;
@property (nonatomic, strong) IBOutlet UITextField *nameField;
@property (nonatomic, strong) IBOutlet UITextField *numberField;

@property (nonatomic, strong) IBOutlet UITextField *widthField;
@property (nonatomic, strong) IBOutlet UITextField *heightField;

@property (nonatomic, strong) IBOutlet UITextField *widthCircleField;
@property (nonatomic, strong) IBOutlet UITextField *heightCircleField;

@property (nonatomic, strong) IBOutlet UIView *interactiveView;
@property (nonatomic, strong) IBOutlet UIButton *uploadLogoButton;
@property (nonatomic, strong) IBOutlet UIButton *internetLogoButton;
@property (nonatomic, strong) IBOutlet UIButton *nearLogoButton;
@property (nonatomic, strong) IBOutlet UIButton *searchLogoButton;
@property (nonatomic, strong) IBOutlet UIButton *rugSizeButton;
@property (nonatomic, strong) IBOutlet UIButton *rugColorButton;

@property (nonatomic, strong) IBOutlet UIButton *homeButton;
@property (nonatomic, strong) IBOutlet UIButton *logoButton;
@property (nonatomic, strong) IBOutlet UIButton *matButton;
@property (nonatomic, strong) IBOutlet UIButton *logoPicButton;

@property (nonatomic, strong) IBOutlet UIButton *hexButton;

@property (nonatomic, strong) IBOutlet UIImageView *chosenImageView;

@property (nonatomic, strong) IBOutlet UIImageView *matBGImageView;
@property (nonatomic, strong) IBOutlet UIImageView *steelBlueImageView;

@property (nonatomic, strong) IBOutlet UIImageView *titleBar;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *headerLabel;

@property (nonatomic, strong) IBOutlet UIButton *size2by3;
@property (nonatomic, strong) IBOutlet UIButton *size3by5;
@property (nonatomic, strong) IBOutlet UIButton *size4by6;
@property (nonatomic, strong) IBOutlet UIButton *size3by10;



@property (nonatomic, strong) IBOutlet UIButton *logoColorButton1;
@property (nonatomic, strong) IBOutlet UIButton *logoColorButton2;
@property (nonatomic, strong) IBOutlet UIButton *logoColorButton3;
@property (nonatomic, strong) IBOutlet UIButton *logoColorButton4;
@property (nonatomic, strong) IBOutlet UIButton *logoColorButton5;
@property (nonatomic, strong) IBOutlet UIButton *logoColorButton6;
@property (nonatomic, strong) IBOutlet UIButton *logoColorButton7;
@property (nonatomic, strong) IBOutlet UIButton *logoColorButton8;

@property (nonatomic, strong) IBOutlet UIButton *matColorButton1;
@property (nonatomic, strong) IBOutlet UIButton *matColorButton2;
@property (nonatomic, strong) IBOutlet UIButton *matColorButton3;
@property (nonatomic, strong) IBOutlet UIButton *matColorButton4;
@property (nonatomic, strong) IBOutlet UIButton *matColorButton5;
@property (nonatomic, strong) IBOutlet UIButton *matColorButton6;
@property (nonatomic, strong) IBOutlet UIButton *matColorButton7;
@property (nonatomic, strong) IBOutlet UIButton *matColorButton8;



@property (nonatomic, strong) IBOutlet UIButton *steelBlueButton;
@property (nonatomic, strong) IBOutlet UIButton *suedeButton;
@property (nonatomic, strong) IBOutlet UIButton *whiteButton;
@property (nonatomic, strong) IBOutlet UIButton *roseButton;
@property (nonatomic, strong) IBOutlet UIButton *royalBlueButton;
@property (nonatomic, strong) IBOutlet UIButton *sandalWoodButton;
@property (nonatomic, strong) IBOutlet UIButton *silverButton;
@property (nonatomic, strong) IBOutlet UIButton *orangeButton;
@property (nonatomic, strong) IBOutlet UIButton *purpleButton;
@property (nonatomic, strong) IBOutlet UIButton *redButton;
@property (nonatomic, strong) IBOutlet UIButton *goldButton;
@property (nonatomic, strong) IBOutlet UIButton *greyButton;
@property (nonatomic, strong) IBOutlet UIButton *lightBlueButton;
@property (nonatomic, strong) IBOutlet UIButton *navyButton;
@property (nonatomic, strong) IBOutlet UIButton *emeraldGreenButton;
@property (nonatomic, strong) IBOutlet UIButton *forestGreenButton;
@property (nonatomic, strong) IBOutlet UIButton *cranberryButton;
@property (nonatomic, strong) IBOutlet UIButton *darkGoldButton;
@property (nonatomic, strong) IBOutlet UIButton *charcoalButton;
@property (nonatomic, strong) IBOutlet UIButton *chocolateButton;
@property (nonatomic, strong) IBOutlet UIButton *clayButton;
@property (nonatomic, strong) IBOutlet UIButton *blackButton;
@property (nonatomic, strong) IBOutlet UIButton *brownButton;
@property (nonatomic, strong) IBOutlet UIButton *burgundyButton;
@property (nonatomic, strong) IBOutlet UIButton *aquamarineButton;
@property (nonatomic, strong) IBOutlet UIButton *turquoiseButton;
@property (nonatomic, strong) IBOutlet UIButton *yellowButton;



@property (nonatomic, copy) NSMutableArray *artworkNameArray;
@property (nonatomic, copy) NSMutableArray *artworkSellerArray;
@property (nonatomic, copy) NSMutableArray *artworkCompanyArray;
@property (nonatomic, copy) NSMutableArray *artworkSizeArray;
@property (nonatomic, copy) NSMutableArray *artworkFormatArray;
@property (nonatomic, copy) NSMutableArray *artworkFullImageArray;
@property (nonatomic, copy) NSMutableArray *artworkIconArray;
@property (nonatomic, copy) NSMutableArray *artworkIDArray;
@property (nonatomic, copy) NSMutableArray *artworkInfoArray;
@property (nonatomic, copy) NSMutableArray *artworkColorArray;

@property (nonatomic, copy) NSMutableArray *logoColorArray;
@property (nonatomic, copy) NSMutableArray *logoColorNumberArray;

@property (nonatomic, copy) NSMutableArray *matNameArray;
@property (nonatomic, copy) NSMutableArray *matSizeArray;
@property (nonatomic, copy) NSMutableArray *matFormatArray;
@property (nonatomic, copy) NSMutableArray *matFullImageArray;
@property (nonatomic, copy) NSMutableArray *matIconArray;
@property (nonatomic, copy) NSMutableArray *matIDArray;
@property (nonatomic, copy) NSMutableArray *matInfoArray;
@property (nonatomic, copy) NSMutableArray *matSellerArray;
@property (nonatomic, copy) NSMutableArray *matCompanyArray;
@property (nonatomic, copy) NSMutableArray *matColorArray;


@property (nonatomic, assign) int artworkCount;
@property (nonatomic, assign) int matCount;



@property (nonatomic, strong) NSString *actionSelectedString;
@property (nonatomic, strong) NSString *matSizeString;
@property (nonatomic, strong) NSString *matColorString;
@property (nonatomic, strong) NSString *logoColorString;

@property (nonatomic, strong) NSString *matColorUseString;
@property (nonatomic, strong) NSString *matSizeUseString;

@property (nonatomic, strong) NSString *nameString;
@property (nonatomic, strong) NSString *sellerString;
@property (nonatomic, strong) NSString *companyString;
@property (nonatomic, strong) NSString *numberString;
@property (nonatomic, strong) NSString *sizeString;

@property (nonatomic, strong) NSString *interactiveHeaderString;

@property (nonatomic, strong) UIImage *selectedImage;


@property (nonatomic, strong) IBOutlet iCarousel *carouselSize;
@property (nonatomic, strong) IBOutlet iCarousel *carouselColor;
@property (nonatomic, strong) IBOutlet iCarousel *carouselLogo;

-(IBAction)goSearch:(id)sender;

-(IBAction) addHexField:(id)sender;

-(IBAction)goAcquireSketches:(id)sender;
-(IBAction)goSketches:(id)sender;
-(IBAction)goSignMat:(id)sender;
-(IBAction)backButton:(id)sender;
-(IBAction)imageMoved:(id) sender withEvent:(UIEvent *) event;
-(IBAction)goMail:(UIButton*)sender event:(id)event;
-(IBAction)cropSquare:(id)sender;

-(IBAction) twoByTwo:(id)sender;
-(IBAction) threeByFive:(id)sender;
-(IBAction) fourBySix:(id)sender;
-(IBAction) threeByTen:(id)sender;



@end
