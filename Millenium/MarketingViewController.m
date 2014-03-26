//
//  MarketingViewController.m
//  Millenium
//
//  Created by Jami Sue Becker on 3/26/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import "MarketingViewController.h"

@interface MarketingViewController ()

@end

@implementation MarketingViewController
@synthesize carousel;

- (void)dealloc
{
    carousel.delegate = nil;
    carousel.dataSource = nil;
    
}


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //configure carousel
    carousel.type = iCarouselTypeCoverFlow2;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.carousel = nil;
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
    
    if (carousel == logoMatsView)
        
    {
        return 5;
    }
    
    else {
        
        return 0;
        
    }
    
}


- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
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
    
    if (index ==0){
        
        [button setTitle:[NSString stringWithFormat:@"Walk-Off Logo Mat"] forState:UIControlStateNormal];
        UIImage *image = [UIImage imageNamed:@"Walk-OffLogoMat.pdf"];
        
		button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.5, image.size.height/1.5);
		[button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[button setBackgroundImage:image forState:UIControlStateNormal];
        //[button addTarget:self action:@selector(buttonTapped0:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (index ==1){
        
        
        [button setTitle:[NSString stringWithFormat:@"Water Guard Logo Inlay"] forState:UIControlStateNormal];
        UIImage *image = [UIImage imageNamed:@"WaterGuardLogoInlay.pdf"];
        
		button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.5, image.size.height/1.5);
		[button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[button setBackgroundImage:image forState:UIControlStateNormal];
        
    }
    
    if (index ==2){
        
        [button setTitle:[NSString stringWithFormat:@"Motif Mat"] forState:UIControlStateNormal];
        UIImage *image = [UIImage imageNamed:@"MotifMat.pdf"];
        
		button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.5, image.size.height/1.5);
		[button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[button setBackgroundImage:image forState:UIControlStateNormal];
        
    }
    
    
    
    if (index == 3){
        
        [button setTitle:[NSString stringWithFormat:@"Ultra Guard Logo Inlay"] forState:UIControlStateNormal];
        UIImage *image = [UIImage imageNamed:@"UltraGuardLogoInlay.pdf"];
        
		button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.5, image.size.height/1.5);
		[button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[button setBackgroundImage:image forState:UIControlStateNormal];

        
    }
    
    if (index == 4){
        
        
        [button setTitle:[NSString stringWithFormat:@"First Step Logo Scraper"] forState:UIControlStateNormal];
        UIImage *image = [UIImage imageNamed:@"FirstStepLogoScraper.pdf"];
        
		button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.5, image.size.height/1.5);
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




//Method Works
- (IBAction)presentRequestFlierViewController:(UIButton *)sender{
    
    UIStoryboard *storyboard = self.storyboard;
    RequestFlierViewController *rfvc = [storyboard instantiateViewControllerWithIdentifier:@"FlierViewBoard"];
    
    // Configure the new view controller here.
    [self presentViewController:rfvc animated:YES completion:nil];
    
    
}
//Not Using Now
#pragma mark-
#pragma mark Segue

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([segue.identifier isEqualToString:@"RequestFlierSegue"]) {
        
        RequestFlierViewController *destViewController = segue.destinationViewController;
        [self presentViewController:destViewController animated:YES completion:nil];
        
        //TODO pass index selected and carousel
        
        
    }
    
}


#pragma mark -
#pragma mark Button tap event

- (void)buttonTapped:(UIButton *)sender
{
    
    NSInteger index = [carousel indexOfItemViewOrSubview:sender];
    NSLog(@"%i",index);
    
    if (index==1){
        
        
        UIStoryboard *storyboard = self.storyboard;
        RequestFlierViewController *rfvc = [storyboard instantiateViewControllerWithIdentifier:@"FlierViewBoard"];
        
        // Configure the new view controller here.
        [self presentViewController:rfvc animated:YES completion:nil];

      
    }
    
    
    
}


@end
