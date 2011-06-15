//
//  BatteryView.m
//  Nodobo Replay
//
//  Created by Stephen Bell on 18/05/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BatteryView.h"


@implementation BatteryView

- (void) drawRect:(CGRect)rect
{
	
	float center = [self bounds].size.width  * 0.50;
	float middle = [self bounds].size.height * 0.50;
	// construct and draw a heart shaped path
    NSGraphicsContext    *nsGraphicsContext    = [NSGraphicsContext currentContext];
    CGContextRef            context        = (CGContextRef) [nsGraphicsContext graphicsPort];
	CGContextSaveGState(context);
	float kHalfSize = 300.0;
	CGContextTranslateCTM(context, center, middle);
	CGContextMoveToPoint(context, 0, 21);
	CGContextAddCurveToPoint(context, -16, 49.8,-53.2, 41.0, -49.6, 5.8);
	CGContextAddCurveToPoint(context, -46, -29.4,-9.4, -53.4, 0, -69.8);
	CGContextAddCurveToPoint(context, 9.4, -53.4,46, -29.4, 49.6, 5.8);
	CGContextAddCurveToPoint(context, 53.2, 41, 16, 49.8, 0, 21);
	CGContextClosePath(context);
	CGContextStrokePath(context);
}

@end
