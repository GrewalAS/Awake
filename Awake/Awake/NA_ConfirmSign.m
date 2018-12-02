//
//  NA_ConfirmSign.m
//  Awake
//
//  Created by Amrinder Grewal on 2014-11-01.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import "NA_ConfirmSign.h"

@implementation NA_ConfirmSign

-(id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {
        self.opaque = NO;
    }
    return self;
}//-(id)initWithFrame:(CGRect)frame

- (void)drawRect:(CGRect)rect {
    //Setting thickess and size of each part
    float thickness = .50;
    //Getting the graphics context
    CGContextRef con = UIGraphicsGetCurrentContext();
    //Setting the fill colour
    CGContextSetFillColorWithColor(con, [[Colors TextColor] CGColor]);
    //Setting up the drawing point
    //Staring point
    CGPoint drawingPoint = {0.f, 9.f};
    //Moving the the upper left hand corner
    //First line will be drawn from here to the bottom right corner
    CGContextMoveToPoint(con, drawingPoint.x, drawingPoint.y);
    
    //Drawing
    drawingPoint.x += thickness;
    drawingPoint.y -= thickness;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    
    drawingPoint.x = 3;
    drawingPoint.y = 13.5;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    
    drawingPoint.x = 14;
    drawingPoint.y = 0;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    
    drawingPoint.x += thickness;
    drawingPoint.y += thickness;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    
    drawingPoint.x = 4;
    drawingPoint.y = 14.5;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    
    drawingPoint.x = 3;
    drawingPoint.y = 15;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    
    drawingPoint.x = 2;
    drawingPoint.y = 14.5;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    
    //Filling the drawing
    CGContextFillPath(con);
    
}//- (void)drawRect:(CGRect)rect

@end//@implementation NA_ConfirmSign
