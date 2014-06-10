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
    [pdfScrollView setContentSize:CGSizeMake(958, 6000)];
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, 100, 0.0);
    pdfScrollView.contentInset = contentInsets;
    
    [pdfScrollView flashScrollIndicators];
    
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)viewDidLayoutSubviews {
    [pdfScrollView setContentSize:CGSizeMake(958, 6000)];
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, 100, 0.0);
    pdfScrollView.contentInset = contentInsets;

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
    
    
    
    
}

- (IBAction)buttonTappedWaterGuardLogoInlay:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/AU_UlosRDeU";
    
    
    
    
}



- (IBAction)buttonTappedMotifMat:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/jdB_DNvXy7k";
    
    
    
    
}

- (IBAction)buttonTappedUltraGuardLogoInlay:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/B-jMxjCZD-s";
    
    
    
    
}

- (IBAction)buttonTappedFirstStepLogoScraper:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/NBj_dJwn4xM";
    
    
    
    
}

//INDOOR MATS

- (IBAction)buttonTappedGoldenSeries:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/B-jMxjCZD-s";
    
    
    
    
}
- (IBAction)buttonTappedSilverSeries:(UIButton *)sender {
    
    
    
    
    
    
    
    
}



- (IBAction)buttonTappedWalkOffPhoenixMat:(UIButton *)sender {
    
    
    
    
    
    
    
}

- (IBAction)buttonTappedTreadLock:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/ZXv5bun6mn0";
    
    
    
    
}

- (IBAction)buttonTappedWaterGuardDiamond:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/i0eDiP9ib6Q";
    
    
    
    
}

//INDOOR/OUTDOOR MATS
- (IBAction)buttonTappedWaterGuard:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/i0eDiP9ib6Q";
    
    
    
    
}


//Indoor Mats
- (IBAction)buttonTappedUltraGuard:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/e08yLohDWqs";
    
    
    
    
}


- (IBAction)buttonTappedEcoGuard:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/gM4jDCSXjt8";
    
    
    
    
}
//SCRAPER MATS
- (IBAction)buttonTappedParquetWiperScraper:(UIButton *)sender {
    
    
    
    NSString* moviePath =@"http://youtu.be/Ir8BUqf2Wj8";
    
    
    
    
}



- (IBAction)buttonTappedBrushTip:(UIButton *)sender {
    
    
    
    
    
    
    
}



- (IBAction)buttonTappedTripleFlexScraper:(UIButton *)sender {
    
    
    
    
    
    
}

- (IBAction)buttonTappedFirstStepScraper:(UIButton *)sender {
    
    
    
    
    
    
    
}

//UTILITY/FOOD SERVICE MATS

- (IBAction)buttonTappedDuraLite:(UIButton *)sender {
    
    
    
   
    
    
    
    
}

- (IBAction)buttonTappedSafetyChef:(UIButton *)sender {
    
    
    
    
    
    
}

- (IBAction)buttonTappedTripleFlexFlow:(UIButton *)sender {
    
    
    
    
    
    
}

- (IBAction)buttonTappedFreeFlowComfort:(UIButton *)sender {
    
    
    
    
    
    
}




//ANTIFATIGUE MATS

- (IBAction)buttonTappedMarbleTop:(UIButton *)sender {
    
    
    
    
    
    
    
}

- (IBAction)buttonTappedSpringStep:(UIButton *)sender {
    
    
    
    
    
    
    
}






- (IBAction)buttonTappedSafeStep:(UIButton *)sender {
    
    
    
    
    
    
}

- (IBAction)buttonTappedAirStep:(UIButton *)sender {
    
    
    
    
    
    
}

- (IBAction)buttonTappedSoftStep:(UIButton *)sender {
    
    
    
   
    
    
    
    
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
