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


@synthesize delegate=_delegate;

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

@synthesize logoButton;
@synthesize logoPicButton;
@synthesize logoUseString;


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
    NSLog(@"logoUseStringSend %@",logoUseString);
    
    if (logoUseString == Nil){
        
        selectedImage = [UIImage imageNamed:@"jadeteahouselogo.png"];
        //UIImage *image = [UIImage imageNamed:@"JadeTeaHouseLogo.png"];
		//_logoPicButton = [UIButton buttonWithType:UIButtonTypeCustom];
		[logoPicButton setBackgroundImage:selectedImage forState:UIControlStateNormal];
    }
    
    else {
        
        logoPicButton = [UIButton buttonWithType:UIButtonTypeCustom];
        selectedImage = [UIImage imageNamed:logoUseString];
		[logoPicButton setBackgroundImage:selectedImage forState:UIControlStateNormal];
    }

    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    //[logoPicButton setBackgroundImage:selectedImage forState:UIControlStateNormal];
    NSLog(@"logoUseStringSendInteractive %@",logoUseString);
   
    if (logoUseString == Nil){
        
        selectedImage = [UIImage imageNamed:@"jadeteahouselogo.png"];
        //UIImage *image = [UIImage imageNamed:@"JadeTeaHouseLogo.png"];
		//_logoPicButton = [UIButton buttonWithType:UIButtonTypeCustom];
		[logoPicButton setBackgroundImage:selectedImage forState:UIControlStateNormal];
    }
    
    else {
        
        logoPicButton = [UIButton buttonWithType:UIButtonTypeCustom];
        selectedImage = [UIImage imageNamed:logoUseString];
		[logoPicButton setBackgroundImage:selectedImage forState:UIControlStateNormal];
        
         //[logoPicButton reloadInputViews];
   }
    
   
    //[DIYMenu isActivated];
    
    //configure carousel
    carouselSize.type = iCarouselTypeCoverFlow2;
    carouselColor.type = iCarouselTypeCoverFlow2;
    carouselLogo.type = iCarouselTypeCustom;
    
   
        
    }
    
    // Override point for customization after application launch.
    //return YES;

- (void)setString:(NSString *)string
{
    [self.delegate setString:string];
    
    
    //[self.delegate setString:string];
    
    [self.delegate setString:logoUseString];
}

    


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

//hits this
-(IBAction)goHome:(id)sender{
    
    
    
    UIStoryboard *storyboard = self.storyboard;
    ViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"HomeStoryboard"];
    [self presentViewController:vc animated:YES completion:nil];
    
    
}




-(IBAction)backButton:(id)sender{
    
     //[self dismissModalViewControllerAnimated:NO];
    
}

//Not Used
#pragma mark-
#pragma mark Segue

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([segue.identifier isEqualToString:@"InteractiveSegue"]) {
        
        InteractiveViewController *destViewController = segue.destinationViewController;
        [self presentViewController:destViewController animated:YES completion:nil];
        
        
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
