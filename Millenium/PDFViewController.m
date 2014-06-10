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

@synthesize selectedPdfString;
@synthesize selectedString;
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
    
    
    selectedPdfString=@"WalkOffLogoMat.png";
    selectedString=@"Walk Off Logo Mat";
    
    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    

    
    
}

- (IBAction)buttonTappedWaterGuardLogoInlay:(UIButton *)sender {
    
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"WaterGuardLogoInlay.png";
    selectedString=@"Water Guard Logo Inlay";

    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
    
    
}



- (IBAction)buttonTappedMotifMat:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"WaterGuardMotifMat.png";
    selectedString=@"Water Guard Motif Mat";
    
    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];

 
}

- (IBAction)buttonTappedUltraGuardLogoInlay:(UIButton *)sender {
    
    
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"UltraGuardLogoInlay.png";
    selectedString=@"Water Guard Logo Inlay";
    
    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
    
    
    
}

- (IBAction)buttonTappedFirstStepLogoScraper:(UIButton *)sender {
    
    
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"FirstStepLogoScraper.png";
    selectedString=@"First Step Logo Scraper";
    
    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
    
    
    
}

//INDOOR MATS

- (IBAction)buttonTappedGoldenSeries:(UIButton *)sender {
    
    
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"GoldenSeries.png";
    selectedString=@"Golden Series";
    
    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
    
}
- (IBAction)buttonTappedSilverSeries:(UIButton *)sender {
    
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"SilverSeries.png";
    selectedString=@"Silver Series";
    
    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
    
    
    
}



- (IBAction)buttonTappedWalkOffPhoenixMat:(UIButton *)sender {
    
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"WalkOffPhoenixMat.png";
    selectedString=@"Walk Off Phoenix Mat";
    
    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
    
}

- (IBAction)buttonTappedTreadLock:(UIButton *)sender {
    
    
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"TreadLock.png";
    selectedString=@"Tread Lock";
    
    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
    
    
}

- (IBAction)buttonTappedWaterGuardDiamond:(UIButton *)sender {
    
    
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"WaterGuardDiamond.png";
    selectedString=@"Water Guard Diamond";
    
    
    
    
}

//INDOOR/OUTDOOR MATS
- (IBAction)buttonTappedWaterGuard:(UIButton *)sender {
    
    
    
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"WaterGuard.png";
    selectedString=@"Water Guard";

    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
    
    
    
}


//Indoor Mats
- (IBAction)buttonTappedUltraGuard:(UIButton *)sender {
    
    
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"UltraGuard.png";
    selectedString=@"Ultra Guard";
    
    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
    
}


- (IBAction)buttonTappedEcoGuard:(UIButton *)sender {
    
    
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"EcoGuard.png";
    selectedString=@"Eco Guard";
    
    
    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
    
}
//SCRAPER MATS
- (IBAction)buttonTappedParquetWiperScraper:(UIButton *)sender {
    
    
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"ParquetWiperScraper.png";
    selectedString=@"Parquet Wiper Scraper";
    
    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
}



- (IBAction)buttonTappedBrushTip:(UIButton *)sender {
    
    
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"BrushTip.png";
    selectedString=@"Brush Tip";
    
    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
    
}



- (IBAction)buttonTappedTripleFlexScraper:(UIButton *)sender {
    
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"FlexScraper.png";
    selectedString=@"Flex Scraper";
    
    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
    
}

- (IBAction)buttonTappedFirstStepScraper:(UIButton *)sender {
    
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"StepScraper.png";
    selectedString=@"Step Scraper";
    
    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
    
}

//UTILITY/FOOD SERVICE MATS

- (IBAction)buttonTappedDuraLite:(UIButton *)sender {
    
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"DuraLite.png";
    selectedString=@"Dura Lite";
   
    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
    
    
}

- (IBAction)buttonTappedSafetyChef:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"SafetyChef.png";
    selectedString=@"Safety Chef";
    
    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
    
}

- (IBAction)buttonTappedTripleFlexFlow:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"TripleFlexFlow.png";
    selectedString=@"Triple Flex Flow";
    
    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
    
}

- (IBAction)buttonTappedFreeFlowComfort:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"FreeFlowComfort.png";
    selectedString=@"Free Flow Comfort";
    
    
    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
}




//ANTIFATIGUE MATS

- (IBAction)buttonTappedMarbleTop:(UIButton *)sender {
    
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"MarbleTop.png";
    selectedString=@"Marble Top";
 
    
    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
}

- (IBAction)buttonTappedSpringStep:(UIButton *)sender {
    
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"SpringStep.png";
    selectedString=@"Spring Step";
    
    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
}




- (IBAction)buttonTappedSafeStep:(UIButton *)sender {
    
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"SafeStep.png";
    selectedString=@"Safe Step";
    
    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
}

- (IBAction)buttonTappedAirStep:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"AirStep.png";
    selectedString=@"Air Step";
    
    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
    
}

- (IBAction)buttonTappedSoftStep:(UIButton *)sender {
    
    
    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];
    selectedPdfString=@"SoftStep.png";
    selectedString=@"SoftStep";
   
    UIStoryboard *storyboard = self.storyboard;
    PDFBigViewController *pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
    
    
    
    
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([segue.identifier isEqualToString:@"pdfPickedSegue"]) {
        
        PDFBigViewController *goingController = segue.destinationViewController;
        //[self presentViewController:destViewController animated:YES completion:nil];
        NSLog(@"locationIDString %@",selectedString);
        goingController.selectedPdfString = selectedPdfString;
        goingController.selectedString = selectedString;
        
        
    }



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
