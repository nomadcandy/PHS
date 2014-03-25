//
//  MaskView.h
//  Millenium
//
//  Created by Jami Sue Becker on 3/24/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MaskView : UIView


{
    CGPoint firstPoint;
    CGPoint secondPoint;
    CGPoint thirdPoint;
    CGPoint fourthPoint;
    
    //CGContextClip context;
    
    NSMutableArray *touchesArray;
    UIImageView*editImageView;
    UIImage*chosenImage;
}
@end


