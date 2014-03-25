//
//  MaskView.h
//  Millenium
//
//  Created by Jami Sue Becker on 3/24/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaskView : UIView


{
    CGPoint firstPoint;
    CGPoint secondPoint;
    CGPoint thirdPoint;
    CGPoint fourthPoint;
    
    NSMutableArray *touchesArray;
}
@end


