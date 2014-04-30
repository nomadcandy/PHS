//
//  Logo.h
//  Millenium
//
//  Created by Jami Sue Becker on 3/14/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogoCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UILabel *logoLabel;
@property (strong, nonatomic) IBOutlet UIImageView *logoImage;
@property (strong, nonatomic) IBOutlet UIButton *logoChooseButton;
@property (strong, nonatomic) IBOutlet UIButton *logoChoose1Button;
@property (strong, nonatomic) IBOutlet UIButton *matChooseButton;
@property (strong, nonatomic) IBOutlet UIButton *matChoose1Button;
@property (strong, nonatomic) IBOutlet UIButton *goBack;
@property (strong, nonatomic) IBOutlet UIButton *favButton;
@property (strong, nonatomic) IBOutlet UIButton *removeFavButton;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;

@end
