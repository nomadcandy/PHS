//
//  DraftHeaderCellViewController.h
//  CintasMats
//
//  Created by Jami Sue Becker on 12/12/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DraftHeaderCell : UICollectionViewCell <UITextFieldDelegate>



@property (strong, nonatomic) IBOutlet UILabel *pageTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *logoTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *matTitleLabel;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIButton *cintasButton;
//@property (strong, nonatomic) IBOutlet UIButton *searchButton;
@property (strong, nonatomic) IBOutlet UIImageView *blackBarView;
@property (strong, nonatomic) IBOutlet UITextField *searchField;

@end
