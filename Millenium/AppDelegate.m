//
//  AppDelegate.m
//  Millenium
//
//  Created by Jami Sue Becker on 3/10/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import "AppDelegate.h"
#import "DIYMenuOptions.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    UIFont *font = [UIFont systemFontOfSize:14];
    
    [DIYMenu setDelegate:self];
    
    // Add menu items
    /*[DIYMenu addMenuItem:@"Portfolio" withIcon:[UIImage imageNamed:@"portfolioIcon@2x.png"] withColor:[UIColor colorWithRed:0.18f green:0.76f blue:0.93f alpha:1.0f] withFont:font];
    [DIYMenu addMenuItem:@"Skills" withIcon:[UIImage imageNamed:@"skillsIcon@2x.png"] withColor:[UIColor colorWithRed:0.28f green:0.55f blue:0.95f alpha:1.0f] withFont:font];
    [DIYMenu addMenuItem:@"Explore" withIcon:[UIImage imageNamed:@"exploreIcon@2x.png"] withColor:[UIColor colorWithRed:0.47f green:0.24f blue:0.93f alpha:1.0f] withFont:font];
    [DIYMenu addMenuItem:@"Settings" withIcon:[UIImage imageNamed:@"settingsIcon@2x.png"] withColor:[UIColor colorWithRed:0.57f green:0.0f blue:0.85f alpha:1.0f] withFont:font];*/
    
    
    [DIYMenu addMenuItem:@"transparent" withIcon:[UIImage imageNamed:@"portfolioIcon@2x.png"] withColor:[UIColor colorWithWhite:0.70 alpha:1] withFont:font];
    
    [DIYMenu addMenuItem:@"transparent" withIcon:[UIImage imageNamed:@"portfolioIcon@2x.png"] withColor:[UIColor colorWithWhite:0.70 alpha:.5] withFont:font];
    
    [DIYMenu addMenuItem:@"pics" withIcon:[UIImage imageNamed:@"skillsIcon@2x.png"] withColor:[UIColor lightGrayColor] withFont:font];
    [DIYMenu addMenuItem:@"camera" withIcon:[UIImage imageNamed:@"exploreIcon@2x.png"] withColor:[UIColor whiteColor] withFont:font];
    [DIYMenu addMenuItem:@"millenium" withIcon:[UIImage imageNamed:@"settingsIcon@2x.png"] withColor:[UIColor lightGrayColor] withFont:font];
    [DIYMenu addMenuItem:@"search" withIcon:[UIImage imageNamed:@"settingsIcon@2x.png"] withColor:[UIColor whiteColor] withFont:font];
    [DIYMenu addMenuItem:@"near me" withIcon:[UIImage imageNamed:@"settingsIcon@2x.png"] withColor:[UIColor lightGrayColor] withFont:font];
    [DIYMenu addMenuItem:@"save" withIcon:[UIImage imageNamed:@"settingsIcon@2x.png"] withColor:[UIColor whiteColor] withFont:font];
    
    
    // Override point for customization after application launch.
    return YES;
    
}

#pragma mark - DIYMenuDelegate

- (void)menuItemSelected:(NSString *)action
{
    NSLog(@"Delegate: selected: %@", action);
}

- (void)menuActivated
{
    NSLog(@"Delegate: menuActivated");
}

- (void)menuCancelled
{
    NSLog(@"Delegate: menuCancelled");
}

							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
