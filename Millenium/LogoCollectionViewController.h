//
//  LogoCollectionViewController.h
//  Millenium
//
//  Created by Jami Sue Becker on 3/14/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "LogoCell.h"
#import "LogoHeaderCell.h"
#import "InteractiveViewController.h"
#import "DIYMenu.h"
#import "Logo.h"

@interface LogoCollectionViewController : UICollectionViewController <DIYMenuDelegate>

{
    //UIButton* button;
    
}

@property (nonatomic, strong) IBOutlet UIViewController *InteractiveViewController;

@property (nonatomic, copy) NSArray *searchImagesArray;
@property (nonatomic, copy) NSArray *nearMeImagesArray;
@property (nonatomic, copy) NSArray *searchNamesArray;
@property (nonatomic, copy) NSArray *nearMeNamesArray;
@property (nonatomic, assign) int selectedIndex;
@property (nonatomic, strong) UIButton*button;

-(IBAction)goInteractive:(id)sender;
- (IBAction)goHome:(UIButton *)sender ;



@end
