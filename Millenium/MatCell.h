//
//  MatCell.h
//  Millenium
//
//  Created by Jami Sue Becker on 4/25/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MatCell : UICollectionViewCell


@property (strong, nonatomic) IBOutlet UILabel *logoLabel;
@property (strong, nonatomic) IBOutlet UIImageView *logoImage;
@property (strong, nonatomic) IBOutlet UIButton *logoChooseButton;
@property (strong, nonatomic) IBOutlet UIButton *goBack;
@property (strong, nonatomic) IBOutlet UIButton *favButton;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;

@end
