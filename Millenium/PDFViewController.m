//
//  PDFViewController.m
//  Millenium
//
//  Created by Jami Sue Becker on 6/6/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import "PDFViewController.h"

@interface PDFViewController ()

@end

@implementation PDFViewController

@synthesize pdfScrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [pdfScrollView setContentSize:CGSizeMake(958, 1650)];
    [pdfScrollView flashScrollIndicators];
    
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)viewDidLayoutSubviews {
    [pdfScrollView setContentSize:CGSizeMake(958, 2000)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)goHome:(UIButton *)sender {
    
    UIStoryboard *storyboard = self.storyboard;
    ViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"HomeStoryboard"];
    [self presentViewController:vc animated:YES completion:nil];
    
}

- (IBAction)buttonTappedWalkOffLogoMat:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    
    
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

- (IBAction)buttonTappedUltraGuardLogoInlay:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/AU_UlosRDeU";
    NSURL* movieURL = [NSURL fileURLWithPath:moviePath];
    
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtu.be/AU_UlosRDeU"]];
    
    
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



- (IBAction)buttonTappedWaterGuardLogoInlay:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/jdB_DNvXy7k";
    NSURL* movieURL = [NSURL fileURLWithPath:moviePath];
    
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtu.be/jdB_DNvXy7k"]];
    
    
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

- (IBAction)buttonTappedPrintedMessageMat:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/B-jMxjCZD-s";
    NSURL* movieURL = [NSURL fileURLWithPath:moviePath];
    
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtu.be/B-jMxjCZD-s"]];
    
    
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

- (IBAction)buttonTappedPhotorealisticMat:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/NBj_dJwn4xM";
    NSURL* movieURL = [NSURL fileURLWithPath:moviePath];
    
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtu.be/NBj_dJwn4xM"]];
    
    
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



- (IBAction)buttonTappedMotifMat:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/B-jMxjCZD-s";
    NSURL* movieURL = [NSURL fileURLWithPath:moviePath];
    
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtu.be/B-jMxjCZD-s"]];
    
    
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
- (IBAction)buttonTappedMediaMat:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/71lCtfHPBeI";
    NSURL* movieURL = [NSURL fileURLWithPath:moviePath];
    
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtu.be/71lCtfHPBeI"]];
    
    
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

//Outdoor Mats

- (IBAction)buttonTappedFirstStepLogoScraper:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/zbAvG8lT9rA";
    NSURL* movieURL = [NSURL fileURLWithPath:moviePath];
    
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtu.be/zbAvG8lT9rA"]];
    
    
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

- (IBAction)buttonTappedParquetWiperScraper:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/ZXv5bun6mn0";
    NSURL* movieURL = [NSURL fileURLWithPath:moviePath];
    
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtu.be/ZXv5bun6mn0"]];
    
    
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
- (IBAction)buttonBrushTippedScraper:(UIButton *)sender {
    
    
    
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


/*- (IBAction)buttonTappedLogoColorGuidelines:(UIButton *)sender {
    
    
    
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
    
    
    
    
}*/
//Indoor Mats
- (IBAction)buttonTappedUltraGuard:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/e08yLohDWqs";
    NSURL* movieURL = [NSURL fileURLWithPath:moviePath];
    
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtu.be/e08yLohDWqs"]];
    
    
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


- (IBAction)buttonTappedWaterGuard:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/gM4jDCSXjt8";
    NSURL* movieURL = [NSURL fileURLWithPath:moviePath];
    
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtu.be/gM4jDCSXjt8"]];
    
    
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

- (IBAction)buttonTappedWaterGuardDiamond:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/Ir8BUqf2Wj8";
    NSURL* movieURL = [NSURL fileURLWithPath:moviePath];
    
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtu.be/Ir8BUqf2Wj8"]];
    
    
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



- (IBAction)buttonTappedEcoGuard:(UIButton *)sender {
    
    
    
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



- (IBAction)buttonTappedGoldenSeries:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/gpmcBZQeu7Y";
    NSURL* movieURL = [NSURL fileURLWithPath:moviePath];
    
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtu.be/gpmcBZQeu7Y"]];
    
    
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

- (IBAction)buttonTappedSilverSeries:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/TrXXJV02W8I";
    NSURL* movieURL = [NSURL fileURLWithPath:moviePath];
    
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtu.be/TrXXJV02W8I"]];
    
    
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

//ANTIFATIGUE MATS

- (IBAction)buttonTappedSpringStep:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/n950F44ej68";
    NSURL* movieURL = [NSURL fileURLWithPath:moviePath];
    
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtu.be/n950F44ej68"]];
    
    
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

- (IBAction)buttonTappedMarbleTop:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/Vwq_PJY5oBg";
    NSURL* movieURL = [NSURL fileURLWithPath:moviePath];
    
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtu.be/Vwq_PJY5oBg"]];
    
    
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






- (IBAction)buttonTappedSafeStep:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/qzkn_tcA6T4";
    NSURL* movieURL = [NSURL fileURLWithPath:moviePath];
    
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtu.be/qzkn_tcA6T4"]];
    
    
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

- (IBAction)buttonTappedAirStep:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/bGPL4mtzgaU";
    NSURL* movieURL = [NSURL fileURLWithPath:moviePath];
    
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtu.be/bGPL4mtzgaU"]];
    
    
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

- (IBAction)buttonTappedSoftStep:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/1AEUq_1ca88";
    NSURL* movieURL = [NSURL fileURLWithPath:moviePath];
    
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtu.be/1AEUq_1ca88"]];
    
    
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
//Food Service Utility

- (IBAction)buttonTappedDuraLite:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/W5oSFq4iCPc";
    NSURL* movieURL = [NSURL fileURLWithPath:moviePath];
    
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtu.be/W5oSFq4iCPc"]];
    
    
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

- (IBAction)buttonTappedSafetyChef:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/LK_imBmdP3E";
    NSURL* movieURL = [NSURL fileURLWithPath:moviePath];
    
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtu.be/LK_imBmdP3E"]];
    
    
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

- (IBAction)buttonTappedTripleFlexFlow:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/GCRUGv7iMNU";
    NSURL* movieURL = [NSURL fileURLWithPath:moviePath];
    
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtu.be/GCRUGv7iMNU"]];
    
    
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




- (IBAction)buttonTappedFreeFlowComfort:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/t_6GHNtRsIY";
    NSURL* movieURL = [NSURL fileURLWithPath:moviePath];
    
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtu.be/t_6GHNtRsIY"]];
    
    
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














- (void)moviePlayBackDidFinish:(NSNotification *)notification {
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    [self.movieController stop];
    [self.movieController.view removeFromSuperview];
    self.movieController = nil;
    
    
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
