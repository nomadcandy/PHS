//
//  InteractiveViewController.m
//  Millenium
//
//  Created by Jami Sue Becker on 3/10/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import "InteractiveViewController.h"
#import "ViewController.h"
#import "MyDraggableImage.h"


@interface InteractiveViewController ()
@property (strong, nonatomic) IBOutlet UIView *matView;

@property (nonatomic,strong) NSMutableArray* decorativeTestFields;
@property (nonatomic,strong) UITextField* lastMovedTextField;
@property (nonatomic,strong) UIButton* lastMovedButton;
@end

@implementation InteractiveViewController

//@synthesize center;
//@synthesize control;
@synthesize firstColorNameString;
@synthesize secondColorNameString;
@synthesize thirdColorNameString;
@synthesize fourthColorNameString;
@synthesize fifthColorNameString;
@synthesize sixthColorNameString;
@synthesize seventhColorNameString;


@synthesize logoColorMoveButton;
@synthesize matColorString;
@synthesize logoColorString;
@synthesize lastMovedButton;

@synthesize emailTitle;
@synthesize sizeGetMatString;
@synthesize colorButtonHideView;

@synthesize steelBlueButton;

@synthesize snapshotView;
@synthesize snapShotTestImageView;
@synthesize tempPickerImageView;

@synthesize urlMatStringAppend;
@synthesize locationIDString;
@synthesize userIDString;

@synthesize activityIndicator;

@synthesize textNoteField;
@synthesize textDecField;
@synthesize textPMSField;

@synthesize hexField;
@synthesize myBGColor;
@synthesize bgColorButton;
//@synthesize delegate=_delegate;
@synthesize decTextLayerView;
@synthesize noteLayerView;

@synthesize interactiveView;
@synthesize matView1;
@synthesize matBGLogoView;
@synthesize carouselSize;
@synthesize carouselColor;
@synthesize carouselLogo;

@synthesize rugSizeButton;
@synthesize rugColorButton;
@synthesize matSizeString;
@synthesize matColorUseString;
@synthesize matSizeUseString;

@synthesize pickerImage;

@synthesize matImage;
@synthesize selectedImage;
@synthesize matButton;
@synthesize logoButton;
@synthesize logoPicButton;
@synthesize homeButton;



@synthesize searchButton;
@synthesize searchField;

@synthesize nameHideField;

@synthesize nameField;
@synthesize numberField;
@synthesize sellerField;
@synthesize companyField;
@synthesize textOrientField;

@synthesize titleBar;

@synthesize titleLabel;
@synthesize headerLabel;

@synthesize myIconImageView;

@synthesize chosenImageView;

@synthesize artworkNameArray;
@synthesize artworkSellerArray;
@synthesize artworkSizeArray;
@synthesize artworkFormatArray;
@synthesize artworkFullImageArray;
@synthesize artworkIconArray;
@synthesize artworkIDArray;
@synthesize artworkInfoArray;
@synthesize artworkCompanyArray;
@synthesize artworkColorArray;

@synthesize artworkCount;
@synthesize matCount;

@synthesize logoColorArray;
@synthesize logoColorButtonArray;
@synthesize logoColorNameArray;
@synthesize logoColorNumberArray;

@synthesize matColorNameArray;

@synthesize matNameArray;
@synthesize matSizeArray;
@synthesize matFormatArray;
@synthesize matFullImageArray;
@synthesize matIconArray;
@synthesize matIDArray;
@synthesize matInfoArray;
@synthesize matSellerArray;
@synthesize matCompanyArray;
@synthesize matColorArray;
@synthesize matBGColorArray;

@synthesize matColorNumberArray;

@synthesize favoritesMatArray;

@synthesize matBGTextColorString;

@synthesize matUrlAddFavString;
@synthesize matNameAddFavString;
@synthesize matSellerAddFavString;
@synthesize matCompanyAddFavString;
@synthesize matIDAddFavString;
@synthesize matLocationIDAddFavString;


@synthesize matColorAddFavString;
@synthesize matBGColorAddFavString;
@synthesize matSizeAddFavString;

@synthesize croppedImageView;



@synthesize BGString;
@synthesize matUseBGColorString;
@synthesize matBGColorString;
@synthesize logoBGColorString;
@synthesize nameString;
@synthesize sellerString;
@synthesize companyString;
@synthesize numberString;
@synthesize sizeString;

@synthesize logoColorSelectedString;
@synthesize logoColor1String;
@synthesize logoColor2String;
@synthesize logoColor3String;
@synthesize logoColor4String;
@synthesize logoColor5String;
@synthesize logoColor6String;
@synthesize logoColor7String;


@synthesize logoColorButton1;
@synthesize logoColorButton2;
@synthesize logoColorButton3;
@synthesize logoColorButton4;
@synthesize logoColorButton5;
@synthesize logoColorButton6;
@synthesize logoColorButton7;


@synthesize firstColorLogoButton;
@synthesize secondColorLogoButton;
@synthesize thirdColorLogoButton;
@synthesize fourthColorLogoButton;
@synthesize fifthColorLogoButton;
@synthesize sixthColorLogoButton;
@synthesize seventhColorLogoButton;


@synthesize orientString;

@synthesize interactiveHeaderString;

@synthesize size2by3View;
@synthesize size3by5View;
@synthesize size4by6View;
@synthesize size3by10View;

@synthesize landscapeImageView;
@synthesize portraitImageView;

@synthesize pickerViewColorArray;
@synthesize pickerViewFontArray;

@synthesize familyNamesArray;
@synthesize colorNamesArray;
@synthesize colorNamesImagesArray;
@synthesize colorNumbersArray;
@synthesize fontSizeArray;
@synthesize redArray;
@synthesize greenArray;
@synthesize blueArray;

@synthesize redInt;
@synthesize greenInt;
@synthesize blueInt;

@synthesize redValue;
@synthesize greenValue;
@synthesize blueValue;


@synthesize chosenFontString;
@synthesize chosenColorInt;
@synthesize chosenFontSize;

@synthesize selectedDecTextField;


@synthesize colorPicker;
@synthesize fontPicker;


//@synthesize logoUseStringHere;


- (void)dealloc
{
    
    carouselSize.delegate = nil;
    carouselSize.dataSource = nil;
    carouselColor.delegate = nil;
    carouselColor.dataSource = nil;
   
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
        tap.cancelsTouchesInView = false;
        [self.view addGestureRecognizer:tap];
    }
    return self;
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







- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //_emailString=@"A New Sketch Request";
    
    logoColorButton1.enabled=YES;
    logoColorButton2.enabled=YES;
    logoColorButton3.enabled=YES;
    logoColorButton4.enabled=YES;
    logoColorButton5.enabled=YES;
    logoColorButton6.enabled=YES;
    logoColorButton7.enabled=YES;
    
    //TODO Add matbgColor info
    NSLog(@"matBGColorString %@",matBGColorString);
    NSLog(@"matColorString Interactive %@",matColorString);
    
    //NSLog(@"%@ matBGColorString", matBGColorString);
    BGString = matBGColorString;
    matUseBGColorString=matBGColorString;
    
    
   //if ([BGString rangeOfString:@"108-Black"].location == NSNotFound ) {
   if ([BGString isEqualToString:@"108-Black"]) {
        
        matUseBGColorString = @"Black_108.jpg";
        matBGTextColorString=@"108";

       
        
        
    } else {
        
        
        NSLog(@"string does not contain bla");
        
        
    }
    
   //if ([BGString rangeOfString:@"121-Steel Blue"].location == NSNotFound) {
    if ([BGString isEqualToString:@"121-Steel Blue"]) {
   
        matUseBGColorString = @"Steel Blue_121.jpg";
        matBGTextColorString=@"121";
        matBGColorAddFavString=@"121-Steel Blue";

        
        
    } else {
        
        NSLog(@"string does not contain bla");
      
        
        
    }
    
    //if ([BGString rangeOfString:@"123-Suede"].location == NSNotFound) {
     if ([BGString isEqualToString:@"123-Suede"]) {
        
         matUseBGColorString=@"Suede_123.jpg";
         matBGTextColorString=@"123";
         matBGColorAddFavString=@"123-Suede";
        
    } else {
        
        
        NSLog(@"string does not contain bla");
    }
    
    //if ([BGString rangeOfString:@"140-White"].location == NSNotFound) {
     if ([BGString isEqualToString:@"140-White"]) {
        
        
         matUseBGColorString=@"White_140.jpg";
         matBGTextColorString=@"140";
         matBGColorAddFavString=@"140-White";
         
    } else {
        
        //NSLog(@"string does not contain bla");
        
        
        
        
    }
    
    //if ([BGString rangeOfString:@"119-Rose"].location == NSNotFound) {
    if ([BGString isEqualToString:@"119-Rose"]) {
        
        matUseBGColorString=@"Rose_119.jpg";
        matBGTextColorString=@"119";
        matBGColorAddFavString=@"119-Rose";

        
    } else {
        
        
        /*matUseBGColorString=@"Rose_119.jpg";
        matBGTextColorString=@"119";
        matBGColorAddFavString=@"119-Rose";*/
        NSLog(@"string does not contain bla");

        
    }
    
    //if ([BGString rangeOfString:@"107-Royal Blue"].location == NSNotFound) {
     if ([BGString isEqualToString:@"107-Royal Blue"]) {
        
         
         matUseBGColorString=@"Royal Blue_107.jpg";
         matBGTextColorString=@"107";
         matBGColorAddFavString=@"107-Royal Blue";

        
    } else {
        
        NSLog(@"string does not contain bla");
       
        
    }
    
   // if ([BGString rangeOfString:@"120-Sandalwood"].location == NSNotFound) {
    if ([BGString isEqualToString:@"120-Sandalwood"]) {
        
        matUseBGColorString=@"Sandalwood_120.jpg";
        matBGTextColorString=@"120";
        matBGColorAddFavString=@"120-Sandalwood";
        
        
    } else {
        
        NSLog(@"string does not contain bla");
        
       
        
    }
    
    //if ([BGString rangeOfString:@"116-Silver"].location == NSNotFound) {
    if ([BGString isEqualToString:@"116-Silver"]) {
        
        
        matUseBGColorString=@"Silver_116.jpg";
        matBGTextColorString=@"116";
        matBGColorAddFavString=@"116-Silver";
        
    } else {
        
        NSLog(@"string does not contain bla");
       /* matUseBGColorString=@"Silver_116.jpg";
        matBGTextColorString=@"116";
        matBGColorAddFavString=@"116-Silver";*/
        
    }
    
    //if ([BGString rangeOfString:@"127-Orange"].location == NSNotFound) {
     if ([BGString isEqualToString:@"127-Orange"]) {
       
         
         matUseBGColorString=@"Orange_127.jpg";
         matBGTextColorString=@"127";
         matBGColorAddFavString=@"127-Orange";

        
    } else {
        
         NSLog(@"string does not contain bla");
        
    }
    
    //if ([BGString rangeOfString:@"105-Purple"].location == NSNotFound) {
    if ([BGString isEqualToString:@"105-Purple"]) {
        //NSLog(@"string does not contain bla");
        matUseBGColorString=@"Purple_105.jpg";
        matBGTextColorString=@"105";
        matBGColorAddFavString=@"105-Purple";
        
    } else {
        
         //NSLog(@"string does not contain bla");
        /*matUseBGColorString=@"Purple_105.jpg";
        matBGTextColorString=@"105";
        matBGColorAddFavString=@"105-Purple";*/
        
        
        
    }
    //TODO set equalToStringHere
    //if ([BGString rangeOfString:@"112-Red"].location == NSNotFound) {
    if ([BGString isEqualToString:@"112-Red"]) {
        //NSLog(@"string does not contain bla");
        matUseBGColorString=@"Red_112.jpg";
        matBGTextColorString=@"112";
        matBGColorAddFavString=@"112-Red";

        
    } else {
        
        
         NSLog(@"string does not contain bla");
        
    }
    
    //if ([BGString rangeOfString:@"109-Gold"].location == NSNotFound) {
    if ([BGString isEqualToString:@"109-Gold"]) {
        matUseBGColorString=@"Gold_109.jpg";
        matBGTextColorString=@"109";
        matBGColorAddFavString=@"109-Gold";
        
        
    } else {
        
        
        NSLog(@"string does not contain bla");
        
        
    }
    
    //if ([BGString rangeOfString:@"115-Grey"].location == NSNotFound) {
    if ([BGString isEqualToString:@"115-Grey"]) {
        
        matUseBGColorString=@"Grey_115.jpg";
        matBGTextColorString= @"115";
        matBGColorAddFavString=@"115-Grey";
        
        
    } else {
        
        NSLog(@"string does not contain bla");
       
    }
    
    //if ([BGString rangeOfString:@"106-Light Blue"].location == NSNotFound) {
    if ([BGString isEqualToString:@"106-Light Blue"]) {
        
            matUseBGColorString=@"Light Blue_106.jpg";
            matUseBGColorString=@"106";
            matBGColorAddFavString=@"106-Light Blue";

        
        
    } else {
        
        NSLog(@"string does not contain bla");
        
        
    }
    
    //if ([BGString rangeOfString:@"118-Navy"].location == NSNotFound) {
    if ([BGString isEqualToString:@"118-Navy"]) {
       
        
        matUseBGColorString=@"Navy_118.jpg";
        matBGTextColorString=@"118";
        matBGColorAddFavString=@"118-Navy";
        
    } else {
        
        
         NSLog(@"string does not contain bla");
        
    }
    
    //if ([BGString rangeOfString:@"110-Emerald Green"].location == NSNotFound) {
     if ([BGString isEqualToString:@"110-Emerald Green"]) {
         
       
         
         matUseBGColorString=@"Emerald Green_110.jpg";
         matBGTextColorString=@"110";
         matBGColorAddFavString=@"110-Emerald Green";
        
    } else {
        
         NSLog(@"string does not contain bla");
        
    }
    
    //if ([BGString rangeOfString:@"117-Forest Green"].location == NSNotFound) {
     if ([BGString isEqualToString:@"117-Forest Green"]) {
        
         
         matUseBGColorString=@"Forest Green_117.jpg";
         matBGTextColorString=@"117";
         matBGColorAddFavString=@"117-Forest Green";

        
    } else {
        
        NSLog(@"string does not contain bla");
        
            }
    
    //if ([BGString rangeOfString:@"114-Cranberry"].location == NSNotFound) {
    if ([BGString isEqualToString:@"114-Cranberry"]) {
        
         
         matUseBGColorString=@"Cranberry_114.jpg";
         matBGTextColorString=@"114";
         matBGColorAddFavString=@"114-Cranberry";
        
    } else {
        
        NSLog(@"string does not contain bla");
        
    }
    
    //if ([BGString rangeOfString:@"103-Dark Gold"].location == NSNotFound) {
    if ([BGString isEqualToString:@"103-Dark Gold"]) {
        //NSLog(@"string does not contain bla");
        
        matUseBGColorString=@"Dark Gold_103.jpg";
        matBGTextColorString=@"103";
        matBGColorAddFavString=@"103-Dark Gold";

        
    } else {
        
        NSLog(@"string does not contain bla");
        
        /*matUseBGColorString=@"Dark Gold_103.jpg";
        matBGTextColorString=@"103";
        matBGColorAddFavString=@"103-Dark Gold";*/
    }
    
    //if ([BGString rangeOfString:@"101-Charcoal"].location == NSNotFound) {
     if ([BGString isEqualToString:@"101-Charcoal"]) {
        //NSLog(@"string does not contain bla");
         
         matUseBGColorString=@"Charcoal_101.jpg";
         matBGTextColorString=@"101";
         matBGColorAddFavString=@"101-Charcoal";
        
    } else {
        
        //NSLog(@"string does not contain bla");

       
    }
    
   // if ([BGString rangeOfString:@"111-Chocolate"].location == NSNotFound) {
     if ([BGString isEqualToString:@"111-Chocolate"]) {
        
         
         matUseBGColorString=@"Chocolate_111.jpg";
         matBGTextColorString=@"111";
         matBGColorAddFavString=@"111-Chocolate";
        
    } else {
        
        NSLog(@"string does not contain bla");
       
    }
    
    //if ([BGString rangeOfString:@"126-Clay"].location == NSNotFound) {
    if ([BGString isEqualToString:@"126-Clay"]) {
   
        
        matUseBGColorString=@"Clay_126.jpg";
        matBGTextColorString=@"126";
        matBGColorAddFavString=@"126-Clay";
        
        
    } else {
        
        
        NSLog(@"string does not contain bla");
        
    }
    
   // if ([BGString rangeOfString:@"102-Brown"].location == NSNotFound) {
        if ([BGString isEqualToString:@"102-Brown"]) {
        
            matUseBGColorString=@"Brown_102.jpg";
            matBGTextColorString=@"102";
            matBGColorAddFavString=@"102-Brown";
        //NSLog(@"string does not contain bla");
        
    } else {
        
        //NSLog(@"string does not contain bla");
       /* matUseBGColorString=@"Brown_102.jpg";
        matBGTextColorString=@"102";
        matBGColorAddFavString=@"102-Brown";*/
    }
    
    //if ([BGString rangeOfString:@"100-Burgundy"].location == NSNotFound) {
        if ([BGString isEqualToString:@"100-Burgundy"]) {
    
        NSLog(@"string does not contain bla");
            
            matUseBGColorString=@"Burgundy_100.jpg";
            matBGTextColorString=@"100";
            matBGColorAddFavString=@"100-Burgundy";
        
    } else {
        
        NSLog(@"string does not contain bla");
        
       /* matUseBGColorString=@"Burgundy_100.jpg";
        matBGTextColorString=@"100";
        matBGColorAddFavString=@"100-Burgundy";*/
        
    }
    
    //if ([BGString rangeOfString:@"130-Aquamarine"].location == NSNotFound) {
      if ([BGString isEqualToString:@"130-Aquamarine"]) {
        
          
          matUseBGColorString=@"Aquamarine_130.jpg";
          matBGTextColorString=@"130";
          matBGColorAddFavString=@"130-Aquamarine";
        
    } else {
        
        NSLog(@"string does not contain bla");
        /*matUseBGColorString=@"Aquamarine_130.jpg";
        matBGTextColorString=@"130";
        matBGColorAddFavString=@"130-Aquamarine";*/
    }
    
    //if ([BGString rangeOfString:@"104-Turquoise"].location == NSNotFound) {
    if ([BGString isEqualToString:@"104-Turquoise"]) {
       
        matUseBGColorString=@"Turquoise_104.jpg";
        matBGTextColorString=@"104";
        matBGColorAddFavString=@"104-Turquoise";
        
    } else {
        
        NSLog(@"string does not contain bla");

        /*matUseBGColorString=@"Turquoise_104.jpg";
        matBGTextColorString=@"104";
        matBGColorAddFavString=@"104-Turquoise";*/
        
    }
    
    //if ([BGString rangeOfString:@"128-Yellow"].location == NSNotFound) {
         if ([BGString isEqualToString:@"128-Yellow"]) {
        
        NSLog(@"string does not contain bla");
             matUseBGColorString=@"Yellow_128.jpg";
             matBGTextColorString=@"128";
             matBGColorAddFavString=@"128-Yellow";
        
    } else {
        
        NSLog(@"string does not contain bla");
        /*matUseBGColorString=@"Yellow_128.jpg";
        matBGTextColorString=@"128";
        matBGColorAddFavString=@"128-Yellow";*/
        
    }
    
   
   
    
    UIImage*matBGColorImage = [UIImage imageNamed:matUseBGColorString];
    [bgColorButton setBackgroundImage:matBGColorImage forState:UIControlStateNormal];
    //[bgColorButton setImage:matBGColorImage forState:UIControlStateNormal];
    [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
    [bgColorButton setTitle:matBGTextColorString forState:UIControlStateNormal];
    
    
    if ([bgColorButton.titleLabel.text isEqualToString:@"140"]){
        
        [bgColorButton setTitleShadowColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
    }
    
    [self.bgColorButton reloadInputViews];
  
    
    //switch to colors
    
    if (logoColorArray == nil)
    {
        logoColorArray = [[NSMutableArray alloc] init];
    }
    
    NSLog(@"logoColorArray %@",logoColorArray);
    
    
    if (logoColorNumberArray == nil)
    {
        logoColorNumberArray = [[NSMutableArray alloc] init];
    }
    
    if (logoColorNameArray == nil)
    {
        logoColorNameArray = [[NSMutableArray alloc] init];
    }
    
    if (logoColorButtonArray == nil)
    {
        logoColorButtonArray = [[NSMutableArray alloc] init];
    }
    
    NSLog(@"logoColorArray %@",logoColorArray);

   
    //logoColorString=matColorString;
    
    if (logoColorString!=nil){
         NSLog(@"logoColorString Interactive %@",logoColorString);
        
        NSString *string = logoColorString;
        if ([string rangeOfString:@"108-Black"].location == NSNotFound) {
            NSLog(@"string does not contain bla");
            
            
            
        } else {
            NSLog(@"black Found!");
            
            [logoColorArray addObject:@"Black_108.jpg"];
            [logoColorButtonArray addObject:_blackButton];
            [logoColorNameArray addObject:@"108-Black"];
            [logoColorNumberArray addObject:@"108"];
            
            
        }
        
        if ([string rangeOfString:@"121-Steel Blue"].location == NSNotFound) {
            
            NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Steel Blue_121.jpg"];
            [logoColorButtonArray addObject:steelBlueButton];
            [logoColorNameArray addObject:@"121-Steel Blue"];
            [logoColorNumberArray addObject:@"121"];
            
            
        }
        
        if ([string rangeOfString:@"123-Suede"].location == NSNotFound) {
            
            NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Suede_123.jpg"];
            [logoColorButtonArray addObject:_suedeButton];
            [logoColorNameArray addObject:@"123-Suede"];
            [logoColorNumberArray addObject:@"123"];
            
        }
        
        if ([string rangeOfString:@"140-White"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"White_140.jpg"];
            [logoColorButtonArray addObject:_whiteButton];
            [logoColorNameArray addObject:@"140-White"];
            [logoColorNumberArray addObject:@"140"];
            
            
        }
        
        if ([string rangeOfString:@"119-Rose"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Rose_119.jpg"];
            [logoColorButtonArray addObject:_roseButton];
            [logoColorNameArray addObject:@"119-Rose"];
            [logoColorNumberArray addObject:@"119"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"107-Royal Blue"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Royal Blue_107.jpg"];
            [logoColorButtonArray addObject:_royalBlueButton];
            [logoColorNameArray addObject:@"107-Royal Blue"];
            [logoColorNumberArray addObject:@"107"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"120-Sandalwood"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Sandalwood_120.jpg"];
            [logoColorButtonArray addObject:_sandalWoodButton];
            [logoColorNameArray addObject:@"120-Sandalwood"];
            [logoColorNumberArray addObject:@"120"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"116-Silver"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Silver_116.jpg"];
            [logoColorButtonArray addObject:_silverButton];
            [logoColorNameArray addObject:@"116-Silver"];
            [logoColorNumberArray addObject:@"116"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"127-Orange"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Orange_127.jpg"];
            [logoColorButtonArray addObject:_orangeButton];
            [logoColorNameArray addObject:@"127-Orange"];
            [logoColorNumberArray addObject:@"127"];
            
            
        }
        
        if ([string rangeOfString:@"105-Purple"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Purple_105.jpg"];
            [logoColorButtonArray addObject:_purpleButton];
            [logoColorNameArray addObject:@"105-Purple"];
            [logoColorNumberArray addObject:@"105"];
            
            
            
        }
        
        if ([string rangeOfString:@"112-Red"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Red_112.jpg"];
            [logoColorButtonArray addObject:_redButton];
            [logoColorNameArray addObject:@"112-Red"];
            [logoColorNumberArray addObject:@"112"];
            
            
        }
        
        if ([string rangeOfString:@"109-Gold"].location == NSNotFound) {
            
            NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Gold_109.jpg"];
            [logoColorButtonArray addObject:_goldButton];
            [logoColorNameArray addObject:@"109-Gold"];
            [logoColorNumberArray addObject:@"109"];
            
            
        }
        
        if ([string rangeOfString:@"115-Grey"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Grey_115.jpg"];
            [logoColorButtonArray addObject:_greyButton];
            [logoColorNameArray addObject:@"115-Grey"];
            [logoColorNumberArray addObject:@"115"];
        }
        
        if ([string rangeOfString:@"106-Light Blue"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Light Blue_106.jpg"];
            [logoColorButtonArray addObject:_lightBlueButton];
            [logoColorNameArray addObject:@"106-Light Blue"];
            [logoColorNumberArray addObject:@"106"];
            
            
        }
        
        if ([string rangeOfString:@"118-Navy"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Navy_118.jpg"];
            [logoColorButtonArray addObject:_navyButton];
            [logoColorNameArray addObject:@"118-Navy"];
            [logoColorNumberArray addObject:@"118"];
            
        }
        
        if ([string rangeOfString:@"110-Emerald Green"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Emerald Green_110.jpg"];
            [logoColorButtonArray addObject:_emeraldGreenButton];
            [logoColorNameArray addObject:@"110-Emerald Green"];
            [logoColorNumberArray addObject:@"110"];
        }
        
        if ([string rangeOfString:@"117-Forest Green"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Forest Green_117.jpg"];
            [logoColorButtonArray addObject:_forestGreenButton];
            [logoColorNameArray addObject:@"117-Forest Green"];
            [logoColorNumberArray addObject:@"117"];
        }
        
        if ([string rangeOfString:@"114-Cranberry"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Cranberry_114.jpg"];
            [logoColorButtonArray addObject:_cranberryButton];
            [logoColorNameArray addObject:@"114-Cranberry"];
            [logoColorNumberArray addObject:@"114"];
            
        }
        
        if ([string rangeOfString:@"103-Dark Gold"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Dark Gold_103.jpg"];
            [logoColorButtonArray addObject:_darkGoldButton];
            [logoColorNameArray addObject:@"103-Dark Gold"];
            [logoColorNumberArray addObject:@"103"];
            
        }
        
        if ([string rangeOfString:@"101-Charcoal"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Charcoal_101.jpg"];
            [logoColorButtonArray addObject:_charcoalButton];
            [logoColorNameArray addObject:@"101-Charcoal"];
            [logoColorNumberArray addObject:@"101"];
            
        }
        
        if ([string rangeOfString:@"111-Chocolate"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Chocolate_111.jpg"];
            [logoColorButtonArray addObject:_chocolateButton];
            [logoColorNameArray addObject:@"111-Chocolate"];
            [logoColorNumberArray addObject:@"111"];
            
        }
        
        if ([string rangeOfString:@"126-Clay"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Clay_126.jpg"];
            [logoColorButtonArray addObject:_clayButton];
            [logoColorNameArray addObject:@"126-Clay"];
            [logoColorNumberArray addObject:@"126"];
            
        }
        
        if ([string rangeOfString:@"102-Brown"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Brown_102.jpg"];
            [logoColorButtonArray addObject:_brownButton];
            [logoColorNameArray addObject:@"102-Brown"];
            [logoColorNumberArray addObject:@"102"];
            
        }
        
        if ([string rangeOfString:@"100-Burgundy"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Burgundy_100.jpg"];
            [logoColorButtonArray addObject:_burgundyButton];
            [logoColorNameArray addObject:@"100-Burgundy"];
            [logoColorNumberArray addObject:@"100"];
            
        }
        
        if ([string rangeOfString:@"130-Aquamarine"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Aquamarine_130.jpg"];
            [logoColorButtonArray addObject:_aquamarineButton];
            [logoColorNameArray addObject:@"130-Aquamarine"];
            [logoColorNumberArray addObject:@"130"];
            
        }
        
        if ([string rangeOfString:@"104-Turquoise"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Turquoise_104.jpg"];
            [logoColorButtonArray addObject:_turquoiseButton];
            [logoColorNameArray addObject:@"104-Turquoise"];
            [logoColorNumberArray addObject:@"104"];
            
            
        }
        
        if ([string rangeOfString:@"128-Yellow"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Yellow_128.jpg"];
            [logoColorButtonArray addObject:_yellowButton];
            [logoColorNameArray addObject:@"128-Yellow"];
            [logoColorNumberArray addObject:@"128"];
            
            
        }
        
        
        
    }
    
    
    
    
    //NSLog(@"logoColorNumberArray %@",logoColorNumberArray);
    //NSLog(@"logoColorArray %@",logoColorArray);
    int logoColorCount= logoColorArray.count;
    //NSLog(@"logoColorCount %i",logoColorCount);
    
    
    
    if (0 == logoColorCount){
        
        
        /* UIImage*whiteImage = [UIImage imageNamed:@"white_140.jpg"];
         [_logoColorButton1 setBackgroundImage:whiteImage forState:UIControlStateNormal];
         [_logoColorButton2 setBackgroundImage:whiteImage forState:UIControlStateNormal];
         [_logoColorButton3 setBackgroundImage:whiteImage forState:UIControlStateNormal];
         [_logoColorButton4 setBackgroundImage:whiteImage forState:UIControlStateNormal];
         [_logoColorButton5 setBackgroundImage:whiteImage forState:UIControlStateNormal];
         [_logoColorButton6 setBackgroundImage:whiteImage forState:UIControlStateNormal];
         [_logoColorButton7 setBackgroundImage:whiteImage forState:UIControlStateNormal];*/
        
        NSString*emptyString = @" ";
        [logoColorButton1 setTitle:emptyString forState:UIControlStateNormal];
        [logoColorButton2 setTitle:emptyString forState:UIControlStateNormal];
        [logoColorButton3 setTitle:emptyString forState:UIControlStateNormal];
        [logoColorButton4 setTitle:emptyString forState:UIControlStateNormal];
        [logoColorButton5 setTitle:emptyString forState:UIControlStateNormal];
        [logoColorButton6 setTitle:emptyString forState:UIControlStateNormal];
        
        
    }
    
    
    
    
    if (1 <= logoColorCount){
        
        
        //id myObj = [logoColorArray objectAtIndex: objIdx];
        
        NSString*firstColorString = [logoColorArray objectAtIndex:0];
        UIImage*firstColorImage = [UIImage imageNamed:firstColorString];
        [logoColorButton1 setBackgroundImage:firstColorImage forState:UIControlStateNormal];
        
        NSString*firstColorNoString = [logoColorNumberArray objectAtIndex:0];
        [logoColorButton1 setTitle:firstColorNoString forState:UIControlStateNormal];
        [logoColorButton1.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        
        if([firstColorNoString isEqualToString:@"140"]){
            
            
            [logoColorButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            
        }
        
       firstColorNameString = [logoColorButtonArray objectAtIndex:0];
       NSLog(@"firstColorNameString %@",firstColorNameString);
        
        logoColor1String = [logoColorNameArray objectAtIndex:0];
        NSLog(@"logoColor1String%@",logoColor1String);

       
        
        firstColorNameString.hidden=YES;
        
        //logoColor1String=logoColorSelectedString;
      
        // UIButton*firstColorButtonName=[selectButtonWithName:firstColorNameString];
        // Control=firstColorNameString;
        //control=button.tag.firstColorNoString;
        //Sender.frame=logoColorButton1.frame;
        //firstColorNameString.frame=logoColorButton1.frame;
        // firstColorNameString.frame= logoColorButton1.frame;
       //firstColorNameString.frame= CGRectMake(52, 519, 38, 38);
       // _blackButton.frame=logoColorButton1.frame;
       //[firstColorNameString reloadInputViews];
        //[firstColorNameString setNeedsDisplay];
    }
    
    if (2 <= logoColorCount){
        
        NSString*secondColorString = [logoColorArray objectAtIndex:1];
        UIImage*secondColorImage = [UIImage imageNamed:secondColorString];
        [logoColorButton2 setBackgroundImage:secondColorImage forState:UIControlStateNormal];
        
        NSString*secondColorNoString = [logoColorNumberArray objectAtIndex:1];
        [logoColorButton2 setTitle:secondColorNoString forState:UIControlStateNormal];
        [logoColorButton2.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        
        if([secondColorNoString isEqualToString:@"140"]){
            
            
            [logoColorButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            
        }

        
        secondColorNameString = [logoColorButtonArray objectAtIndex:1];
        //secondColorNameString.frame=logoColorButton2.frame;
        
        
        logoColor2String = [logoColorNameArray objectAtIndex:1];
        NSLog(@"logoColor2String%@",logoColor2String);

        
        secondColorNameString.hidden=YES;
        
    }
    
    if (3 <= logoColorCount){
        
        NSString*thirdColorString=[logoColorArray objectAtIndex:2];
        UIImage*thirdColorImage = [UIImage imageNamed:thirdColorString];
        [logoColorButton3 setBackgroundImage:thirdColorImage forState:UIControlStateNormal];
        
        NSString*thirdColorNoString = [logoColorNumberArray objectAtIndex:2];
        [logoColorButton3 setTitle:thirdColorNoString forState:UIControlStateNormal];
        [logoColorButton3.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        
        if([thirdColorNoString isEqualToString:@"140"]){
            
            
            [logoColorButton3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            
        }
        
        thirdColorNameString = [logoColorButtonArray objectAtIndex:2];
        thirdColorNameString.frame=logoColorButton3.frame;
        
        logoColor3String = [logoColorNameArray objectAtIndex:2];
        NSLog(@"logoColor3String%@",logoColor3String);

        
        thirdColorNameString.hidden=YES;
    }
    
    if (4 <= logoColorCount){
        
        NSString*fourthColorString=[logoColorArray objectAtIndex:3];
        UIImage*fourthColorImage = [UIImage imageNamed:fourthColorString];
        [logoColorButton4 setBackgroundImage:fourthColorImage forState:UIControlStateNormal];
        
        NSString*fourthColorNoString = [logoColorNumberArray objectAtIndex:3];
        [logoColorButton4 setTitle:fourthColorNoString forState:UIControlStateNormal];
        [logoColorButton4.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        
        if([fourthColorNoString isEqualToString:@"140"]){
            
            
            [logoColorButton4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            
        }
        
        fourthColorNameString = [logoColorButtonArray objectAtIndex:3];
        //fourthColorNameString.frame=logoColorButton4.frame;
        
        logoColor4String = [logoColorNameArray objectAtIndex:3];
        NSLog(@"logoColor2String%@",logoColor4String);

        
        fourthColorNameString.hidden=YES;
    }
    
    if (5 <= logoColorCount){
        
        NSString*fifthColorString=[logoColorArray objectAtIndex:4];
        UIImage*fifthColorImage = [UIImage imageNamed:fifthColorString];
        [logoColorButton5 setBackgroundImage:fifthColorImage forState:UIControlStateNormal];
        
        NSString*fifthColorNoString = [logoColorNumberArray objectAtIndex:4];
        [logoColorButton5 setTitle:fifthColorNoString forState:UIControlStateNormal];
        [logoColorButton5.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        
        if([fifthColorNoString isEqualToString:@"140"]){
            
            
            [logoColorButton5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            
        }
        
        fifthColorNameString = [logoColorButtonArray objectAtIndex:4];
        fifthColorNameString.frame=logoColorButton5.frame;
        
        
        logoColor5String = [logoColorNameArray objectAtIndex:4];
        NSLog(@"logoColor5String%@",logoColor5String);

        
        fifthColorNameString.hidden=YES;
        
    }
    
    if (6 <= logoColorCount){
        
        NSString*sixthColorString=[logoColorArray objectAtIndex:5];
        UIImage*sixthColorImage = [UIImage imageNamed:sixthColorString];
        [logoColorButton6 setBackgroundImage:sixthColorImage forState:UIControlStateNormal];
        
        
        NSString*sixthColorNoString = [logoColorNumberArray objectAtIndex:5];
        [logoColorButton6 setTitle:sixthColorNoString forState:UIControlStateNormal];
        [logoColorButton6.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        
        sixthColorNameString = [logoColorButtonArray objectAtIndex:5];
        sixthColorNameString.frame=logoColorButton6.frame;
        
        if([sixthColorNoString isEqualToString:@"140"]){
            
            
            [logoColorButton6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            
        }
        
        logoColor6String = [logoColorNameArray objectAtIndex:5];
        NSLog(@"logoColor6String%@",logoColor6String);

        
        sixthColorNameString.hidden=YES;
        
    }
    
    if (7 <= logoColorCount){
        
        NSString*seventhColorString=[logoColorArray objectAtIndex:6];
        UIImage*seventhColorImage = [UIImage imageNamed:seventhColorString];
        [logoColorButton7 setBackgroundImage:seventhColorImage forState:UIControlStateNormal];
        
        NSString*seventhColorNoString = [logoColorNumberArray objectAtIndex:6];
        [logoColorButton7 setTitle:seventhColorNoString forState:UIControlStateNormal];
        [logoColorButton7.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        
        
        if([seventhColorNoString isEqualToString:@"140"]){
            
            
            [logoColorButton7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            
        }
        
        seventhColorNameString = [logoColorButtonArray objectAtIndex:6];
        seventhColorNameString.frame=logoColorButton7.frame;
        
        logoColor7String = [logoColorNameArray objectAtIndex:6];
        NSLog(@"logoColor7String%@",logoColor7String);

        
        seventhColorNameString.hidden=YES;
        
        
        
    }
    
    if (8 == logoColorCount){
        
        NSString*eighthColorString=[logoColorArray objectAtIndex:7];
        UIImage*eighthColorImage = [UIImage imageNamed:eighthColorString];
        [_logoColorButton8 setBackgroundImage:eighthColorImage forState:UIControlStateNormal];
        
        NSString*eighthColorNoString = [logoColorNumberArray objectAtIndex:7];
        [_logoColorButton8 setTitle:eighthColorNoString forState:UIControlStateNormal];
        [_logoColorButton8 setTitle:eighthColorNoString forState:UIControlStateNormal];
        
    }

    
    matColorString= [NSString stringWithFormat:@"%@,%@,%@,%@,%@,%@,%@", logoColor1String, logoColor2String, logoColor3String, logoColor4String, logoColor5String, logoColor6String,logoColor7String];
    
    
    NSLog(@"matColorString pass%@",matColorString);

    
    self.decorativeTestFields = [NSMutableArray new];
    
    portraitImageView.hidden=YES;
    [self.fontPicker removeFromSuperview];
    //self.tapGestureRecognizer.delegate = self;
    colorButtonHideView.hidden=YES;
    
    // List all fonts on iPhone
    familyNamesArray = [[NSArray alloc] initWithArray:[UIFont familyNames]];
    NSArray *fontNames;
    NSInteger indFamily, indFont;
    for (indFamily=0; indFamily<[familyNamesArray count]; ++indFamily)
    {
        NSLog(@"Family name: %@", [familyNamesArray objectAtIndex:indFamily]);
        fontNames = [[NSArray alloc] initWithArray:
                     [UIFont fontNamesForFamilyName:
                      [familyNamesArray objectAtIndex:indFamily]]];
        for (indFont=0; indFont<[fontNames count]; ++indFont)
        {
            NSLog(@"    Font name: %@", [fontNames objectAtIndex:indFont]);
        }
        
        
        
       
    }
    
    
    pickerViewFontArray=fontNames;
    
    
    
     colorNamesImagesArray =@[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Steel Blue_121.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Suede50_123.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"White50_140.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Rose50_119.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Royal Blue50_107.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Sandalwood50_120.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Silver50_116"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Orange50_127.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Purple50_105.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Red50_112.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Gold50_109.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Grey50_115.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Light Blue50_106.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Navy50_118.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Emerald Green50_110.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Forest Green50_117.jpg"] ],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Cranberry50_114.jpg"] ],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Dark Gold50_103.jpg"] ],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Charcoal50_101.jpg"] ],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Chocolate50_111.jpg"] ],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Clay50_126.jpg"] ],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Black50_108.jpg"] ],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Brown50_102.jpg"] ],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Burgundy50_100.jpg"] ],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Aquamarine50_130.jpg"] ],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Turquoise50_104.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Yellow50_128.jpg"]]];
                  
    
    
    colorNamesArray =[[NSMutableArray alloc]init];
                 [colorNamesArray addObject:@"Steel Blue_121.jpg"],
                 [colorNamesArray addObject:@"Suede_123.jpg"],
                 [colorNamesArray addObject:@"White_140.jpg"],
                 [colorNamesArray addObject:@"Rose_119.jpg"],
                 [colorNamesArray addObject:@"Royal Blue_107.jpg"],
                 [colorNamesArray addObject:@"Sandalwood_120.jpg"],
                 [colorNamesArray addObject:@"Silver_116"],
                 [colorNamesArray addObject:@"Orange_127.jpg"],
                 [colorNamesArray addObject:@"Purple_105.jpg"],
                 [colorNamesArray addObject:@"Red_112.jpg"],
                 [colorNamesArray addObject:@"Gold_109.jpg"],
                 [colorNamesArray addObject:@"Grey_115.jpg"],
                 [colorNamesArray addObject:@"Light Blue_106.jpg"],
                 [colorNamesArray addObject:@"Navy_118.jpg"],
                 [colorNamesArray addObject:@"Emerald Green_110.jpg"],
                 [colorNamesArray addObject:@"Forest Green_117.jpg"],
                 [colorNamesArray addObject:@"Cranberry_114.jpg"],
                 [colorNamesArray addObject:@"Dark Gold_103.jpg"],
                 [colorNamesArray addObject:@"Charcoal_101.jpg"],
                 [colorNamesArray addObject:@"Chocolate_111.jpg"],
                 [colorNamesArray addObject:@"Clay_126.jpg"],
                 [colorNamesArray addObject:@"Black_108.jpg"],
                 [colorNamesArray addObject:@"Brown_102.jpg"],
                 [colorNamesArray addObject:@"Burgundy_100.jpg"],
                 [colorNamesArray addObject:@"Aquamarine_130.jpg"],
                 [colorNamesArray addObject:@"Turquoise_104.jpg"],
                [colorNamesArray addObject:@"Yellow_128.jpg"];
    
    
    redArray =[[NSMutableArray alloc]init];
    [redArray addObject:@"99"],
    [redArray addObject:@"166"],
    [redArray addObject:@"255"],
    [redArray addObject:@"255"],
    [redArray addObject:@"0"],
    [redArray addObject:@"223"],
    [redArray addObject:@"193"],
    [redArray addObject:@"255"],
    [redArray addObject:@"147"],
    [redArray addObject:@"252"],
    [redArray addObject:@"255"],
    [redArray addObject:@"193"],
    [redArray addObject:@"89"],
    [redArray addObject:@"0"],
    [redArray addObject:@"0"],
    [redArray addObject:@"40"],
    [redArray addObject:@"175"],
    [redArray addObject:@"255"],
    [redArray addObject:@"117"],
    [redArray addObject:@"170"],
    [redArray addObject:@"192"],
    [redArray addObject:@"0"],
    [redArray addObject:@"123"],
    [redArray addObject:@"164"],
    [redArray addObject:@"157"],
    [redArray addObject:@"0"],
    [redArray addObject:@"234"];
    
    
    greenArray =[[NSMutableArray alloc]init];
    [greenArray addObject:@"102"],
    [greenArray addObject:@"159"],
    [greenArray addObject:@"255"],
    [greenArray addObject:@"163"],
    [greenArray addObject:@"119"],
    [greenArray addObject:@"209"],
    [greenArray addObject:@"198"],
    [greenArray addObject:@"105"],
    [greenArray addObject:@"50"],
    [greenArray addObject:@"76"],
    [greenArray addObject:@"219"],
    [greenArray addObject:@"198"],
    [greenArray addObject:@"214"],
    [greenArray addObject:@"47"],
    [greenArray addObject:@"171"],
    [greenArray addObject:@"114"],
    [greenArray addObject:@"39"],
    [greenArray addObject:@"174"],
    [greenArray addObject:@"120"],
    [greenArray addObject:@"128"],
    [greenArray addObject:@"76"],
    [greenArray addObject:@"0"],
    [greenArray addObject:@"73"],
    [greenArray addObject:@"52"],
    [greenArray addObject:@"231"],
    [greenArray addObject:@"142"],
    [greenArray addObject:@"218"];
    
    blueArray =[[NSMutableArray alloc]init];
    [blueArray addObject:@"106"],
    [blueArray addObject:@"136"],
    [blueArray addObject:@"255"],
    [blueArray addObject:@"181"],
    [blueArray addObject:@"200"],
    [blueArray addObject:@"167"],
    [blueArray addObject:@"200"],
    [blueArray addObject:@"0"],
    [blueArray addObject:@"142"],
    [blueArray addObject:@"2"],
    [blueArray addObject:@"178"],
    [blueArray addObject:@"200"],
    [blueArray addObject:@"230"],
    [blueArray addObject:@"108"],
    [blueArray addObject:@"132"],
    [blueArray addObject:@"79"],
    [blueArray addObject:@"47"],
    [blueArray addObject:@"98"],
    [blueArray addObject:@"123"],
    [blueArray addObject:@"102"],
    [blueArray addObject:@"54"],
    [blueArray addObject:@"0"],
    [blueArray addObject:@"49"],
    [blueArray addObject:@"58"],
    [blueArray addObject:@"215"],
    [blueArray addObject:@"170"],
    [blueArray addObject:@"36"];



    
    
    colorNumbersArray =[[NSMutableArray alloc]init];
    [colorNumbersArray addObject:@"121"],
    [colorNumbersArray addObject:@"123"],
    [colorNumbersArray addObject:@"140"],
    [colorNumbersArray addObject:@"119"],
    [colorNumbersArray addObject:@"107"],
    [colorNumbersArray addObject:@"120"],
    [colorNumbersArray addObject:@"116"],
    [colorNumbersArray addObject:@"127"],
    [colorNumbersArray addObject:@"105"],
    [colorNumbersArray addObject:@"112"],
    [colorNumbersArray addObject:@"109"],
    [colorNumbersArray addObject:@"115"],
    [colorNumbersArray addObject:@"106"],
    [colorNumbersArray addObject:@"118"],
    [colorNumbersArray addObject:@"110"],
    [colorNumbersArray addObject:@"117"],
    [colorNumbersArray addObject:@"114"],
    [colorNumbersArray addObject:@"103"],
    [colorNumbersArray addObject:@"101"],
    [colorNumbersArray addObject:@"111"],
    [colorNumbersArray addObject:@"126"],
    [colorNumbersArray addObject:@"108"],
    [colorNumbersArray addObject:@"102"],
    [colorNumbersArray addObject:@"100"],
    [colorNumbersArray addObject:@"130"],
    [colorNumbersArray addObject:@"104"],
    [colorNumbersArray addObject:@"128"];

    
    fontSizeArray =[[NSMutableArray alloc]init];
    [fontSizeArray addObject:@"12.0"],
    [fontSizeArray addObject:@"14.0"],
    [fontSizeArray addObject:@"16.0"],
    [fontSizeArray addObject:@"18.0"],
    [fontSizeArray addObject:@"24.0"],
    [fontSizeArray addObject:@"36.0"],
    [fontSizeArray addObject:@"75.0"],
    [fontSizeArray addObject:@"110.0"],
    [fontSizeArray addObject:@"430.0"];

    
    
    
    //Declare colorPicker Array
    
    
    // Add some data for demo purposes.
   /* [pickerViewFontArray addObject:@"AmericanTypewriter"];
    [pickerViewFontArray addObject:@"Two"];
    [pickerViewFontArray addObject:@"Three"];
    [pickerViewFontArray addObject:@"Four"];
    [pickerViewFontArray addObject:@"Five"];*/
    
    
    
    
    /*textEditor.fontPicker.fontList = @[ @"AmericanTypewriter", @"Baskerville",
                                        @"Copperplate", @"Didot", @"EuphemiaUCAS", @"Futura-Medium", @"GillSans",
                                        @"Helvetica", @"Marion-Regular", @"Optima-Regular", @"Palatino-Roman",
                                        @"TimesNewRomanPSMT", @"Verdana"];*/
    
    //crashes code
    //[fontPicker setDataSource: self];
    
    
    // Set the picker's frame. We set the y coordinate to 50px.
    //[pickerView setFrame: CGRectMake(xPoint, 50.0f, pickerWidth, 200.0f)];
    
    // Before we add the picker view to our view, let's do a couple more
    // things. First, let the selection indicator (that line inside the
    // picker view that highlights your selection) to be shown.
    fontPicker.showsSelectionIndicator = YES;
    
    //fontPicker.hidden=YES;
    //_colorPicker.hidden=YES;
    
    
    
    
    
    if([orientString isEqualToString:@"landscape"])
    {
        //portraitImageView.hidden=YES;
        //landscapeImageView.hidden=NO;
        textOrientField.text =@"Portrait";
        
    }
    
    if([orientString isEqualToString:@"portrait"])
    {
        //portraitImageView.hidden=NO;
        //landscapeImageView.hidden=YES;
         textOrientField.text =@"Landscape";

        
    } else {
        textOrientField.text =@"";
        //portraitImageView.hidden=YES;
        //landscapeImageView.hidden=YES;
    }
    
    if ([sizeString isEqualToString:@"2'x3'"])
    {
        size2by3View.hidden=NO;
        size3by5View.hidden=YES;
        size4by6View.hidden=YES;
        size3by10View.hidden=YES;
    }
    
    if ([sizeString isEqualToString:@"3'x5'"])
    {
        size2by3View.hidden=YES;
        size3by5View.hidden=NO;
        size4by6View.hidden=YES;
        size3by10View.hidden=YES;
    }
    if ([sizeString isEqualToString:@"4'x6'"])
    {
        size2by3View.hidden=YES;
        size3by5View.hidden=YES;
        size4by6View.hidden=NO;
        size3by10View.hidden=YES;
    }
    
    if ([sizeString isEqualToString:@"3'x10'"])
    {
        size2by3View.hidden=YES;
        size3by5View.hidden=YES;
        size4by6View.hidden=YES;
        size3by10View.hidden=NO;
    }
    else {
        
        size2by3View.hidden=YES;
        size3by5View.hidden=YES;
        size4by6View.hidden=YES;
        size3by10View.hidden=YES;
        
    }

    
    //[activityIndicator stopAnimating];
    matView1.hidden= YES;
   
    searchField.textAlignment = NSTextAlignmentCenter;
    
    
    [_widthField addTarget:self
                   action:@selector(sizeFieldUpdate:)
         forControlEvents:UIControlEventEditingChanged];
    
    [_heightField addTarget:self
                    action:@selector(sizeFieldUpdate:)
          forControlEvents:UIControlEventEditingChanged];

    
    //textOrientField.hidden= YES;
    
    
    _widthField.text = @"3'";
    _widthCircleField.text = @"3'";
    
    _heightField.text = @"5'";
    _heightCircleField.text = @"5'";
    
    
    CGRect myLogoMatRect = CGRectMake( 476.0f, 200.0f, 500.0f, 300.0f);
    
    matBGLogoView.frame=myLogoMatRect;
    matBGLogoView.ContentMode=  UIViewContentModeScaleAspectFit;

    
    //NSLog(@"matColorString %@",_matColorString);
    //NSLog(@"logoColorString %@",_logoColorString);
    
   /* NSLog(@"nameStringHere %@",nameString);
    NSLog(@"sellerStringHere %@",sellerString);
    NSLog(@"companyStringHere %@",companyString);
    NSLog(@"numberStringHere %@",numberString);
    NSLog(@"interactiveHeaderString %@",interactiveHeaderString);*/

    
    if(nameString!=NULL){
        NSLog(@"nameString %@",nameString);
        nameField.text =nameString;
        
    }else{
        
        nameField.text =@"";
    }
    //check if NSNULL CLASS
     NSLog(@"sellerString %@",sellerString);
    if(sellerString!=nil ){
        
        NSLog(@"sellerString %@",sellerString);
        sellerField.text =sellerString;
        
    }else {
        
        sellerField.text =@" ";

        
    }
    
    if(companyString!=NULL){
        
        NSLog(@"sellerString %@",sellerString);
        companyField.text =companyString;
        
    }else{
        
        companyField.text =@"";
        
    }
    
    if(numberString!=NULL){
       
        
        numberField.text =numberString;
        
    }else{
        
        numberField.text =@"";
    }
    
    if(interactiveHeaderString!=NULL){
    
        headerLabel.text= interactiveHeaderString;
        
    } else{
        
        headerLabel.text =@"Create Mat";
    }
    
    

    
   
    
    
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scale:)] ;
	[pinchRecognizer setDelegate:self];
	[self.logoPicButton addGestureRecognizer:pinchRecognizer];
    
    UIPinchGestureRecognizer *pinchRecognizerDec = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scaleDec:)] ;
	[pinchRecognizerDec setDelegate:self];
	[self.textDecField addGestureRecognizer:pinchRecognizerDec];
    
   
    
    [steelBlueButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [steelBlueButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
   /* UILongPressGestureRecognizer *gestureRecognizer1 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress1:)];
    steelBlueButton.userInteractionEnabled = YES;
    gestureRecognizer1.minimumPressDuration = 0.3;
    gestureRecognizer1.delegate = self;
    gestureRecognizer1.numberOfTouchesRequired = 1;
    [steelBlueButton addGestureRecognizer:gestureRecognizer1];*/
    
    steelBlueButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    steelBlueButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    steelBlueButton.layer.shadowOpacity = 1.00f;
    steelBlueButton.layer.shadowRadius = 3.0f;
    
    
    [_suedeButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_suedeButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _suedeButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _suedeButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _suedeButton.layer.shadowOpacity = 1.00f;
    _suedeButton.layer.shadowRadius = 3.0f;
    
    [_whiteButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_whiteButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _whiteButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _whiteButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _whiteButton.layer.shadowOpacity = 1.00f;
    _whiteButton.layer.shadowRadius = 3.0f;
    
    [_roseButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_roseButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _roseButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _roseButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _roseButton.layer.shadowOpacity = 1.00f;
    _roseButton.layer.shadowRadius = 3.0f;
    
    [_royalBlueButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_royalBlueButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _royalBlueButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _royalBlueButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _royalBlueButton.layer.shadowOpacity = 1.00f;
    _royalBlueButton.layer.shadowRadius = 3.0f;
    
    [_sandalWoodButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_sandalWoodButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _sandalWoodButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _sandalWoodButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _sandalWoodButton.layer.shadowOpacity = 1.00f;
    _sandalWoodButton.layer.shadowRadius = 3.0f;
    
    [_silverButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_silverButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _silverButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _silverButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _silverButton.layer.shadowOpacity = 1.00f;
    _silverButton.layer.shadowRadius = 3.0f;
    
    [_orangeButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_orangeButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _orangeButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _orangeButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _orangeButton.layer.shadowOpacity = 1.00f;
    _orangeButton.layer.shadowRadius = 3.0f;
    
    [_purpleButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_purpleButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _purpleButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _purpleButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _purpleButton.layer.shadowOpacity = 1.00f;
    _purpleButton.layer.shadowRadius = 3.0f;
    
    [_redButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_redButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _redButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _redButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _redButton.layer.shadowOpacity = 1.00f;
    _redButton.layer.shadowRadius = 3.0f;
    
    [_goldButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_goldButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _goldButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _goldButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _goldButton.layer.shadowOpacity = 1.00f;
    _goldButton.layer.shadowRadius = 3.0f;
    
    [_greyButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_greyButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _greyButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _greyButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _greyButton.layer.shadowOpacity = 1.00f;
    _greyButton.layer.shadowRadius = 3.0f;
    
    [_lightBlueButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_lightBlueButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _lightBlueButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _lightBlueButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _lightBlueButton.layer.shadowOpacity = 1.00f;
    _lightBlueButton.layer.shadowRadius = 3.0f;
    
    [_navyButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_navyButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _navyButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _navyButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _navyButton.layer.shadowOpacity = 1.00f;
    _navyButton.layer.shadowRadius = 3.0f;
    
    [_emeraldGreenButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_emeraldGreenButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _emeraldGreenButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _emeraldGreenButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _emeraldGreenButton.layer.shadowOpacity = 1.00f;
    _emeraldGreenButton.layer.shadowRadius = 3.0f;
    
    [_forestGreenButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_forestGreenButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _forestGreenButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _forestGreenButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _forestGreenButton.layer.shadowOpacity = 1.00f;
    _forestGreenButton.layer.shadowRadius = 3.0f;
    
    [_cranberryButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_cranberryButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _cranberryButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _cranberryButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _cranberryButton.layer.shadowOpacity = 1.00f;
    _cranberryButton.layer.shadowRadius = 3.0f;
    
    [_darkGoldButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_darkGoldButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _darkGoldButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _darkGoldButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _darkGoldButton.layer.shadowOpacity = 1.00f;
    _darkGoldButton.layer.shadowRadius = 3.0f;
    
    [_charcoalButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_charcoalButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _charcoalButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _charcoalButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _charcoalButton.layer.shadowOpacity = 1.00f;
    _charcoalButton.layer.shadowRadius = 3.0f;
    
    [_chocolateButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_chocolateButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _chocolateButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _chocolateButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _chocolateButton.layer.shadowOpacity = 1.00f;
    _chocolateButton.layer.shadowRadius = 3.0f;
    
    [_clayButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_clayButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _clayButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _clayButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _clayButton.layer.shadowOpacity = 1.00f;
    _clayButton.layer.shadowRadius = 3.0f;
    
    
    [_blackButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_blackButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _blackButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _blackButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _blackButton.layer.shadowOpacity = 1.00f;
    _blackButton.layer.shadowRadius = 3.0f;
    
    [_brownButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_brownButton  addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _brownButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _brownButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _brownButton.layer.shadowOpacity = 1.00f;
    _brownButton.layer.shadowRadius = 3.0f;
    
    [_burgundyButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_burgundyButton  addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _burgundyButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _burgundyButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _burgundyButton.layer.shadowOpacity = 1.00f;
    _burgundyButton.layer.shadowRadius = 3.0f;
    
    [_aquamarineButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_aquamarineButton  addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _aquamarineButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _aquamarineButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _aquamarineButton.layer.shadowOpacity = 1.00f;
    _aquamarineButton.layer.shadowRadius = 3.0f;
    
    [_turquoiseButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_turquoiseButton  addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _turquoiseButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _turquoiseButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _turquoiseButton.layer.shadowOpacity = 1.00f;
    _turquoiseButton.layer.shadowRadius = 3.0f;
    
    [_yellowButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_yellowButton  addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _yellowButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _yellowButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _yellowButton.layer.shadowOpacity = 1.00f;
    _yellowButton.layer.shadowRadius = 3.0f;
    
    
    if([interactiveHeaderString isEqualToString:@"Create Mat"]){
        
        _emailString=@"A New Sketch Request";
        
         matView1.hidden= YES;
        
        NSArray *directoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString *imagePath =  [directoryPath objectAtIndex:0];
        imagePath= [imagePath stringByAppendingPathComponent:@"logoImage.png"];
        
        
        NSData *data = [NSData dataWithContentsOfFile:imagePath];
        UIImage *logoImage = [UIImage imageWithData:data];
        
        //[logoPicButton setBackgroundImage:selectedImage forState:UIControlStateNormal];
        //NSLog(@"logoUseStringSendInteractive %@",_logoUseStringHere);
        
        if (imagePath == Nil){
            
            
            UIImage *image = [UIImage imageNamed:@"JadeTeaHouseLogo.png"];
            [logoPicButton setImage:image forState:UIControlStateNormal];
        }
        
        else {
            
            
            
            //[[self.logoPicButton imageView] setContentMode: UIViewContentModeScaleAspectFit];
            //[self.logoPicButton setBackgroundImage:logoImage forState:UIControlStateNormal];
            
            [[self.logoPicButton imageView] setContentMode: UIViewContentModeScaleAspectFit];
            [self.logoPicButton setImage:logoImage forState:UIControlStateNormal];
            
            
            
        }

        
        /*UIImage*whiteImage = [UIImage imageNamed:@"white_140.jpg"];
        [_logoColorButton1 setBackgroundImage:whiteImage forState:UIControlStateNormal];
        [_logoColorButton2 setBackgroundImage:whiteImage forState:UIControlStateNormal];
        [_logoColorButton3 setBackgroundImage:whiteImage forState:UIControlStateNormal];
        [_logoColorButton4 setBackgroundImage:whiteImage forState:UIControlStateNormal];
        [_logoColorButton5 setBackgroundImage:whiteImage forState:UIControlStateNormal];
        [_logoColorButton6 setBackgroundImage:whiteImage forState:UIControlStateNormal];
        [_logoColorButton7 setBackgroundImage:whiteImage forState:UIControlStateNormal];*/
        
       /* NSString*emptyString = @" ";
        [_logoColorButton1 setTitle:emptyString forState:UIControlStateNormal];
        [_logoColorButton2 setTitle:emptyString forState:UIControlStateNormal];
        [_logoColorButton3 setTitle:emptyString forState:UIControlStateNormal];
        [_logoColorButton4 setTitle:emptyString forState:UIControlStateNormal];
        [_logoColorButton5 setTitle:emptyString forState:UIControlStateNormal];
        [_logoColorButton6 setTitle:emptyString forState:UIControlStateNormal];
        [_logoColorButton7 setTitle:emptyString forState:UIControlStateNormal];*/
        
        
        [self.logoColorButton1 reloadInputViews];
        [self.logoColorButton2 reloadInputViews];
        [self.logoColorButton3 reloadInputViews];
        [self.logoColorButton4 reloadInputViews];
        [self.logoColorButton5 reloadInputViews];
        [self.logoColorButton6 reloadInputViews];
        [self.logoColorButton7 reloadInputViews];
        
        
    }
   

    
    if([interactiveHeaderString isEqualToString:@"Edit Mat"]){
        
        
        
        
        
        
        
        
        _emailString=@"Mat Variation";
        
        
        
        /*[steelBlueButton setEnabled:NO];
        [_suedeButton setEnabled:NO];
        [_whiteButton setEnabled:NO];
        [_roseButton setEnabled:NO];
        [_royalBlueButton setEnabled:NO];
        [_sandalWoodButton setEnabled:NO];
        [_silverButton setEnabled:NO];
        [_orangeButton setEnabled:NO];
        [_purpleButton setEnabled:NO];
        [_redButton setEnabled:NO];
        [_goldButton setEnabled:NO];
        [_greyButton setEnabled:NO];
        [_lightBlueButton setEnabled:NO];
        [_navyButton setEnabled:NO];
        [_emeraldGreenButton setEnabled:NO];
        [_forestGreenButton setEnabled:NO];
        [_cranberryButton setEnabled:NO];
        [_darkGoldButton setEnabled:NO];
        [_charcoalButton setEnabled:NO];
        [_chocolateButton setEnabled:NO];
        [_clayButton setEnabled:NO];
        [_blackButton setEnabled:NO];
        [_brownButton setEnabled:NO];
        [_burgundyButton setEnabled:NO];
        [_aquamarineButton setEnabled:NO];
        [_turquoiseButton setEnabled:NO];
        [_yellowButton setEnabled:NO];
       

        
        
        
        colorButtonHideView.hidden=NO;*/
        
        
        
        
        if([orientString isEqualToString:@"landscape"])
        {
            textOrientField.text =@"PORTRAIT";
            //portraitImageView.hidden=YES;
            //landscapeImageView.hidden=NO;
            
        }
        
        if([orientString isEqualToString:@"portrait"])
        {
            //portraitImageView.hidden=NO;
            //landscapeImageView.hidden=YES;
             textOrientField.text =@"LANDSCAPE";
            
        }
        
        else {
            textOrientField.text =@"";
            //portraitImageView.hidden=YES;
            //landscapeImageView.hidden=YES;
            
        }

        
        matView1.hidden= NO;
        matBGLogoView.hidden= YES;
        
        //[self.matView addSubview:noteLayerView];
        //[self.matView bringSubviewToFront:noteLayerView];
        [self.matView1 setUserInteractionEnabled:YES];
        [self.matView1 addSubview:noteLayerView];
        
        //NSLog(@"sizeStringHere %@",sizeString);
        
        
       if(sizeString!=NULL){
        
           sizeGetMatString = sizeString;
        
       }else{
           
           sizeGetMatString= @"4'x 6' ";
       }
        
        
        NSRange range = [sizeGetMatString rangeOfString:@"x"];
        
        NSString *widthMatString = [sizeGetMatString substringToIndex:range.location];
        //NSLog(@"%@",widthMatString);
        
        NSString *heightMatString = [sizeGetMatString substringFromIndex:range.location];
        //NSLog(@"%@",heightMatString);
        
        
        NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@"x ,X"];
        NSString *safeHeightMatString = [[heightMatString componentsSeparatedByCharactersInSet:charSet] componentsJoinedByString:@""];
        
        _widthField.text=widthMatString;
        _heightField.text=safeHeightMatString;
        
        _widthCircleField.text=_widthField.text;
        _heightCircleField.text=_heightField.text;
        
        int wMat = [_widthField.text intValue];
        int hMat = [_heightField.text intValue];
        
        int wMatHundred = wMat*100;
        int hMatHundred = hMat*100;
        
        int wMatHundredDivide = wMatHundred/2;
        int hMatHundredDivide = hMatHundred/2;

        
        NSArray *directoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString *imagePath1 =  [directoryPath objectAtIndex:0];
        imagePath1= [imagePath1 stringByAppendingPathComponent:@"matImage.png"];
        
        
        NSData *dataMat = [NSData dataWithContentsOfFile:imagePath1];
        UIImage *matImage = [UIImage imageWithData:dataMat];
        
        //UIImageView* matView=[[UIImageView alloc]initWithImage:matImage];
        //matView1=[[UIImageView alloc]initWithImage:matImage];
        matView1.image = matImage;
        CGRect myMatRect = CGRectMake( 426.0f, 121.0f, 600.0f, 400.0f);
        
        matView1.frame=myMatRect;
        matView1.ContentMode=  UIViewContentModeScaleAspectFit;
        
        [self.view addSubview:snapshotView];
       // [self.view addSubview:matView1];
        
        
        
        
        //add logo colors fot the mats
      /*  if (matColorArray == nil)
        {
            matColorArray = [[NSMutableArray alloc] init];
        }
        
        //NSLog(@"matColorArray %@",matColorArray);
        
        
        if (matColorNumberArray == nil)
        {
            matColorNumberArray = [[NSMutableArray alloc] init];
        }
        
        
        
        
        
        NSString *string = matColorString;
        if ([string rangeOfString:@"108-Black"].location == NSNotFound) {
            //NSLog(@"string does not contain bla");
            
            
            
        } else {
            //NSLog(@"black Found!");
            
            [matColorArray addObject:@"Black_108.jpg"];
            [matColorNameArray addObject:@"BlackButton"];
            [matColorNumberArray addObject:@"108"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"121-Steel Blue"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Steel Blue_121.jpg"];
            [matNameArray addObject:@"SteelBlueButton"];
            [matColorNumberArray addObject:@"121"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"123-Suede"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Suede_123.jpg"];
            [matColorNameArray addObject:@"SuedeButton"];
            [matColorNumberArray addObject:@"123"];
            
        }
        
        if ([string rangeOfString:@"140-White"].location == NSNotFound) {
            
            NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"White_140.jpg"];
            [matColorNameArray addObject:@"WhiteButton"];
            [matColorNumberArray addObject:@"140"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"119-Rose"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Rose_119.jpg"];
            [matColorNameArray addObject:@"RoseButton"];
            [matColorNumberArray addObject:@"119"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"107-Royal Blue"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Royal Blue_107.jpg"];
            [matColorNameArray addObject:@"RoyalBlueButton"];
            [matColorNumberArray addObject:@"107"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"120-Sandalwood"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Sandalwood_120.jpg"];
            [matColorNameArray addObject:@"SandalwoodButton"];
            [matColorNumberArray addObject:@"120"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"116-Silver"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Silver_116.jpg"];
            [matColorNameArray addObject:@"SilverButton"];
            [matColorNumberArray addObject:@"116"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"127-Orange"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Orange_127.jpg"];
            [matColorNameArray addObject:@"OrangeButton"];
            [matColorNumberArray addObject:@"127"];
            
            
        }
        
        if ([string rangeOfString:@"105-Purple"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Purple_105.jpg"];
            [matColorNameArray addObject:@"PurpleButton"];
            [matColorNumberArray addObject:@"105"];
            
            
            
        }
        
        if ([string rangeOfString:@"112-Red"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Red_112.jpg"];
            [matColorNameArray addObject:@"RedButton"];
            [matColorNumberArray addObject:@"112"];
            
            
        }
        
        if ([string rangeOfString:@"109-Gold"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Gold_109.jpg"];
            [matColorNameArray addObject:@"GoldButton"];
            [matColorNumberArray addObject:@"109"];
            
            
        }
        
        if ([string rangeOfString:@"115-Grey"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Grey_115.jpg"];
            [matColorNameArray addObject:@"GreyButton"];
            [matColorNumberArray addObject:@"115"];
        }
        
        if ([string rangeOfString:@"106-Light Blue"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Light Blue_106.jpg"];
            [matColorNameArray addObject:@"LightBlueButton"];
            [matColorNumberArray addObject:@"106"];
            
            
        }
        
        if ([string rangeOfString:@"118-Navy"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Navy_118.jpg"];
            [matColorNameArray addObject:@"NavyButton"];
            [matColorNumberArray addObject:@"118"];
            
        }
        
        if ([string rangeOfString:@"110-Emerald Green"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Emerald Green_110.jpg"];
            [matColorNameArray addObject:@"EmeraldGreenButton"];
            [matColorNumberArray addObject:@"110"];
        }
        
        if ([string rangeOfString:@"117-Forest Green"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Forest Green_117.jpg"];
            [matColorNameArray addObject:@"ForestGreenButton"];
            [matColorNumberArray addObject:@"117"];
        }
        
        if ([string rangeOfString:@"114-Cranberry"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Cranberry_114.jpg"];
            [matColorNameArray addObject:@"CranberryButton"];
            [matColorNumberArray addObject:@"114"];
            
        }
        
        if ([string rangeOfString:@"103-Dark Gold"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Dark Gold_103.jpg"];
            [matColorNameArray addObject:@"DarkGoldButton"];
            [matColorNumberArray addObject:@"103"];
            
        }
        
        if ([string rangeOfString:@"101-Charcoal"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Charcoal_101.jpg"];
            [matColorNameArray addObject:@"CharcoalButton"];
            [matColorNumberArray addObject:@"101"];
            
        }
        
        if ([string rangeOfString:@"111-Chocolate"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Chocolate_111.jpg"];
            [matColorNameArray addObject:@"ChocolateButton"];
            [matColorNumberArray addObject:@"111"];
            
        }
        
        if ([string rangeOfString:@"126-Clay"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Clay_126.jpg"];
            [matColorNameArray addObject:@"ClayButton"];
            [matColorNumberArray addObject:@"126"];
            
        }
        
        if ([string rangeOfString:@"102-Brown"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Brown_102.jpg"];
            [matColorNameArray addObject:@"BrownButton"];
            [matColorNumberArray addObject:@"102"];
            
        }
        
        if ([string rangeOfString:@"100-Burgundy"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Burgundy_100.jpg"];
            [matColorNameArray addObject:@"BurgundyButton"];
            [matColorNumberArray addObject:@"100"];
            
        }
        
        if ([string rangeOfString:@"130-Aquamarine"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Aquamarine_130.jpg"];
            [matColorNameArray addObject:@"AquamarineButton"];
            [matColorNumberArray addObject:@"130"];
            
        }
        
        if ([string rangeOfString:@"104-Turquoise"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Turquoise_104.jpg"];
            [matColorNameArray addObject:@"TurquoiseButton"];
            [matColorNumberArray addObject:@"104"];
            
            
        }
        
        if ([string rangeOfString:@"128-Yellow"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Yellow_128.jpg"];
            [matColorNameArray addObject:@"YellowButton"];
            [matColorNumberArray addObject:@"128"];
            
            
        }
        
        
        
        
        
        
        
        
        int matColorCount= matColorArray.count;
        
        
       

        
        
        if (1 <= matColorCount){
            
            
            
            
            NSString*firstColorString = [matColorArray objectAtIndex:0];
            UIImage*firstColorImage = [UIImage imageNamed:firstColorString];
            [logoColorButton1 setBackgroundImage:firstColorImage forState:UIControlStateNormal];
            
            NSString*firstColorNoString = [matColorNumberArray objectAtIndex:0];
            [logoColorButton1 setTitle:firstColorNoString forState:UIControlStateNormal];
            [logoColorButton1.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
            
            UIButton*firstColorNameString=[matColorNameArray objectAtIndex:0];
            firstColorNameString.frame=logoColorButton1.frame;
            
            [logoColorButton1 setNeedsDisplay];
        }
        
        if (2 <= matColorCount){
            
            NSString*secondColorString = [matColorArray objectAtIndex:1];
            UIImage*secondColorImage = [UIImage imageNamed:secondColorString];
            [logoColorButton2 setBackgroundImage:secondColorImage forState:UIControlStateNormal];
            
            [logoColorButton2.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
            NSString*secondColorNoString = [matColorNumberArray objectAtIndex:1];
            NSLog(@"secondColorNoString %@", secondColorNoString);
            [logoColorButton2 setTitle:secondColorNoString forState:UIControlStateNormal];
            
            UIButton*secondColorNameString=[matColorNameArray objectAtIndex:1];
            secondColorNameString.frame=logoColorButton2.frame;
            
        }
        
        if (3 <= matColorCount){
            
            NSString*thirdColorString=[matColorArray objectAtIndex:2];
            UIImage*thirdColorImage = [UIImage imageNamed:thirdColorString];
            [logoColorButton3 setBackgroundImage:thirdColorImage forState:UIControlStateNormal];
            [logoColorButton3.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
            NSString*thirdColorNoString = [matColorNumberArray objectAtIndex:2];
            [logoColorButton3 setTitle:thirdColorNoString forState:UIControlStateNormal];
            
            UIButton*thirdColorNameString=[matColorNameArray objectAtIndex:2];
            thirdColorNameString.frame=logoColorButton3.frame;
            
            
        }
        
        if (4 <= matColorCount){
            
            NSString*fourthColorString=[matColorArray objectAtIndex:3];
            UIImage*fourthColorImage = [UIImage imageNamed:fourthColorString];
            [logoColorButton4 setBackgroundImage:fourthColorImage forState:UIControlStateNormal];
            [logoColorButton4.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
            
            NSString*fourthColorNoString = [matColorNumberArray objectAtIndex:3];
            [logoColorButton4 setTitle:fourthColorNoString forState:UIControlStateNormal];
            
            UIButton*fourthColorNameString=[matColorNameArray objectAtIndex:3];
            fourthColorNameString.frame=logoColorButton4.frame;
            
            
        }
        
        if (5 <= matColorCount){
            
            NSString*fifthColorString=[matColorArray objectAtIndex:4];
            UIImage*fifthColorImage = [UIImage imageNamed:fifthColorString];
            [logoColorButton5 setBackgroundImage:fifthColorImage forState:UIControlStateNormal];
             [logoColorButton5.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
            NSString*fifthColorNoString = [matColorNumberArray objectAtIndex:4];
            [logoColorButton5 setTitle:fifthColorNoString forState:UIControlStateNormal];
            
            UIButton*fifthColorNameString=[matColorNameArray objectAtIndex:4];
            fifthColorNameString.frame=logoColorButton5.frame;
            
            
        }
        
        if (6 <= matColorCount){
            
            NSString*sixthColorString=[matColorArray objectAtIndex:5];
            UIImage*sixthColorImage = [UIImage imageNamed:sixthColorString];
            [logoColorButton6 setBackgroundImage:sixthColorImage forState:UIControlStateNormal];
            [logoColorButton6.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
            
            NSString*sixthColorNoString = [matColorNumberArray objectAtIndex:5];
            [logoColorButton6 setTitle:sixthColorNoString forState:UIControlStateNormal];
            
            UIButton*sixthColorNameString=[matColorNameArray objectAtIndex:5];
            sixthColorNameString.frame=logoColorButton6.frame;
            
            
        }
        
        if (7 <= matColorCount){
            
            NSString*seventhColorString=[matColorArray objectAtIndex:6];
            UIImage*seventhColorImage = [UIImage imageNamed:seventhColorString];
            [logoColorButton7 setBackgroundImage:seventhColorImage forState:UIControlStateNormal];
            [logoColorButton7.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
            NSString*seventhColorNoString = [matColorNumberArray objectAtIndex:6];
            [logoColorButton7 setTitle:seventhColorNoString forState:UIControlStateNormal];
            
            UIButton*seventhColorNameString=[matColorNameArray objectAtIndex:6];
            seventhColorNameString.frame=logoColorButton7.frame;
            
            
        }
        
        if (8 == matColorCount){
            
            NSString*eighthColorString=[matColorArray objectAtIndex:7];
            UIImage*eighthColorImage = [UIImage imageNamed:eighthColorString];
            [_logoColorButton8 setBackgroundImage:eighthColorImage forState:UIControlStateNormal];
             [_logoColorButton8.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
            NSString*eighthColorNoString = [matColorNumberArray objectAtIndex:7];
            [_logoColorButton8 setTitle:eighthColorNoString forState:UIControlStateNormal];
            
        }*/
   
        
        
        
        
        
    

    
        
       
     
    }
    
    
    //What is this for should not hit this!!!
    //create logo size
    if ([interactiveHeaderString isEqualToString:@"Logo Selected"])
    
    {
        colorButtonHideView.hidden=YES;
        
        
        
        if([orientString isEqualToString:@"landscape"])
        {
            //portraitImageView.hidden=YES;
            //landscapeImageView.hidden=NO;
            textOrientField.text =@"PORTRAIT";
            
        }
        
        if([orientString isEqualToString:@"portrait"])
        {
            //portraitImageView.hidden=NO;
            //landscapeImageView.hidden=YES;
            textOrientField.text= @"LANDSCAPE";
        }
        
        else {
            
            //portraitImageView.hidden=YES;
            //landscapeImageView.hidden=YES;
            textOrientField.text= @"LANDSCAPE";
        }

        matView1.hidden= YES;
        matBGLogoView.hidden= NO;
        
        //sizeString = @"3 X 5";
        if (sizeString!=NULL){
       
            
            //NSLog(@"sizeStringHere %@",sizeString);
        
            NSString *sizeGetMatLogoString = sizeString;
            NSRange range = [sizeGetMatLogoString rangeOfString:@"x"];
        
            NSString *widthLogoMatString = [sizeGetMatLogoString substringToIndex:range.location];
            //NSLog(@"%@",widthLogoMatString);
        
            NSString *heightLogoMatString = [sizeGetMatLogoString substringFromIndex:range.location];
            //NSLog(@"%@",heightLogoMatString);
        
        
            NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@"x ,X"];
            NSString *safeHeightLogoMatString = [[heightLogoMatString componentsSeparatedByCharactersInSet:charSet] componentsJoinedByString:@""];
        
            _widthField.text=widthLogoMatString;
            _heightField.text=safeHeightLogoMatString;
        
            _widthCircleField.text=_widthField.text;
            _heightCircleField.text=_heightField.text;
        
            int wLogoMat = [_widthField.text intValue];
            int hLogoMat = [_heightField.text intValue];
        
            int wLogoMatHundred = wLogoMat*100;
            int hLogoMatHundred = hLogoMat*100;
        
        /*int wLogoMatHundredDivide = wLogoMatHundred/2;
        int hLogoMatHundredDivide = hLogoMatHundred/2;*/
        
        //UIImageView* matView=[[UIImageView alloc]initWithImage:matImage];
        //CGRect myLogoMatRect = CGRectMake( 426.0f, 121.0f, 600.0f, 400.0f);
            
            CGRect myLogoMatRect = CGRectMake( 426.0f, 121.0f, wLogoMatHundred, hLogoMatHundred);
        
            matBGLogoView.frame=myLogoMatRect;
            matBGLogoView.ContentMode=  UIViewContentModeScaleAspectFit;
            //UIViewContentModeScaleAspectFit
            
            UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scale:)] ;
            [pinchRecognizer setDelegate:self];
            [self.logoPicButton addGestureRecognizer:pinchRecognizer];
        
        }
        
        //[self.view addSubview:matBGLogoView];


        
        
        NSArray *directoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString *imagePath =  [directoryPath objectAtIndex:0];
        imagePath= [imagePath stringByAppendingPathComponent:@"logoImage.png"];
        
        
        NSData *data = [NSData dataWithContentsOfFile:imagePath];
        UIImage *logoImage = [UIImage imageWithData:data];
        
        //[logoPicButton setBackgroundImage:selectedImage forState:UIControlStateNormal];
        NSLog(@"logoUseStringSendInteractive %@",_logoUseStringHere);
        
        if (imagePath == Nil){
            
            
            UIImage *image = [UIImage imageNamed:@"JadeTeaHouseLogo.png"];
            //[logoPicButton setImage:image forState:UIControlStateNormal];
            
            [[self.logoPicButton imageView] setContentMode: UIViewContentModeScaleAspectFit];
            [self.logoPicButton setImage:logoImage forState:UIControlStateNormal];

        }
        
        else {
            
            
            
            //[[self.logoPicButton imageView] setContentMode: UIViewContentModeScaleAspectFit];
            //[self.logoPicButton setBackgroundImage:logoImage forState:UIControlStateNormal];
            
            [[self.logoPicButton imageView] setContentMode: UIViewContentModeScaleAspectFit];
            [self.logoPicButton setImage:logoImage forState:UIControlStateNormal];

            
            
            
        }

        
     
    
            
       
    matButton.hidden =NO;
    logoButton.hidden= NO;
    titleLabel.hidden =NO;
    homeButton.hidden =NO;
    titleBar.hidden =NO;
    
    
   
    
        
   
        
    }
    
}


- (void)didSetNameString:(NSString *)nameString{
    
    nameField.text =nameString;
    
}

- (void)didSetCompanyString:(NSString *)companyString{
    
    nameField.text =nameString;
    
}


/*- (void)setString:(NSString *)string
{
    

    [self.delegate setString:string];
    [self.delegate setString:_logoUseStringHere];
    [self.delegate setString:nameString];
    nameField.text =nameString;
    
   

}*/

    


//hits this
#pragma mark - DIYMenuDelegate
//Item selected on menu
/*- (void)menuItemSelected:(NSString *)action
{
    
     //[DIYMenu addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
    
    _actionSelectedString=action;
    NSLog(@"menuItemSelected");
    
    if ([action isEqualToString:@"transparent"])
    {
        _actionSelectedString=action;
        
    }
    
    else if ([action isEqualToString:@"pics"])
    {
        _actionSelectedString=action;
        
        
        UIStoryboard *storyboardLogo = self.storyboard;
        ImagePickerViewController *ImagePickerVC = [storyboardLogo instantiateViewControllerWithIdentifier:@"ImagePickerBoard"];
        
        // Configure the new view controller here.
        [self presentViewController:ImagePickerVC animated:YES completion:nil];

        
       

        
    }
    
    else if ([action isEqualToString:@"camera"])
    {
        
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        
 
        
            _actionSelectedString=action;
            
            UIStoryboard *storyboardLogo = self.storyboard;
            ImagePickerViewController *ImagePickerVC = [storyboardLogo instantiateViewControllerWithIdentifier:@"ImagePickerBoard"];
            
            // Configure the new view controller here.
            [self presentViewController:ImagePickerVC animated:YES completion:nil];
            
            
            
            
            
            

            
            
        }

    }
    
    else if ([action isEqualToString:@"millenium"])
    {
        
        _actionSelectedString=action;
        UIStoryboard *storyboardLogo = self.storyboard;
        LogoCollectionViewController *LogoCVC = [storyboardLogo instantiateViewControllerWithIdentifier:@"LogoViewBoard"];
        
        // Configure the new view controller here.
        [self presentViewController:LogoCVC animated:YES completion:nil];
        
        
        
         _actionSelectedString=action;
        UIStoryboard *signStoryBoard = self.storyboard;
        SignOffViewController *signOffVC = [signStoryBoard instantiateViewControllerWithIdentifier:@"SignStoryBoard"];
        
        // Configure the new view controller here.
        [self presentViewController:signOffVC animated:YES completion:nil];
        
    }
    
    else if ([action isEqualToString:@"search"])
    {
        _actionSelectedString=action;
        
    }
    
    else if ([action isEqualToString:@"near me"])
    {
        
        //[DIYMenu dismiss];
        
        //_actionSelectedString=action;
        
        UIStoryboard *storyboardLogo = self.storyboard;
        LogoCollectionViewController *LogoCVC = [storyboardLogo instantiateViewControllerWithIdentifier:@"LogoViewBoard"];
        
        // Configure the new view controller here.
        [self presentViewController:LogoCVC animated:YES completion:nil];
        
               
        
        
    }
    
    else{
        //save
        
    }
    
}*/



//hits this
/*- (void)menuActivated
{
    //NSLog(@"Delegate: menuActivated");
    //NSLog(@"%@",_actionSelectedString);
    
    if ([_actionSelectedString isEqualToString:@"pics"]){
        
        //clears menu off picker screen
        //[DIYMenu dismiss];
        
        AppDelegate *appdelegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];
        appdelegate.model=YES;
        
        
        
        
        
    }
    
    if ([_actionSelectedString isEqualToString:@"camera"]){
        
        AppDelegate *appdelegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];
        appdelegate.model=YES;
        
        
    
    }

    else if ([_actionSelectedString isEqualToString:@"near me"]){
        
        UIStoryboard *storyboardLogo = self.storyboard;
        LogoCollectionViewController *LogoCVC = [storyboardLogo instantiateViewControllerWithIdentifier:@"LogoViewBoard"];
        [self presentViewController:LogoCVC animated:YES completion:nil];
        
        
        
    }

}*/


#pragma mark -
#pragma mark iCarousel methods

/*- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    
    
    if (carousel.tag==1)
    
    {
    //generate 100 item views
    //normally we'd use a backing array
    //as shown in the basic iOS example
    //but for this example we haven't bothered
    return 14;
    
    }
    
    else if  (carousel.tag==2)
    {
        return 14;
    }
    
    else  {
        
        return 8;
    }
    
    
    
}*/


/*- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    //if (carousel==carouselSize){
    
        /*UIButton *matSizeButton = (UIButton *)view;
        if (matSizeButton == nil)
            
        {
            
		//no button available to recycle, so create new one
            UIImage *image = [UIImage imageNamed:@"whitecirclematsize1.png"];
            matSizeButton = [UIButton buttonWithType:UIButtonTypeCustom];
            matSizeButton.frame = CGRectMake(0.0f, 0.0f, image.size.width, image.size.height);
            [matSizeButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            [matSizeButton setBackgroundImage:image forState:UIControlStateNormal];
        
            matSizeButton.layer.shadowColor = [UIColor blackColor].CGColor;
            matSizeButton.layer.shadowOpacity = 0.8;
            matSizeButton.layer.shadowRadius = 12;
            matSizeButton.layer.shadowOffset = CGSizeMake(12.0f, 12.0f);
        
            matSizeButton.titleLabel.shadowOffset = CGSizeMake(1.0, 1.0);
            [matSizeButton setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        
            [matSizeButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Light" size:22.0]];
            //button.titleLabel.font = [button.titleLabel.font fontWithSize:22];
            [matSizeButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        }
	
	//set button label
            [matSizeButton setTitle:[NSString stringWithFormat:@"%i", index] forState:UIControlStateNormal];
            [matSizeButton setTitle:[NSString stringWithFormat:@"matSizeString", matSizeString] forState:UIControlStateNormal];
    
    
    if (index ==0){
        
        [matSizeButton setTitle:[NSString stringWithFormat:@"2 X 10"] forState:UIControlStateNormal];
        //[button addTarget:self action:@selector(buttonTapped0:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (index ==1){
        
        [matSizeButton setTitle:[NSString stringWithFormat:@"2 X 11"] forState:UIControlStateNormal];
        
    }
    
    if (index ==2){
        
        [matSizeButton setTitle:[NSString stringWithFormat:@"3 X 12"] forState:UIControlStateNormal];
        
    }
    
    if (index == 3){
        
        [matSizeButton setTitle:[NSString stringWithFormat:@"3 X 14"] forState:UIControlStateNormal];
        
    }
    
    if (index == 4){
        
        [matSizeButton setTitle:[NSString stringWithFormat:@"4 X 10"] forState:UIControlStateNormal];
        
    }
    
    if (index == 5){
        
        [matSizeButton setTitle:[NSString stringWithFormat:@"4 X 12"] forState:UIControlStateNormal];
        
    }
    
    if (index == 6){
        
        [matSizeButton setTitle:[NSString stringWithFormat:@"5 X 10"] forState:UIControlStateNormal];
        
        
    }
    
    if (index ==7){
        
        [matSizeButton setTitle:[NSString stringWithFormat:@"6 X 10"] forState:UIControlStateNormal];
        //[button addTarget:self action:@selector(buttonTapped0:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (index ==8){
        
        [matSizeButton setTitle:[NSString stringWithFormat:@"6 X 11"] forState:UIControlStateNormal];
        
    }
    
    if (index ==9){
        
        [matSizeButton setTitle:[NSString stringWithFormat:@"6 X 12"] forState:UIControlStateNormal];
        
    }
    
    if (index == 10){
        
        [matSizeButton setTitle:[NSString stringWithFormat:@"7 X 14"] forState:UIControlStateNormal];
        
    }
    
    if (index == 11){
        
        [matSizeButton setTitle:[NSString stringWithFormat:@"8 X 10"] forState:UIControlStateNormal];
        
    }
    
    if (index == 12){
        
        [matSizeButton setTitle:[NSString stringWithFormat:@"9 X 12"] forState:UIControlStateNormal];
        
    }
    
    if (index == 13){
        
        [matSizeButton setTitle:[NSString stringWithFormat:@"10 X 10"] forState:UIControlStateNormal];
        
        
    }


    return matSizeButton;
}*/
    


/* if (carousel==carouselColor){
    
    UIButton *matColorButton = (UIButton *)view;
	if (matColorButton == nil)
	{
		//no button available to recycle, so create new one
		UIImage *imageColor = [UIImage imageNamed:@"whitecirclerugsample2.png"];
		matColorButton = [UIButton buttonWithType:UIButtonTypeCustom];
        matColorButton.frame = CGRectMake(0.0f, 0.0f, 110, 110);
        //matColorButton.frame = CGRectMake(0.0f, 0.0f, image.size.width, image.size.height);
		[matColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[matColorButton setBackgroundImage:imageColor forState:UIControlStateNormal];
        
        matColorButton.layer.shadowColor = [UIColor blackColor].CGColor;
        matColorButton.layer.shadowOpacity = 0.8;
        matColorButton.layer.shadowRadius = 12;
        matColorButton.layer.shadowOffset = CGSizeMake(12.0f, 12.0f);
        
        matColorButton.titleLabel.shadowOffset = CGSizeMake(1.0, 1.0);
        [matColorButton setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        
        [matColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Light" size:17.0]];
		//button.titleLabel.font = [button.titleLabel.font fontWithSize:22];
        [matColorButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
	}
	
	//set button label
	[matColorButton setTitle:[NSString stringWithFormat:@"%i", index] forState:UIControlStateNormal];
    [matColorButton setTitle:[NSString stringWithFormat:@"matSizeString", matSizeString] forState:UIControlStateNormal];
    
    
    if (index ==0){
        
        [matColorButton setTitle:[NSString stringWithFormat:@"red 001"] forState:UIControlStateNormal];
        UIImage *imageColor = [UIImage imageNamed:@"whitecirclerugsample2.png"];
        [matColorButton setBackgroundImage:imageColor forState:UIControlStateNormal];
        //[button addTarget:self action:@selector(buttonTapped0:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (index ==1){
        
        [matColorButton setTitle:[NSString stringWithFormat:@"red 001"] forState:UIControlStateNormal];
        
    }
    
    if (index ==2){
        
        [matColorButton setTitle:[NSString stringWithFormat:@"red 001"] forState:UIControlStateNormal];
        
    }
    
    if (index == 3){
        
        [matColorButton setTitle:[NSString stringWithFormat:@"red 001"] forState:UIControlStateNormal];
        
    }
    
    if (index == 4){
        
        [matColorButton setTitle:[NSString stringWithFormat:@"red 001"] forState:UIControlStateNormal];
        
    }
    
    if (index == 5){
        
        [matColorButton setTitle:[NSString stringWithFormat:@"red 001"] forState:UIControlStateNormal];
        
    }
    
    if (index == 6){
        
        [matColorButton setTitle:[NSString stringWithFormat:@"red 001"] forState:UIControlStateNormal];
        
        
    }
    
    if (index ==7){
        
        [matColorButton setTitle:[NSString stringWithFormat:@"red 001"] forState:UIControlStateNormal];
        //[button addTarget:self action:@selector(buttonTapped0:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (index ==8){
        
        [matColorButton setTitle:[NSString stringWithFormat:@"red 001"] forState:UIControlStateNormal];
        
    }
    
    if (index ==9){
        
        [matColorButton setTitle:[NSString stringWithFormat:@"red 001"] forState:UIControlStateNormal];
        
    }
    
    if (index == 10){
        
        [matColorButton setTitle:[NSString stringWithFormat:@"red 001"] forState:UIControlStateNormal];
        
    }
    
    if (index == 11){
        
        [matColorButton setTitle:[NSString stringWithFormat:@"red 001"] forState:UIControlStateNormal];
        
    }
    
    if (index == 12){
        
        [matColorButton setTitle:[NSString stringWithFormat:@"red 001"] forState:UIControlStateNormal];
        
    }
    
    if (index == 13){
        
        [matColorButton setTitle:[NSString stringWithFormat:@"red 001"] forState:UIControlStateNormal];
        
        
    }
    
    
    return matColorButton;
    
}




    
else
    
{
    
    UIButton *logoButtons = (UIButton *)view;
	if (logoButtons == nil)
	{
		//no button available to recycle, so create new one
		UIImage *imageColor = [UIImage imageNamed:@"logobuttonsbg.png"];
		logoButtons = [UIButton buttonWithType:UIButtonTypeCustom];
        logoButtons.frame = CGRectMake(0.0f, 0.0f, 90, 60);
        //matColorButton.frame = CGRectMake(0.0f, 0.0f, image.size.width, image.size.height);
		[logoButtons setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
		[logoButtons setBackgroundImage:imageColor forState:UIControlStateNormal];
        
        logoButtons.layer.shadowColor = [UIColor blackColor].CGColor;
        logoButtons.layer.shadowOpacity = 0.8;
        logoButtons.layer.shadowRadius = 12;
        logoButtons.layer.shadowOffset = CGSizeMake(12.0f, 12.0f);
        
        logoButtons.titleLabel.shadowOffset = CGSizeMake(1.0, 1.0);
        [logoButtons setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        
        [logoButtons.titleLabel setFont:[UIFont fontWithName:@"Avenir-Light" size:17.0]];
		//button.titleLabel.font = [button.titleLabel.font fontWithSize:22];
        [logoButtons addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
	}
	
	//set button label
	[logoButtons setTitle:[NSString stringWithFormat:@"%i", index] forState:UIControlStateNormal];
    [logoButtons setTitle:[NSString stringWithFormat:@"matSizeString", matSizeString] forState:UIControlStateNormal];
    
    
    if (index ==0){
        
        [logoButtons setTitle:[NSString stringWithFormat:@"edit"] forState:UIControlStateNormal];
        //[button addTarget:self action:@selector(buttonTapped0:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (index ==1){
        
        [logoButtons setTitle:[NSString stringWithFormat:@"pics"] forState:UIControlStateNormal];
        
    }
    
    if (index ==2){
        
        [logoButtons setTitle:[NSString stringWithFormat:@"camera"] forState:UIControlStateNormal];
        
    }
    
    if (index == 3){
        
        [logoButtons setTitle:[NSString stringWithFormat:@"millenium"] forState:UIControlStateNormal];
        
    }
    
    if (index == 4){
        
        [logoButtons setTitle:[NSString stringWithFormat:@"web"] forState:UIControlStateNormal];
        
    }
    
    if (index == 5){
        
        [logoButtons setTitle:[NSString stringWithFormat:@"website"] forState:UIControlStateNormal];
        
    }
    
    if (index == 6){
        
        [logoButtons setTitle:[NSString stringWithFormat:@"transparent"] forState:UIControlStateNormal];
        
        
    }
    
    if (index ==7){
        
        [logoButtons setTitle:[NSString stringWithFormat:@"save"] forState:UIControlStateNormal];
        //[button addTarget:self action:@selector(buttonTapped0:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    
    
    return logoButtons;
    
}

    
}*/
- (void)touchDownRepeatDec:(UITextField*)textField{
    
    
   
     
     /*[textDecField  resignFirstResponder];
     textDecField.hidden= YES;
     textDecField.delegate = self;
     textDecField.returnKeyType = UIReturnKeyDefault;
     [textDecField isFirstResponder];*/
    
    [_lastMovedTextField resignFirstResponder];
    _lastMovedTextField.hidden= YES;
    _lastMovedTextField.delegate = self;
    _lastMovedTextField.returnKeyType = UIReturnKeyDefault;
    [_lastMovedTextField isFirstResponder];
   
    
    
    
}


- (void)touchDownRepeat:(UITextField*)textField{
   
    
    //self.lastMovedTextField = sender;
    
    
    
    
    [_lastMovedTextField resignFirstResponder];
    _lastMovedTextField.hidden= YES;
    _lastMovedTextField.delegate = self;
    _lastMovedTextField.returnKeyType = UIReturnKeyDefault;
    [_lastMovedTextField isFirstResponder];
    
   /*[textNoteField  resignFirstResponder];
    textNoteField.hidden= YES;
    textNoteField.delegate = self;
    textNoteField.returnKeyType = UIReturnKeyDefault;
    [textNoteField isFirstResponder];*/
    
    
 
    
}

-(void)touchDownCenter:(UITextField*)textField{
    
     [self.view addSubview:fontPicker];
    
}

#pragma mark -
#pragma mark Button tap event

- (void)buttonTapped:(UIButton *)sender
{
    
    NSInteger index = [carouselSize indexOfItemViewOrSubview:sender];
    int i=index;
    //int width;
    //int height;
    
    if (index==i){
        
        
        //getColorName at index i;
        //getSizeName at index i;
        
        //set interactiveImage to selected data
        
        
        
        
        
        
    }
    
    if (index==6){
        
        
        
        
        
        
        
        
    }
    
    
    
    
}

-(void)move:(id)sender {
    
    CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:canvas];
    
    if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        _firstX = [chosenImageView center].x;
        _firstY = [chosenImageView center].y;
        
        
       
    }
    
    translatedPoint = CGPointMake(_firstX+translatedPoint.x, _firstY+translatedPoint.y);
    
    [logoPicButton setCenter:translatedPoint];
   
}




-(void)scale:(id)sender {
    
    
    float x,y;
    float a,b;
    x = matBGLogoView.frame.size.width;
    y = matBGLogoView.frame.size.height;
    a=matBGLogoView.frame.origin.x;
    b=matBGLogoView.frame.origin.y;
    
    /*matBGLogoView.frame = CGRectMake(matBGLogoView.frame.origin.x,
                                 matBGLogoView.frame.origin.y, matBGLogoView.width, matBGLogoView.height);*/
    
    NSLog(@"image after aspect fit: width=%f height=%f",x,y);
   
    
    /* a = im.size.width;
    b = im.size.height;*/

    
    
    
    if([(UIPinchGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        _lastScale = 1.0;
        
        
    }
    _keepScale=_lastScale;
    
    CGFloat scale = 1.0 - (_lastScale - [(UIPinchGestureRecognizer*)sender scale]);
    
 
    
    
    CGAffineTransform currentTransformLogo = logoPicButton.transform;
    CGAffineTransform newTransformLogo = CGAffineTransformScale(currentTransformLogo, scale, scale);
    
    [logoPicButton setTransform:newTransformLogo];
    
    
   _lastScale = [(UIPinchGestureRecognizer*)sender scale];
    matBGLogoView.frame = CGRectMake(a, b, x, y);
    
    
    //[self showOverlayWithFrame:chosenImageView.frame];
    
    //CGAffineTransform currentTransformMat = matBGLogoView.transform;
    //CGAffineTransform newTransformMat = CGAffineTransformScale(currentTransformMat, scale, scale);
    
    //[matBGLogoView setTransform:currentTransformMat];
    

    /*matBGLogoView.frame.size.width==x;
    matBGLogoView.frame.size.height==y;
    
    if ([sizeString isEqualToString:@"4'x6'" ]||[sizeString isEqualToString:@"4x6" ])
    {
        [self fourBySix:(id)sender];
        
    }
    
    if ([sizeString isEqualToString:@"3'X10'"] ||[sizeString isEqualToString:@"3X10"] )
    {
       [self threeByTen:(id)sender];
        
    }*/
}



#pragma bgColorSelected

-(IBAction)bgColorSelected:(UIButton*)sender event:(id)event {
    
    interactiveHeaderString = @"Create Mat";
    
    //NSLog(@"addButton.tag:%ld",(long)sender.tag);
    
    int myInt = (int)sender.tag;
    //NSLog(@"sender %@",sender);
    
    
    if ((long)sender.tag==121){
        
        matBGColorAddFavString=@"121-Steel Blue";
        matBGColorString=@"Steel Blue_121.jpg";
        //create an image
        myBGColor = [UIImage imageNamed:@"Steel Blue_121.jpg"];
        [matBGLogoView setImage:myBGColor];
        
        [bgColorButton setTitle:@"121" forState:UIControlStateNormal];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //[bgColorButton.titleLabelColor setColor:whiteColor  forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
        
        
    }

   
    
    else if ((long)sender.tag==123){
        
        matBGColorAddFavString=@"123-Suede";
        myBGColor = [UIImage imageNamed:@"Suede_123.jpg"];
        [matBGLogoView setImage:myBGColor];
        
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setTitle:@"123" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    else if ((long)sender.tag==140){
        matBGColorAddFavString=@"140-White";
        
        myBGColor = [UIImage imageNamed:@"White_140.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"140" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    else if ((long)sender.tag==119){
        
        matBGColorAddFavString=@"119-Rose";
        myBGColor = [UIImage imageNamed:@"Rose_119.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"119" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    else if ((long)sender.tag==107){
        
        matBGColorAddFavString=@"107-Royal Blue";
        myBGColor = [UIImage imageNamed:@"Royal Blue_107.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"107" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    
    }
    
    else if ((long)sender.tag==120){
        
        matBGColorAddFavString=@"120-Sandalwood";
        myBGColor = [UIImage imageNamed:@"Sandalwood_120.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"120" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    else if ((long)sender.tag==116){
        
        matBGColorAddFavString=@"116-Silver";
        myBGColor = [UIImage imageNamed:@"Silver_116.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"116" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==127){
        
        matBGColorAddFavString=@"127-Orange";
        
        myBGColor = [UIImage imageNamed:@"Orange_127.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"127" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==105){
        
        matBGColorAddFavString=@"105-Purple";
        
        myBGColor = [UIImage imageNamed:@"Purple_105.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"105" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    if ((long)sender.tag==112){
        
        matBGColorAddFavString=@"Red-112";
        
        myBGColor = [UIImage imageNamed:@"Red_112.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"112" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==109){
        
        matBGColorAddFavString=@"109-Gold";
        
        myBGColor = [UIImage imageNamed:@"Gold_109.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"109" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    
    if ((long)sender.tag==115){
        
        matBGColorAddFavString=@"115-Grey";
       
        myBGColor = [UIImage imageNamed:@"Grey_115.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"115" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==106){
        
        matBGColorAddFavString=@"106-Light Blue";
        
        myBGColor = [UIImage imageNamed:@"Light Blue_106.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"106" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==118){
        
        matBGColorAddFavString=@"118-Navy";
        
        myBGColor = [UIImage imageNamed:@"Navy_118.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"118" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==110){
        
        matBGColorAddFavString=@"110-Emerald Green";
        //create an image
        myBGColor = [UIImage imageNamed:@"Emerald Green_110.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"110" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==117){
        
        matBGColorAddFavString=@"117-Forest Green";
        
        myBGColor = [UIImage imageNamed:@"Forest Green_117.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"117" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
        
    }
    
    if ((long)sender.tag==114){
        matBGColorAddFavString=@"114-Cranberry";
        
        myBGColor = [UIImage imageNamed:@"Cranberry_114.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"114" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
        
    }
    
    if ((long)sender.tag==103){
        
        matBGColorAddFavString=@"103-Dark Gold";
        
        myBGColor = [UIImage imageNamed:@"Dark Gold_103.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"103" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==101){
        
        matBGColorAddFavString=@"101-Charcoal";
        myBGColor = [UIImage imageNamed:@"Charcoal_101.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"101" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==111){
        
        matBGColorAddFavString=@"111-Chocolate";
       
        myBGColor = [UIImage imageNamed:@"Chocolate_111.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"111" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==126){
        
        matBGColorAddFavString=@"126-Clay";
        UIImage *myBGColor = [UIImage imageNamed:@"Clay_126.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"126" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
    
    }
    
    if ((long)sender.tag==108){
        matBGColorAddFavString=@"108-Black";
        
        myBGColor = [UIImage imageNamed:@"Black_108.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"108" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==102){
        
        matBGColorAddFavString=@"102-Brown";
        myBGColor = [UIImage imageNamed:@"Brown_102.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"102" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==100){
        matBGColorAddFavString=@"100-Burgundy";
        
        myBGColor = [UIImage imageNamed:@"Burgundy_100.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"100" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==130){
        
        
        matBGColorAddFavString=@"130-Aquamarine";
        //matBGColorAddFavString=@"Aquamarine_130.jpg";
        matBGColorString=@"Aquamarine_130.jpg";
       
        myBGColor = [UIImage imageNamed:@"Aquamarine_130.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"130" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==104){
        
        matBGColorAddFavString=@"104-Turquoise";
        myBGColor = [UIImage imageNamed:@"Turquoise_104.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"104" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
        
    }
    //TODO FIX ALL THESE
    if ((long)sender.tag==128){
        
        matBGColorAddFavString=@"128-Yellow";
        myBGColor = [UIImage imageNamed:@"Yellow_128.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setTitle:@"128" forState:UIControlStateNormal];
        [bgColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
        
        
    }
    
    
   /* if ([bgColorButton.titleLabel.text isEqualToString:@"140"]){
        
        [bgColorButton setTitleShadowColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
    }*/

  [self.bgColorButton reloadInputViews];
  matBGLogoView.contentMode = UIViewContentModeScaleToFill;








    
   
    
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
   
    
    UITextField * alertNameField = [alertView textFieldAtIndex:0];
    nameField.text=alertNameField.text;
    NSString*nameFieldAlertString=alertNameField.text;
    
    
    
    
    noteLayerView.hidden=YES;
    CGRect screenRect2 = CGRectMake(0,0,1024,768);
    UIGraphicsBeginImageContext(screenRect2.size);
    
    CGContextRef ctx1 = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] set];
    CGContextFillRect(ctx1, screenRect2);
    
    [self.view.layer renderInContext:ctx1];
    UIImage *matImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    croppedImageView = [[UIImageView alloc] initWithImage:matImage];
    
    // Get size of current image
    CGSize size = [matImage size];
    
    // Frame location in view to show original image
    [croppedImageView setFrame:CGRectMake(0, 0, size.width, size.height)];
    
    
    
    CGRect rect = CGRectMake(425,142,600, 416);
    
    // Create bitmap image from original image data,
    // using rectangle to specify desired crop area
    CGImageRef imageRef = CGImageCreateWithImageInRect([matImage CGImage], rect);
    UIImage *img = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    // Create and show the new image from bitmap data
    croppedImageView = [[UIImageView alloc] initWithImage:img];
    [croppedImageView setFrame:CGRectMake(0,0,600, 416)];
    
    
    
    
    //save new imageView to FAV
    
    CGRect screenRect3 = CGRectMake(425,142,600, 416);
    
    
    UIGraphicsBeginImageContext(screenRect3.size);
    
    
    CGContextRef ctx2 = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] set];
    CGContextFillRect(ctx2, screenRect3);
    
    [self.croppedImageView.layer renderInContext:ctx2];
    UIImage *matCroppedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    
    
    UIGraphicsEndImageContext();
    
    
    
    
    
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@.png",nameFieldAlertString]];
    
    [UIImagePNGRepresentation(matCroppedImage) writeToFile:imagePath atomically:YES];
    
    
    //NOTE- Do not remove local NSString values will break
    
    NSString*matUrlAppendAddFavString= nameFieldAlertString;
    NSString*pngString= @".png";
    //NSLog(@"nameFieldText %@",nameField.text);
    //NSLog(@"nameFieldText %@",nameHideField.text);
    
    
    urlMatStringAppend = [matUrlAppendAddFavString stringByAppendingString:pngString];
    
    matUrlAddFavString = urlMatStringAppend;
    //NSLog(@"matUrlAddFavString %@",matUrlAddFavString);
    NSString*matNameAddFavString =nameFieldAlertString;
    NSString*matSellerAddFavString =sellerField.text;
    NSString*matCompanyAddFavString =companyField.text;
    NSString*matIDAddFavString =numberField.text;
    NSString*matLocationIDAddFavString =locationIDString;
    NSString*matColorAddFavString =matColorString;
    
    //NSString*matBGColorAddFavString =matBGColorString;
    matUseBGColorString=matBGColorString;
    NSString*matSizeAddFavString =matSizeString;
    
    
    
    
    
    
    //NSLog(@"matUrlAddFavString %@",matUrlAddFavString);
    if (matUrlAddFavString==NULL)
        
    {
        
        matUrlAddFavString= @"No Image Is Available";
        
    }
    
    if (matNameAddFavString==NULL)
    {
        
        matNameAddFavString= @"The Artwork has no name";
        
    }
    
    
    if (matCompanyAddFavString==NULL)
    {
        
        matCompanyAddFavString= @"No Company Name Is Available";
        
    }
    
    if (matSellerAddFavString==NULL)
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
        
    }
    
    
    //NSLog(@"urlFavString %@",matUrlAddFavString);
    //NSLog(@"urlFavString %@",matNameAddFavString);
    /*NSString*artworkCompanyAddFavString =[artworkCompanyArray objectAtIndex:indexPathSend];
     NSString*artworkSellerAddFavString =[artworkSellerArray objectAtIndex:indexPathSend];
     NSString*artworkNumberAddFavString =[artworkNumberArray objectAtIndex:indexPathSend];*/
    
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    NSManagedObject *newMatFavorite = [NSEntityDescription insertNewObjectForEntityForName:@"MatFavorite" inManagedObjectContext:context];
    
    
    
    //NSLog(@"matUrlAddFavString %@",matUrlAddFavString);
    [newMatFavorite setValue:matUrlAddFavString forKey:@"fullImageURL"];
    [newMatFavorite setValue:nameField.text forKey:@"artworkName"];
    [newMatFavorite setValue:companyField.text forKey:@"company"];
    [newMatFavorite setValue:sellerField.text forKey:@"seller"];
    [newMatFavorite setValue:numberField.text forKey:@"productID"];
    [newMatFavorite setValue:locationIDString forKey:@"locationID"];
    [newMatFavorite setValue:matColorString forKey:@"color"];
    [newMatFavorite setValue:matUseBGColorString forKey:@"bgColor"];
    [newMatFavorite setValue:self.matSizeString forKey:@"artworkSize"];
    
    
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        //NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    //Fetch Data entered to test
    /* NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
     NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"MatFavorite"];
     self.favoritesMatArray = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];*/
    //self->artworkName = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    
    //NSLog(@"favoritesMatArray %@",favoritesMatArray);
    
}

//hits this
#pragma mark
#pragma mark Mask
- (UIImage*) maskImage:(UIImage *)selectedImage withMask:(UIImage *)maskImage {
    
	CGImageRef imgRef = [selectedImage CGImage];
    CGImageRef maskRef = [maskImage CGImage];
    CGImageRef actualMask = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                              CGImageGetHeight(maskRef),
                                              CGImageGetBitsPerComponent(maskRef),
                                              CGImageGetBitsPerPixel(maskRef),
                                              CGImageGetBytesPerRow(maskRef),
                                              CGImageGetDataProvider(maskRef), NULL, false);
    masked = CGImageCreateWithMask(imgRef, actualMask);
    return [UIImage imageWithCGImage:masked];
    
    
}



-(IBAction)addMatFavorite:(id)sender{
    
    decTextLayerView.hidden=NO;
    NSString*nameStringHere=nameField.text;
    NSLog(@"nameString %@",nameStringHere);
    
    
   /* NSString*matUrlAppendAddFavString= nameField.text;
    NSLog(@"matUrlAppendAddFavString %@",matUrlAppendAddFavString);
    NSString*pngString= @".png";
    //NSLog(@"nameFieldText %@",nameField.text);
    //NSLog(@"nameFieldText %@",nameHideField.text);
    
    
    matUrlAddFavString = [matUrlAppendAddFavString stringByAppendingString:pngString];*/

    if ([nameStringHere isEqualToString:@""]  /*|| [matUrlAddFavString isEqualToString:@""] */){
        
        
        
        
        UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Add a name for your New Sketch Request"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
        alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        
        
        
        
        alert.tag = 1;
        [alert show];

    } else{
    
   
    //temporarily add button to subview to snap picture of mat
        
        
        float x,y;
        float a,b;
        float c,d;
        x = logoPicButton.frame.size.width;
        y = logoPicButton.frame.size.height;
        a= logoPicButton.frame.origin.x;
        b=logoPicButton.frame.origin.y;
    
        c=a+50;
        d=b+50;
        
        
     
        
        noteLayerView.hidden=YES;
        CGRect screenRect2 = CGRectMake(0,0,1024,768);
        UIGraphicsBeginImageContext(screenRect2.size);
        
        CGContextRef ctx1 = UIGraphicsGetCurrentContext();
        [[UIColor whiteColor] set];
        CGContextFillRect(ctx1, screenRect2);
        
        [self.view.layer renderInContext:ctx1];
                UIImage *matImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        
        croppedImageView = [[UIImageView alloc] initWithImage:matImage];
        
        // Get size of current image
        CGSize size = [matImage size];
        
        // Frame location in view to show original image
        [croppedImageView setFrame:CGRectMake(0, 0, size.width, size.height)];
        
       
        
        CGRect rect = CGRectMake(425,142,600, 416);
        
        // Create bitmap image from original image data,
        // using rectangle to specify desired crop area
        CGImageRef imageRef = CGImageCreateWithImageInRect([matImage CGImage], rect);
        UIImage *img = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        
        // Create and show the new image from bitmap data
        croppedImageView = [[UIImageView alloc] initWithImage:img];
        [croppedImageView setFrame:CGRectMake(0,0,600, 416)];
      
    
    
  
       //save new imageView to FAV
       
        CGRect screenRect3 = CGRectMake(425,142,600, 416);
        
        
        UIGraphicsBeginImageContext(screenRect3.size);
       
        
        CGContextRef ctx2 = UIGraphicsGetCurrentContext();
        [[UIColor whiteColor] set];
        CGContextFillRect(ctx2, screenRect3);
        
        [self.croppedImageView.layer renderInContext:ctx2];
                UIImage *matCroppedImage = UIGraphicsGetImageFromCurrentImageContext();
        
        
        
        UIGraphicsEndImageContext();

        
        
        
        
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@.png",nameStringHere]];
        
    [UIImagePNGRepresentation(matCroppedImage) writeToFile:imagePath atomically:YES];
    
    //NOTE- Do not remove local NSString values will break
    
   /* NSString*matUrlAppendAddFavString= nameField.text;
    NSLog(@"matUrlAppendAddFavString %@",matUrlAppendAddFavString);
    NSString*pngString= @".png";
    //NSLog(@"nameFieldText %@",nameField.text);
    //NSLog(@"nameFieldText %@",nameHideField.text);
    
    
     NSString*matUrlAddFavString = [matUrlAppendAddFavString stringByAppendingString:pngString];*/
    
    
    NSLog(@"matUrlAddFavString %@",matUrlAddFavString);
    NSString*matNameAddFavString =nameField.text;
    NSString*matSellerAddFavString =sellerField.text;
    NSString*matCompanyAddFavString =companyField.text;
    NSString*matIDAddFavString =numberField.text;
    NSString*matLocationIDAddFavString =locationIDString;
    matColorAddFavString =matColorString;
    //matUseBGColorString =matBGColorString;
    //matUseBGColorString =matBGColorString;
    matUseBGColorString =BGString;
    NSLog(@"matColorAddFavString %@",matColorAddFavString);
    NSLog(@"matBGColorAddFavString %@",matBGColorAddFavString);
    NSString*matSizeAddFavString =matSizeString;
    
    
    
    
    
    
    //NSLog(@"matUrlAddFavString %@",matUrlAddFavString);
    if (matUrlAddFavString==NULL)
        
    {
        
        NSString*matUrlAppendAddFavString= nameField.text;
        NSLog(@"matUrlAppendAddFavString %@",matUrlAppendAddFavString);
        NSString*pngString= @".png";
        //NSLog(@"nameFieldText %@",nameField.text);
        //NSLog(@"nameFieldText %@",nameHideField.text);
        
        
        matUrlAddFavString = [matUrlAppendAddFavString stringByAppendingString:pngString];

        NSLog(@"matUrlAddFavString %@",matUrlAddFavString);
        
        
    }
    
    if (matNameAddFavString==NULL)
    {
        
        matNameAddFavString= @"The Artwork has no name";
        
    }
    
    
    if (matCompanyAddFavString==NULL)
    {
        
        matCompanyAddFavString= @"No Company Name Is Available";
        
    }
    
    if (matSellerAddFavString==NULL)
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
        
    if (matUseBGColorString==NULL)
        
    {
            
            matUseBGColorString= @"No Background Color is provided";
            
    }
    
   /* if (matBGColorAddFavString==NULL)
    {
        
        matBGColorAddFavString= @"No Background Color is provided";
        
    }*/
    
    if (matSizeAddFavString==NULL)
    {
        
        matSizeAddFavString= @"4' x 6'";
        
    }
    
    
    
    
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    NSManagedObject *newMatFavorite = [NSEntityDescription insertNewObjectForEntityForName:@"MatFavorite" inManagedObjectContext:context];
    
    
    
    //NSLog(@"matUrlAddFavString %@",matUrlAddFavString);
    //[newMatFavorite setValue:matUrlAddFavString forKey:@"fullImageURL"];
    [newMatFavorite setValue:matUrlAddFavString forKey:@"fullImageURL"];
    [newMatFavorite setValue:nameField.text forKey:@"artworkName"];
    [newMatFavorite setValue:companyField.text forKey:@"company"];
    [newMatFavorite setValue:sellerField.text forKey:@"seller"];
    [newMatFavorite setValue:numberField.text forKey:@"productID"];
    [newMatFavorite setValue:locationIDString forKey:@"locationID"];
    [newMatFavorite setValue:matColorString forKey:@"color"];
    [newMatFavorite setValue:matBGColorAddFavString forKey:@"bgColor"];
    [newMatFavorite setValue:self.matSizeString forKey:@"artworkSize"];
    
    
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        //NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    
}


    
    }


-(IBAction)refreshLogoColors:(id)sender{
    
   /*float x,y;
    float a,b;
    x = matBGLogoView.frame.size.width;
    y = matBGLogoView.frame.size.height;
    a=matBGLogoView.frame.origin.x;
    b=matBGLogoView.frame.origin.y;*/
    
    
    firstColorNameString.hidden=NO;
    secondColorNameString.hidden=NO;
    thirdColorNameString.hidden=NO;
    fourthColorNameString.hidden=NO;
    fifthColorNameString.hidden=NO;
    sixthColorNameString.hidden=NO;
    seventhColorNameString.hidden=NO;
    
    
    logoColorButton1.hidden=YES;
    logoColorButton2.hidden=YES;
    logoColorButton3.hidden=YES;
    logoColorButton4.hidden=YES;
    logoColorButton5.hidden=YES;
    logoColorButton6.hidden=YES;
    logoColorButton7.hidden=YES;
    
    logoColor1String=@"";
    logoColor2String=@"";
    logoColor3String=@"";
    logoColor4String=@"";
    logoColor5String=@"";
    logoColor6String=@"";
    logoColor7String=@"";
    
    /*logoColor1String=nil;
    logoColor2String=nil;
    logoColor3String=nil;
    logoColor4String=nil;
    logoColor5String=nil;
    logoColor6String=nil;
    logoColor7String=nil;*/
    
    
    matColorString= [NSString stringWithFormat:@"%@,%@,%@,%@,%@,%@,%@", logoColor1String, logoColor2String, logoColor3String, logoColor4String, logoColor5String, logoColor6String,logoColor7String];
    
    
    NSLog(@"matColorString pass%@",matColorString);
    
    [self.view addSubview:decTextLayerView];
    decTextLayerView.hidden=YES;
    
    
       
    //matBGLogoView.frame = CGRectMake(a, b, x, y);
    
    
    
    
}

-(IBAction)addNote:(id)sender{
    
    noteLayerView.hidden=NO;
    decTextLayerView.hidden=YES;
    if(matView1.hidden==NO){
        
        [self.matView1 addSubview:noteLayerView];
        
    }
    
    
    textNoteField = [[UITextField alloc] initWithFrame:CGRectMake(325, 50, 300, 60)];
    //textNoteField.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    textNoteField.textColor = [UIColor redColor];
    textNoteField.font = [UIFont fontWithName:@"Avenir-Bold" size:14];
    textNoteField.backgroundColor=[UIColor whiteColor];
    textNoteField.text=@"ADD PRODUCTION NOTES";
    textNoteField.tag = 1;
   
    [self.noteLayerView addSubview:textNoteField];
    
    
    [textNoteField addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [textNoteField addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    [textNoteField addTarget:self action:@selector(touchDownRepeat:) forControlEvents:UIControlEventTouchDownRepeat];
    
    /*UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scaleNote:)] ;
	[pinchRecognizer setDelegate:self];
	[self.textNoteField addGestureRecognizer:pinchRecognizer];
    
    [textNoteField addTarget:self action:@selector(scaleNote:) forControlEvents:pinchRecognizer];*/
    
}

-(IBAction)addText:(id)sender{
    
   // for (NSInteger i=1; i<10; i++) {
    
    decTextLayerView.hidden=NO;
    noteLayerView.hidden=YES;
    
    
        textDecField = [[UITextField alloc] initWithFrame:CGRectMake(445, 100, 600, 100)];
        textDecField.textColor = [UIColor whiteColor];
        textDecField.font = [UIFont fontWithName:@"Avenir-Light" size:25];
        textDecField.backgroundColor=[UIColor clearColor];
        textDecField.text=@"TEXT";
    
    
        
        //textDecField.tag = i;
      

    
    
        [self.decTextLayerView addSubview:textDecField];
        
        [textDecField addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
        [textDecField addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
        [textDecField addTarget:self action:@selector(touchDownRepeatDec:) forControlEvents:UIControlEventTouchDownRepeat];
    
    [self.decorativeTestFields addObject:textDecField];
    
    }
    


enum {
    textDecFieldTag = 2,
    textNoteFieldTag=1
};

-(IBAction)addPMS:(id)sender{
    
    decTextLayerView.hidden=NO;
    
    textDecField = [[UITextField alloc] initWithFrame:CGRectMake(145, 400, 38, 38)];
    textDecField.textColor = [UIColor whiteColor];
    textDecField.font = [UIFont fontWithName:@"Avenir-Bold" size:14];
    textDecField.backgroundColor=[UIColor darkGrayColor];
    textDecField.textAlignment= NSTextAlignmentCenter;
    textDecField.tag = 3;
    
    [self.view addSubview:textDecField];
    
    [textDecField addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [textDecField addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    [textDecField addTarget:self action:@selector(touchDownRepeat:) forControlEvents:UIControlEventTouchDownRepeat];
    
    
    
}


-(IBAction)hideNotes:(id)sender{
    
    noteLayerView.hidden =YES;
}

-(IBAction)showNotes:(id)sender{
    
    
    noteLayerView.hidden =NO;
}

-(IBAction)hideText:(id)sender{
    
    decTextLayerView.hidden =YES;
}

-(IBAction)showText:(id)sender{
    
    
    
    
    decTextLayerView.hidden =NO;
}






-(IBAction)goMail:(UIButton*)sender event:(id)event {
    
    if ([MFMailComposeViewController canSendMail]) {
    
        [self.fontPicker removeFromSuperview];
    
        noteLayerView.hidden=YES;
        decTextLayerView.hidden =NO;
    
        CGRect screenRect2 = CGRectMake(0.0,0,1028,720);
    
    
        UIGraphicsBeginImageContext(screenRect2.size);
        //UIGraphicsBeginImageContext(interactiveMatView.size);
    
        CGContextRef ctx1 = UIGraphicsGetCurrentContext();
        [[UIColor whiteColor] set];
        CGContextFillRect(ctx1, screenRect2);
    
        [self.view.layer renderInContext:ctx1];
    
        UIImage *matImageHere = UIGraphicsGetImageFromCurrentImageContext();
    
        UIGraphicsEndImageContext();
    
    
        //save image to documents
        NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/matImageHere.jpg"]];
        [UIImageJPEGRepresentation(matImageHere, 1.0) writeToFile:imagePath atomically:YES];
        noteLayerView.hidden=YES;
    
        //snapshot withNotes grab image
        //noteLayerView.hidden=NO;
        CGRect screenRect3 = CGRectMake(0.0,0,1028,720);
    
    
        UIGraphicsBeginImageContext(screenRect3.size);
        //UIGraphicsBeginImageContext(interactiveMatView.size);
    
        CGContextRef ctx2 = UIGraphicsGetCurrentContext();
        [[UIColor whiteColor] set];
        CGContextFillRect(ctx2, screenRect2);
    
        //[self.noteLayerView.layer renderInContext:ctx1];
    
        UIImage *matNoteImage = UIGraphicsGetImageFromCurrentImageContext();
    
        UIGraphicsEndImageContext();

        NSString  *imagePath2 = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/matNoteImage.jpg"]];
        [UIImageJPEGRepresentation(matNoteImage, 1.0) writeToFile:imagePath2 atomically:YES];
    
    
        MFMailComposeViewController*mailComposer;
    
   
    
    
        mailComposer = [[MFMailComposeViewController alloc] init];
        mailComposer.mailComposeDelegate=self;
    
   
    
        emailTitle = _emailString;
    
    
        NSString*messageString = @"This mat has been approved";
    
    
    //TODO add string and images to email
        NSString *messageBody = messageString;
    
    
       
    
    //Display Email Composer
        MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
        mc.mailComposeDelegate = self;
        [mc setSubject:emailTitle];
        [mc setMessageBody:messageBody isHTML:NO];
    
    //[mc setToRecipients:toRecipents];
    
        NSMutableArray*recipients=[[NSMutableArray alloc]init];
    
        NSArray *directoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString *imagePath1 =  [directoryPath objectAtIndex:0];
        imagePath1= [imagePath1 stringByAppendingPathComponent:@"matImageHere.jpg"];
    
        NSData *data = [NSData dataWithContentsOfFile:imagePath1];
        //UIImage *image = [UIImage imageWithData:data];
    
        NSString *imagePath3 =  [directoryPath objectAtIndex:0];
        imagePath1= [imagePath3 stringByAppendingPathComponent:@"matNoteImage.jpg"];
    
        NSData *dataNote = [NSData dataWithContentsOfFile:imagePath3];
    
        // Add attachment
        [mc addAttachmentData:data mimeType:@"image/jpeg" fileName:@"matImage.jpg"];
        [mailComposer setToRecipients:recipients];
    
        [self presentViewController:mc animated:YES completion:NULL];
    
    }else{
        
        
        UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please set up an email account on this device to enable this feature." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
        
        [alert show];
        
            }
    
    
}



-(IBAction)goMail1:(UIButton*)sender event:(id)event {
    
    
    if ([MFMailComposeViewController canSendMail]) {
    
        [self.fontPicker removeFromSuperview];
    
        decTextLayerView.hidden=NO;
        noteLayerView.hidden=NO;
    
    
        CGRect screenRect2 = CGRectMake(0.0,0,1028,720);
    
    
        UIGraphicsBeginImageContext(screenRect2.size);
        //UIGraphicsBeginImageContext(interactiveMatView.size);
    
        CGContextRef ctx1 = UIGraphicsGetCurrentContext();
        [[UIColor whiteColor] set];
        CGContextFillRect(ctx1, screenRect2);
    
        [self.view.layer renderInContext:ctx1];
    
        UIImage *matNoteImage = UIGraphicsGetImageFromCurrentImageContext();
    
        UIGraphicsEndImageContext();
    
    
    
        NSString  *imagePath2 = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/matNoteImage.jpg"]];
        [UIImageJPEGRepresentation(matNoteImage, 1.0) writeToFile:imagePath2 atomically:YES];
    
    
        MFMailComposeViewController*mailComposer;
    
    
    
    
        mailComposer = [[MFMailComposeViewController alloc] init];
        mailComposer.mailComposeDelegate=self;
    
        NSString *emailTitle = @"Mat Approved";
    
        //NSString*firstNameString= firstNameField.text;
        //NSString*lastNameString= lastNameField.text;
    
    
        //NSLog(@"%@",lastNameString);
    
        //NSString*messageString = [NSString stringWithFormat:@"%@  %@, %@, %@, %@, %@, %@, %@",firstNameString,lastNameString,emailString,phoneString,addressString,cityString,countryString,notesString];
    
        NSString*messageString = @"This mat requires your approval";
    
    
        //TODO add string and images to email
        NSString *messageBody = messageString;
    
    
        //add here
        //[mailComposer setMessageBody:self.messageBody isHTML:YES];
    
    
        //NSArray *toRecipents = [NSArray arrayWithObject:emailString];
        //NSArray *toRecipents = @"yummy@nomadcandy.com";
    
    
        //Display Email Composer
        MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
        mc.mailComposeDelegate = self;
        [mc setSubject:emailTitle];
        [mc setMessageBody:messageBody isHTML:NO];
    
        //[mc setToRecipients:toRecipents];
    
        NSMutableArray*recipients=[[NSMutableArray alloc]init];
    
        NSArray *directoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        /* NSString *imagePath1 =  [directoryPath objectAtIndex:0];
         imagePath1= [imagePath1 stringByAppendingPathComponent:@"matImageHere.jpg"];*/
    
        NSData *data = [NSData dataWithContentsOfFile:imagePath2];
        //UIImage *image = [UIImage imageWithData:data];
    
        NSString *imagePath3 =  [directoryPath objectAtIndex:0];
        imagePath2= [imagePath3 stringByAppendingPathComponent:@"matNoteImage.jpg"];
    
        //NSData *dataNote = [NSData dataWithContentsOfFile:imagePath3];
   
        [mc addAttachmentData:data mimeType:@"image/jpeg" fileName:@"matNoteImage.jpg"];
    
    
    
        [mailComposer setToRecipients:recipients];
    
        [self presentViewController:mc animated:YES completion:NULL];
        
    }else{
        
        
        UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please set up an email account on this device to enable this feature." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
        
        [alert show];

    }
    
    
}



-(IBAction)goSearch:(id)sender{
    
    
 // [activityIndicator startAnimating];
    
   if( searchField.text!= Nil || [searchField.text length] == 0 ) {
    
    
    NSString*searchOneString= searchField.text;
    
    NSInteger nWords = 1;
    NSRange wordRange = NSMakeRange(0, nWords);
    NSArray *searchStringArray = [[searchOneString componentsSeparatedByString:@" "] subarrayWithRange:wordRange];
    
    NSString*searchString= [searchStringArray objectAtIndex:0];
    
       
    NSString*urlSearchString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/?searchString=%@&Orderby=mostPopular&interactiveOnly=1&locationID=-1&userID=0", searchString];

       
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

    
    NSString*urlSearchMatString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/?searchString=%@&Orderby=mostPopular&interactiveOnly=0&locationID=-1&userID=0", searchString];
    
       NSURL *urlSearchMat = [[NSURL alloc] initWithString:urlSearchMatString];
       NSURLRequest *requestMat = [NSURLRequest requestWithURL:
                                   urlSearchMat];
       
       
       // NSLog(@"URLSearchMat: %@",urlSearchMat);
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
                      // handle response
                      
                  }] resume];
       
       
       //NSError *errorMat = nil;
       //NSData *dataMat = [NSData dataWithContentsOfURL:urlSearch];
       
       
       //parse Array from web
       NSArray *searchMatArray = [NSJSONSerialization
                                  JSONObjectWithData:dataMat
                                  options:NSJSONReadingAllowFragments
                                  error: &errorMat];
       
       

    
       
    matCount= searchMatArray.count;
    //NSLog(@"%@SearchMatArray",searchMatArray);
       
       
       
       
       

    
    
    
    [searchLogoArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
        
        artworkNameArray = [searchLogoArray valueForKey:@"ArtworkName"];
        artworkSizeArray = [searchLogoArray valueForKey:@"ArtworkSize"];
        artworkFormatArray = [searchLogoArray valueForKey:@"Format"];
        artworkFullImageArray = [searchLogoArray valueForKey:@"FullImageURL"];
        artworkIconArray = [searchLogoArray valueForKey:@"IconURL"];
        artworkIDArray = [searchLogoArray valueForKey:@"ProductID"];
        artworkCompanyArray = [searchLogoArray valueForKey:@"CompanyName"];
        artworkSellerArray = [searchLogoArray valueForKey:@"Seller"];
        artworkColorArray = [searchLogoArray valueForKey:@"Color"];
        
        
        
    }];
    
    
    
    [searchMatArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
        
        
        
        
            matNameArray = [searchMatArray valueForKey:@"ArtworkName"];
            matCount= matNameArray.count;
            matSizeArray = [searchMatArray valueForKey:@"ArtworkSize"];
            matFormatArray = [searchMatArray valueForKey:@"Format"];
            matFullImageArray = [searchMatArray valueForKey:@"FullImageURL"];
            matIconArray = [searchMatArray valueForKey:@"IconURL"];
            matCompanyArray = [searchMatArray valueForKey:@"CompanyName"];
            matSellerArray = [searchMatArray valueForKey:@"Seller"];
            matIDArray = [searchMatArray valueForKey:@"ProductID"];
            matColorArray = [searchMatArray valueForKey:@"Color"];
            matBGColorArray = [searchMatArray valueForKey:@"BGColor"];
        
       // [activityIndicator stopAnimating];

        
        
        }];
    
   } else{
       
       UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter text in the search field" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
       
       [alert show];
   }
    
    
    
}




//moves logo around
//moves bg colors around
- (IBAction) imageMoved:(id) sender withEvent:(UIEvent *) event
{
    
    
    NSLog(@"Sender %@",sender);
    

    if([sender isKindOfClass:[UITextField class]]){
        self.lastMovedTextField = sender;
    }
    
    UITouch *t = [[event allTouches] anyObject];
    UIControl *control = sender;
    CGPoint center = control.center;
    
    
    CGPoint pPrev = [t previousLocationInView:control];
    CGPoint p = [t locationInView:control];
    center.x += p.x - pPrev.x;
    center.y += p.y - pPrev.y;
    control.center = center;
    
    
    
    if([sender isKindOfClass:[UIButton class]]){
        
       //[self.view bringSubviewToFront:sender];
        self.lastMovedButton = sender;
        NSInteger i = [sender tag];

        if (i== 121)
        {
            logoColorSelectedString=@"121-Steel Blue";
            NSLog(@"%@",logoColorSelectedString);
        }
        
        if (i== 123)
        {
            logoColorSelectedString=@"123-Suede";
            NSLog(@"%@",logoColorSelectedString);
        }
        if (i== 140)
        {
            logoColorSelectedString=@"140-White";
            NSLog(@"%@",logoColorSelectedString);
        }
        
        if (i== 119)
        {
            logoColorSelectedString=@"119-Rose";
            NSLog(@"%@",logoColorSelectedString);
        }
        
        if (i== 107)
        {
            logoColorSelectedString=@"107-Royal Blue";
            NSLog(@"%@",logoColorSelectedString);
        }
        
        if (i== 120)
        {
            logoColorSelectedString=@"120-Sandalwood";
            NSLog(@"%@",logoColorSelectedString);
        }
        if (i== 116)
        {
            logoColorSelectedString=@"116-Silver";
            NSLog(@"%@",logoColorSelectedString);
        }
        
        if (i== 127)
        {
            logoColorSelectedString=@"127-Orange";
            NSLog(@"%@",logoColorSelectedString);
        }
        if (i== 105)
        {
            logoColorSelectedString=@"105-Purple";
            NSLog(@"%@",logoColorSelectedString);
        }
        if (i== 112)
        {
            logoColorSelectedString=@"112-Red";
            NSLog(@"%@",logoColorSelectedString);
        }
        if (i== 109)
        {
            logoColorSelectedString=@"109-Gold";
            NSLog(@"%@",logoColorSelectedString);
        }
        if (i== 115)
        {
            logoColorSelectedString=@"115-Grey";
            NSLog(@"%@",logoColorSelectedString);
        }
        if (i== 106)
        {
            logoColorSelectedString=@"106-Light Blue";
            NSLog(@"%@",logoColorSelectedString);
        }
        if (i== 118)
        {
            logoColorSelectedString=@"118-Navy";
            NSLog(@"%@",logoColorSelectedString);
        }
        if (i== 110)
        {
            logoColorSelectedString=@"110-Emerald Green";
            NSLog(@"%@",logoColorSelectedString);
        }
        if (i== 117)
        {
            logoColorSelectedString=@"117-Forest Green";
            NSLog(@"%@",logoColorSelectedString);
        }
        if (i== 114)
        {
            logoColorSelectedString=@"114-Cranberry";
            NSLog(@"%@",logoColorSelectedString);
        }
        if (i== 103)
        {
            logoColorSelectedString=@"103-Dark Gold";
            NSLog(@"%@",logoColorSelectedString);
        }
        if (i== 101)
        {
            logoColorSelectedString=@"101-Charcoal";
            NSLog(@"%@",logoColorSelectedString);
        }
        if (i== 111)
        {
            logoColorSelectedString=@"111-Chocolate";
            NSLog(@"%@",logoColorSelectedString);
        }
        
        if (i== 126)
        {
            logoColorSelectedString=@"126-Clay";
            NSLog(@"%@",logoColorSelectedString);
        }
        if (i== 108)
        {
            logoColorSelectedString=@"108-Black";
            NSLog(@"%@",logoColorSelectedString);
        }
        if (i== 102)
        {
            logoColorSelectedString=@"102-Brown";
            NSLog(@"%@",logoColorSelectedString);
        }
        if (i== 100)
        {
            logoColorSelectedString=@"100-Burgundy";
            NSLog(@"%@",logoColorSelectedString);
        }
        if (i== 130)
        {
            logoColorSelectedString=@"130-Aquamarine";
            NSLog(@"%@",logoColorSelectedString);
        }
        if (i== 104)
        {
            logoColorSelectedString=@"104-Turquoise";
            NSLog(@"%@",logoColorSelectedString);
        }
        if (i== 128)
        {
            logoColorSelectedString=@"128-Yellow";
            NSLog(@"%@",logoColorSelectedString);
        }



        
    }
    
    
    NSLog(@"%@",logoColor1String);
    if (CGRectIntersectsRect(control.frame, logoColorButton1.frame)) {
        
        //_logoColorButton1.enabled=YES;
        //if(logoColor1String==nil){
        //if([logoColor1String isEqualToString:@""]){
        //if([logoColor1String length:0]){
        //if(_logoColorButton1.imageView==Nil){
        
            control.frame=logoColorButton1.frame;
            //_logoColorButton1.enabled=YES;
            logoColor1String=logoColorSelectedString;
            //logoColorButton1.enabled=NO;
            //_logoColorButton1.enabled=NO;
            
       /* }else{
                
                _logoColorButton1.enabled=YES;
            }*/
        
        
    
    
        
    }else if (CGRectIntersectsRect(control.frame, logoColorButton2.frame)){
        
        
       
            
            control.frame=logoColorButton2.frame;
            logoColorButton2.enabled=YES;
            logoColor2String=logoColorSelectedString;
            NSLog(@"logoColor2String%@",logoColor2String);
        
      
        
        NSLog(@"%@",matColorString);
        
    }else if (CGRectIntersectsRect(control.frame, logoColorButton3.frame)){
        
        
      
        
            control.frame=logoColorButton3.frame;
            logoColorButton3.enabled=YES;
            logoColor3String=logoColorSelectedString;
            //logoColorButton3.enabled=NO;
            
        
        
        
        NSLog(@"%@",matColorString);
        
    }else if (CGRectIntersectsRect(control.frame, logoColorButton4.frame)) {
        
      
        
            control.frame=logoColorButton4.frame;
            logoColorButton4.enabled=YES;
            logoColor4String=logoColorSelectedString;
        
        
    }else if (CGRectIntersectsRect(control.frame, logoColorButton5.frame)){
        
        
        
            control.frame=logoColorButton5.frame;
            logoColorButton5.enabled=YES;
            logoColor5String=logoColorSelectedString;
        
        
        
    } else if (CGRectIntersectsRect(control.frame, logoColorButton6.frame)){
        
        
        
             control.frame=logoColorButton6.frame;
             logoColorButton6.enabled=YES;
             logoColor6String=logoColorSelectedString;
        
       
        
        
        
    }else if(CGRectIntersectsRect(control.frame, logoColorButton7.frame)){
        
       
        
            control.frame=logoColorButton7.frame;
            logoColorButton7.enabled=YES;
            logoColor7String=logoColorSelectedString;
        
        


    }else if(CGRectIntersectsRect(control.frame, bgColorButton.frame)){
        
        control.frame=bgColorButton.frame;
        bgColorButton.enabled=YES;
        
        
    
        
    }

   
    
   matColorString= [NSString stringWithFormat:@"%@,%@,%@,%@,%@,%@,%@", logoColor1String, logoColor2String, logoColor3String, logoColor4String, logoColor5String, logoColor6String,logoColor7String];
   
    
    NSLog(@"matColorString pass%@",matColorString);

    
    
    
    
}



//moves logo around
//moves bg colors around
- (IBAction) imageMoved1:(id) sender withEvent:(UIEvent *) event
{
    
    UITouch *t = [[event allTouches] anyObject];
    UIControl *control = sender;
    CGPoint center = control.center;
    
    
    CGPoint pPrev = [t previousLocationInView:control];
    CGPoint p = [t locationInView:control];
    center.x += p.x - pPrev.x;
    center.y += p.y - pPrev.y;
    control.center = center;
    
    
    
    
    
}

/*-(void)imageMoved1:(id)sender {
    
    [sender isFirstResponder];
    
}*/


- (IBAction)cropSquare:(id)sender  {
    
    //not work
    
    UIImage *OrigImage = [UIImage imageNamed:selectedImage];
    UIImage *mask = [UIImage imageNamed:@"mask.png"];
    //UIImage *maskedImage = [self maskImage:OrigImage withMask:mask];
    //myUIImage.image = maskedImage;
}
    
    



#pragma mark - Drop Down Animated Menus

- (IBAction)goSignMat:(id)sender
{
    matButton.hidden =YES;
    logoButton.hidden= YES;
    titleLabel.hidden =YES;
    
    homeButton.hidden =YES;
    titleBar.hidden =YES;
    
    
    //begin capture entire webview
    //CGRect screenRect = self.view.frame;
    //CGRect screenRect = interactiveMatView.frame;
    
     //CGRect screenRect1 = CGRectMake(637.0,357.0,988,580);
    CGRect screenRect1 = CGRectMake(637.0,357.0,998,580);
   
    
    UIGraphicsBeginImageContext(screenRect1.size);
    //UIGraphicsBeginImageContext(interactiveMatView.size);
    
    CGContextRef ctx1 = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] set];
    CGContextFillRect(ctx1, screenRect1);
    
    [self.view.layer renderInContext:ctx1];
    
    UIImage *orderImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    //save image to documents
    
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/orderImage.jpg"]];
    [UIImageJPEGRepresentation(orderImage, 1.0) writeToFile:imagePath atomically:YES];
    
    //TODO pass save  orderImage to device and pass to SignOffScreen
    
    //chosenImageView.image = orderImage;
    //chosenImage = newImage;
    
    
    
    //NSLog(@"chosenImage %@",selectedImage);
    
    
    //_actionSelectedString=action;
    UIStoryboard *signStoryBoard = self.storyboard;
    SignOffViewController *signOffVC = [signStoryBoard instantiateViewControllerWithIdentifier:@"SignStoryBoard"];
    
    // Configure the new view controller here.
    [self presentViewController:signOffVC animated:YES completion:nil];
    
    
    
    
}




#pragma mark - Drop Down Animated Menus

- (IBAction)showMenu:(id)sender
{
    
    
    
    
    
    [DIYMenu show];
    [DIYMenu setDelegate:self];
        
    UIFont *font = [UIFont systemFontOfSize:14 ];

        
    [DIYMenu addMenuItem:@"transparent" withIcon:[UIImage imageNamed:@"skillsIcon@2x.png"] withColor:[UIColor colorWithWhite:0.70 alpha:.5] withFont:font];
    [DIYMenu addMenuItem:@"pics" withIcon:[UIImage imageNamed:@"skillsIcon@2x.png"] withColor:[UIColor colorWithWhite:0.70 alpha:.7] withFont:font];
    [DIYMenu addMenuItem:@"camera" withIcon:[UIImage imageNamed:@"exploreIcon@2x.png"] withColor:[UIColor colorWithWhite:0.70 alpha:.5] withFont:font];
    [DIYMenu addMenuItem:@"millenium" withIcon:[UIImage imageNamed:@"settingsIcon@2x.png"] withColor:[UIColor colorWithWhite:0.70 alpha:.7] withFont:font];
    [DIYMenu addMenuItem:@"search" withIcon:[UIImage imageNamed:@"settingsIcon@2x.png"] withColor:[UIColor colorWithWhite:0.70 alpha:.5] withFont:font];
    [DIYMenu addMenuItem:@"near me" withIcon:[UIImage imageNamed:@"settingsIcon@2x.png"] withColor:[UIColor colorWithWhite:0.70 alpha:.7] withFont:font];
    [DIYMenu addMenuItem:@"save" withIcon:[UIImage imageNamed:@"settingsIcon@2x.png"] withColor:[UIColor colorWithWhite:0.70 alpha:.5] withFont:font ];
        
    
}



-(IBAction)goAcquireSketches:(id)sender{
    
    
    UIStoryboard *storyboardLogo = self.storyboard;
    ImagePickerViewController *ImagePickerVC = [storyboardLogo instantiateViewControllerWithIdentifier:@"ImagePickerBoard"];
    
    // Configure the new view controller here.
    [self presentViewController:ImagePickerVC animated:YES completion:nil];
    
    
    
}
-(IBAction)goSketches:(id)sender{


    UIStoryboard *storyboardLogo = self.storyboard;
    LogoCollectionViewController *LogoCVC = [storyboardLogo instantiateViewControllerWithIdentifier:@"LogoViewBoard"];
    [self presentViewController:LogoCVC animated:YES completion:nil];
    
}





-(IBAction)goHome:(id)sender{
    
    
    
    UIStoryboard *storyboard = self.storyboard;
    ViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"HomeStoryboard"];
    [self presentViewController:vc animated:YES completion:nil];
    
    
}




-(IBAction)backButton:(id)sender{
    
     //[self dismissModalViewControllerAnimated:NO];
    
}

//# UpdateMatSize

-(IBAction)sizeFieldUpdate:(id)sender{
    
    
    
        
        //_widthField.text = _widthField.text;
        _widthCircleField.text =_widthField.text;
    
        //_heightField.text =_heightField.text;
        _heightCircleField.text = _heightField.text;
    
    
        int wMat = [_widthField.text intValue];
        int hMat = [_heightField.text intValue];
    
    
        NSNumber *wMatNumber = [NSNumber numberWithInt:wMat];
        NSNumber *hMatNumber = [NSNumber numberWithInt:hMat];
    
    
    
    /*int i = 60;
    float x = (float)i/100.0f;
    NSLog(@"%.2lf", x);*/
    //this will print 0.60

    
      if (  wMat > hMat)
          
      {
          float x = (float)hMat/wMat;
           NSLog(@"%.2lf", x);
          
          _doubleMat = x;
          /*_PercentMat =  hMatNumber/wMatNumber;
           NSLog(@"_PercentMat %d",_PercentMat);*/
          
      }
    
    
      else{
          
          float x = (float)wMat/hMat;
          NSLog(@"%.2lf", x);
          
          _doubleMat = x;
          
        /* _PercentMat = (float) wMat/hMat;
        NSLog(@"_PercentMat %d",_PercentMat);*/
          
          
      }
    
    
    
    
    
    if (wMat == hMat){
        
        
        size2by3View.hidden=YES;
        size3by5View.hidden=YES;
        size4by6View.hidden=YES;
        size3by10View.hidden=YES;
        
        CGRect myLogoMatRect = CGRectMake( 476.0f, 96.0f, 500.0f, 500.0f);
        
        matBGLogoView.frame=myLogoMatRect;
        matBGLogoView.contentMode = UIViewContentModeScaleToFill;

        
    }
    //((x >= 5) && (y < 10))
    else if ((_doubleMat >=.0)&&(_doubleMat <=.10)){
        
        size2by3View.hidden=YES;
        size3by5View.hidden=YES;
        size4by6View.hidden=YES;
        size3by10View.hidden=YES;
        
        
        CGRect myLogoMatRect = CGRectMake( 52.0f, 165.0f, 500.0f, 50.0f);
        
        matBGLogoView.frame=myLogoMatRect;
        matBGLogoView.contentMode = UIViewContentModeScaleToFill;
        
    }
    else if ((_doubleMat >=.10)&&(_doubleMat <=.20)){
        
       
         CGRect myLogoMatRect = CGRectMake( 52.0f, 155.0f, 500.0f, 100.0f);
        
        matBGLogoView.frame=myLogoMatRect;
        matBGLogoView.contentMode = UIViewContentModeScaleToFill;
        
    }
    
    else if ((_doubleMat >=.20)&&(_doubleMat <=.33)){
    //else if (_doubleMat ==.33){
        
        size2by3View.hidden=YES;
        size3by5View.hidden=YES;
        size4by6View.hidden=YES;
        size3by10View.hidden=YES;
        
        
        CGRect myLogoMatRect = CGRectMake( 52.0f, 125.0f, 500.0f, 165.0f);
        
        matBGLogoView.frame=myLogoMatRect;
        matBGLogoView.contentMode = UIViewContentModeScaleToFill;
        
    }
    else if ((_doubleMat >=.33)&&(_doubleMat <=.40)){
   
        
        
        size2by3View.hidden=YES;
        size3by5View.hidden=YES;
        size4by6View.hidden=YES;
        size3by10View.hidden=YES;
        
        CGRect myLogoMatRect = CGRectMake( 52.0f, 85.0f, 500.0f, 200.0f);
        
        matBGLogoView.frame=myLogoMatRect;
        matBGLogoView.contentMode = UIViewContentModeScaleToFill;
        
    }
    else if ((_doubleMat >=.40)&&(_doubleMat <=.50)){
   
        
       
        CGRect myLogoMatRect = CGRectMake( 52.0f, 85.0f, 500.0f, 250.0f);
        
        matBGLogoView.frame=myLogoMatRect;
        matBGLogoView.contentMode = UIViewContentModeScaleToFill;
        
    }


    
    
  
}




-(IBAction) Portrait:(id)sender{
    
    //portraitImageView.hidden=NO;
    //landscapeImageView.hidden=YES;
    
    textOrientField.hidden= NO;
    
    
    //textOrientField = [[UITextField alloc] initWithFrame:CGRectMake(445, 300, 200, 60)];
    //textNoteField.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    textOrientField.textColor = [UIColor redColor];
    textOrientField.font = [UIFont fontWithName:@"Avenir-Light" size:25];
    textOrientField.backgroundColor=[UIColor whiteColor];
    textOrientField.text=@"Portrait";
    [self.view addSubview:textNoteField];
    
    [textOrientField addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [textOrientField addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];

    //start here
    
    float x,y;
    float a,b;
    //float c,d;
    
    x=  matBGLogoView.frame.origin.x;
    y=  matBGLogoView.frame.origin.y;
    
    a = matBGLogoView.frame.size.width;
    b = matBGLogoView.frame.size.height;
    
    
    float difference;
    float divide;
    float xUse;
    
    float yUse;
    
    
    
    if(a > b){
        
        
        difference=a-b/2;
        divide=difference/2;
        
        
        
        matBGLogoView.frame = CGRectMake (x+divide/2, y-divide/2, b , a);
        
        
        
        
      
    } else{
        
        difference=b-a/2;
        divide=difference/2;
        
        xUse= x-divide;
        
        
        matBGLogoView.frame = CGRectMake (x-divide/2, y+divide/2, b , a);
       
    }
    
        
   
    
}

-(IBAction)Landscape:(id)sender{
    
    //portraitImageView.hidden=YES;
    //landscapeImageView.hidden=YES;
    
    //textOrientField.hidden= YES;
    //textOrientField.textColor = [UIColor redColor];
    //textOrientField.font = [UIFont fontWithName:@"Avenir-Light" size:25];
    //textOrientField.backgroundColor=[UIColor whiteColor];
    
    if ([orientString isEqualToString:@"Landscape"])
    {
        
        textOrientField.text=@"Landscape";
        orientString=@"Portrait";
        
    }else{
        
        
        textOrientField.text=@"Portrait";
        orientString=@"Landscape";
        
    }
    //[self.view addSubview:textOrientField];
    
    [textOrientField addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [textOrientField addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];

    float x,y;
    float a,b;
    //float c,d;
    
    x=  matBGLogoView.frame.origin.x;
    y=  matBGLogoView.frame.origin.y;
    
    a = matBGLogoView.frame.size.width;
    b = matBGLogoView.frame.size.height;
    
    
    float divideWidthFrame;
    float dividedWidth;
    float divideHeightFrame;
    float dividedHeight;
    
    float newXOrigin;
    float newYOrigin;
    
    //float yUse;
    
    
    
    if(a > b){
        
        
        divideWidthFrame=601-b;
        dividedWidth=divideWidthFrame/2;
        //newXOrigin=724-dividedWidth;
        newXOrigin=dividedWidth;
        
        divideHeightFrame=416-a;
        dividedHeight=divideHeightFrame/2;
        //newYOrigin=346-dividedHeight*2;
        //newYOrigin=dividedHeight;
        matBGLogoView.frame = CGRectMake (newXOrigin, dividedHeight+10, b , a);
        
        //matBGLogoView.center = self.view.center;
        //matBGLogoView.center = interactiveMatView.center;
        
       //put logo back where it originally was
        float x,y;
        float a,b;
        x = logoPicButton.frame.size.width;
        y = logoPicButton.frame.size.height;
        a=logoPicButton.frame.origin.x;
        b=logoPicButton.frame.origin.y;
        
        NSLog(@"image after aspect fit: width=%f height=%f",x,y);
        logoPicButton.frame = CGRectMake(a, b, x, y);
        
       
    } else{
        
        divideWidthFrame=601-b;
        dividedWidth=divideWidthFrame/2;
        
        
        
        divideHeightFrame=416-a;
        dividedHeight=divideHeightFrame/2;
        newYOrigin=dividedHeight;
        matBGLogoView.frame = CGRectMake (dividedWidth, newYOrigin+10, b , a);
        
        
        //put logo back where it originally was
        float x,y;
        float a,b;
        x = logoPicButton.frame.size.width;
        y = logoPicButton.frame.size.height;
        a=logoPicButton.frame.origin.x;
        b=logoPicButton.frame.origin.y;
        
        NSLog(@"image after aspect fit: width=%f height=%f",x,y);
        logoPicButton.frame = CGRectMake(a, b, x, y);
    }
    
}







-(IBAction) twoByTwo:(id)sender{
    
    sizeString=@"2' x 3'";
    size2by3View.hidden=NO;
    size3by5View.hidden=YES;
    size4by6View.hidden=YES;
    size3by10View.hidden=YES;
    
    _widthField.text = @"2'";
    _widthCircleField.text = @"2'";
    
    _heightField.text = @"3'";
    _heightCircleField.text = @"3'";
    
    //CGRect myLogoMatRect = CGRectMake( 576.0f, 250.0f, 300.0f, 200.0f);
    //CGRect myLogoMatRect = CGRectMake( 150.0f, 100.0f, 300.0f, 200.0f);
    //CGRect myLogoMatRect = CGRectMake( 150.0f, 108.0f, 300.0f, 200.0f);
    CGRect myLogoMatRect = CGRectMake( 120.5f, 88.0f, 360.0f, 240.0f);
    //601 411
    matBGLogoView.frame=myLogoMatRect;
    //matBGLogoView.ContentMode=  UIViewContentModeScaleAspectFit;
    matBGLogoView.contentMode = UIViewContentModeScaleToFill;

    
}
//3by5
-(IBAction) threeByFive:(id)sender{
    
    sizeString=@"3' x 5'";

    size3by5View.hidden=NO;
    size2by3View.hidden=YES;
    size4by6View.hidden=YES;
    size3by10View.hidden=YES;
    
    _widthField.text = @"3'";
    _widthCircleField.text = @"3'";
    
    _heightField.text = @"5'";
    _heightCircleField.text = @"5'";
    
    
    CGRect myLogoMatRect = CGRectMake( 46.0f, 50.0f, 500.0f, 300.0f);
    
    matBGLogoView.frame=myLogoMatRect;
    //matBGLogoView.ContentMode=  UIViewContentModeScaleAspectFit;
    matBGLogoView.contentMode = UIViewContentModeScaleToFill;
    
  
    
    
    
}

-(IBAction) fourBySix:(id)sender{
    
    
    sizeString=@"4' x 6'";
    
    size3by5View.hidden=YES;
    size2by3View.hidden=YES;
    size4by6View.hidden=NO;
    size3by10View.hidden=YES;
   
    _widthField.text = @"4'";
    _widthCircleField.text = @"4'";
    
    _heightField.text = @"6'";
    _heightCircleField.text = @"6'";
    
    //CGRect myLogoMatRect = CGRectMake(75.0f, 58.0f, 450.0f, 300.0f);
    //CGRect myLogoMatRect = CGRectMake(30.0f, 23.0f, 540.0f, 360.0f);
     CGRect myLogoMatRect = CGRectMake(41.0f, 33.0f, 520.0f, 346.0f);
   
    
    
    matBGLogoView.frame=myLogoMatRect;
    //matBGLogoView.ContentMode=  UIViewContentModeScaleAspectFit;
    matBGLogoView.contentMode = UIViewContentModeScaleToFill;
}

-(IBAction) threeByTen:(id)sender{
    
    
    sizeString=@"3' x 10'";
    
    size3by5View.hidden=YES;
    size2by3View.hidden=YES;
    size4by6View.hidden=YES;
    size3by10View.hidden=NO;
    
    _widthField.text = @"3'";
    _widthCircleField.text = @"3'";
    
    _heightField.text = @"10'";
    _heightCircleField.text = @"10'";
    
    //CGRect myLogoMatRect = CGRectMake( 56.0f, 130.0f, 500.0f, 150.0f);
    //CGRect myLogoMatRect = CGRectMake( 56.0f, 130.0f, 400.0f, 120.0f);
    //601 416
    CGRect myLogoMatRect = CGRectMake( 100.0f, 148.0f, 400.0f, 120.0f);
    
    matBGLogoView.frame=myLogoMatRect;
    //matBGLogoView.ContentMode=  UIViewContentModeScaleAspectFit;
    matBGLogoView.contentMode = UIViewContentModeScaleToFill;

    
}
-(IBAction) goFontPicker:(id)sender{
    
    [self.view addSubview:fontPicker];
    //[self.fontPicker removeFromSuperview];
}

-(IBAction) hideFontPicker:(id)sender{
    
    [self.fontPicker removeFromSuperview];
}





/*- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    //UILabel* lbl = (UILabel*)view;
    // Customise Font
    if (textDecField == nil) {
        //label size
        CGRect frame = CGRectMake(0.0, 0.0, 70, 30);
        
        textDecField = [[UILabel alloc] initWithFrame:frame];
        
        [textDecField setTextAlignment:UITextAlignmentLeft];
        
        [textDecField setBackgroundColor:[UIColor clearColor]];
        //textDecField.numberOfLines=3;
        //here you can play with fonts
        [textDecField setFont:[UIFont fontWithName:@"Times New Roman" size:14.0]];
        
    }
    //picker view array is the datasource
    [textDecField setText:[pickerViewFontArray objectAtIndex:row]];
    
    
    return textDecField;
}*/

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)fontPicker{
    return 3;
}


- (NSInteger)pickerView:(UIPickerView *)fontPicker
numberOfRowsInComponent:(NSInteger)component
{
    
    if (component==0){
     
        return familyNamesArray.count;
        
    }else if(component==1){
    
        return colorNamesImagesArray.count;
    
   
    }else{
    
        return fontSizeArray.count;
    
}
    
}




- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row
          forComponent:(NSInteger)component reusingView:(UIView *)view
{
    if (component==0){
    
        UILabel *firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 500, 270)];
        firstLabel.text = [familyNamesArray objectAtIndex:row];
        firstLabel.textAlignment = NSTextAlignmentCenter;
        //[firstLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:10.0]];
        [firstLabel setFont:[UIFont fontWithName:[familyNamesArray objectAtIndex:row] size:14.0]];
        firstLabel.backgroundColor = [UIColor clearColor];
        
        return firstLabel;
        
    }else if (component==1){
    //add number labels here
        UILabel *secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 0, 50, 50)];
        secondLabel.text = [colorNumbersArray objectAtIndex:row];
        secondLabel.textAlignment = UITextAlignmentLeft;
        secondLabel.backgroundColor = [UIColor clearColor];
    
        
        UIImageView *icon = [colorNamesImagesArray objectAtIndex:row];
        icon.frame = CGRectMake(200, 0, 50, 50);
    
    
    return icon;
    return secondLabel;
        
        
           }else{
        
        UILabel *thirdLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 500, 50)];
        thirdLabel.text = [fontSizeArray objectAtIndex:row];
        thirdLabel.textAlignment = NSTextAlignmentCenter;
        [thirdLabel setFont:[UIFont fontWithName:[familyNamesArray objectAtIndex:row] size:14.0]];
        thirdLabel.backgroundColor = [UIColor clearColor];
        return thirdLabel;

    }
    
  
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    /*ViewController*InteractiveViewController;
    InteractiveViewController=(ViewController*)self.delegate;*/
    
    /*ViewController*initialView;
    initialView=(ViewController*)self.delegate;*/
    
    

    if(component==0)
    {
        int chosenFont=[pickerView selectedRowInComponent:0];
        /*
        //[textDecField setFont:[UIFont fontWithName:[familyNamesArray objectAtIndex:row] size:14.0]];
        chosenFontString=[familyNamesArray objectAtIndex:chosenFont];
        [self.lastMovedTextField setFont:[UIFont fontWithName:[familyNamesArray objectAtIndex:chosenFont] size:chosenFontSize]];
        [_selectedTextField setFont:[UIFont fontWithName:[familyNamesArray objectAtIndex:chosenFont] size:chosenFontSize]];
        
        [_selectedTextField  setFont:[UIFont fontWithName:chosenFontString size:chosenFontSize]];
         textDecField.textColor= [UIColor colorWithRed:redValue/225.0f green:greenValue/225.0f  blue:blueValue/225.0f alpha:1];
        */
        chosenFontString=[familyNamesArray objectAtIndex:chosenFont];
        self.lastMovedTextField.textColor= [UIColor colorWithRed:redValue/225.0f green:greenValue/225.0f  blue:blueValue/225.0f alpha:1];
        [self.lastMovedTextField setFont:[UIFont fontWithName:chosenFontString size:chosenFontSize]];
        
        
    }else if (component==1) {
    
        
       int chosenColor=[pickerView selectedRowInComponent:1];
       chosenColorInt=[pickerView selectedRowInComponent:1];
        NSLog(@"%i",chosenColorInt);
        
        redInt=[redArray objectAtIndex:chosenColorInt];
         NSLog(@"%i",chosenColorInt);
        greenInt=[greenArray objectAtIndex:chosenColorInt];
        blueInt=[blueArray objectAtIndex:chosenColorInt];
        
        redValue = [redInt intValue];
        greenValue = [greenInt intValue];
        blueValue = [blueInt intValue];
        //convertStringTo an Integer
        
        textDecField.textColor= [UIColor colorWithRed:redValue/225.0f green:greenValue/225.0f  blue:blueValue/225.0f alpha:1];
        
        
        //textDecField.textColor= [UIColor colorWithRed:40/225.0f green:75/225.0f  blue:230/225.0f alpha:1];

       
       
        
    }else{
     
        int chosenFontSize1=[pickerView selectedRowInComponent:2];
        chosenFontSize= chosenFontSize1 * 10;
        
        //chosenFontSize=[fontSizeArray objectAtIndex:chosenFontSize];
        [textDecField setFont:[UIFont fontWithName:chosenFontString size:chosenFontSize]];
        textDecField.textColor= [UIColor colorWithRed:redValue/225.0f green:greenValue/225.0f  blue:blueValue/225.0f alpha:1];
        [_selectedTextField setFont:[UIFont fontWithName:chosenFontString size:chosenFontSize]];
        _selectedTextField.textColor= [UIColor colorWithRed:redValue/225.0f green:greenValue/225.0f  blue:blueValue/225.0f alpha:1];
        
        
          }
}

-(CGFloat)pickerView:(UIPickerView *)fontPicker rowHeightForComponent:(NSInteger)component{
    
    return 75.0;
}


-(CGFloat)pickerView:(UIPickerView *)fontPicker rowWidthForComponent:(NSInteger)component{
    if (component==0){
    
        return 600.0;
        
    }else if (component==1){
        
        return 300.0;
        
    }else{
        
        return 300.0;
        
    }
    
}

//Not Used
#pragma mark-
#pragma mark Segue

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([segue.identifier isEqualToString:@"InteractiveSegue"]) {
        
        InteractiveViewController *goingController = segue.destinationViewController;
        //[self presentViewController:destViewController animated:YES completion:nil];
        //NSLog(@"locationIDString %@",locationIDString);
        goingController.locationIDString = locationIDString;
        goingController.matUseBGColorString = matUseBGColorString;
        
        
    }
    
    if ([segue.identifier isEqualToString:@"MatPickedSegue"]) {
        
        SignOffViewController *destViewController = segue.destinationViewController;
        //[self presentViewController:destViewController animated:YES completion:nil];
        
        destViewController.matImage=interactiveMatView.image;
        destViewController.logoImage=logoPicButton.imageView.image;

        
        
        
        
    }
    
    if ([segue.identifier isEqualToString:@"SearchSegue"]) {
        
        LogoCollectionViewController *goingController = segue.destinationViewController;
        
        //NSLog(@"locationIDString %@",locationIDString);
        
        goingController.locationIDString = locationIDString;
        
        goingController.artworkNameArray = artworkNameArray;
        goingController.artworkCount = artworkCount;
        goingController.artworkSizeArray = artworkSizeArray;
        goingController.artworkFormatArray = artworkFormatArray;
        goingController.artworkIconArray = artworkIconArray;
        goingController.artworkFullImageArray = artworkFullImageArray;
        goingController.artworkIDArray = artworkIDArray;
        goingController.artworkSellerArray = artworkSellerArray;
        goingController.artworkCompanyArray = artworkCompanyArray;
        goingController.artworkColorArray = artworkColorArray;
        
        goingController.matCount = matCount;
        goingController.matNameArray = matNameArray;
        goingController.matSizeArray = matSizeArray;
        goingController.matFormatArray = matFormatArray;
        goingController.matIconArray = matIconArray;
        goingController.matFullImageArray = matFullImageArray;
        goingController.matIDArray = matIDArray;
        goingController.matCompanyArray = matCompanyArray;
        goingController.matSellerArray = matSellerArray;
        goingController.matColorArray = matColorArray;
        goingController.matBGColorArray = matBGColorArray;
        
        
        
    }


    
}







#pragma mark-
#pragma mark Image picking
/*- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    //UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    [_logoPicButton setBackgroundImage:chosenImage forState:UIControlStateNormal];
    
    //self.imageView.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    AppDelegate *appdelegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    appdelegate.model=NO;
    
    //[self.viewDidLoad reload];
    //[DIYMenu show];
    
}*/





#pragma mark - Rotation

/*- (NSUInteger)supportedInterfaceOrientations
{
    return (UIInterfaceOrientationMaskLandscapeLeft);
}*/

/*- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return false;
    return NO;
}

-(BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationLandscapeLeft;
}*/

-(void)widthFieldDidChange:(UITextField *)widthField{
    
}


-(void)heightFieldDidChange:(UITextField *)heightField{
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    
}


// The mail compose view controller delegate method
- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error
{
    //[self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}
-(void) handleLongPress1:(UITapGestureRecognizer*) sender{
    
    if(steelBlueButton){
        
        steelBlueButton.frame = CGRectMake(37,613,38,38);
    }
}

-(void)ifButtonCollides{
    
    
    

    
   /* if (CGRectIntersectsRect(bgColorButton.frame, _logoColorButton1.frame)) {
       
        bgColorButton.frame=_logoColorButton1.frame;
        
    }else if (CGRectIntersectsRect(bgColorButton.frame, _logoColorButton2.frame)){
        
        bgColorButton.frame=_logoColorButton2.frame;
    
    } else if (CGRectIntersectsRect(bgColorButton.frame, _logoColorButton3.frame)){
        
        bgColorButton.frame=_logoColorButton3.frame;
        
    }*/
}

/*-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    // Determine if the touch is inside the custom subview
    if ([touch view] == self.view){
        
        
        // If it is, prevent all of the delegate's gesture recognizers
        // from receiving the touch
        return YES;
    }
    return YES;
}*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    [DIYMenu dismiss];
    //[DIYMenu dismiss];
    //[self menuCancelled];
    
    self.carouselSize = nil;
    self.carouselColor = nil;
    self.rugSizeButton = nil;
    self.rugColorButton = nil;
    //[self reloadInputViews];
}




@end
