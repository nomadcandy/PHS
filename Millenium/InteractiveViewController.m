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

@synthesize textNoteField;
@synthesize textDecField;
@synthesize hexField;


//@synthesize delegate=_delegate;

@synthesize interactiveView;
@synthesize carouselSize;
@synthesize carouselColor;
@synthesize carouselLogo;

@synthesize rugSizeButton;
@synthesize rugColorButton;
@synthesize matSizeString;
@synthesize matColorUseString;
@synthesize matSizeUseString;

@synthesize selectedImage;
@synthesize matButton;
@synthesize logoButton;
@synthesize logoPicButton;
@synthesize homeButton;

@synthesize searchButton;
@synthesize searchField;

@synthesize nameField;
@synthesize numberField;
@synthesize sellerField;
@synthesize companyField;

@synthesize titleBar;

@synthesize titleLabel;
@synthesize headerLabel;

@synthesize chosenImageView;

@synthesize artworkNameArray;
@synthesize artworkSellerArray;
@synthesize artworkSizeArray;
@synthesize artworkFormatArray;
@synthesize artworkFullImageArray;
@synthesize artworkIconArray;
@synthesize artworkIDArray;
@synthesize artworkInfoArray;



@synthesize nameString;
@synthesize sellerString;
@synthesize companyString;
@synthesize numberString;
@synthesize sizeString;

@synthesize interactiveHeaderString;


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


-(void)ViewDidAppear
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

    
}





- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"nameStringHere %@",nameString);
    NSLog(@"sellerStringHere %@",sellerString);
    NSLog(@"companyStringHere %@",companyString);
    NSLog(@"numberStringHere %@",numberString);

    nameField.text =nameString;
    sellerField.text =sellerString;
    companyField.text =companyString;
    numberField.text =numberString;
    
    headerLabel.text= interactiveHeaderString;
    
    
    
    NSString *sizeGetString = sizeString;
    NSRange range = [sizeGetString rangeOfString:@"x"];
    
    NSString *widthString = [sizeGetString substringToIndex:range.location];
    NSLog(@"%@",widthString);
    
    NSString *heightString = [sizeGetString substringFromIndex:range.location];
    NSLog(@"%@",heightString);
    
    
    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@"x ,X"];
    NSString *safeHeightString = [[heightString componentsSeparatedByCharactersInSet:charSet] componentsJoinedByString:@""];
    
    _widthField.text=widthString;
    _heightField.text=safeHeightString;
    
    _widthCircleField.text=_widthField.text;
    _heightCircleField.text=_heightField.text;
    
    int w = [_widthField.text intValue];
    int h = [_heightField.text intValue];
    
    int wHundred = w*100;
    int hHundred = h*100;

    
    /*CGFloat width = w;
    CGFloat height = w;*/
    
   

    
    if([headerLabel.text isEqualToString:@"Edit Mat"]){
        
        CGRect myMatRect = CGRectMake( 100.0f, 100.0f, wHundred, hHundred);
        interactiveMatView = [[UIImageView alloc]initWithFrame:myMatRect];
       // CGRect myImageRect = CGRectMake( 100.0f, 100.0f, 40.0f, 40.0f);
        
        
    }else{
        
        
    }

    
    
   /* UILongPressGestureRecognizer *gestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    logoPicButton.userInteractionEnabled = YES;
    gestureRecognizer.minimumPressDuration = 0.3;
    gestureRecognizer.delegate = self;
    gestureRecognizer.numberOfTouchesRequired = 1;
    [logoPicButton addGestureRecognizer:gestureRecognizer];*/
    
    
   /* UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scale:)] ;
	[pinchRecognizer setDelegate:self];
	[self.view addGestureRecognizer:pinchRecognizer];*/
    //[self.textDecField addGestureRecognizer:pinchRecognizer];
    
    //nameField.text =nameString;
    
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scale:)] ;
	[pinchRecognizer setDelegate:self];
	[self.logoPicButton addGestureRecognizer:pinchRecognizer];
    
    UIPinchGestureRecognizer *pinchRecognizerDec = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scaleDec:)] ;
	[pinchRecognizerDec setDelegate:self];
	[self.textDecField addGestureRecognizer:pinchRecognizerDec];
    
    
    
    
    /*UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)] ;
	[panRecognizer setMinimumNumberOfTouches:1];
	[panRecognizer setMaximumNumberOfTouches:1];
	[panRecognizer setDelegate:self];
	[logoPicButton addGestureRecognizer:panRecognizer];*/
    
    matButton.hidden =NO;
    logoButton.hidden= NO;
    titleLabel.hidden =NO;
    homeButton.hidden =NO;
    titleBar.hidden =NO;
    
    NSArray *directoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *imagePath =  [directoryPath objectAtIndex:0];
    imagePath= [imagePath stringByAppendingPathComponent:@"logoImage.png"];
    
    
    
    
    
    
    
    NSData *data = [NSData dataWithContentsOfFile:imagePath];
    UIImage *logoImage = [UIImage imageWithData:data];
    
    //[logoPicButton setBackgroundImage:selectedImage forState:UIControlStateNormal];
    NSLog(@"logoUseStringSendInteractive %@",_logoUseStringHere);
   
    if (imagePath == Nil){
        
        
        UIImage *image = [UIImage imageNamed:@"JadeTeaHouseLogo.png"];
		[logoPicButton setImage:image forState:UIControlStateNormal];
    }
    
    else {
        
        
		
        
        //[[self.logoPicButton imageView] setContentMode: UIViewContentModeScaleToFill];
        
        [[self.logoPicButton imageView] setContentMode: UIViewContentModeScaleAspectFit];
        //[self.logoPicButton setImage:logoImage forState:UIControlStateNormal];
        [self.logoPicButton setBackgroundImage:logoImage forState:UIControlStateNormal];
        
        
    
    }
    
   
    
    //configure carousel
    carouselSize.type = iCarouselTypeCoverFlow2;
    carouselColor.type = iCarouselTypeCoverFlow2;
    carouselLogo.type = iCarouselTypeCustom;
    
   
        
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
    NSLog(@"Delegate: menuActivated");
    NSLog(@"%@",_actionSelectedString);
    
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
    
    if([(UIPinchGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        _lastScale = 1.0;
    }
    
    
    CGFloat scale = 1.0 - (_lastScale - [(UIPinchGestureRecognizer*)sender scale]);
    
   /* CGAffineTransform currentTransform = chosenImageView.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, scale, scale);
    
    [chosenImageView setTransform:newTransform];*/
    
    
    CGAffineTransform currentTransformLogo = logoPicButton.transform;
    CGAffineTransform newTransformLogo = CGAffineTransformScale(currentTransformLogo, scale, scale);
    
    [logoPicButton setTransform:newTransformLogo];
    
    
    _lastScale = [(UIPinchGestureRecognizer*)sender scale];
    //[self showOverlayWithFrame:chosenImageView.frame];
}


-(void)scaleDec:(id)sender {
    
    if([(UIPinchGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        _lastScale = 1.0;
    }
    
    
    CGFloat scale = 1.0 - (_lastScale - [(UIPinchGestureRecognizer*)sender scale]);
    
    /* CGAffineTransform currentTransform = chosenImageView.transform;
     CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, scale, scale);
     
     [chosenImageView setTransform:newTransform];*/
    
    
    CGAffineTransform currentTransform = textDecField.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, scale, scale);
    
    [textDecField setTransform:newTransform];
    
    
    _lastScale = [(UIPinchGestureRecognizer*)sender scale];
    //[self showOverlayWithFrame:chosenImageView.frame];
}

-(void)scaleNote:(id)sender {
    
    if([(UIPinchGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        _lastScale = 1.0;
    }
    
    
    CGFloat scale = 1.0 - (_lastScale - [(UIPinchGestureRecognizer*)sender scale]);
    
    /* CGAffineTransform currentTransform = chosenImageView.transform;
     CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, scale, scale);
     
     [chosenImageView setTransform:newTransform];*/
    
    
    CGAffineTransform currentTransform = textNoteField.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, scale, scale);
    
    [textNoteField setTransform:newTransform];
    
    
    _lastScale = [(UIPinchGestureRecognizer*)sender scale];
    //[self showOverlayWithFrame:chosenImageView.frame];
}

/*-(IBAction)addHexColor:(id)sender{
    

    NSString*hexString=hexField.text;
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    if (red) {*red = ((baseValue >> 24) & 0xFF)/255.0f; }
    if (green) { *green = ((baseValue >> 16) & 0xFF)/255.0f; }
    if (blue) { *blue = ((baseValue >> 8) & 0xFF)/255.0f; }
    if (alpha) { *alpha = ((baseValue >> 0) & 0xFF)/255.0f; }
    
    
    UIColor * SKColorFromHexString(NSString * hexString) {
        float red, green, blue, alpha;
        SKScanHexColor(hexString, &red, &green, &blue, &alpha);
        
        return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    }
    
    
    UIButton *colorButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [colorButton addTarget:self action:@selector(myCustomFunction:) forControlEvents:UIControlEventTouchUpInside];
    /*[myButton setBackgroundImage:[UIImage imageNamed:@"yourImageName.png"] forState:UIControlStateNormal];*/

    /*[myButton setColor:[UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    colorButton.frame = CGRectMake(304.0, 300.0, 44.0, 44.0);
    
    [self addSubview:myButton];
    
}*/
-(IBAction)addNote:(id)sender{
    
    
    textNoteField = [[UITextField alloc] initWithFrame:CGRectMake(445, 300, 300, 60)];
    //textNoteField.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    textNoteField.textColor = [UIColor redColor];
    textNoteField.font = [UIFont fontWithName:@"Avenir-Light" size:25];
    textNoteField.backgroundColor=[UIColor whiteColor];
    textNoteField.text=@"DESIGN TEXT";
    [self.view addSubview:textNoteField];
    
    [textNoteField addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [textNoteField addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
    
    /*UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scaleNote:)] ;
	[pinchRecognizer setDelegate:self];
	[self.textNoteField addGestureRecognizer:pinchRecognizer];
    
    [textNoteField addTarget:self action:@selector(scaleNote:) forControlEvents:pinchRecognizer];*/
    
}

-(IBAction)addText:(id)sender{
    
    
    textDecField = [[UITextField alloc] initWithFrame:CGRectMake(445, 200, 300, 60)];
    textDecField.textColor = [UIColor whiteColor];
    textDecField.font = [UIFont fontWithName:@"Avenir-Light" size:25];
    textDecField.backgroundColor=[UIColor clearColor];
    textDecField.text=@"NOTES";
    [self.view addSubview:textDecField];
    
    [textDecField addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [textDecField addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    

    
}

-(IBAction)hideNotes:(id)sender{
    
    textNoteField.hidden = YES;
}

-(IBAction)showNotes:(id)sender{
    
    textNoteField.hidden = NO;
    
}


-(IBAction)goMail:(UIButton*)sender event:(id)event {
    
    //CGRect screenRect2 = self.view.frame;
    //CGRect screenRect1 = CGRectMake(637.0,357.0,998,580);
    CGRect screenRect2 = CGRectMake(0.0,0,1028,720);
    
    
    UIGraphicsBeginImageContext(screenRect2.size);
    //UIGraphicsBeginImageContext(interactiveMatView.size);
    
    CGContextRef ctx1 = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] set];
    CGContextFillRect(ctx1, screenRect2);
    
    [self.view.layer renderInContext:ctx1];
    
    UIImage *matImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    //save image to documents
    
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/matImage.jpg"]];
    [UIImageJPEGRepresentation(matImage, 1.0) writeToFile:imagePath atomically:YES];
    
    
    
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
    
    
    
    //NSArray *toRecipents = [NSArray arrayWithObject:emailString];
    //NSArray *toRecipents = @"yummy@nomadcandy.com";
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    
    //[mc setToRecipients:toRecipents];
    
    NSMutableArray*recipients=[[NSMutableArray alloc]init];
    
    NSArray *directoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *imagePath1 =  [directoryPath objectAtIndex:0];
    imagePath1= [imagePath1 stringByAppendingPathComponent:@"matImage.jpg"];
    
    NSData *data = [NSData dataWithContentsOfFile:imagePath1];
    UIImage *image = [UIImage imageWithData:data];
    
    
    
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
    
    /*UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Your invites have been sent" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
     
     [alert show];*/
    
    
}


-(IBAction)goSearch:(id)sender{
    
    NSString*searchString= searchField.text;
    //NSString*passwordString= passwordField.text;
    
    //loginView.hidden =YES;
    //loginField.hidden=YES;
    //passwordField.hidden =YES;
    //goButton.hidden =YES;
    
    
    
    
    
    
    /*BOOL error = NO;
     
     if(loginField.text == nil || [loginField.text length] == 0)
     {
     error = YES;
     //[nameErrorBG setBackgroundColor:[UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:0.1f]];
     }
     
     if(passwordField.text == nil || [passwordField.text length] == 0)
     {
     error = YES;
     //[passwordErrorBG setBackgroundColor:[UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:0.1f]];
     }*/
    
    
    
    /*if(error)
     {
     [self showError];
     return;
     }*/
    
    
    
    
    
    //NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://ipad.cintasmats.com/Login/?username=oclipse&password=password"]];
    
    
    // NSString*urlLoginString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/Login/?username=%@&password=%@", searchString,passwordString];
    
    NSString*urlSearchString=[NSString stringWithFormat:@"http://ipad.cintasmats.com/LogoSearchResults/?searchLogoString=%@&Orderby=match", searchString];

    
    
    NSURL *urlSearch = [[NSURL alloc] initWithString:urlSearchString];
    
    
    //[theRequest setHTTPMethod:@"POST"];
    //[theRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    
    NSLog(@"URLLOGIN: %@",urlSearch);
    
    
    
    NSError *error = nil;
    
    
    
    NSData *data = [NSData dataWithContentsOfURL:urlSearch];
    
    
    
    //parse Dictionary from web
    NSDictionary *searchLogoDictionary = [NSJSONSerialization
                                          JSONObjectWithData:data
                                          options:NSJSONReadingAllowFragments
                                          error: &error];
    
    
    //parse Array from web
    NSArray *searchLogoArray = [NSJSONSerialization
                                JSONObjectWithData:data
                                options:NSJSONReadingAllowFragments
                                error: &error];
    
    
    
    
    
    
    NSLog(@"%@SEARCHLOGODICTIONARY",searchLogoDictionary);
    NSLog(@"%@SEARCHLOGOARRAY",searchLogoArray);
    
    //crashes here
    //NSArray* keysAllLogosArray = [searchLogoDictionary allKeys];
    
    //NSLog(@"%@KEYSALLLOGOSARRAY",keysAllLogosArray);
    
    
    [searchLogoArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
        
        NSLog(@"%@", object);
        NSLog(@"searchLogoArray %@",searchLogoArray);
        
        
        artworkNameArray = [searchLogoArray valueForKey:@"ArtworkName"];
        
        
        NSLog(@"artWorkNameArray: %@", artworkNameArray);
        
        
        //adding an array to COREDATA
        //NSString *predicateString = [NSString stringWithFormat @"artworkNameArray == $EMPLOYEE_ID"];
        /*  NSString *predicateString = [NSString stringWithFormat @"artworkNameArray == ArtworkName"];
         NSPredicate *predicate = [NSPredicate predicateWithFormat:predicateString];
         
         for (NSString *anArtworkName in logoSearchs) {
         NSDictionary *variables = @{ @"ArtworkName" : anArtworkName };
         NSPredicate *localPredicate = [predicate predicateWithSubstitutionVariables:variables];*/
        
        
        
        
        
        artworkSizeArray = [searchLogoArray valueForKey:@"ArtworkSize"];
        NSLog(@"artworkSizeArray %@",artworkSizeArray);
        
        
        
        
        artworkFormatArray = [searchLogoArray valueForKey:@"Format"];
        NSLog(@"artworkFormatString %@",artworkFormatArray);
        
        
        
        
        artworkFullImageArray = [searchLogoArray valueForKey:@"FullImageURL"];
        NSLog(@"fullImageArray %@",artworkFullImageArray);
        
        
        artworkIconArray = [searchLogoArray valueForKey:@"IconURL"];
        
        
        artworkIDArray = [searchLogoArray valueForKey:@"ProductID"];
        //NSLog(@"idString %@",idString);
        
        
        
    }];
    
    //declare variable and return count of images returned
    int jsonLogoCount;
    jsonLogoCount = artworkNameArray.count;
    
    // NSLog(@"jsonLogoCount %d",jsonLogoCount);
    /*for (int i = 0;i<jsonLogoCount;i++){
     
     
     
     NSDictionary*logosNameDictionary  = [artworkNameArray objectAtIndex:i];
     
     NSLog(@"logosDictionary %@",logosNameDictionary);
     
     }*/
    
    //NSManagedObject *myManagedObject;
    /*for (int i=0;i<jsonLogoCount;i++) {
     
     artworkNameAddString =[artworkNameArray objectAtIndex:i];
     NSLog(@"artworkNameAddString= %@", artworkNameAddString);
     
     //calls method to add the string to CoreData
     //[self insertNewManagedObject:[artworkNameArray objectAtIndex:i]];
     [self insertNewManagedObject:artworkNameAddString];
     
     }*/
    
    /* for (int i=0;i<jsonLogoCount;i++) {
     //delete existing data
     
     
     
     
     
     
     
     
     // loops to add values
     artworkNameAddString =[artworkNameArray objectAtIndex:i];
     NSLog(@"artworkNameAddString= %@", artworkNameAddString);
     
     artworkFullImageString =[artworkFullImageArray objectAtIndex:i];
     NSLog(@"artworkFullImageString = %@", artworkFullImageString );
     
     NSManagedObjectContext *context = [self managedObjectContext];
     
     // Create a new managed object
     NSManagedObject *newLogoSearch = [NSEntityDescription insertNewObjectForEntityForName:@"LogoSearch" inManagedObjectContext:context];
     
     // Delete object from database
     //[context deleteObject:[self.LogoSearch objectAtIndex:indexPath.row]];
     
     [newLogoSearch setValue:self.artworkNameAddString forKey:@"artworkName"];
     [newLogoSearch setValue:self.artworkFullImageString forKey:@"fullImageURL"];
     //[newDevice setValue:self.companyTextField.text forKey:@"company"];
     
     NSError *error = nil;
     // Save the object to persistent store
     if (![context save:&error]) {
     NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
     }
     //Fetch Data entered to test
     NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
     NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"LogoSearch"];
     self.favoritesArray = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
     //self->artworkName = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
     
     
     NSLog(@"favoritesArray %@",favoritesArray);
     
     
     }*/
    
    
    
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
    
    

/*- (IBAction)screenShot:(UIButton *)sender{
    
    
    
    //begin capture entire webview
    CGRect screenRect = self.view.frame;
    
    UIGraphicsBeginImageContext(screenRect.size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] set];
    CGContextFillRect(ctx, screenRect);
    
    [self.view.layer renderInContext:ctx];
    
    UIImage *orderImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    //TODO pass save  orderImage to device and pass to SignOffScreen
    
    //chosenImageView.image = orderImage;
    //chosenImage = newImage;
    
    
    
    NSLog(@"chosenImage %@",selectedImage);
    
    
    
}*/


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
    
    
    
    NSLog(@"chosenImage %@",selectedImage);
    
    
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

//not hit
/*- (IBAction)hideMenu:(id)sender


{
    [DIYMenu dismiss];
    
   

}*/

/*- (IBAction)tapped:(id)sender
{
    NSLog(@"sender %@",sender);
    [DIYMenu dismiss];
}*/


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

-(IBAction) twoByTwo:(id)sender{
    
    _widthField.text = @"2'";
    _widthCircleField.text = @"2'";
    
    _heightField.text = @"2'";
    _heightCircleField.text = @"2'";
    
}

-(IBAction) threeByFive:(id)sender{
    
    _widthField.text = @"3'";
    _widthCircleField.text = @"3'";
    
    _heightField.text = @"5'";
    _heightCircleField.text = @"5'";
    
    
    
}

-(IBAction) fourBySix:(id)sender{
    
   
    _widthField.text = @"4'";
    _widthCircleField.text = @"4'";
    
    _heightField.text = @"6'";
    _heightCircleField.text = @"6'";
}

-(IBAction) threeByTen:(id)sender{
    
    _widthField.text = @"3'";
    _widthCircleField.text = @"3'";
    
    _heightField.text = @"10'";
    _heightCircleField.text = @"10'";

    
}

//Not Used
#pragma mark-
#pragma mark Segue

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([segue.identifier isEqualToString:@"InteractiveSegue"]) {
        
        InteractiveViewController *destViewController = segue.destinationViewController;
        //[self presentViewController:destViewController animated:YES completion:nil];
        
        
    }
    
    if ([segue.identifier isEqualToString:@"MatPickedSegue"]) {
        
        SignOffViewController *destViewController = segue.destinationViewController;
        //[self presentViewController:destViewController animated:YES completion:nil];
        
        destViewController.matImage=interactiveMatView.image;
        destViewController.logoImage=logoPicButton.imageView.image;

        
        
        
        
    }
    
    if ([segue.identifier isEqualToString:@"SearchSegue"]) {
        
        LogoCollectionViewController *goingController = segue.destinationViewController;
        //[self presentViewController:goingController animated:YES completion:nil];
        
        NSLog(@"artworkNameArray %@",artworkNameArray);
        goingController.artworkNameArray = artworkNameArray;
        
        // NSLog(@"jsonLogoCount %i",jsonLogoCount);
        // goingController.jsonLogoCount = jsonLogoCount;
        
        NSLog(@"artworkSizeArray %@",artworkSizeArray);
        goingController.artworkSizeArray = artworkSizeArray;
        
        NSLog(@"artworkFormatArray %@",artworkFormatArray);
        goingController.artworkFormatArray = artworkFormatArray;
        
        NSLog(@"artworkIconArray %@",artworkIconArray);
        goingController.artworkIconArray = artworkIconArray;
        
        NSLog(@"artworkFullImageArray %@",artworkFullImageArray);
        goingController.artworkFullImageArray = artworkFullImageArray;
        
        NSLog(@"artworkIDArray %@",artworkIDArray);
        goingController.artworkIDArray = artworkIDArray;
        
        goingController.artworkSellerArray = artworkSellerArray;
        
        
        
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
