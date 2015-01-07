//
//  DraftCell.h
//  CintasMats
//
//  Created by Jami Sue Becker on 12/12/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface DraftCell : UICollectionViewCell



@property (strong, nonatomic) IBOutlet UILabel *draftTitleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *draftImage;
@property (strong, nonatomic) IBOutlet UIButton *draftChooseButton;
@property (strong, nonatomic) IBOutlet UIButton *draftChoose1Button;

@property (strong, nonatomic) IBOutlet UIButton *goBack;
@property (strong, nonatomic) IBOutlet UIButton *goBackLogo;

@property (nonatomic,strong) IBOutlet UILabel *goBackLogoLabel;
@property (nonatomic,strong) IBOutlet UILabel *goBackMatLabel;



@property (nonatomic,strong) IBOutlet UIButton *removeDraftButton;
@property (nonatomic,strong) IBOutlet UILabel *removeDraftLabel;
@property (nonatomic,strong) IBOutlet UILabel *addDraftLabel;



@end
