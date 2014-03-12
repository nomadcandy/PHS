//
//  InteractiveViewController.m
//  Millenium
//
//  Created by Jami Sue Becker on 3/10/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import "InteractiveViewController.h"
#import "ViewController.h"


@interface InteractiveViewController ()

@end

@implementation InteractiveViewController

@synthesize interactiveView;
@synthesize carouselSize;
@synthesize carouselColor;
@synthesize rugSizeButton;
@synthesize rugColorButton;
@synthesize matSizeString;
@synthesize matColorUseString;
@synthesize matSizeUseString;


- (void)dealloc
{
    carouselSize.delegate = nil;
    carouselSize.dataSource = nil;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    
    if (self) {
        // Custom initialization
        
        //UIStoryboard*interactive = [UIStoryboard storyboardWithName:@"mystoryboard"
                                                      //bundle:nil];
        
        //[self.storyboard instantiateViewControllerWithIdentifier:@"interactive"];
        //UIViewController* vc = [interactive instantiateViewControllerWithIdentifier:@"InteractiveViewController"];
   }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //configure carousel
    carouselSize.type = iCarouselTypeCoverFlow2;
    
    
}

#pragma mark -
#pragma mark iCarousel methods

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //generate 100 item views
    //normally we'd use a backing array
    //as shown in the basic iOS example
    //but for this example we haven't bothered
    return 14;
}
//hell0

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    if (carousel==carouselSize){
    
	UIButton *matSizeButton = (UIButton *)view;
	if (matSizeButton == nil)
	{
		//no button available to recycle, so create new one
		UIImage *image = [UIImage imageNamed:@"greySizeImage.png"];
		matSizeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        matSizeButton.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.5, image.size.height/1.5);
		[matSizeButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
		[matSizeButton setBackgroundImage:image forState:UIControlStateNormal];
        
        matSizeButton.layer.shadowColor = [UIColor blackColor].CGColor;
        matSizeButton.layer.shadowOpacity = 0.8;
        matSizeButton.layer.shadowRadius = 12;
        matSizeButton.layer.shadowOffset = CGSizeMake(12.0f, 12.0f);
        
        matSizeButton.titleLabel.shadowOffset = CGSizeMake(1.0, 1.0);
        [matSizeButton setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        
        [matSizeButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:22.0]];
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
}
    


else {
    
    UIButton *matColorButton = (UIButton *)view;
	if (matColorButton == nil)
	{
		//no button available to recycle, so create new one
		UIImage *image = [UIImage imageNamed:@"greySizeImage.png"];
		matColorButton = [UIButton buttonWithType:UIButtonTypeCustom];
        matColorButton.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.5, image.size.height/1.5);
		[matColorButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
		[matColorButton setBackgroundImage:image forState:UIControlStateNormal];
        
        matColorButton.layer.shadowColor = [UIColor blackColor].CGColor;
        matColorButton.layer.shadowOpacity = 0.8;
        matColorButton.layer.shadowRadius = 12;
        matColorButton.layer.shadowOffset = CGSizeMake(12.0f, 12.0f);
        
        matColorButton.titleLabel.shadowOffset = CGSizeMake(1.0, 1.0);
        [matColorButton setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        
        [matColorButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:17.0]];
		//button.titleLabel.font = [button.titleLabel.font fontWithSize:22];
        [matColorButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
	}
	
	//set button label
	[matColorButton setTitle:[NSString stringWithFormat:@"%i", index] forState:UIControlStateNormal];
    [matColorButton setTitle:[NSString stringWithFormat:@"matSizeString", matSizeString] forState:UIControlStateNormal];
    
    
    if (index ==0){
        
        [matColorButton setTitle:[NSString stringWithFormat:@"red 001"] forState:UIControlStateNormal];
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

    
}



#pragma mark -
#pragma mark Button tap event

- (void)buttonTapped:(UIButton *)sender
{
    
    NSInteger index = [carouselSize indexOfItemViewOrSubview:sender];
    int i=index;
    int width;
    int height;
    
    if (index==i){
        
        
        //getColorName at index i;
        //getSizeName at index i;
        
        //set interactiveImage to selected data
        
        
        
        
        
        
    }
    
    if (index==6){
        
        
        
        
        
        
        
        
    }
    
    
    
    
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


















-(IBAction)backButton:(id)sender{
    
     //[self dismissModalViewControllerAnimated:NO];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.carouselSize = nil;
    self.rugSizeButton = nil;
    self.rugColorButton = nil;
}


@end
