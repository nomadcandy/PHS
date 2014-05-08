//
//  InteractiveViewController.h
//  Millenium
//
//  Created by Jami Sue Becker on 3/10/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

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
    IBOutlet UIButton *searchButton;
    
    AppDelegate *appdelegate;
    UIImage *selectedImage;
    
    CGFloat _lastScale;
	CGFloat _lastRotation;
	CGFloat _firstX;
	CGFloat _firstY;
    
    UIView *canvas;
    
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


@property (nonatomic, strong) IBOutlet UITextField *searchField;
@property (nonatomic, strong) IBOutlet UIButton *searchButton;

@property (nonatomic, strong) IBOutlet UITextField *sellerField;
@property (nonatomic, strong) IBOutlet UITextField *companyField;
@property (nonatomic, strong) IBOutlet UITextField *nameField;
@property (nonatomic, strong) IBOutlet UITextField *numberField;

@property (nonatomic, strong) IBOutlet UITextField *widthField;
@property (nonatomic, strong) IBOutlet UITextField *heightField;

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

@property (nonatomic, strong) IBOutlet UIImageView *chosenImageView;

@property (nonatomic, strong) IBOutlet UIImageView *titleBar;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;

@property (nonatomic, strong) IBOutlet UIButton *size2by3;
@property (nonatomic, strong) IBOutlet UIButton *size3by5;
@property (nonatomic, strong) IBOutlet UIButton *size4by6;
@property (nonatomic, strong) IBOutlet UIButton *size3by10;


@property (nonatomic, copy) NSMutableArray *artworkNameArray;
@property (nonatomic, copy) NSMutableArray *artworkSellerArray;
@property (nonatomic, copy) NSMutableArray *artworkSizeArray;
@property (nonatomic, copy) NSMutableArray *artworkFormatArray;
@property (nonatomic, copy) NSMutableArray *artworkFullImageArray;
@property (nonatomic, copy) NSMutableArray *artworkIconArray;
@property (nonatomic, copy) NSMutableArray *artworkIDArray;
@property (nonatomic, copy) NSMutableArray *artworkInfoArray;


@property (nonatomic, strong) NSString *actionSelectedString;
@property (nonatomic, strong) NSString *matSizeString;
@property (nonatomic, strong) NSString *matColorString;

@property (nonatomic, strong) NSString *matColorUseString;
@property (nonatomic, strong) NSString *matSizeUseString;

@property (nonatomic, strong) NSString *nameString;
@property (nonatomic, strong) NSString *sellerString;
@property (nonatomic, strong) NSString *companyString;
@property (nonatomic, strong) NSString *numberString;

@property (nonatomic, strong) UIImage *selectedImage;


@property (nonatomic, strong) IBOutlet iCarousel *carouselSize;
@property (nonatomic, strong) IBOutlet iCarousel *carouselColor;
@property (nonatomic, strong) IBOutlet iCarousel *carouselLogo;

-(IBAction)goSearch:(id)sender;

-(IBAction)goAcquireSketches:(id)sender;
-(IBAction)goSketches:(id)sender;
- (IBAction)goSignMat:(id)sender;
- (IBAction)backButton:(id)sender;
- (IBAction) imageMoved:(id) sender withEvent:(UIEvent *) event;
- (IBAction)cropSquare:(id)sender;

@end
