//
//  AppDelegate.h
//  Millenium
//
//  Created by Jami Sue Becker on 3/10/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DIYMenu.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, DIYMenuDelegate>

@property (strong, nonatomic) UIWindow *window;
@property BOOL model;

@end
