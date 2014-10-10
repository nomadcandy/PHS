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

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [pdfScrollView setContentSize:CGSizeMake(958, 7000)];

    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, 100, 0.0);
    pdfScrollView.contentInset = contentInsets;

    [pdfScrollView flashScrollIndicators];

    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)viewDidLayoutSubviews
{
    [pdfScrollView setContentSize:CGSizeMake(958, 7000)];
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, 100, 0.0);
    pdfScrollView.contentInset = contentInsets;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goHome:(UIButton*)sender
{
    UIStoryboard* storyboard = self.storyboard;
    ViewController* vc = [storyboard instantiateViewControllerWithIdentifier:@"HomeStoryboard"];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)presentScrollViewController:(UIButton*)sender
{
    UIStoryboard* storyboard = self.storyboard;
    ScrollViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PleaseLoad"];

    // Configure the new view controller here.
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

- (IBAction)buttonTappedMotifMat:(UIButton*)sender
{
    selectedPdfString = @"MotifMatPDF.png";
    selectedString = @"Motif Mat";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

- (IBAction)buttonTappedWalkOffLogoMat:(UIButton*)sender
{
    selectedPdfString = @"WalkOffLogoMatPDF.png";
    selectedString = @"Walk Off Logo Mat";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

- (IBAction)buttonTappedWaterGuardLogoInlay:(UIButton*)sender
{
    selectedPdfString = @"WaterGuardLogoInlayPDF.png";
    selectedString = @"Water Guard Logo Inlay";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

- (IBAction)buttonTappedLogoColorGuidelines:(UIButton*)sender
{
    selectedPdfString = @"LogoColorGuidelinesPDF.png";
    selectedString = @"Logo Color Guidelines";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

- (IBAction)buttonTappedUltraGuardLogoInlay:(UIButton*)sender
{
    selectedPdfString = @"UltraGuardLogoInlayPDF.png";
    selectedString = @"Ultra Guard Logo Inlay";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

- (IBAction)buttonTappedFirstStepLogoScraper:(UIButton*)sender
{
    selectedPdfString = @"FirstStepLogoScraperPDF.png";
    selectedString = @"First Step Logo Scraper";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

//INDOOR MATS

- (IBAction)buttonTappedGoldenSeries:(UIButton*)sender
{
    selectedPdfString = @"GoldenSeriesPDF.png";
    selectedString = @"Golden Series";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}
- (IBAction)buttonTappedSilverSeries:(UIButton*)sender
{
    selectedPdfString = @"SilverSeriesPDF.png";
    selectedString = @"Silver Series";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

- (IBAction)buttonTappedWalkOffPhoenixMat:(UIButton*)sender
{
    //selectedPdfString = @"WalkOffPhoenixMatPDF.png";
    //selectedString = @"Walk Off Phoenix Mat";

    selectedPdfString = @"WalkOffPhoenixPDF.png";
    selectedString = @"Walk Off Phoenix Mat";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

- (IBAction)buttonTappedTreadLock:(UIButton*)sender
{
    selectedPdfString = @"TreadLockPDF.png";
    selectedString = @"Tread Lock";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

- (IBAction)buttonTappedWaterGuardDiamond:(UIButton*)sender
{
    selectedPdfString = @"WaterGuardDiamondPDF.png";
    selectedString = @"Water Guard Diamond";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

//INDOOR/OUTDOOR MATS
- (IBAction)buttonTappedWaterGuard:(UIButton*)sender
{
    selectedPdfString = @"WaterGuardPDF.png";
    selectedString = @"Water Guard";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

//Indoor Mats
- (IBAction)buttonTappedUltraGuard:(UIButton*)sender
{
    selectedPdfString = @"UltraGuardPDF.png";
    selectedString = @"Ultra Guard";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

- (IBAction)buttonTappedEcoGuard:(UIButton*)sender
{
    selectedPdfString = @"EcoGuardPDF.png";
    selectedString = @"Eco Guard";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}
//SCRAPER MATS
- (IBAction)buttonTappedParquetWiperScraper:(UIButton*)sender
{
    selectedPdfString = @"ParquetWiperScraperPDF.png";
    selectedString = @"Parquet Wiper Scraper";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

- (IBAction)buttonTappedBrushTip:(UIButton*)sender
{
    selectedPdfString = @"BrushTipPDF.png";
    selectedString = @"Brush Tip";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

- (IBAction)buttonTappedTripleFlexScraper:(UIButton*)sender
{
    //selectedPdfString = @"FlexScraperPDF.png";
    //selectedString = @"Flex Scraper";

    selectedPdfString = @"TripleFlexScraperPDF.png";
    selectedString = @"Triple Flex Scraper";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

- (IBAction)buttonTappedFirstStepScraper:(UIButton*)sender
{
    selectedPdfString = @"FirstStepScraperPDF.png";
    selectedString = @"First Step Scraper";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

//UTILITY/FOOD SERVICE MATS

- (IBAction)buttonTappedDuraLite:(UIButton*)sender
{
    selectedPdfString = @"DuraLitePDF.png";
    selectedString = @"Dura Lite";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

- (IBAction)buttonTappedSafetyChef:(UIButton*)sender
{
    selectedPdfString = @"SafetyChefPDF.png";
    selectedString = @"Safety Chef";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

- (IBAction)buttonTappedTripleFlexFlow:(UIButton*)sender
{
    selectedPdfString = @"TripleFlexFlow1PDF.png";
    selectedString = @"Triple Flex Flow";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

- (IBAction)buttonTappedFreeFlowComfort:(UIButton*)sender
{
    selectedPdfString = @"FreeFlowComfortPDF.png";
    selectedString = @"Free Flow Comfort";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

//ANTIFATIGUE MATS

- (IBAction)buttonTappedMarbleTop:(UIButton*)sender
{
    selectedPdfString = @"MarbleTopPDF.png";
    selectedString = @"Marble Top";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

- (IBAction)buttonTappedSpringStep:(UIButton*)sender
{
    selectedPdfString = @"SpringStepPDF.png";
    selectedString = @"Spring Step";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

- (IBAction)buttonTappedSafeStep:(UIButton*)sender
{
    selectedPdfString = @"SafeStepPDF.png";
    selectedString = @"Safe Step";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

- (IBAction)buttonTappedAirStep:(UIButton*)sender
{
    selectedPdfString = @"AirStepPDF.png";
    selectedString = @"Air Step";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

- (IBAction)buttonTappedSoftStep:(UIButton*)sender
{
    selectedPdfString = @"SoftStepPDF.png";
    selectedString = @"SoftStep";

    [self performSegueWithIdentifier:@"pdfPickedSegue" sender:sender];

    UIStoryboard* storyboard = self.storyboard;
    PDFBigViewController* pleaseLoad = [storyboard instantiateViewControllerWithIdentifier:@"PDFBigStoryboard"];
    [self presentViewController:pleaseLoad animated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"pdfPickedSegue"]) {
        PDFBigViewController* goingController = segue.destinationViewController;
        //[self presentViewController:destViewController animated:YES completion:nil];
        NSLog(@"locationIDString %@", selectedString);
        goingController.selectedPdfString = selectedPdfString;
        goingController.selectedString = selectedString;
    }
}

@end
