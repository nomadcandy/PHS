//
//  ViewController.m
//  Millenium
//
//  Created by Jami Sue Becker on 3/10/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import "ViewController.h"
#import "InteractiveViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize InteractiveViewController;
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
    
    
    charlesBGView.hidden =YES;
    charlesView.hidden=YES;
    
    //configure carousel
    carousel.type = iCarouselTypeCoverFlow2;
    //[carousel reloadData];
}

/*- (void)viewWillAppear:(BOOL)animated
{
    //[super viewDidLoad];
    
    //configure carousel
    carousel.type = iCarouselTypeCoverFlow2;
    //[carousel reloadData];
}*/


-(IBAction)playFriendly:(id)sender{
    
    self.movieController = [[MPMoviePlayerController alloc] init];
    
    NSString *moviePath = [[NSBundle mainBundle] pathForResource:@"Charles3Animation" ofType:@"m4v"];
    //NSString *moviePath = [[NSBundle mainBundle] pathForResource:@"matsensesall" ofType:@"mp4"];
    NSURL *movieURL = [NSURL fileURLWithPath:moviePath];
    self.movieController = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
    //[self.movieController.view setFrame:CGRectMake (392, 200, 240, 136)];
    [self.movieController.view setFrame:CGRectMake (370, 255, 360, 204)];
    //[self.movieController.view setFrame:CGRectMake (272, 200, 480, 272)];
    self.movieController.movieSourceType = MPMovieSourceTypeFile;
    [self.view addSubview:self.movieController.view];
    [self.movieController play];
    
    //hides play button
    [_movieController setControlStyle:MPMovieControlStyleNone];
    _movieController.view.backgroundColor = [UIColor clearColor];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:_movieController];
    
    
}



-(IBAction)playPro:(id)sender{
    
    self.movieController = [[MPMoviePlayerController alloc] init];
    
    NSString *moviePath = [[NSBundle mainBundle] pathForResource:@"Professional_video" ofType:@"mp4"];
    //NSString *moviePath = [[NSBundle mainBundle] pathForResource:@"matsensesall" ofType:@"mp4"];
    NSURL *movieURL = [NSURL fileURLWithPath:moviePath];
    self.movieController = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
    //[self.movieController.view setFrame:CGRectMake (392, 200, 240, 136)];
    [self.movieController.view setFrame:CGRectMake (370, 255, 360, 204)];
    //[self.movieController.view setFrame:CGRectMake (272, 200, 480, 272)];
    self.movieController.movieSourceType = MPMovieSourceTypeFile;
    [self.view addSubview:self.movieController.view];
    [self.movieController play];
    
    //hides play button
    [_movieController setControlStyle:MPMovieControlStyleNone];
    _movieController.view.backgroundColor = [UIColor clearColor];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:_movieController];
    
    
}


-(IBAction)playClean:(id)sender{
    
    self.movieController = [[MPMoviePlayerController alloc] init];
    
    NSString *moviePath = [[NSBundle mainBundle] pathForResource:@"MatAnimationUseSmall" ofType:@"m4v"];
    //NSString *moviePath = [[NSBundle mainBundle] pathForResource:@"matsensesall" ofType:@"mp4"];
    NSURL *movieURL = [NSURL fileURLWithPath:moviePath];
    self.movieController = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
    //[self.movieController.view setFrame:CGRectMake (392, 200, 240, 136)];
    [self.movieController.view setFrame:CGRectMake (370, 255, 360, 204)];
    //[self.movieController.view setFrame:CGRectMake (272, 200, 480, 272)];
    self.movieController.movieSourceType = MPMovieSourceTypeFile;
    [self.view addSubview:self.movieController.view];
    [self.movieController play];
    
    //hides play button
     [_movieController setControlStyle:MPMovieControlStyleNone];
    _movieController.view.backgroundColor = [UIColor clearColor];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:_movieController];
   
    
}


- (void) moviePlayBackDidFinish:(NSNotification*)notification {
    
    MPMoviePlayerController *player = [notification object];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:player];
    
    if ([player
         respondsToSelector:@selector(setFullscreen:animated:)])
    {
        [player.view removeFromSuperview];
        player.fullscreen = NO;
    }
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
    //generate 100 item views
    //normally we'd use a backing array
    //as shown in the basic iOS example
    //but for this example we haven't bothered
    return 6;
}
//hell0



/*- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
	UIButton *button = (UIButton *)view;
	if (button == nil)
	{
        
        
         
		//no button available to recycle, so create new one
		UIImage *image = [UIImage imageNamed:@"WhiteCircleRugSample2.png"];
		button = [UIButton buttonWithType:UIButtonTypeCustom];
		button.frame = CGRectMake(0.0f, 0.0f, image.size.width, image.size.height);
		[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[button setBackgroundImage:image forState:UIControlStateNormal];
		button.titleLabel.font = [button.titleLabel.font fontWithSize:50];
		[button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
	}
	
	//set button label
	[button setTitle:[NSString stringWithFormat:@"%i", index] forState:UIControlStateNormal];
	
	return button;
}*/


- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
	UIButton *button = (UIButton *)view;
	if (button == nil)
	{
		//no button available to recycle, so create new one
		//UIImage *image = [UIImage imageNamed:@"CarouselBGWhite.png"];
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        UIImage *image = [UIImage imageNamed:@"carouselbgnopicuse.png"];
        

		button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0.0f, 0.0f, image.size.width/1.5, image.size.height/1.5);
		
		[button setBackgroundImage:image forState:UIControlStateNormal];
         button.alpha = 0.8;
        
        //[button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        
        button.layer.shadowColor = [UIColor darkGrayColor].CGColor;
        //button.layer.shadowOpacity = 0.8;
        button.layer.shadowOpacity = 0.1;
        //button.layer.shadowRadius = 12;
        button.layer.shadowRadius = 3;
        //button.layer.shadowOffset = CGSizeMake(12.0f, 12.0f);
        button.layer.shadowOffset = CGSizeMake(3.0f, 4.0f);

        button.titleLabel.shadowOffset = CGSizeMake(1.0, 1.0);
        [button setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        
        //[button.titleLabel setFont:[UIFont fontWithName:@"Avenir" size:18.0]];
        [button.titleLabel setFont:[UIFont fontWithName:@"Helvetica-bold" size:18.0]];
		[button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        //return button;
	}
	
	//set button label
	//[button setTitle:[NSString stringWithFormat:@"%i", index] forState:UIControlStateNormal];
    
    if (index ==0){
        
        [button setTitle:[NSString stringWithFormat:@"Direct Purchase Mat"] forState:UIControlStateNormal];
        //[button addTarget:self action:@selector(buttonTapped0:) forControlEvents:UIControlEventTouchUpInside];
        //return button;
    }
    
    if (index ==1){
        
        [button setTitle:[NSString stringWithFormat:@"Rental Mat"] forState:UIControlStateNormal];
        
    }
    
    if (index ==2){
        
        [button setTitle:[NSString stringWithFormat:@"Marketing"] forState:UIControlStateNormal];
        
    }
    
   
    
    if (index == 3){
        
        [button setTitle:[NSString stringWithFormat:@"Sketch Search"] forState:UIControlStateNormal];
        
    }
    
    if (index == 4){
        
        [button setTitle:[NSString stringWithFormat:@"Sketch Request"] forState:UIControlStateNormal];
        
    }
    
    if (index == 5){
        
        [button setTitle:[NSString stringWithFormat:@"Interactive Mat Tool"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(presentInteractiveViewController:) forControlEvents:UIControlEventTouchUpInside];
        //[button addTarget:self action:@selector(buttonTappedSix:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
    
	return button;
}


/*- (IBAction)buttonTappedSix:(UIButton *)sender{
    
    
    
    
       [self presentViewController:InteractiveViewController animated:YES completion:nil];
    
    
    
}*/




//Method Works
- (IBAction)presentInteractiveViewController:(UIButton *)sender{
    
    UIStoryboard *storyboard = self.storyboard;
    InteractiveViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"InteractiveViewBoard"];
    
    // Configure the new view controller here.
    [self presentViewController:svc animated:YES completion:nil];
    
    
   }
//Not Using Now
#pragma mark-
#pragma mark Segue

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([segue.identifier isEqualToString:@"InteractiveSegue"]) {
        
        InteractiveViewController *destViewController = segue.destinationViewController;
        [self presentViewController:destViewController animated:YES completion:nil];
        

        
       

        
        
    }
    
}


#pragma mark -
#pragma mark Button tap event

- (void)buttonTapped:(UIButton *)sender
{
    
    NSInteger index = [carousel indexOfItemViewOrSubview:sender];
    
    if (index==2){
        
        
        
        UIStoryboard *storyboard = self.storyboard;
        MarketingViewController *mvc = [storyboard instantiateViewControllerWithIdentifier:@"MarketingViewBoard"];
        
        // Configure the new view controller here.
        [self presentViewController:mvc animated:YES completion:nil];
        
        
        
        
    }
    
    
    if (index==5){
        
        
        
        UIStoryboard *storyboard = self.storyboard;
        InteractiveViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"InteractiveViewBoard"];
        
        // Configure the new view controller here.
        [self presentViewController:svc animated:YES completion:nil];
        
        
        
        
    }
    
    if (index==6){
        
       

        UIStoryboard *storyboard = self.storyboard;
        InteractiveViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"InteractiveViewBoard"];
        
        // Configure the new view controller here.
        [self presentViewController:svc animated:YES completion:nil];
        
        
        
        
    }

    
   
  
}



#pragma mark -
#pragma mark Control events

/*- (IBAction)pressedButton:(id)sender

{
    
    NSInteger index = [carousel indexOfItemViewOrSubview:sender];
    if (index==6){
        
        
        [self presentViewController:InteractiveViewController animated:YES completion:nil];
        
        
        
    }
    
}*/






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
