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
@synthesize button;

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
    
   [self dismissViewControllerAnimated:YES completion:nil];

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
        //[logoCell.logoChooseButton setBackgroundImage:[UIImage imageNamed:selectedImageString] forState:UIControlStateSelected];

    
        [logoCell.logoChooseButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    
    
       //[logoCell.logoChooseButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    
    
        [[logoCell logoChooseButton] addTarget:self action:@selector(logoSelected:) forControlEvents:UIControlEventTouchUpInside];
        
        
        if (logoCell.logoChooseButton)
            
        {
          
            _selectedIndex=[indexPath row];
            logoCell.logoChooseButton.tag=[indexPath row];
            //NSLog(@"index %d",index);
            button = [logoCell logoChooseButton];
            button.tag = _selectedIndex;
            NSLog(@"selectedIndex %i",_selectedIndex);
            
            
            

            
            

            
            
        }
        
        return logoCell;
    }
    
    
    
-(IBAction)logoSelected:(id)sender

{
   
    NSLog(@"sender %@",sender);
    NSLog(@"selectedIndex %d",_selectedIndex);
    NSString*nearMeImageString=[nearMeImagesArray objectAtIndex:_selectedIndex];
    //NSLog(@"nearMe %@",nearMeImageString);
    NSLog(@"nearMe %i",button.tag);
    
    UIStoryboard *storyboard = self.storyboard;
    InteractiveViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"InteractiveViewBoard"];
    
    // Configure the new view controller here.
    [self presentViewController:svc animated:YES completion:nil];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
