//
//  SearchViewController.h
//  Millenium
//
//  Created by Jami Sue Becker on 3/14/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>


@property (strong, nonatomic) NSArray *locationArray;
@property (strong, nonatomic) NSArray *matTypeArray;
@property (strong, nonatomic) NSArray *sizeArray;
@property (strong, nonatomic) NSArray *styleArray;

@end
