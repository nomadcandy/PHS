//
//  ViewController.m
//  Millenium
//
//  Created by Jami Sue Becker on 3/10/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


@synthesize carousel;
@synthesize label;

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
    return YES;
}

#pragma mark -
#pragma mark iCarousel methods

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //generate 100 item views
    //normally we'd use a backing array
    //as shown in the basic iOS example
    //but for this example we haven't bothered
    return 7;
}
//hell0

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
	UIButton *button = (UIButton *)view;
	if (button == nil)
	{
		//no button available to recycle, so create new one
		UIImage *image = [UIImage imageNamed:@"CarouselBG.png"];
		button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.5, image.size.height/1.5);
		[button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[button setBackgroundImage:image forState:UIControlStateNormal];
        
        button.layer.shadowColor = [UIColor blackColor].CGColor;
        button.layer.shadowOpacity = 0.8;
        button.layer.shadowRadius = 12;
        button.layer.shadowOffset = CGSizeMake(12.0f, 12.0f);

        button.titleLabel.shadowOffset = CGSizeMake(1.0, 1.0);
        [button setContentVerticalAlignment:UIControlContentVerticalAlignmentBottom];
        
        [button.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:22.0]];
		//button.titleLabel.font = [button.titleLabel.font fontWithSize:22];
        
		[button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
	}
	
	//set button label
	//[button setTitle:[NSString stringWithFormat:@"%i", index] forState:UIControlStateNormal];
    
    if (index ==0){
        
        [button setTitle:[NSString stringWithFormat:@"Direct Purchase Mat"] forState:UIControlStateNormal];
        
    }
    
    if (index ==1){
        
        [button setTitle:[NSString stringWithFormat:@"Rental Mat"] forState:UIControlStateNormal];
        
    }
    
    if (index ==2){
        
        [button setTitle:[NSString stringWithFormat:@"Product Movies"] forState:UIControlStateNormal];
        
    }
    
    if (index == 3){
        
        [button setTitle:[NSString stringWithFormat:@"Flyer Views"] forState:UIControlStateNormal];
        
    }
    
    if (index == 4){
        
        [button setTitle:[NSString stringWithFormat:@"Sketch Search"] forState:UIControlStateNormal];
        
    }
    
    if (index == 5){
        
        [button setTitle:[NSString stringWithFormat:@"Sketch Request"] forState:UIControlStateNormal];
        
    }
    
    if (index == 6){
        
        [button setTitle:[NSString stringWithFormat:@"Interactive Mat Tool"] forState:UIControlStateNormal];
        
    }
    
    
	return button;
}


#pragma mark -
#pragma mark Button tap event

- (void)buttonTapped:(UIButton *)sender
{
	//get item index for button
	NSInteger index = [carousel indexOfItemViewOrSubview:sender];
	
    [[[UIAlertView alloc] initWithTitle:@"Button Tapped"
                                message:[NSString stringWithFormat:@"You tapped button number %i", index]
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
}



#pragma mark -
#pragma mark Control events

- (IBAction)pressedButton:(id)sender
{
    label.text = [NSString stringWithFormat:@"Button %i pressed", [carousel indexOfItemViewOrSubview:sender]];
}

- (IBAction)toggledSwitch:(id)sender
{
    label.text = [NSString stringWithFormat:@"Switch %i toggled", [carousel indexOfItemViewOrSubview:sender]];
}

- (IBAction)changedSlider:(id)sender
{
    label.text = [NSString stringWithFormat:@"Slider %i changed", [carousel indexOfItemViewOrSubview:sender]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
