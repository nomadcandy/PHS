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



@synthesize carouselLogo;
@synthesize carouselIndoor;
@synthesize carouselIndoorOutdoor;
@synthesize carouselIndoorScraper;
@synthesize carouselUtilityMats;
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
    carouselIndoorScraper.delegate = nil;
    carouselIndoorScraper.dataSource = nil;
    carouselUtilityMats.delegate = nil;
    carouselUtilityMats.dataSource = nil;
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
    carouselIndoorScraper.type = iCarouselTypeCoverFlow2;
    carouselUtilityMats.type = iCarouselTypeCoverFlow2;
    carouselAntiFatigue.type = iCarouselTypeCoverFlow2;
    
    carouselIndoor.hidden =YES;
    carouselIndoorOutdoor.hidden =YES;
    carouselIndoorScraper.hidden =YES;
    carouselUtilityMats.hidden =YES;
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
    self.carouselIndoorScraper = nil;
    self.carouselUtilityMats = nil;
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
    
    
	return button;
}


/*- (IBAction)buttonTappedSix:(UIButton *)sender{
 
 
 
 [self presentViewController:InteractiveViewController animated:YES completion:nil];
 
 
 
 }*/


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
    
    
       hideCarouselView.hidden=NO;
        hideGradCarouselView.hidden=NO;
    
    
        NSString* moviePath = [[NSBundle mainBundle] pathForResource:@"WalkOffLogoMatMedium" ofType:@"m4v"];
        NSURL* movieURL = [NSURL fileURLWithPath:moviePath];
        
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
    
    hideGradCarouselView.hidden=YES;
    hideCarouselView.hidden=YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
