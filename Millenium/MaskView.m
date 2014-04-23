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
        self.backgroundColor = [UIColor lightGrayColor];
        touchesArray = [[NSMutableArray alloc]initWithCapacity:4];
        self.frame = CGRectMake(0, 0,532 ,386  );
        
        /*CGRect myImageRect = CGRectMake( 200.0f, 100.0f, 800.0f, 600.0f);
        UIImageView *myImage = [[UIImageView alloc]initWithFrame:myImageRect];*/
        //[myImage setImage:[UIImage imageNamed:@"playboyz.png"]];
        [editImageView setImage:chosenImage];
        [self addSubview:editImageView];

        
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
    
    //CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    //CGContextFillPath(context);

    CGContextSaveGState(context);
    CGContextClip(context);
	
	// Draw a connected sequence of line segments
	CGPoint addLines[] =
	{
        firstPoint,secondPoint,thirdPoint,fourthPoint,firstPoint,
	};
    
    //make Snapshot Rectangle
    //CGRect screenRectSnapshot = CGRectMake(637.0,357.0,998,580);
    
    //CGRect screenRectSnapshot
    
    //trying to add paths to context to save
    CGPoint addPath[] =
	{
        firstPoint,secondPoint,thirdPoint,fourthPoint,
	};
    
    
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    
    // Set the starting point of the shape.
    //[aPath moveToPoint:CGPointMake(100.0, 0.0)];
    [aPath moveToPoint:firstPoint];
    [aPath addLineToPoint:secondPoint];
    [aPath addLineToPoint:thirdPoint];
    [aPath addLineToPoint:fourthPoint];
    
    // Draw the lines.
    /*[aPath addLineToPoint:CGPointMake(200.0, 40.0)];
    [aPath addLineToPoint:CGPointMake(160, 140)];
    [aPath addLineToPoint:CGPointMake(40.0, 140)];
    [aPath addLineToPoint:CGPointMake(0.0, 40.0)];*/
    [aPath closePath];
    
    // Get the CGPathRef and create a mutable version. asign bezier to core graphics
    CGPathRef cgPath = aPath.CGPath;
    CGMutablePathRef  mutablePath = CGPathCreateMutableCopy(cgPath);
    
    
    //Set the render colors.
    [[UIColor blackColor] setStroke];
    [[UIColor redColor] setFill];
    
    CGContextRef aRef = UIGraphicsGetCurrentContext();
    
    // If you have content to draw after the shape,
    // save the current state before changing the transform.
    //CGContextSaveGState(aRef);
    
    // Adjust the view's origin temporarily. The oval is
    // now drawn relative to the new origin point.
    CGContextTranslateCTM(aRef, 50, 50);
    
    // Adjust the drawing options as needed.
    aPath.lineWidth = 5;
    
    // Fill the path before stroking it so that the fill
    // color does not obscure the stroked line.
    [aPath fill];
    [aPath stroke];
    
    // Restore the graphics state before drawing any other content.
    //CGContextRestoreGState(aRef);
    
    
    
    //CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    //CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGPoint startPoint = firstPoint;
    CGPoint endPoint = thirdPoint;
    
    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextClip(context);
    
    CGContextRestoreGState(context);
    

    
    
	// Bulk call to add lines to the current path.
	// Equivalent to MoveToPoint(points[0]); for(i=1; i<count; ++i) AddLineToPoint(points[i]);
	CGContextAddLines(context, addLines, sizeof(addLines)/sizeof(addLines[0]));
	CGContextStrokePath(context);
    
    //CGContextAddPath(<#CGContextRef context#>, <#CGPathRef path#>);
    
    
    
    CGContextSetFillColorWithColor(context,
                                   [UIColor redColor].CGColor);
    
    

    //CGContextAddPath(context, addLines);
    
    //CAShapeLayer *mask = [CAShapeLayer layer];
    
    //CAShapeLayer *maskUse = (__bridge CAShapeLayer *)(addPath);
    //CAShapeLayer *maskUse = (context, addLines);
    

    
    CGContextSaveGState(context);
    
    //Set color of current context
    [[UIColor blackColor] set];
    
    //Set shadow and color of shadow
    CGContextSetShadowWithColor(context, CGSizeZero, 10.0f, [[UIColor clearColor] CGColor]);
    
    //CGContextSetShadowWithColor(context, CGSizeZero, 10.0f, context);
    
    //Draw ellipse
    //CGRect Rect = CGRectMake(60.0f, 150.0f, 200.0f, 200.0f);
    //CGContextFillEllipseInRect(context, Rect);
    
    //CGContextDrawImage(context, Rect, (__bridge CGImageRef)(chosenImage));
    
    CGContextRestoreGState(context);
    
    
    
    //add more
    
    CGSize imageSize = chosenImage.size;
    
    
    //mask code
    /*CGFloat width = secondPoint-firstPoint;
    
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;

    
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    if (width != height) {
        CGFloat newDimension = MIN(width, height);
        //CGFloat newDimension = secondPoint-firstPoint;
        CGFloat widthOffset = (width - newDimension) / 2;
        CGFloat heightOffset = (height - newDimension) / 2;
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(newDimension, newDimension), NO, 0.);
        [chosenImage drawAtPoint:CGPointMake(-widthOffset, -heightOffset)
                 blendMode:kCGBlendModeCopy
                     alpha:1.];
        chosenImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();*/
    }

    



-(void)drawEllipse:(CGContextRef)context{
    
    CGContextSaveGState(context);
    
    //Set color of current context
    [[UIColor blackColor] set];
    
    //Set shadow and color of shadow
    CGContextSetShadowWithColor(context, CGSizeZero, 10.0f, [[UIColor blackColor] CGColor]);
    
    //Draw ellipse
    CGRect ellipseRect = CGRectMake(60.0f, 150.0f, 200.0f, 200.0f);
    CGContextFillEllipseInRect(context, ellipseRect);
    
    CGContextRestoreGState(context);
    
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


