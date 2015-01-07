//
//  DraftNotesCell.h
//  CintasMats
//
//  Created by Jami Sue Becker on 1/7/15.
//  Copyright (c) 2015 Jami Sue Becker. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface DraftNotesCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UILabel *draftNoteTitleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *draftNoteImage;
//@property (strong, nonatomic) IBOutlet UIButton *draftChooseButton;
@property (strong, nonatomic) IBOutlet UIButton *draftNoteChooseButton;

@property (strong, nonatomic) IBOutlet UIButton *goBack;
@property (strong, nonatomic) IBOutlet UIButton *goBackLogo;

@property (nonatomic,strong) IBOutlet UILabel *goBackLogoLabel;
@property (nonatomic,strong) IBOutlet UILabel *goBackMatLabel;



@property (nonatomic,strong) IBOutlet UIButton *removeDraftButton;
@property (nonatomic,strong) IBOutlet UILabel *removeDraftLabel;
@property (nonatomic,strong) IBOutlet UILabel *addDraftLabel;


@end
