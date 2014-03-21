//
//  ImagePickerViewController.m
//  Millenium
//
//  Created by Jami Sue Becker on 3/21/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import "ImagePickerViewController.h"

@interface ImagePickerViewController ()

@end

@implementation ImagePickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AppDelegate *appdelegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    appdelegate.model=YES;
    
    
    //send here where near me sends in other method
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
    [self dismissViewControllerAnimated:YES completion:NULL];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
