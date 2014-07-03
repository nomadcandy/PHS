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

@end

@implementation InteractiveViewController

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
@synthesize logoColorNumberArray;

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




@synthesize matUseBGColorString;
@synthesize matBGColorString;
@synthesize logoBGColorString;
@synthesize nameString;
@synthesize sellerString;
@synthesize companyString;
@synthesize numberString;
@synthesize sizeString;

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


//Not Used
/*-(void)ViewDidAppear
{
    NSLog(@"nameStringHere %@",nameString);
    nameField.text =nameString;
    
    NSLog(@"logoUseStringSend %@",_logoUseStringHere);
     NSLog(@"logoUseStringSendDidAppear %@",_logoUseStringHere);
    
    if (_logoUseStringHere == Nil){
        
        selectedImage = [UIImage imageNamed:@"jadeteahouselogo.png"];
        //UIImage *image = [UIImage imageNamed:@"JadeTeaHouseLogo.png"];
		//_logoPicButton = [UIButton buttonWithType:UIButtonTypeCustom];
		[logoPicButton setBackgroundImage:selectedImage forState:UIControlStateNormal];
    }
    
    else {
        
        logoPicButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage*freshImage = [UIImage imageNamed:_logoUseStringHere];
        NSLog(@"logoUseStringImageName %@",_logoUseStringHere);
		//[logoPicButton setBackgroundImage:freshImage forState:UIControlStateNormal];
        [logoPicButton setImage:freshImage forState:UIControlStateNormal];
        UIImageView * imgView = [[UIImageView alloc] initWithImage:freshImage];
        [logoPicButton addSubview:imgView];
        
    }

    
}*/





- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.fontPicker removeFromSuperview];
    
    
    
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
    
    
    
    /*[[NSMutableArray alloc] initWithObjects:
     [UIImage imageNamed:@"one.jpg"],
     [UIImage imageNamed:@"two.jpg"],
     [UIImage imageNamed:@"three.jpg"],
     [UIImage imageNamed:@"four.jpg"],
     [UIImage imageNamed:@"five.jpg"], nil];*/
     colorNamesImagesArray =@[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Steel Blue_121.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Suede_123.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"White_140.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Rose_119.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Royal Blue_107.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Sandalwood_120.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Silver_116"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Orange_127.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Purple_105.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Red_112.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Gold_109.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Grey_115.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Light Blue_106.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Navy_118.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Emerald Green_110.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Forest Green_117.jpg"] ],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Cranberry_114.jpg"] ],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Dark Gold_103.jpg"] ],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Charcoal_101.jpg"] ],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Chocolate_111.jpg"] ],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Clay_126.jpg"] ],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Black_108.jpg"] ],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Brown_102.jpg"] ],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Burgundy_100.jpg"] ],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Aquamarine_130.jpg"] ],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Turquoise_104.jpg"]],
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Yellow_128.jpg"]]];
                  
    
    
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
        portraitImageView.hidden=YES;
        landscapeImageView.hidden=NO;
        
    }
    
    if([orientString isEqualToString:@"portrait"])
    {
        portraitImageView.hidden=NO;
        landscapeImageView.hidden=YES;

        
    } else {
        portraitImageView.hidden=YES;
        landscapeImageView.hidden=YES;
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

    
    [activityIndicator stopAnimating];
    matView1.hidden= YES;
   
    searchField.textAlignment = NSTextAlignmentCenter;
    
    
    [_widthField addTarget:self
                   action:@selector(sizeFieldUpdate:)
         forControlEvents:UIControlEventEditingChanged];
    
    [_heightField addTarget:self
                    action:@selector(sizeFieldUpdate:)
          forControlEvents:UIControlEventEditingChanged];

    
    textOrientField.hidden= YES;
    
    
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
        
        nameField.text =nameString;
        
    }
    
    if(sellerString!=NULL){
        
            sellerField.text =sellerString;
        
    }
    
    if(companyString!=NULL){
        
        companyField.text =companyString;
        
    }
    
    
    numberField.text =numberString;
        
    
    
    headerLabel.text= interactiveHeaderString;
    
    
    //To Do add Logo sizing when available
    /*int wLogo = [_widthField.text intValue];
    int hLogo = [_heightField.text intValue];
    
    int wLogoHundred = w*100;
    int hLogoHundred = h*100;*/

    
    /*CGFloat width = w;
    CGFloat height = w;*/
    
    
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scale:)] ;
	[pinchRecognizer setDelegate:self];
	[self.logoPicButton addGestureRecognizer:pinchRecognizer];
    
    UIPinchGestureRecognizer *pinchRecognizerDec = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scaleDec:)] ;
	[pinchRecognizerDec setDelegate:self];
	[self.textDecField addGestureRecognizer:pinchRecognizerDec];
    
    [_steelBlueButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_steelBlueButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    _steelBlueButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _steelBlueButton.layer.shadowOffset = CGSizeMake(1.00f, 1.00f);
    _steelBlueButton.layer.shadowOpacity = 1.00f;
    _steelBlueButton.layer.shadowRadius = 3.0f;
    
    
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
    
    
    if([interactiveHeaderString isEqualToString:@"Logo Picked"]){
        
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

        
        UIImage*whiteImage = [UIImage imageNamed:@"white_140.jpg"];
        [_logoColorButton1 setBackgroundImage:whiteImage forState:UIControlStateNormal];
        [_logoColorButton2 setBackgroundImage:whiteImage forState:UIControlStateNormal];
        [_logoColorButton3 setBackgroundImage:whiteImage forState:UIControlStateNormal];
        [_logoColorButton4 setBackgroundImage:whiteImage forState:UIControlStateNormal];
        [_logoColorButton5 setBackgroundImage:whiteImage forState:UIControlStateNormal];
        [_logoColorButton6 setBackgroundImage:whiteImage forState:UIControlStateNormal];
        [_logoColorButton7 setBackgroundImage:whiteImage forState:UIControlStateNormal];
        
        NSString*emptyString = @" ";
        [_logoColorButton1 setTitle:emptyString forState:UIControlStateNormal];
        [_logoColorButton2 setTitle:emptyString forState:UIControlStateNormal];
        [_logoColorButton3 setTitle:emptyString forState:UIControlStateNormal];
        [_logoColorButton4 setTitle:emptyString forState:UIControlStateNormal];
        [_logoColorButton5 setTitle:emptyString forState:UIControlStateNormal];
        [_logoColorButton6 setTitle:emptyString forState:UIControlStateNormal];
        [_logoColorButton7 setTitle:emptyString forState:UIControlStateNormal];
        
        
        [self.logoColorButton1 reloadInputViews];
        [self.logoColorButton2 reloadInputViews];
        [self.logoColorButton3 reloadInputViews];
        [self.logoColorButton4 reloadInputViews];
        [self.logoColorButton5 reloadInputViews];
        [self.logoColorButton6 reloadInputViews];
        [self.logoColorButton7 reloadInputViews];
        
        
    }
   

    
    if([interactiveHeaderString isEqualToString:@"Edit Mat"]){
        
        
        
        if([orientString isEqualToString:@"landscape"])
        {
            portraitImageView.hidden=YES;
            landscapeImageView.hidden=NO;
            
        }
        
        if([orientString isEqualToString:@"portrait"])
        {
            portraitImageView.hidden=NO;
            landscapeImageView.hidden=YES;
            
        }
        
        else {
            
            portraitImageView.hidden=YES;
            landscapeImageView.hidden=YES;
            
        }

        
        matView1.hidden= NO;
        matBGLogoView.hidden= YES;
        
        //NSLog(@"sizeStringHere %@",sizeString);
        
        NSString *sizeGetMatString = sizeString;
        
        
                
        
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
        
        
        
        
        if (matColorArray == nil)
        {
            matColorArray = [[NSMutableArray alloc] init];
        }
        
        //NSLog(@"matColorArray %@",matColorArray);
        
        
        if (matColorNumberArray == nil)
        {
            matColorNumberArray = [[NSMutableArray alloc] init];
        }
        
        
        
        
        
        NSString *string = _matColorString;
        if ([string rangeOfString:@"108-Black"].location == NSNotFound) {
            //NSLog(@"string does not contain bla");
            
            
            
        } else {
            //NSLog(@"black Found!");
            
            [matColorArray addObject:@"Black_108.jpg"];
            [matColorNumberArray addObject:@"108"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"121-Steel Blue"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Steel Blue_121.jpg"];
            [matColorNumberArray addObject:@"121"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"123-Suede"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Suede_123.jpg"];
            [matColorNumberArray addObject:@"123"];
            
        }
        
        if ([string rangeOfString:@"140-White"].location == NSNotFound) {
            
            NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"White_140.jpg"];
            [matColorNumberArray addObject:@"140"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"119-Rose"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Rose_119.jpg"];
            [matColorNumberArray addObject:@"119"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"107-Royal Blue"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Royal Blue_107.jpg"];
            [matColorNumberArray addObject:@"107"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"120-Sandalwood"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Sandalwood_120.jpg"];
            [matColorNumberArray addObject:@"120"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"116-Silver"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Silver_116.jpg"];
            [matColorNumberArray addObject:@"116"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"127-Orange"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Orange_127.jpg"];
            [matColorNumberArray addObject:@"127"];
            
            
        }
        
        if ([string rangeOfString:@"105-Purple"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Purple_105.jpg"];
            [matColorNumberArray addObject:@"105"];
            
            
            
        }
        
        if ([string rangeOfString:@"112-Red"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Red_112.jpg"];
            [matColorNumberArray addObject:@"112"];
            
            
        }
        
        if ([string rangeOfString:@"109-Gold"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Gold_109.jpg"];
            [matColorNumberArray addObject:@"109"];
            
            
        }
        
        if ([string rangeOfString:@"115-Grey"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Grey_115.jpg"];
            [matColorNumberArray addObject:@"115"];
        }
        
        if ([string rangeOfString:@"106-Light Blue"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Light Blue_106.jpg"];
            [matColorNumberArray addObject:@"106"];
            
            
        }
        
        if ([string rangeOfString:@"118-Navy"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Navy_118.jpg"];
            [matColorNumberArray addObject:@"118"];
            
        }
        
        if ([string rangeOfString:@"110-Emerald Green"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Emerald Green_110.jpg"];
            [matColorNumberArray addObject:@"110"];
        }
        
        if ([string rangeOfString:@"117-Forest Green"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Forest Green_117.jpg"];
            [matColorNumberArray addObject:@"117"];
        }
        
        if ([string rangeOfString:@"114-Cranberry"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Cranberry_114.jpg"];
            [matColorNumberArray addObject:@"114"];
            
        }
        
        if ([string rangeOfString:@"103-Dark Gold"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Dark Gold_103.jpg"];
            [matColorNumberArray addObject:@"103"];
            
        }
        
        if ([string rangeOfString:@"101-Charcoal"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Charcoal_101.jpg"];
            [matColorNumberArray addObject:@"101"];
            
        }
        
        if ([string rangeOfString:@"111-Chocolate"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Chocolate_111.jpg"];
            [matColorNumberArray addObject:@"111"];
            
        }
        
        if ([string rangeOfString:@"126-Clay"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Clay_126.jpg"];
            [matColorNumberArray addObject:@"126"];
            
        }
        
        if ([string rangeOfString:@"102-Brown"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Brown_102.jpg"];
            [matColorNumberArray addObject:@"102"];
            
        }
        
        if ([string rangeOfString:@"100-Burgundy"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Burgundy_100.jpg"];
            [matColorNumberArray addObject:@"100"];
            
        }
        
        if ([string rangeOfString:@"130-Aquamarine"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Aquamarine_130.jpg"];
            [matColorNumberArray addObject:@"130"];
            
        }
        
        if ([string rangeOfString:@"104-Turquoise"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Turquoise_104.jpg"];
            [matColorNumberArray addObject:@"104"];
            
            
        }
        
        if ([string rangeOfString:@"128-Yellow"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [matColorArray addObject:@"Yellow_128.jpg"];
            [matColorNumberArray addObject:@"128"];
            
            
        }
        
        
        //NSLog(@"%@ matBGColorString", matBGColorString);
        NSString *BGString = matBGColorString;
        if ([BGString rangeOfString:@"108-Black"].location == NSNotFound) {
            //NSLog(@"string does not contain bla");
            
            
            
        } else {
            //NSLog(@"black Found!");
            
            matUseBGColorString = @"Black_108.jpg";
            matBGTextColorString=@"108";
            //add string to an array
            
        }
        
        if ([BGString rangeOfString:@"121-Steel Blue"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            matUseBGColorString = @"Steel Blue_121.jpg";
            matBGTextColorString=@"121";
            //add string to an array
            
        }
        
        if ([BGString rangeOfString:@"123-Suede"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            matUseBGColorString=@"Suede_123.jpg";
            matBGTextColorString=@"123";
            
        }
        
        if ([BGString rangeOfString:@"140-White"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            matUseBGColorString=@"White_140.jpg";
            matBGTextColorString=@"140";
            
            
        }
        
        if ([BGString rangeOfString:@"119-Rose"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            matUseBGColorString=@"Rose_119.jpg";
            matBGTextColorString=@"119";
            
            
        }
        
        if ([BGString rangeOfString:@"107-Royal Blue"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            matUseBGColorString=@"Royal Blue_107.jpg";
            matBGTextColorString=@"107";
            //add string to an array
            
        }
        
        if ([BGString rangeOfString:@"120-Sandalwood"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            matUseBGColorString=@"Sandalwood_120.jpg";
            matBGTextColorString=@"120";
            //add string to an array
            
        }
        
        if ([BGString rangeOfString:@"116-Silver"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            matUseBGColorString=@"Silver_116.jpg";
            matBGTextColorString=@"116";
            //add string to an array
            
        }
        
        if ([BGString rangeOfString:@"127-Orange"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
             matUseBGColorString=@"Orange_127.jpg";
             matBGTextColorString=@"127";
            
            
        }
        
        if ([BGString rangeOfString:@"105-Purple"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            matUseBGColorString=@"Purple_105.jpg";
            matBGTextColorString=@"105";
            
            
            
        }
        
        if ([BGString rangeOfString:@"112-Red"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
             matUseBGColorString=@"Red_112.jpg";
             matBGTextColorString=@"112";
            
            
        }
        
        if ([BGString rangeOfString:@"109-Gold"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            matUseBGColorString=@"Gold_109.jpg";
            matBGTextColorString=@"109";
            
            
        }
        
        if ([BGString rangeOfString:@"115-Grey"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
             matUseBGColorString=@"Grey_115.jpg";
             matBGTextColorString= @"115";
        }
        
        if ([BGString rangeOfString:@"106-Light Blue"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            matUseBGColorString=@"Light Blue_106.jpg";
            matUseBGColorString=@"106";
            
            
        }
        
        if ([BGString rangeOfString:@"118-Navy"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            matUseBGColorString=@"Navy_118.jpg";
            matBGTextColorString=@"118";
            
        }
        
        if ([BGString rangeOfString:@"110-Emerald Green"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            matUseBGColorString=@"Emerald Green_110.jpg";
            matBGTextColorString=@"110";
        }
        
        if ([BGString rangeOfString:@"117-Forest Green"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            matUseBGColorString=@"Forest Green_117.jpg";
            matBGTextColorString=@"117";
        }
        
        if ([BGString rangeOfString:@"114-Cranberry"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            matUseBGColorString=@"Cranberry_114.jpg";
            matBGTextColorString=@"114";
            
        }
        
        if ([BGString rangeOfString:@"103-Dark Gold"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            matUseBGColorString=@"Dark Gold_103.jpg";
            matBGTextColorString=@"103";
            
        }
        
        if ([BGString rangeOfString:@"101-Charcoal"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            matUseBGColorString=@"Charcoal_101.jpg";
            matBGTextColorString=@"101";
            
        }
        
        if ([BGString rangeOfString:@"111-Chocolate"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            matUseBGColorString=@"Chocolate_111.jpg";
            matBGTextColorString=@"111";
            
        }
        
        if ([BGString rangeOfString:@"126-Clay"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            matUseBGColorString=@"Clay_126.jpg";
            matBGTextColorString=@"126";
            
        }
        
        if ([BGString rangeOfString:@"102-Brown"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            matUseBGColorString=@"Brown_102.jpg";
            matBGTextColorString=@"102";
            
        }
        
        if ([BGString rangeOfString:@"100-Burgundy"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            matUseBGColorString=@"Burgundy_100.jpg";
            matBGTextColorString=@"100";
            
        }
        
        if ([BGString rangeOfString:@"130-Aquamarine"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            matUseBGColorString=@"Aquamarine_130.jpg";
            matBGTextColorString=@"130";
            
        }
        
        if ([BGString rangeOfString:@"104-Turquoise"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            matUseBGColorString=@"Turquoise_104.jpg";
            matBGTextColorString=@"104";
            
            
        }
        
        if ([BGString rangeOfString:@"128-Yellow"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            matUseBGColorString=@"Yellow_128.jpg";
            matBGTextColorString=@"128";
            
            
        }

        
        
        
        
        UIImage*matBGColorImage = [UIImage imageNamed:matUseBGColorString];
        [bgColorButton setBackgroundImage:matBGColorImage forState:UIControlStateNormal];
        [bgColorButton setImage:matBGColorImage forState:UIControlStateNormal];
        [bgColorButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
        [bgColorButton setTitle:matBGTextColorString forState:UIControlStateNormal];

        
        [self.bgColorButton reloadInputViews];
        //NSLog(@"matUseBGColorString %@",matUseBGColorString);
        //NSLog(@"matColorNumberArray %@",matColorNumberArray);
        //NSLog(@"matColorArray %@",matColorArray);
        int matColorCount= matColorArray.count;
        //NSLog(@"matColorCount %i",matColorCount);
        
        
       /* if (0 == matColorCount){
            
            
            UIImage*whiteImage = [UIImage imageNamed:@"white_140.jpg"];
            [_logoColorButton1 setBackgroundImage:whiteImage forState:UIControlStateNormal];
            [_logoColorButton2 setBackgroundImage:whiteImage forState:UIControlStateNormal];
            [_logoColorButton3 setBackgroundImage:whiteImage forState:UIControlStateNormal];
            [_logoColorButton4 setBackgroundImage:whiteImage forState:UIControlStateNormal];
            [_logoColorButton5 setBackgroundImage:whiteImage forState:UIControlStateNormal];
            [_logoColorButton6 setBackgroundImage:whiteImage forState:UIControlStateNormal];
            [_logoColorButton7 setBackgroundImage:whiteImage forState:UIControlStateNormal];
            
            NSString*emptyString = @" ";
            [_logoColorButton1 setTitle:emptyString forState:UIControlStateNormal];
            [_logoColorButton2 setTitle:emptyString forState:UIControlStateNormal];
            [_logoColorButton3 setTitle:emptyString forState:UIControlStateNormal];
            [_logoColorButton4 setTitle:emptyString forState:UIControlStateNormal];
            [_logoColorButton5 setTitle:emptyString forState:UIControlStateNormal];
            [_logoColorButton6 setTitle:emptyString forState:UIControlStateNormal];

            
                    }*/

        
        
        if (1 <= matColorCount){
            
            
            //id myObj = [logoColorArray objectAtIndex: objIdx];
            
            NSString*firstColorString = [matColorArray objectAtIndex:0];
            UIImage*firstColorImage = [UIImage imageNamed:firstColorString];
            [_logoColorButton1 setBackgroundImage:firstColorImage forState:UIControlStateNormal];
            
            NSString*firstColorNoString = [matColorNumberArray objectAtIndex:0];
            [_logoColorButton1 setTitle:firstColorNoString forState:UIControlStateNormal];
            [_logoColorButton1.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
            [_logoColorButton1 setNeedsDisplay];
        }
        
        if (2 <= matColorCount){
            
            NSString*secondColorString = [matColorArray objectAtIndex:1];
            UIImage*secondColorImage = [UIImage imageNamed:secondColorString];
            [_logoColorButton2 setBackgroundImage:secondColorImage forState:UIControlStateNormal];
            [_logoColorButton2.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
            NSString*secondColorNoString = [logoColorNumberArray objectAtIndex:1];
            [_logoColorButton2 setTitle:secondColorNoString forState:UIControlStateNormal];
            
        }
        
        if (3 <= matColorCount){
            
            NSString*thirdColorString=[matColorArray objectAtIndex:2];
            UIImage*thirdColorImage = [UIImage imageNamed:thirdColorString];
            [_logoColorButton3 setBackgroundImage:thirdColorImage forState:UIControlStateNormal];
            [_logoColorButton3.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
            NSString*thirdColorNoString = [matColorNumberArray objectAtIndex:2];
            [_logoColorButton3 setTitle:thirdColorNoString forState:UIControlStateNormal];
            
            
        }
        
        if (4 <= matColorCount){
            
            NSString*fourthColorString=[matColorArray objectAtIndex:3];
            UIImage*fourthColorImage = [UIImage imageNamed:fourthColorString];
            [_logoColorButton4 setBackgroundImage:fourthColorImage forState:UIControlStateNormal];
            [_logoColorButton4.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
            
            NSString*fourthColorNoString = [matColorNumberArray objectAtIndex:3];
            [_logoColorButton4 setTitle:fourthColorNoString forState:UIControlStateNormal];
            
            
        }
        
        if (5 <= matColorCount){
            
            NSString*fifthColorString=[matColorArray objectAtIndex:4];
            UIImage*fifthColorImage = [UIImage imageNamed:fifthColorString];
            [_logoColorButton5 setBackgroundImage:fifthColorImage forState:UIControlStateNormal];
             [_logoColorButton5.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
            NSString*fifthColorNoString = [matColorNumberArray objectAtIndex:4];
            [_logoColorButton5 setTitle:fifthColorNoString forState:UIControlStateNormal];
            
            
            
        }
        
        if (6 <= matColorCount){
            
            NSString*sixthColorString=[matColorArray objectAtIndex:5];
            UIImage*sixthColorImage = [UIImage imageNamed:sixthColorString];
            [_logoColorButton6 setBackgroundImage:sixthColorImage forState:UIControlStateNormal];
            [_logoColorButton6.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
            
            NSString*sixthColorNoString = [matColorNumberArray objectAtIndex:5];
            [_logoColorButton6 setTitle:sixthColorNoString forState:UIControlStateNormal];
            
            
        }
        
        if (7 <= matColorCount){
            
            NSString*seventhColorString=[matColorArray objectAtIndex:6];
            UIImage*seventhColorImage = [UIImage imageNamed:seventhColorString];
            [_logoColorButton7 setBackgroundImage:seventhColorImage forState:UIControlStateNormal];
            [_logoColorButton7.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
            NSString*seventhColorNoString = [matColorNumberArray objectAtIndex:6];
            [_logoColorButton7 setTitle:seventhColorNoString forState:UIControlStateNormal];
            
            
        }
        
        if (8 == matColorCount){
            
            NSString*eighthColorString=[matColorArray objectAtIndex:7];
            UIImage*eighthColorImage = [UIImage imageNamed:eighthColorString];
            [_logoColorButton8 setBackgroundImage:eighthColorImage forState:UIControlStateNormal];
             [_logoColorButton8.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
            NSString*eighthColorNoString = [matColorNumberArray objectAtIndex:7];
            [_logoColorButton8 setTitle:eighthColorNoString forState:UIControlStateNormal];
            
        }
   
        
        
        
        
        
    

    
        
       
     
    }
    
    
    
    //create logo size
    if ([interactiveHeaderString isEqualToString:@"Create Mat"])
    
    {
        
        
        
        
        if([orientString isEqualToString:@"landscape"])
        {
            portraitImageView.hidden=YES;
            landscapeImageView.hidden=NO;
            
        }
        
        if([orientString isEqualToString:@"portrait"])
        {
            portraitImageView.hidden=NO;
            landscapeImageView.hidden=YES;
            
        }
        
        else {
            
            portraitImageView.hidden=YES;
            landscapeImageView.hidden=YES;
            
        }

        matView1.hidden= YES;
        matBGLogoView.hidden= NO;
        
        //sizeString = @"3 X 5";
        if (sizeString!=nil){
       
            
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

        
        if (logoColorArray == nil)
        {
            logoColorArray = [[NSMutableArray alloc] init];
        }
        
        NSLog(@"logoColorArray %@",logoColorArray);
        
        
        if (logoColorNumberArray == nil)
        {
            logoColorNumberArray = [[NSMutableArray alloc] init];
        }

        
        if (_logoColorString!=NULL){

        
        NSString *string = _logoColorString;
        if ([string rangeOfString:@"108-Black"].location == NSNotFound) {
            NSLog(@"string does not contain bla");
            
            
            
        } else {
            NSLog(@"black Found!");
            
            [logoColorArray addObject:@"Black_108.jpg"];
            [logoColorNumberArray addObject:@"108"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"121-Steel Blue"].location == NSNotFound) {
            
            NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Steel Blue_121.jpg"];
            [logoColorNumberArray addObject:@"121"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"123-Suede"].location == NSNotFound) {
            
            NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Suede_123.jpg"];
            [logoColorNumberArray addObject:@"123"];
            
        }
        
        if ([string rangeOfString:@"140-White"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"White_140.jpg"];
             [logoColorNumberArray addObject:@"140"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"119-Rose"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Rose_119.jpg"];
            [logoColorNumberArray addObject:@"119"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"107-Royal Blue"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Royal Blue_107.jpg"];
            [logoColorNumberArray addObject:@"107"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"120-Sandalwood"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Sandalwood_120.jpg"];
            [logoColorNumberArray addObject:@"120"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"116-Silver"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Silver_116.jpg"];
            [logoColorNumberArray addObject:@"116"];
            //add string to an array
            
        }
        
        if ([string rangeOfString:@"127-Orange"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Orange_127.jpg"];
            [logoColorNumberArray addObject:@"127"];
            
            
        }
        
        if ([string rangeOfString:@"105-Purple"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Purple_105.jpg"];
            [logoColorNumberArray addObject:@"105"];
            
            
            
        }
        
        if ([string rangeOfString:@"112-Red"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Red_112.jpg"];
            [logoColorNumberArray addObject:@"112"];
            
            
        }
        
        if ([string rangeOfString:@"109-Gold"].location == NSNotFound) {
            
            NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Gold_109.jpg"];
            [logoColorNumberArray addObject:@"109"];
            
            
        }
        
        if ([string rangeOfString:@"115-Grey"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Grey_115.jpg"];
            [logoColorNumberArray addObject:@"115"];
        }
        
        if ([string rangeOfString:@"106-Light Blue"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Light Blue_106.jpg"];
            [logoColorNumberArray addObject:@"106"];
            
            
        }
        
        if ([string rangeOfString:@"118-Navy"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Navy_118.jpg"];
            [logoColorNumberArray addObject:@"118"];
            
        }
        
        if ([string rangeOfString:@"110-Emerald Green"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Emerald Green_110.jpg"];
            [logoColorNumberArray addObject:@"110"];
        }
        
        if ([string rangeOfString:@"117-Forest Green"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Forest Green_117.jpg"];
            [logoColorNumberArray addObject:@"117"];
        }
        
        if ([string rangeOfString:@"114-Cranberry"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Cranberry_114.jpg"];
            [logoColorNumberArray addObject:@"114"];
            
        }
        
        if ([string rangeOfString:@"103-Dark Gold"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Dark Gold_103.jpg"];
            [logoColorNumberArray addObject:@"103"];
            
        }
        
        if ([string rangeOfString:@"101-Charcoal"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Charcoal_101.jpg"];
            [logoColorNumberArray addObject:@"101"];
            
        }
        
        if ([string rangeOfString:@"111-Chocolate"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Chocolate_111.jpg"];
            [logoColorNumberArray addObject:@"111"];
            
        }
        
        if ([string rangeOfString:@"126-Clay"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Clay_126.jpg"];
            [logoColorNumberArray addObject:@"126"];
            
        }
        
        if ([string rangeOfString:@"102-Brown"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Brown_102.jpg"];
            [logoColorNumberArray addObject:@"102"];
            
        }
        
        if ([string rangeOfString:@"100-Burgundy"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Burgundy_100.jpg"];
            [logoColorNumberArray addObject:@"100"];
            
        }
        
        if ([string rangeOfString:@"130-Aquamarine"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Aquamarine_130.jpg"];
            [logoColorNumberArray addObject:@"130"];
            
        }
        
        if ([string rangeOfString:@"104-Turquoise"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Turquoise_104.jpg"];
            [logoColorNumberArray addObject:@"104"];
            
            
        }
        
        if ([string rangeOfString:@"128-Yellow"].location == NSNotFound) {
            
            //NSLog(@"string does not contain bla");
            
        } else {
            
            
            [logoColorArray addObject:@"Yellow_128.jpg"];
            [logoColorNumberArray addObject:@"128"];
            
            
        }



        }




        //NSLog(@"logoColorNumberArray %@",logoColorNumberArray);
        //NSLog(@"logoColorArray %@",logoColorArray);
        int logoColorCount= logoColorArray.count;
        //NSLog(@"logoColorCount %i",logoColorCount);
        
        
        
        if (0 == logoColorCount){
            
            
            UIImage*whiteImage = [UIImage imageNamed:@"white_140.jpg"];
            [_logoColorButton1 setBackgroundImage:whiteImage forState:UIControlStateNormal];
            [_logoColorButton2 setBackgroundImage:whiteImage forState:UIControlStateNormal];
            [_logoColorButton3 setBackgroundImage:whiteImage forState:UIControlStateNormal];
            [_logoColorButton4 setBackgroundImage:whiteImage forState:UIControlStateNormal];
            [_logoColorButton5 setBackgroundImage:whiteImage forState:UIControlStateNormal];
            [_logoColorButton6 setBackgroundImage:whiteImage forState:UIControlStateNormal];
            [_logoColorButton7 setBackgroundImage:whiteImage forState:UIControlStateNormal];
            
            NSString*emptyString = @" ";
            [_logoColorButton1 setTitle:emptyString forState:UIControlStateNormal];
            [_logoColorButton2 setTitle:emptyString forState:UIControlStateNormal];
            [_logoColorButton3 setTitle:emptyString forState:UIControlStateNormal];
            [_logoColorButton4 setTitle:emptyString forState:UIControlStateNormal];
            [_logoColorButton5 setTitle:emptyString forState:UIControlStateNormal];
            [_logoColorButton6 setTitle:emptyString forState:UIControlStateNormal];
            
            
        }
      
        
       
                    
              if (1 <= logoColorCount){
                    
                
                    //id myObj = [logoColorArray objectAtIndex: objIdx];
                    
                    NSString*firstColorString = [logoColorArray objectAtIndex:0];
                    UIImage*firstColorImage = [UIImage imageNamed:firstColorString];
                    [_logoColorButton1 setBackgroundImage:firstColorImage forState:UIControlStateNormal];
                  
                    NSString*firstColorNoString = [logoColorNumberArray objectAtIndex:0];
                   [_logoColorButton1 setTitle:firstColorNoString forState:UIControlStateNormal];
                   [_logoColorButton1.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
                  
                  [_logoColorButton1 setNeedsDisplay];
                }
                
               if (2 <= logoColorCount){
                   
                   NSString*secondColorString = [logoColorArray objectAtIndex:1];
                   UIImage*secondColorImage = [UIImage imageNamed:secondColorString];
                    [_logoColorButton2 setBackgroundImage:secondColorImage forState:UIControlStateNormal];
                   
                   NSString*secondColorNoString = [logoColorNumberArray objectAtIndex:1];
                   [_logoColorButton2 setTitle:secondColorNoString forState:UIControlStateNormal];
                   [_logoColorButton2.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
                
                }
            
             if (3 <= logoColorCount){
           
                 NSString*thirdColorString=[logoColorArray objectAtIndex:2];
                 UIImage*thirdColorImage = [UIImage imageNamed:thirdColorString];
                 [_logoColorButton3 setBackgroundImage:thirdColorImage forState:UIControlStateNormal];
                 
                 NSString*thirdColorNoString = [logoColorNumberArray objectAtIndex:2];
                 [_logoColorButton3 setTitle:thirdColorNoString forState:UIControlStateNormal];
                [_logoColorButton3.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
                 
            
             }
                
                if (4 <= logoColorCount){
                    
                    NSString*fourthColorString=[logoColorArray objectAtIndex:3];
                    UIImage*fourthColorImage = [UIImage imageNamed:fourthColorString];
                    [_logoColorButton4 setBackgroundImage:fourthColorImage forState:UIControlStateNormal];
                    
                    NSString*fourthColorNoString = [logoColorNumberArray objectAtIndex:3];
                    [_logoColorButton4 setTitle:fourthColorNoString forState:UIControlStateNormal];
                    [_logoColorButton4.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
                    
                    
                }
                
                if (5 <= logoColorCount){
                    
                    NSString*fifthColorString=[logoColorArray objectAtIndex:4];
                    UIImage*fifthColorImage = [UIImage imageNamed:fifthColorString];
                    [_logoColorButton5 setBackgroundImage:fifthColorImage forState:UIControlStateNormal];
                    
                    NSString*fifthColorNoString = [logoColorNumberArray objectAtIndex:4];
                    [_logoColorButton5 setTitle:fifthColorNoString forState:UIControlStateNormal];
                    [_logoColorButton5.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];

                    
                    
                }
                
                if (6 <= logoColorCount){
                    
                    NSString*sixthColorString=[logoColorArray objectAtIndex:5];
                    UIImage*sixthColorImage = [UIImage imageNamed:sixthColorString];
                    [_logoColorButton6 setBackgroundImage:sixthColorImage forState:UIControlStateNormal];
                    
                    
                    NSString*sixthColorNoString = [logoColorNumberArray objectAtIndex:5];
                    [_logoColorButton6 setTitle:sixthColorNoString forState:UIControlStateNormal];
                    [_logoColorButton6.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];

                    
                }
                
                if (7 <= logoColorCount){
                    
                    NSString*seventhColorString=[logoColorArray objectAtIndex:6];
                    UIImage*seventhColorImage = [UIImage imageNamed:seventhColorString];
                    [_logoColorButton7 setBackgroundImage:seventhColorImage forState:UIControlStateNormal];
                    
                    NSString*seventhColorNoString = [logoColorNumberArray objectAtIndex:6];
                    [_logoColorButton7 setTitle:seventhColorNoString forState:UIControlStateNormal];
                    [_logoColorButton7.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:14.0]];
                    
                    
                }
                
                if (8 == logoColorCount){
                    
                    NSString*eighthColorString=[logoColorArray objectAtIndex:7];
                    UIImage*eighthColorImage = [UIImage imageNamed:eighthColorString];
                    [_logoColorButton8 setBackgroundImage:eighthColorImage forState:UIControlStateNormal];
                    
                    NSString*eighthColorNoString = [logoColorNumberArray objectAtIndex:7];
                    [_logoColorButton8 setTitle:eighthColorNoString forState:UIControlStateNormal];
                    [_logoColorButton8 setTitle:eighthColorNoString forState:UIControlStateNormal];
                    
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
- (void)menuItemSelected:(NSString *)action
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
        
            /*AppDelegate *appdelegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];
            appdelegate.model=YES;*/

        
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
    
}



//hits this
- (void)menuActivated
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

}


#pragma mark -
#pragma mark iCarousel methods

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
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
    
    
    
}


- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
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
    


 if (carousel==carouselColor){
    
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

    
}


- (void)touchDownRepeat:(UITextField*)textField{
   
        
        [textField  resignFirstResponder];
        textField.hidden= YES;
        textField.delegate = self;
        textField.returnKeyType = UIReturnKeyDefault;
        [textField isFirstResponder];
       
         
    
    
    
    
}


/*- (void)touchDownRepeat:(UIButton *)blackButton {
    //worked
    blackButton.hidden = YES;
    
    
}*/

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
        
        
        // _firstX = [logoPicButton center].x;
        // _firstY = [logoPicButton center].y;
    }
    
    translatedPoint = CGPointMake(_firstX+translatedPoint.x, _firstY+translatedPoint.y);
    
    [logoPicButton setCenter:translatedPoint];
    // [self showOverlayWithFrame:chosenImageView.frame];
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
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Steel Blue_121.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setImage:myBGColor forState:UIControlStateSelected];
        [bgColorButton setImage:myBGColor forState:UIControlStateHighlighted];
        [bgColorButton setImage:myBGColor forState:UIControlStateApplication];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
        
        
    }

   
    
    else if ((long)sender.tag==123){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Suede_123.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    else if ((long)sender.tag==140){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"White_140.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    else if ((long)sender.tag==119){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Rose_119.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    else if ((long)sender.tag==107){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Royal Blue_107.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    else if ((long)sender.tag==120){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Sandalwood_120.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    else if ((long)sender.tag==116){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Silver_116.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==127){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Orange_127.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==105){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Purple_105.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    if ((long)sender.tag==112){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Red_112.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==109){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Gold_109.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    
    if ((long)sender.tag==115){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Grey_115.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==106){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Light Blue_106.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==118){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Navy_118.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==110){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Emerald Green_110.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==117){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Forest Green_117.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
        
    }
    
    if ((long)sender.tag==114){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Cranberry_114.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
        
    }
    
    if ((long)sender.tag==103){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Dark Gold_103.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==101){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Charcoal_101.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==111){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Chocolate_111.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==126){
        
        //create an image
        UIImage *myBGColor = [UIImage imageNamed:@"Clay_126.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==108){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Black_108.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==102){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Brown_102.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==100){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Burgundy_100.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==130){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Aquamarine_130.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
    
    if ((long)sender.tag==104){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Turquoise_104.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
        
    }
    //TODO FIX ALL THESE
    if ((long)sender.tag==128){
        
        //create an image
        myBGColor = [UIImage imageNamed:@"Yellow_128.jpg"];
        [matBGLogoView setImage:myBGColor];
        [bgColorButton setImage:nil forState:UIControlStateNormal];
        [bgColorButton setBackgroundImage:nil forState:UIControlStateNormal];
        [bgColorButton setBackgroundImage:myBGColor forState:UIControlStateNormal];
        [self.bgColorButton reloadInputViews];
        
    }
  [self.bgColorButton reloadInputViews];
  matBGLogoView.contentMode = UIViewContentModeScaleToFill;








    
   
    
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    //if (alertView.tag == 1) {  //First Dialog
    
    UITextField * alertNameField = [alertView textFieldAtIndex:0];
    nameField.text=alertNameField.text;
    NSString*nameFieldAlertString=alertNameField.text;
    //NSLog(@"alertNameField - %@",alertNameField.text);
    CGRect screenRect2 = CGRectMake(723,342,600,490);
    UIGraphicsBeginImageContext(screenRect2.size);
    
    
    CGContextRef ctx1 = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] set];
    CGContextFillRect(ctx1, screenRect2);
    
    [self.snapshotView.layer renderInContext:ctx1];
    
    
    matImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@.png",nameFieldAlertString]];
    
    [UIImagePNGRepresentation(matImage) writeToFile:imagePath atomically:YES];
    
    
    
    [self.view addSubview:snapshotView];
    
    
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
    NSString*matColorAddFavString =_matColorString;
    NSString*matBGColorAddFavString =matBGColorString;
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
    [newMatFavorite setValue:_matColorString forKey:@"color"];
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





-(IBAction)addMatFavorite:(id)sender{
    
    
    NSString*nameStringHere=nameField.text;
    NSLog(@"nameString %@",nameStringHere);

    if ([nameStringHere isEqualToString:@""]){
        
        //nameHideField.text= nameField.text;
        // Get size of current image
        //CGSize size = [myBGColor size];
        
        
        UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Add a name for your Logo"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
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
        
        //not doing anything
        /*logoPicButton.frame = CGRectMake(a-100, b, x, y);
         [self.snapshotView addSubview:logoPicButton];*/

    
    
    
    
    //logoPicButton.frame = CGRectMake(snapshotView.frame.origin., d, x, y);
    
    
    CGRect screenRect2 = CGRectMake(723,342,600,490);
        
    UIGraphicsBeginImageContext(screenRect2.size);
    
    
    CGContextRef ctx1 = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] set];
    CGContextFillRect(ctx1, screenRect2);
    
    
    [self.snapshotView.layer renderInContext:ctx1];
        
    //only moves the button in its original view not for the picture
    //logoPicButton.frame = CGRectMake(180, 180, x, y);
    [self.logoPicButton.layer renderInContext:ctx1];
    //[logoPicButton center];
    
    
    matImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@.png",nameStringHere]];
    
    [UIImagePNGRepresentation(matImage) writeToFile:imagePath atomically:YES];
    
    
    //hides logoButton
    //[self.view addSubview:snapshotView];
    //[self.view addSubview:logoPicButton];
    
    
    //NOTE- Do not remove local NSString values will break
    
    NSString*matUrlAppendAddFavString= nameField.text;
    NSLog(@"matUrlAppendAddFavString %@",matUrlAppendAddFavString);
    NSString*pngString= @".png";
    //NSLog(@"nameFieldText %@",nameField.text);
    //NSLog(@"nameFieldText %@",nameHideField.text);
    
    
    NSString*urlMatStringAppend = [matUrlAppendAddFavString stringByAppendingString:pngString];
    
    NSString*matUrlAddFavString = urlMatStringAppend;
    NSLog(@"matUrlAddFavString %@",matUrlAddFavString);
    NSString*matNameAddFavString =nameField.text;
    NSString*matSellerAddFavString =sellerField.text;
    NSString*matCompanyAddFavString =companyField.text;
    NSString*matIDAddFavString =numberField.text;
    NSString*matLocationIDAddFavString =locationIDString;
    NSString*matColorAddFavString =_matColorString;
    NSString*matBGColorAddFavString =matBGColorString;
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
    [newMatFavorite setValue:_matColorString forKey:@"color"];
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


    
    }


//}

/*- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
 
    UITextField * alertTextField = [alertView textFieldAtIndex:0];
    NSLog(@"alerttextfiled - %@",alertTextField.text);
 
    // do whatever you want to do with this UITextField.
 
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@.png",alertTextField.text]];
    [UIImagePNGRepresentation(matImage) writeToFile:imagePath atomically:YES];

 
 
 
}*/


-(IBAction)addNote:(id)sender{
    
    noteLayerView.hidden=NO;
    
    textNoteField = [[UITextField alloc] initWithFrame:CGRectMake(445, 50, 300, 60)];
    //textNoteField.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    textNoteField.textColor = [UIColor redColor];
    textNoteField.font = [UIFont fontWithName:@"Avenir-Light" size:25];
    textNoteField.backgroundColor=[UIColor whiteColor];
    textNoteField.text=@"ADD PRODUCTION NOTES";
    textNoteField.tag = 1;
   // [self.view addSubview:textNoteField];
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
    
    
    textDecField = [[UITextField alloc] initWithFrame:CGRectMake(445, 100, 300, 60)];
    textDecField.textColor = [UIColor whiteColor];
    textDecField.font = [UIFont fontWithName:@"Avenir-Light" size:25];
    textDecField.backgroundColor=[UIColor clearColor];
    textDecField.text=@"TEXT";
    textDecField.tag = 2;
    [self.view addSubview:textDecField];
    
    [textDecField addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [textDecField addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    [textDecField addTarget:self action:@selector(touchDownRepeat:) forControlEvents:UIControlEventTouchDownRepeat];
    

    
}

enum {
    textDecFieldTag = 2,
    textNoteFieldTag=1
};

-(IBAction)addPMS:(id)sender{
    
    
    textDecField = [[UITextField alloc] initWithFrame:CGRectMake(145, 400, 38, 38)];
    textDecField.textColor = [UIColor whiteColor];
    textDecField.font = [UIFont fontWithName:@"Avenir-Bold" size:14];
    textDecField.backgroundColor=[UIColor darkGrayColor];
    //textDecField.text=@" ";
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
    
    
    
    //textDecField.hidden = NO;
    noteLayerView.hidden =NO;
}






-(IBAction)goMail:(UIButton*)sender event:(id)event {
    
    noteLayerView.hidden=YES;
   
    
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
    NSString *imagePath1 =  [directoryPath objectAtIndex:0];
    imagePath1= [imagePath1 stringByAppendingPathComponent:@"matImageHere.jpg"];
    
    NSData *data = [NSData dataWithContentsOfFile:imagePath1];
    //UIImage *image = [UIImage imageWithData:data];
    
    NSString *imagePath3 =  [directoryPath objectAtIndex:0];
    imagePath1= [imagePath3 stringByAppendingPathComponent:@"matNoteImage.jpg"];
    
    NSData *dataNote = [NSData dataWithContentsOfFile:imagePath3];
    //UIImage *imageNote = [UIImage imageWithData:dataNote];
    // Determine the file name and extension
    /* NSArray *filepart = [file componentsSeparatedByString:@"."];
     NSString *filename = [filepart objectAtIndex:0];
     NSString *extension = [filepart objectAtIndex:1];
     
     // Get the resource path and read the file using NSData
     NSString *filePath = [[NSBundle mainBundle] pathForResource:orderImage ofType:extension];
     NSData *fileData = [NSData dataWithContentsOfFile:filePath];*/
    
    // Determine the MIME type
    /* NSString *mimeType;
     if ([extension isEqualToString:@"jpg"]) {
     mimeType = @"image/jpeg";
     } else if ([extension isEqualToString:@"png"]) {
     mimeType = @"image/png";
     } else if ([extension isEqualToString:@"doc"]) {
     mimeType = @"application/msword";
     } else if ([extension isEqualToString:@"ppt"]) {
     mimeType = @"application/vnd.ms-powerpoint";
     } else if ([extension isEqualToString:@"html"]) {
     mimeType = @"text/html";
     } else if ([extension isEqualToString:@"pdf"]) {
     mimeType = @"application/pdf";
     }*/
    
    // Add attachment
    [mc addAttachmentData:data mimeType:@"image/jpeg" fileName:@"matImage.jpg"];
    [mailComposer setToRecipients:recipients];
    
    [self presentViewController:mc animated:YES completion:NULL];
    
    
    //[self goMail1:sender event:self];
    
    
}



-(IBAction)goMail1:(UIButton*)sender event:(id)event {
    
    
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
    
    
    //save image to documents
   /* NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/matImageHere.jpg"]];
    [UIImageJPEGRepresentation(matImageHere, 1.0) writeToFile:imagePath atomically:YES];*/
    //noteLayerView.hidden=YES;
    
    //snapshot withNotes grab image
    //noteLayerView.hidden=NO;
   /* CGRect screenRect3 = CGRectMake(0.0,0,1028,720);
    
    
    UIGraphicsBeginImageContext(screenRect3.size);
    //UIGraphicsBeginImageContext(interactiveMatView.size);
    
    CGContextRef ctx2 = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] set];
    CGContextFillRect(ctx2, screenRect2);

    
    UIImage *matNoteImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();*/
    
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
    
    NSData *dataNote = [NSData dataWithContentsOfFile:imagePath3];
    //UIImage *imageNote = [UIImage imageWithData:dataNote];
    // Determine the file name and extension
    /* NSArray *filepart = [file componentsSeparatedByString:@"."];
     NSString *filename = [filepart objectAtIndex:0];
     NSString *extension = [filepart objectAtIndex:1];
     
     // Get the resource path and read the file using NSData
     NSString *filePath = [[NSBundle mainBundle] pathForResource:orderImage ofType:extension];
     NSData *fileData = [NSData dataWithContentsOfFile:filePath];*/
    
    // Determine the MIME type
    /* NSString *mimeType;
     if ([extension isEqualToString:@"jpg"]) {
     mimeType = @"image/jpeg";
     } else if ([extension isEqualToString:@"png"]) {
     mimeType = @"image/png";
     } else if ([extension isEqualToString:@"doc"]) {
     mimeType = @"application/msword";
     } else if ([extension isEqualToString:@"ppt"]) {
     mimeType = @"application/vnd.ms-powerpoint";
     } else if ([extension isEqualToString:@"html"]) {
     mimeType = @"text/html";
     } else if ([extension isEqualToString:@"pdf"]) {
     mimeType = @"application/pdf";
     }*/
    
    // Add attachment
    //[mc addAttachmentData:data mimeType:@"image/jpeg" fileName:@"matImage.jpg"];
    [mc addAttachmentData:data mimeType:@"image/jpeg" fileName:@"matNoteImage.jpg"];
    
    
    
    [mailComposer setToRecipients:recipients];
    
    [self presentViewController:mc animated:YES completion:NULL];
    
    
    
}



-(IBAction)goSearch:(id)sender{
    
    
  [activityIndicator startAnimating];
    
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
    
    
    
}




//moves logo around
- (IBAction) imageMoved:(id) sender withEvent:(UIEvent *) event
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


    
    
   /* else  if (_PercentMat == .20){
        
        int wMatHundred = wMat*100;
        int hMatHundred = hMat*100;
        
        int wMatHundredDivide = wMatHundred/2;
        int hMatHundredDivide = hMatHundred/2;
        
        int wPlaceDouble =  601-wMatHundredDivide;
        int hPlaceDouble =  511-hMatHundredDivide;
        
        int wPlace=wPlaceDouble/2;
        int hPlace=hPlaceDouble/2;
        
        //int wPlaceUse=wPlace+426;
        //int hPlaceUse=hPlace+100;
        
        int wPlaceUse=wPlace+345;
        //int hPlaceUse=hPlace+20;
        int hPlaceUse=hPlace+15;
        
        
        CGRect myLogoMatRect = CGRectMake( wPlaceUse, hPlaceUse, wMatHundred, hMatHundred);
        
        //CGRect myLogoMatRect = CGRectMake( 426.0f, 100.0f, wMatHundred, hMatHundred);
        
        //CGRect myLogoMatRect = CGRectMake( 426.0f, 121.0f, 300.0f, 500.0f);
        
        matBGLogoView.frame=myLogoMatRect;
        matBGLogoView.ContentMode=  UIViewContentModeScaleToFill;
        //interactiveMatView.ContentMode = UIViewContentModeCenter;
        
        
    }*/
    
   /*else  if (wMat <= 5 & hMat <= 5){
    
        int wMatHundred = wMat*100;
        int hMatHundred = hMat*100;
    
        int wMatHundredDivide = wMatHundred/2;
        int hMatHundredDivide = hMatHundred/2;
        
        int wPlaceDouble =  601-wMatHundredDivide;
        int hPlaceDouble =  511-hMatHundredDivide;
        
        int wPlace=wPlaceDouble/2;
        int hPlace=hPlaceDouble/2;
        
        //int wPlaceUse=wPlace+426;
        //int hPlaceUse=hPlace+100;
        
        int wPlaceUse=wPlace+345;
        //int hPlaceUse=hPlace+20;
        int hPlaceUse=hPlace+15;
      
        
        CGRect myLogoMatRect = CGRectMake( wPlaceUse, hPlaceUse, wMatHundred, hMatHundred);
    
        //CGRect myLogoMatRect = CGRectMake( 426.0f, 100.0f, wMatHundred, hMatHundred);
    
        //CGRect myLogoMatRect = CGRectMake( 426.0f, 121.0f, 300.0f, 500.0f);
    
        matBGLogoView.frame=myLogoMatRect;
        matBGLogoView.ContentMode=  UIViewContentModeScaleToFill;
        //interactiveMatView.ContentMode = UIViewContentModeCenter;
   
        
    } */
}




-(IBAction) Portrait:(id)sender{
    
    portraitImageView.hidden=NO;
    landscapeImageView.hidden=YES;
    
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

    /*orientString=@"portrait";
    
    if ([orientString isEqualToString:@"portrait"])
        
    {
        
        
    
    
    //_widthField.text = _widthField.text;
    _widthCircleField.text =_widthField.text;
    
    //_heightField.text =_heightField.text;
    _heightCircleField.text = _heightField.text;
    
    
    int wMat = [_widthField.text intValue];
    int hMat = [_heightField.text intValue];
    
    int wMatHundred = wMat*85;
    int hMatHundred = hMat*85;
    
    int wMatHundredDivide = wMatHundred/2;
    int hMatHundredDivide = hMatHundred/2;
    
    
    CGRect myLogoMatRect = CGRectMake( 426.0f, 121.0f, wMatHundred, hMatHundred);
    
    //CGRect myLogoMatRect = CGRectMake( 426.0f, 121.0f, 300.0f, 500.0f);
    
    matBGLogoView.frame=myLogoMatRect;
    //matBGLogoView.ContentMode=  UIViewContentModeScaleAspectFit;
    //matBGLogoView.ContentMode=  UIViewContentModeCenter;
    matBGLogoView.ContentMode=  UIViewContentModeScaleToFill;
        
    
    
    /*_widthField.text = @"5'";
    _widthCircleField.text = @"3'";
    
    _heightField.text = @"5'";
    _heightCircleField.text = @"3'";
    
    CGRect myLogoMatRect = CGRectMake(426.0f, 121.0f, 300.0f, 500.0f);
    
    matBGLogoView.frame=myLogoMatRect;
    matBGLogoView.ContentMode=  UIViewContentModeScaleAspectFit;*/
        
    }
    
//}

-(IBAction)Landscape:(id)sender{
    
    portraitImageView.hidden=YES;
    landscapeImageView.hidden=NO;
    
    textOrientField.hidden= NO;
    textOrientField.textColor = [UIColor redColor];
    textOrientField.font = [UIFont fontWithName:@"Avenir-Light" size:25];
    textOrientField.backgroundColor=[UIColor whiteColor];
    textOrientField.text=@"Landscape";
    //[self.view addSubview:textOrientField];
    
    [textOrientField addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [textOrientField addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];

    /*orientString=@"landscape";
    
    
    if ([orientString isEqualToString:@"landscape"])
        
    {
        
    

    
    //_widthField.text = _widthField.text;
    _widthCircleField.text =_widthField.text;
    
    //_heightField.text =_heightField.text;
    _heightCircleField.text = _heightField.text;
    
    
    int wMat = [_widthField.text intValue];
    int hMat = [_heightField.text intValue];
    
    int wMatHundred = wMat*100;
    int hMatHundred = hMat*100;
    
    //int wMatHundredDivide = wMatHundred/2;
    //int hMatHundredDivide = hMatHundred/2;
    
    
    CGRect myLogoMatRect = CGRectMake( 426.0f, 121.0f, hMatHundred, wMatHundred);
    
    //CGRect myLogoMatRect = CGRectMake( 426.0f, 121.0f, 300.0f, 500.0f);
    
    matBGLogoView.frame=myLogoMatRect;
    //matBGLogoView.ContentMode=  UIViewContentModeScaleAspectFit;
    matBGLogoView.ContentMode=  UIViewContentModeCenter;
    
    
   /* _widthField.text = @"3'";
    _widthCircleField.text = @"5'";
    
    _heightField.text = @"3'";
    _heightCircleField.text = @"5'";
    
    
    CGRect myLogoMatRect = CGRectMake( 426.0f, 121.0f, 500.0f, 300.0f);
    
    matBGLogoView.frame=myLogoMatRect;
    matBGLogoView.ContentMode=  UIViewContentModeScaleAspectFit;*/
        
   // }
    
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
    CGRect myLogoMatRect = CGRectMake( 150.0f, 100.0f, 300.0f, 200.0f);
    
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
    
    
    CGRect myLogoMatRect = CGRectMake(2.0f, 30.0f, 600.0f, 400.0f);
    
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
    
    CGRect myLogoMatRect = CGRectMake( 56.0f, 130.0f, 500.0f, 150.0f);
    
    matBGLogoView.frame=myLogoMatRect;
    //matBGLogoView.ContentMode=  UIViewContentModeScaleAspectFit;
    matBGLogoView.contentMode = UIViewContentModeScaleToFill;

    
}
-(IBAction) goFontPicker:(id)sender{
    
    [self.view addSubview:fontPicker];
    //[self.fontPicker removeFromSuperview];
}


-(IBAction) goColorPicker:(id)sender{
    
     colorPicker.hidden=NO;
    
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
    return 2;
}


- (NSInteger)pickerView:(UIPickerView *)fontPicker
numberOfRowsInComponent:(NSInteger)component
{
    
    if (component==0){
     
    return familyNamesArray.count;
}else{
    
    return colorNamesImagesArray.count;
    //return 27;
   
}
    
}

/*- (UIView *)pickerView:(UIPickerView *)fontPicker
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
             reusingView:(UIView*)view
{
    if (component==1){
    
    
            UILabel*fontLabel;
            fontLabel=[[UILabel alloc] initWithFrame:CGRectMake(0,0,120,32)];
            fontLabel.text=[familyNamesArray objectAtIndex:row];
        
            return fontLabel;
        
       }else {
        
        
        
        return [colorNamesImagesArray objectAtIndex:row];
           
    
       }
        
}*/


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row
          forComponent:(NSInteger)component reusingView:(UIView *)view
{
    if (component==0){
    
        UILabel *firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 60, 32)];
        firstLabel.text = [familyNamesArray objectAtIndex:row];
        firstLabel.textAlignment = NSTextAlignmentCenter;
        firstLabel.backgroundColor = [UIColor clearColor];
        
        return firstLabel;
        
    }else{
    
    /*UILabel *secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(165, 0, 60, 32)];
    secondLabel.text = [array2 objectAtIndex:row];
    secondLabel.textAlignment = UITextAlignmentLeft;
    secondLabel.backgroundColor = [UIColor clearColor];*/
    
   /* UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[colorNamesImagesArray objectAtIndex:row]]];*/
    
    //UIImage *img= [colorNamesImagesArray objectAtIndex:row];
    
    //UIImageView *icon = [[UIImageView alloc] initWithImage:img];
    //temp.frame = CGRectMake(170, 0, 30, 30);
        
    UIImageView *icon = [colorNamesImagesArray objectAtIndex:row];
    icon.frame = CGRectMake(170, 0, 50, 50);
        
    return icon;
        
        
       /* UIView *tmpView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 400, 32) ];
        [tmpView insertSubview:icon atIndex:1];
        [tmpView insertSubview:firstLabel atIndex:0];
        //[tmpView insertSubview:secondLabel atIndex:0];
        [tmpView setUserInteractionEnabled:NO];
        [tmpView setTag:row];
        //[channelLabel release];
        //[temp release];
        return tmpView;*/
    }
    
    
    
    
   
    
    
}

-(CGFloat)pickerView:(UIPickerView *)fontPicker rowHeightForComponent:(NSInteger)component{
    
    return 75.0;
}


-(CGFloat)pickerView:(UIPickerView *)fontPicker rowWidthForComponent:(NSInteger)component{
    if (component==0){
    
        return 400.0;
        
    }else{
        
        return 200.0;
    }
}

//}





/*- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel* tView = (UILabel*)view;
    if (!tView)
    {
        tView = [[UILabel alloc] init];
        [tView setFont:[UIFont fontWithName:@"Helvetica" size:14]];
        //[tView setTextAlignment:UITextAlignmentLeft];
        tView.numberOfLines=3;
    }
    // Fill the label text here
    tView.text=[wishvalues objectAtIndex:row];
    return tView;
}*/


/*-(BOOL)viewsDoCollide:(UIView *)view1 :(UIView *)view2{
    if(CGRectIntersectsRect(view1.frame, view2.frame))
    {
        return YES;
    }
    return NO;
}*/


/*-(BOOL)viewsDoCollide:(UIImageView *)_matBGImageView :(UIButton *)_steelBlueButton{
    if(CGRectIntersectsRect(_matBGImageView.frame, _steelBlueButton.frame))
    {
        return YES;
    }
    return NO;
}*/

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
