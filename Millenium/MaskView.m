//
//  MaskView.m
//  Millenium
//
//  Created by Jami Sue Becker on 3/24/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import "MaskView.h"

@implementation MaskView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        touchesArray = [[NSMutableArray alloc]initWithCapacity:4];
        
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 1.0);
	// Draw them with a 2.0 stroke width so they are a bit more visible.
	CGContextSetLineWidth(context, 2.0);
	
	// Draw a connected sequence of line segments
	CGPoint addLines[] =
	{
        firstPoint,secondPoint,thirdPoint,fourthPoint,firstPoint,
	};
	// Bulk call to add lines to the current path.
	// Equivalent to MoveToPoint(points[0]); for(i=1; i<count; ++i) AddLineToPoint(points[i]);
	CGContextAddLines(context, addLines, sizeof(addLines)/sizeof(addLines[0]));
	CGContextStrokePath(context);
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    [touchesArray addObject:[NSValue valueWithCGPoint:point]];
    if (touchesArray.count > 4) {
        [touchesArray removeObjectAtIndex:0];
    }
    if (touchesArray.count==4) {
        firstPoint = [[touchesArray objectAtIndex:0]CGPointValue];
        secondPoint = [[touchesArray objectAtIndex:1]CGPointValue];
        thirdPoint = [[touchesArray objectAtIndex:2]CGPointValue];
        fourthPoint=[[touchesArray objectAtIndex:3]CGPointValue];
    }
    NSLog(@"%@",[NSString stringWithFormat:@"1:%f/%f\n2:%f/%f\n3:%f/%f\n4:%f/%f",firstPoint.x,firstPoint.y,secondPoint.x,secondPoint.y,thirdPoint.x,thirdPoint.y,fourthPoint.x,fourthPoint.y]);
    [self setNeedsDisplay];
}
-(void)dealloc{
    
}

@end


