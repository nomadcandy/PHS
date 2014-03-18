//
//  LogoCollectionViewController.h
//  Millenium
//
//  Created by Jami Sue Becker on 3/14/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LogoCell.h"
#import "LogoHeaderCell.h"

@interface LogoCollectionViewController : UICollectionViewController

@property (nonatomic, copy) NSMutableArray *nearMeArray;
@property (nonatomic, assign) int selectedIndex;



@end
