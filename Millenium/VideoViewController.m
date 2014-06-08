//
//  VideoViewController.m
//  Millenium
//
//  Created by Jami Sue Becker on 3/27/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController

@synthesize logoButton;
@synthesize indoorButton;

@synthesize carouselLogo;
@synthesize carouselIndoor;
@synthesize carouselIndoorOutdoor;
@synthesize carouselScraperUtility;
@synthesize carouselFoodService;
@synthesize carouselAntiFatigue;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
 {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization
 }
 return self;
 }



- (void)dealloc
{
    carouselLogo.delegate = nil;
    carouselLogo.dataSource = nil;
    carouselIndoor.delegate = nil;
    carouselIndoor.dataSource = nil;
    carouselIndoorOutdoor.delegate = nil;
    carouselIndoorOutdoor.dataSource = nil;
    carouselScraperUtility.delegate = nil;
    carouselFoodService.dataSource = nil;
    carouselAntiFatigue.delegate = nil;
    carouselAntiFatigue.dataSource = nil;
    
    
}



#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //configure carousel
    carouselLogo.type= iCarouselTypeCoverFlow2;
    carouselIndoor.type = iCarouselTypeCoverFlow2;
    carouselIndoorOutdoor.type = iCarouselTypeCoverFlow2;
    carouselScraperUtility.type = iCarouselTypeCoverFlow2;
    carouselFoodService.type = iCarouselTypeCoverFlow2;
    carouselAntiFatigue.type = iCarouselTypeCoverFlow2;
    
    //carouselIndoor.hidden =NO;
    [carouselLogo setAlpha:0.9f];
    [carouselIndoor setAlpha:0.1f];
    carouselIndoorOutdoor.hidden =YES;
    carouselIndoorOutdoor.hidden =YES;
    carouselScraperUtility.hidden =YES;
    carouselFoodService.hidden =YES;
    carouselAntiFatigue.hidden =YES;
    
    hideCarouselView.hidden =YES;
    hideGradCarouselView.hidden=YES;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.carouselLogo = nil;
    self.carouselIndoor = nil;
    self.carouselIndoorOutdoor = nil;
    self.carouselScraperUtility = nil;
    self.carouselFoodService = nil;
    self.carouselAntiFatigue = nil;
    
    
    self.label = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}

#pragma mark -
#pragma mark iCarousel methods

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //if statements to support items per view
    
    if (carousel.tag==1)
        
    {
        //generate 100 item views
        //normally we'd use a backing array
        //as shown in the basic iOS example
        //but for this example we haven't bothered
        return 5;
        
    }
    
    
    if (carousel.tag==2){
        
        
        return 4;
    }
    
    if (carousel.tag==3){
        
        return 3;
        
    }
    
    if (carousel.tag==4){
        
        return 4;
        
    }
    
    if (carousel.tag==5){
        
        return 4;
        
    }
    
    else {
        
        return 5;
        
    }
    
    
}


- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    //UILabel *titleLabel = (UILabel *)view;
    
    //UILabel *titleLabel = [ [UILabel alloc ] initWithFrame:CGRectMake(400, 300.0, 150.0, 43.0) ];
    UILabel *titleLabel = [ [UILabel alloc ] initWithFrame:CGRectMake(100, 100.0, 150.0, 43.0) ];
    titleLabel.textAlignment =  UITextAlignmentCenter;
    titleLabel.textColor = [UIColor darkGrayColor];
    titleLabel.backgroundColor = [UIColor whiteColor];
    titleLabel.font = [UIFont fontWithName:@"Avenir" size:(36.0)];
    
    
    if (titleLabel == nil){
        
        
        //[self addSubview:titleLabel];
        
        
    }
    
    
    
    
	UIButton *button = (UIButton *)view;
	if (button == nil)
        
        
    {
        button.layer.shadowColor = [UIColor darkGrayColor].CGColor;
        button.layer.shadowOpacity = 0.1;
        button.layer.shadowRadius = 3;
        button.layer.shadowOffset = CGSizeMake(3.0f, 4.0f);
        button.titleLabel.shadowOffset = CGSizeMake(1.0, 1.0);
        [button setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [button.titleLabel setFont:[UIFont fontWithName:@"Avenir-Light" size:18.0]];
		[button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        
	}
	
	//set button label
	//[button setTitle:[NSString stringWithFormat:@"%i", index] forState:UIControlStateNormal];
    
    
    //if (carousel.tag==1)
        
    if ([carousel isEqual:carouselLogo])
        
    {

    
        if (index ==0)  {
        
        
        
            titleLabel.text = @"Walk-Off Logo Mat";
        
            UIImage *image = [UIImage imageNamed:@"WalkOffLogoMat.png"];
            [button setTitle:[NSString stringWithFormat:@"Walk-Off Logo Mat"] forState:UIControlStateNormal ];
        
            [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];

            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button.titleLabel setTextAlignment:NSBaselineOffsetAttributeName];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonTappedWalkOffLogoMat:) forControlEvents:UIControlEventTouchUpInside];
        }
    
        if (index ==1){
        
            titleLabel.text = @"Water Guard Logo Inlay";
            [button setTitle:[NSString stringWithFormat:@"Water Guard Logo Inlay"] forState:UIControlStateNormal];
            UIImage *image = [UIImage imageNamed:@"WaterGuardLogoInlay.png"];
        
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            [button addTarget:self action:@selector(WaterGuardLogoInlay:) forControlEvents:UIControlEventTouchUpInside];
        
        }
    
        if (index ==2){
        
            [button setTitle:[NSString stringWithFormat:@"Motif Mat"] forState:UIControlStateNormal];
            UIImage *image = [UIImage imageNamed:@"MotifMat.png"];
        
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            [button addTarget:self action:@selector(MotifMat:) forControlEvents:UIControlEventTouchUpInside];
        
        }
    
    
    
        if (index == 3){
        
            [button setTitle:[NSString stringWithFormat:@"Ultra Guard Logo Inlay"] forState:UIControlStateNormal];
            UIImage *image = [UIImage imageNamed:@"UltraGuardLogoInlay.png"];
        
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            [button addTarget:self action:@selector(UltraGuardLogoInlay:) forControlEvents:UIControlEventTouchUpInside];
            
        
        
        }
    
        if (index == 4){
        
        
            [button setTitle:[NSString stringWithFormat:@"First Step Logo Scraper"] forState:UIControlStateNormal];
            UIImage *image = [UIImage imageNamed:@"FirstStepLogoScraper.png"];
        
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            [button addTarget:self action:@selector(FirstStepLogoScraper:) forControlEvents:UIControlEventTouchUpInside];
        
        
        }
    
        if (index == 5){
        
            [button setTitle:[NSString stringWithFormat:@"Logo Color Guidelines"] forState:UIControlStateNormal];
            UIImage *image = [UIImage imageNamed:@"LogoColorGuidelines.png"];
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            [button addTarget:self action:@selector(LogoColorGuidelines:) forControlEvents:UIControlEventTouchUpInside];

        
        
        
        
        }
        
    }
    
    
    if ([carousel isEqual:carouselIndoor])
        
    {
        
        
        if (index ==0)  {
            
            
            
            titleLabel.text = @"Golden Series";
            
            UIImage *image = [UIImage imageNamed:@"WebPadBig.png"];
            [button setTitle:[NSString stringWithFormat:@"Golden Series"] forState:UIControlStateNormal ];
            
            [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button.titleLabel setTextAlignment:NSBaselineOffsetAttributeName];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonTappedGoldenSeries:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        if (index ==1){
            
            titleLabel.text = @"Silver Series";
            [button setTitle:[NSString stringWithFormat:@"Silver Series"] forState:UIControlStateNormal];
            UIImage *image = [UIImage imageNamed:@"SilverSeries.png"];
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonTappedSilverSeries:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        
        if (index ==2){
            
            [button setTitle:[NSString stringWithFormat:@"Walk-Off Pheonix Mat"] forState:UIControlStateNormal];
            UIImage *image = [UIImage imageNamed:@"Walk-OffPheonixMat.png"];
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonTappedWalkOffPheonixMat:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        
        
        
        if (index == 3){
            
            [button setTitle:[NSString stringWithFormat:@"Tread Lock"] forState:UIControlStateNormal];
            UIImage *image = [UIImage imageNamed:@"TreadLock.png"];
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonTappedWalkOffTreadLock:) forControlEvents:UIControlEventTouchUpInside];
            
            
        }
        
        
    }
    
    if (carousel.tag==3)
        
    {
        
        
        if (index ==0)  {
            
            
            
            titleLabel.text = @"WaterGuard Mat";
            
            UIImage *image = [UIImage imageNamed:@"WaterGuardMat.png"];
            [button setTitle:[NSString stringWithFormat:@"WaterGuard Mat"] forState:UIControlStateNormal ];
            
            [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button.titleLabel setTextAlignment:NSBaselineOffsetAttributeName];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonTappedWaterGuard:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        if (index ==1){
            
            titleLabel.text = @"UltraGuard";
            [button setTitle:[NSString stringWithFormat:@"UltraGuard"] forState:UIControlStateNormal];
            UIImage *image = [UIImage imageNamed:@"UltraGuard.png"];
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonTappedUltraGuard:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        
        if (index ==2){
            
            titleLabel.text = @"EcoGuard";
            [button setTitle:[NSString stringWithFormat:@"EcoGuard"] forState:UIControlStateNormal];
            UIImage *image = [UIImage imageNamed:@"EcoGuard.png"];
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonTappedEcoGuard:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        
        
        
        
    }


    //TODO change titles here-SCRAPER MATS
    if (carousel.tag==4)
        
    {
        
        
        if (index ==0)  {
            
            
            
            titleLabel.text = @"Walk-Off Logo Mat";
            
            UIImage *image = [UIImage imageNamed:@"WalkOffLogoMat.png"];
            [button setTitle:[NSString stringWithFormat:@"Walk-Off Logo Mat"] forState:UIControlStateNormal ];
            
            [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button.titleLabel setTextAlignment:NSBaselineOffsetAttributeName];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonTappedWalkOffLogoMat:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        if (index ==1){
            
            titleLabel.text = @"Water Guard Logo Inlay";
            [button setTitle:[NSString stringWithFormat:@"Water Guard Logo Inlay"] forState:UIControlStateNormal];
            UIImage *image = [UIImage imageNamed:@"WaterGuardLogoInlay.png"];
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            
        }
        
        if (index ==2){
            
            [button setTitle:[NSString stringWithFormat:@"Motif Mat"] forState:UIControlStateNormal];
            UIImage *image = [UIImage imageNamed:@"MotifMat.png"];
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            
        }
        
        
        
        if (index == 3){
            
            [button setTitle:[NSString stringWithFormat:@"Ultra Guard Logo Inlay"] forState:UIControlStateNormal];
            UIImage *image = [UIImage imageNamed:@"UltraGuardLogoInlay.png"];
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            
            
        }
        
        if (index == 4){
            
            
            [button setTitle:[NSString stringWithFormat:@"First Step Logo Scraper"] forState:UIControlStateNormal];
            UIImage *image = [UIImage imageNamed:@"FirstStepLogoScraper.png"];
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            
            
        }
        
        if (index == 5){
            
            [button setTitle:[NSString stringWithFormat:@"Logo Color Guidelines"] forState:UIControlStateNormal];
            
            //[button addTarget:self action:@selector(buttonTappedSix:) forControlEvents:UIControlEventTouchUpInside];
            
            
        }
        
    }
    
    if (carousel.tag==5)
        
    {
        
        
        if (index ==0)  {
            
            
            
            titleLabel.text = @"Walk-Off Logo Mat";
            
            UIImage *image = [UIImage imageNamed:@"WalkOffLogoMat.png"];
            [button setTitle:[NSString stringWithFormat:@"Walk-Off Logo Mat"] forState:UIControlStateNormal ];
            
            [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button.titleLabel setTextAlignment:NSBaselineOffsetAttributeName];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonTappedWalkOffLogoMat:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        if (index ==1){
            
            titleLabel.text = @"Water Guard Logo Inlay";
            [button setTitle:[NSString stringWithFormat:@"Water Guard Logo Inlay"] forState:UIControlStateNormal];
            UIImage *image = [UIImage imageNamed:@"WaterGuardLogoInlay.png"];
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            
        }
        
        if (index ==2){
            
            [button setTitle:[NSString stringWithFormat:@"Motif Mat"] forState:UIControlStateNormal];
            UIImage *image = [UIImage imageNamed:@"MotifMat.png"];
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            
        }
        
        
        
        if (index == 3){
            
            [button setTitle:[NSString stringWithFormat:@"Ultra Guard Logo Inlay"] forState:UIControlStateNormal];
            UIImage *image = [UIImage imageNamed:@"UltraGuardLogoInlay.png"];
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            
            
        }
        
        if (index == 4){
            
            
            [button setTitle:[NSString stringWithFormat:@"First Step Logo Scraper"] forState:UIControlStateNormal];
            UIImage *image = [UIImage imageNamed:@"FirstStepLogoScraper.png"];
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            
            
        }
        
        if (index == 5){
            
            [button setTitle:[NSString stringWithFormat:@"Logo Color Guidelines"] forState:UIControlStateNormal];
            
            //[button addTarget:self action:@selector(buttonTappedSix:) forControlEvents:UIControlEventTouchUpInside];
            
            
        }
        
    }
    
    if (carousel.tag==6)
        
    {
        
        
        if (index ==0)  {
            
            
            
            titleLabel.text = @"Walk-Off Logo Mat";
            
            UIImage *image = [UIImage imageNamed:@"WalkOffLogoMat.png"];
            [button setTitle:[NSString stringWithFormat:@"Walk-Off Logo Mat"] forState:UIControlStateNormal ];
            
            [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button.titleLabel setTextAlignment:NSBaselineOffsetAttributeName];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonTappedWalkOffLogoMat:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        if (index ==1){
            
            titleLabel.text = @"Water Guard Logo Inlay";
            [button setTitle:[NSString stringWithFormat:@"Water Guard Logo Inlay"] forState:UIControlStateNormal];
            UIImage *image = [UIImage imageNamed:@"WaterGuardLogoInlay.png"];
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            
        }
        
        if (index ==2){
            
            [button setTitle:[NSString stringWithFormat:@"Motif Mat"] forState:UIControlStateNormal];
            UIImage *image = [UIImage imageNamed:@"MotifMat.png"];
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            
        }
        
        
        
        if (index == 3){
            
            [button setTitle:[NSString stringWithFormat:@"Ultra Guard Logo Inlay"] forState:UIControlStateNormal];
            UIImage *image = [UIImage imageNamed:@"UltraGuardLogoInlay.png"];
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            
            
        }
        
        if (index == 4){
            
            
            [button setTitle:[NSString stringWithFormat:@"First Step Logo Scraper"] forState:UIControlStateNormal];
            UIImage *image = [UIImage imageNamed:@"FirstStepLogoScraper.png"];
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.15, image.size.height/1.15);
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            
            
        }
        
        if (index == 5){
            
            [button setTitle:[NSString stringWithFormat:@"Logo Color Guidelines"] forState:UIControlStateNormal];
            
            //[button addTarget:self action:@selector(buttonTappedSix:) forControlEvents:UIControlEventTouchUpInside];
            
            
        }
        
    }



    
    
	return button;
}


/*- (IBAction)buttonTappedSix:(UIButton *)sender{
 
 
 
 [self presentViewController:InteractiveViewController animated:YES completion:nil];
 
 
 
 }*/

- (IBAction)indoorMats:(UIButton *)sender {
    
    [carouselLogo setAlpha:0.1f];
    [carouselIndoor setAlpha:1.0f];
    //carouselLogo.hidden =YES;
    //carouselIndoor.hidden =NO;
    /*carouselIndoorOutdoor.hidden =YES;
    carouselScraperUtility.hidden =YES;
    carouselFoodService.hidden =YES;
    carouselAntiFatigue.hidden =YES;*/
    
    //[self.carouselIndoor reloadData];
    
}



- (IBAction)goMarketing:(UIButton *)sender {
    
    UIStoryboard *storyboard = self.storyboard;
    ViewController *videovc = [storyboard instantiateViewControllerWithIdentifier:@"MarketingViewBoard"];
    [self presentViewController:videovc animated:YES completion:nil];
    
    
}

- (IBAction)goHome:(UIButton *)sender {
    
    UIStoryboard *storyboard = self.storyboard;
    ViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"HomeStoryboard"];
    [self presentViewController:vc animated:YES completion:nil];
    
    
}

- (IBAction)buttonTappedWalkOffLogoMat:(UIButton *)sender {
    
    
       //hideCarouselView.hidden=NO;
       // hideGradCarouselView.hidden=NO;
    
    
    
        //NSString* moviePath = [[NSBundle mainBundle] pathForResource:@"WalkOffLogoMatMobile" ofType:@"m4v"];
        //NSURL* movieURL = [NSURL fileURLWithPath:moviePath];
    
        NSString* moviePath =@"http://youtu.be/i0eDiP9ib6Q";
        NSURL* movieURL = [NSURL fileURLWithPath:moviePath];

    
    
       [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtu.be/i0eDiP9ib6Q"]];

        
        _movieController =  [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
        _movieController.scalingMode = MPMovieScalingModeFill;
        _movieController.controlStyle = MPMovieControlStyleNone;
    
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(moviePlayBackDidFinish:)
                                                     name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    
        [_movieController.view setFrame:CGRectMake(150,130, 920, 520)];
    
        [self.view addSubview:_movieController.view];
        [_movieController play];
    
    
    
    
}






- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    self.movieURL = info[UIImagePickerControllerMediaURL];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


- (void)moviePlayBackDidFinish:(NSNotification *)notification {
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    [self.movieController stop];
    [self.movieController.view removeFromSuperview];
    self.movieController = nil;
    
    //hideGradCarouselView.hidden=YES;
    //hideCarouselView.hidden=YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
