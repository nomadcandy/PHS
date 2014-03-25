//
//  MyDraggableImage.m
//  FeltedHeart
//
//  Created by jami  becker on 8/13/12.
//  Copyright (c) 2012 jami  becker. All rights reserved.
//

#import "MyDraggableImage.h"

@implementation MyDraggableImage

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
	
	// Retrieve the touch point
	CGPoint pt = [[touches anyObject] locationInView:self];
	//startLocation = pt;
	[[self superview] bringSubviewToFront:self];
	
}
- (void) touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
	
	// Move relative to the original touch point
	CGPoint pt = [[touches anyObject] locationInView:self];
	CGRect frame = [self frame];
	//frame.origin.x += pt.x - startLocation.x;
	//frame.origin.y += pt.y - startLocation.y;
	[self setFrame:frame];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
