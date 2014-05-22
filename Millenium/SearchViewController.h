//
//  SearchViewController.h
//  Millenium
//
//  Created by Jami Sue Becker on 3/14/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface SearchViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>


-(IBAction)goHome:(id)sender;

@property (strong, nonatomic) NSArray *locationArray;
@property (strong, nonatomic) NSArray *matTypeArray;
@property (strong, nonatomic) NSArray *sizeArray;
@property (strong, nonatomic) NSArray *styleArray;

@property (nonatomic, strong) IBOutlet UITextField *sketchReferenceField;
@property (nonatomic, strong) IBOutlet UITextField *containingField;
@property (nonatomic, strong) IBOutlet UITextField *locationField;
@property (nonatomic, strong) IBOutlet UITextField *typeField;
@property (nonatomic, strong) IBOutlet UITextField *firstDateField;
@property (nonatomic, strong) IBOutlet UITextField *secondDateField;
@property (nonatomic, strong) IBOutlet UITextField *sizeField;
@property (nonatomic, strong) IBOutlet UIButton *bestMatchButton;
@property (nonatomic, strong) IBOutlet UIButton *dateButton;
@property (nonatomic, strong) IBOutlet UIButton *popularityButton;


@property (nonatomic, copy) NSMutableArray *artworkNameArray;
@property (nonatomic, copy) NSMutableArray *artworkSizeArray;
@property (nonatomic, copy) NSMutableArray *artworkFormatArray;
@property (nonatomic, copy) NSMutableArray *artworkFullImageArray;
@property (nonatomic, copy) NSMutableArray *artworkIconArray;
@property (nonatomic, copy) NSMutableArray *artworkIDArray;
@property (nonatomic, copy) NSMutableArray *artworkInfoArray;


@property (nonatomic, copy) NSString *firstNameString;
@property (nonatomic, copy) NSString *lastNameString;
@property (nonatomic, copy) NSString *locationIDString;
@property (nonatomic, copy) NSString *locationNameString;
@property (nonatomic, copy) NSString *locationNumberString;





@end
