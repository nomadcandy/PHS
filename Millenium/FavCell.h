//
//  Logo.h
//  Millenium
//
//  Created by Jami Sue Becker on 3/14/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UILabel *matLabel;
@property (strong, nonatomic) IBOutlet UILabel *logoLabel;
@property (strong, nonatomic) IBOutlet UIImageView *logoImage;
@property (strong, nonatomic) IBOutlet UIButton *logoChooseButton;
@property (strong, nonatomic) IBOutlet UIButton *logoChoose1Button;

@property (strong, nonatomic) IBOutlet UIButton *matChooseButton;
@property (strong, nonatomic) IBOutlet UIButton *matChoose1Button;
@property (strong, nonatomic) IBOutlet UIButton *goBack;
@property (strong, nonatomic) IBOutlet UIButton *goBackLogo;

@property (nonatomic,strong) IBOutlet UILabel *goBackLogoLabel;
@property (nonatomic,strong) IBOutlet UILabel *goBackMatLabel;
//@property (strong, nonatomic) IBOutlet UIButton *favButton;
//@property (strong, nonatomic) IBOutlet UIButton *removeFavButton;
//@property (strong, nonatomic) IBOutlet UIButton *saveButton;


@property (nonatomic,strong) IBOutlet UIButton *removeFavLogoButton;
@property (nonatomic,strong) IBOutlet UIButton *addFavLogoButton;
@property (nonatomic,strong) IBOutlet UILabel *removeFavLogoLabel;
@property (nonatomic,strong) IBOutlet UILabel *addFavLogoLabel;

@property (nonatomic,strong) IBOutlet UIButton *removeFavMatButton;
@property (nonatomic,strong) IBOutlet UIButton *addFavMatButton;
@property (nonatomic,strong) IBOutlet UILabel *removeFavMatLabel;
@property (nonatomic,strong) IBOutlet UILabel *addFavMatLabel;


@end
