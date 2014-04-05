//
//  LogoCollectionViewController.m
//  Millenium
//
//  Created by Jami Sue Becker on 3/14/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import "LogoCollectionViewController.h"


@interface LogoCollectionViewController ()

@end

@implementation LogoCollectionViewController

@synthesize nearMeImagesArray;
@synthesize nearMeNamesArray;
//@synthesize button;
//@synthesize logoChooseButton;
@synthesize selectedIndex;
//@synthesize delegate=_delegate;

@synthesize rowSelectedHere;
@synthesize rowSelectedSend;
@synthesize indexPathSend;

@synthesize logoUseString;

NSString *kLogoCollectionViewCellID = @"logoCollectionViewCellID";
NSString *kLogoHeaderCellID = @"logoHeaderCellID";

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
    [super viewDidLoad];
    
    [DIYMenu dismiss];
    
    
    nearMeNamesArray= @[@"Helix", @"MindCraft", @"Rainbow Hands",
                        @"DJ Pop", @"School Anime", @"Spartan Golf Club",
                        @"Pheonix Designs", @"Old", @"Old",
                        @"Old", @"Old", @"Old",
                        @"Old", @"Old", @"Old"];
    
    nearMeImagesArray= @[@"SampleLogo1.png", @"SampleLogo2.png", @"SampleLogo3.png",
                         @"SampleLogo4.png", @"SampleLogo5.png", @"SampleLogo6.png", @"SampleLogo7.png", @"SampleLogo8.png",@"SampleLogo9.png",@"SampleLogo10.png",@"SampleLogo11.png",@"SampleLogo12.png",@"SampleLogo13.png",@"SampleLogo14.png",@"SampleLogo15.png",@"SampleLogo16.png"];
    
    
	// Do any additional setup after loading the view.
}




- (id)initWithLogo:(Logo *)logo

{
    
    self = [super init];
    
    if (self) {
        
        
        //_firstName = [people.firstName copy];
        //lastName = [people.lastName copy];
        //homeEmail = [people.homeEmail copy];
        //workEmail = [people.workEmail copy];
        
        
    }
    
    return self;
    
}



-(IBAction)goInteractive:(id)sender{
    
  
    
    [DIYMenu dismiss];
    
    
   UIStoryboard *storyboard = self.storyboard;
     InteractiveViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"InteractiveViewBoard"];
     [self presentViewController:svc animated:YES completion:nil];
   //[self dismissViewControllerAnimated:YES completion:nil];

}


- (IBAction)goHome:(UIButton *)sender {
    
    /*UIStoryboard *storyboard = self.storyboard;
    ViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"HomeStoryboard"];
    [self presentViewController:vc animated:YES completion:nil];*/
    [self dismissViewControllerAnimated:YES completion:nil];
    
}




- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    
    
    
    [self.collectionView reloadData];
    //cell for header
    if (section == 0)
        
    {
        
        
        
        return 15;
    }
    
    
    else
    {
        
        
        //return logoNearMeArray.count;
        return 15;
        
    }
}

- (UICollectionReusableView *)collectionView: (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        LogoHeaderCell *logoHeaderCell = [collectionView dequeueReusableSupplementaryViewOfKind:
                                  UICollectionElementKindSectionHeader withReuseIdentifier:@"headerCellID" forIndexPath:indexPath];
        
            logoHeaderCell.pageTitleLabel.text = @" ";
        
        
        [[logoHeaderCell backButton] addTarget:self action:@selector(goInteractive1:event:) forControlEvents:UIControlEventTouchUpInside];
        
            reusableview = logoHeaderCell;
            
        
    }
    
    
    
    //NSString *searchTerm = self.searches[indexPath.section]; [headerView setSearchText:searchTerm];
    return reusableview;
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}





- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    
    
        nearMeNamesArray= @[@"Helix", @"MindCraft", @"Rainbow Hands",
                            @"DJ Pop", @"School Anime", @"Spartan Golf Club",
                            @"Pheonix Designs", @"Old", @"Old",
                            @"Old", @"Old", @"Old",
                            @"Old", @"Old", @"Old"];
    
        nearMeImagesArray= @[@"SampleLogo1.png", @"SampleLogo2.png", @"SampleLogo3.png",
                        @"SampleLogo4.png", @"SampleLogo5.png", @"SampleLogo6.png", @"SampleLogo7.png", @"SampleLogo8.png",@"SampleLogo9.png",@"SampleLogo10.png",@"SampleLogo11.png",@"SampleLogo12.png",@"SampleLogo13.png",@"SampleLogo14.png",@"SampleLogo15.png",@"SampleLogo16.png"];


    
        LogoCell *logoCell = [collectionView dequeueReusableCellWithReuseIdentifier:kLogoCollectionViewCellID forIndexPath:indexPath];
        
        logoCell.logoLabel.text = [nearMeNamesArray objectAtIndex:indexPath.item];
    
    
    
        NSString*nearMeImageString=[nearMeImagesArray objectAtIndex:indexPath.item];
        NSLog(@"mediaImageString %@",nearMeImageString);
    
        NSString*selectedImageString= @"SampleLogo8A.png";
    
    
    
        [logoCell.logoChooseButton setBackgroundImage:[UIImage imageNamed:nearMeImageString]forState:UIControlStateNormal];
    
        [logoCell.logoChooseButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    
    
    
     [[logoCell logoChooseButton] addTarget:self action:@selector(logoSelected:event:) forControlEvents:UIControlEventTouchUpInside];
        
        if (logoCell.logoChooseButton)
            
        {
            
            selectedIndex=[indexPath row];
            _logoChooseButton.tag=[indexPath row];
            NSLog(@"addButton.tag:%ld",(long)_logoChooseButton.tag);
            NSLog(@"indexPathSender1:%@",indexPath);
            NSLog(@"rowSelectedHere %i",rowSelectedHere);
            
            NSLog(@"indexPathSender:%ld",(long)logoCell.tag);
            
            UIButton*button = [logoCell logoChooseButton];
            button.tag = selectedIndex;

            
            
        }
        
        return logoCell;
    }


-(IBAction)goInteractive1:(UIButton*)sender event:(id)event {
    
    UIStoryboard *storyboard = self.storyboard;
     InteractiveViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"InteractiveViewBoard"];
     [self presentViewController:svc animated:YES completion:nil];
    
}

-(IBAction)logoSelected:(UIButton*)sender event:(id)event {
    
    NSLog(@"addButton.tag:%ld",(long)sender.tag);
    
    int myInt = (int)sender.tag;
    indexPathSend = (int)sender.tag;
    //int indexSend = addButton.tag;
    
    NSLog(@"sender %@",sender);
    NSLog(@"indexPathSend %d",indexPathSend);
    //NSString*nearMeImageString=[nearMeImagesArray objectAtIndex:selectedIndex];
    
    
    
    logoUseString=[nearMeImagesArray objectAtIndex:indexPathSend];
    NSLog(@"logoUseString %@",logoUseString);

    
    
    /*UIStoryboard *storyboard = self.storyboard;
    InteractiveViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"InteractiveViewBoard"];
    [self presentViewController:svc animated:YES completion:nil];*/

    
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"logoPickedSegue"]) {
        
        
        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        InteractiveViewController *destViewController = segue.destinationViewController;
        // NSLog(@"chosenImage %@",chosenImage);
        //NSLog(@"chosenImage %@",newImage);
        //destViewController.chosenImage = chosenImage;
        
        
        
        //NSString*nearMeImageString=[nearMeImagesArray objectAtIndex:selectedIndex];
        
        
        
        logoUseString=[nearMeImagesArray objectAtIndex:indexPathSend];
        NSLog(@"logoUseString %@",logoUseString);
        
        logoUseString=[nearMeImagesArray objectAtIndex:indexPathSend];
        NSLog(@"logoUseStringSend %@",logoUseString);

        destViewController.logoUseStringHere=logoUseString;
        //NSLog(@"chosenImage %@",logoUseString);
        
        //destViewController.delegate = self;
        
        /*UIStoryboard *storyboard = self.storyboard;
         InteractiveViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"InteractiveViewBoard"];
         [self presentViewController:svc animated:YES completion:nil];*/
        
    }
}



- (void)didSetLogoUseString:(InteractiveViewController *)controller{
    
    
     //[self dismissViewControllerAnimated:YES completion:nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
