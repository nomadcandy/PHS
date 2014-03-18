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
	// Do any additional setup after loading the view.
}


- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    
    
    
    [self.collectionView reloadData];
    //cell for header
    if (section == 0)
        
    {
        
        
        
        return 1;
    }
    
    
    else
    {
        
        
        //return logoNearMeArray.count;
        return 12;
        
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
    
    
    
    
        LogoCell *logoCell = [collectionView dequeueReusableCellWithReuseIdentifier:kLogoCollectionViewCellID forIndexPath:indexPath];
        
        logoCell.logoLabel.text = [_nearMeNamesArray objectAtIndex:indexPath.item];
    
    
        UIImage* buttonImage = [_nearMeImagesArray objectAtIndex:indexPath.item];
                //nameString=[nearMeArray objectAtIndex:indexPath.item];
        
        [logoCell.logoChooseButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    
    
        [logoCell.logoChooseButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    
        [[logoCell logoChooseButton] addTarget:self action:@selector(goDirections:event:) forControlEvents:UIControlEventTouchUpInside];
        
        
        if (logoCell.logoChooseButton)
            
        {
          
            _selectedIndex=[indexPath row];
            logoCell.logoChooseButton.tag=[indexPath row];
            UIButton* button = [logoCell logoChooseButton];
            button.tag = _selectedIndex;
            
            
        }
        
        return logoCell;
    }
    
    
    




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
