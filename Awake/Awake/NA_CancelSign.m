//
//  NA_CancelSign.m
//  Awake
//
//  Created by Amrinder Grewal on 2014-11-01.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import "NA_CancelSign.h"

@implementation NA_CancelSign

-(id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {
        self.opaque = NO;
    }
    return self;
}//-(id)initWithFrame:(CGRect)frame

- (void)drawRect:(CGRect)rect {
    //Setting thickess and size of each part
    float thickness = sqrtf(0.5);
    float size = 7;
    //Getting the graphics context
    CGContextRef con = UIGraphicsGetCurrentContext();
    //Setting the fill colour
    CGContextSetFillColorWithColor(con, [[Colors SymbolColor] CGColor]);
    //Setting up the drawing point
    //Staring point
    CGPoint drawingPoint = {0.f, 1.f};
    //Moving the the upper left hand corner
    //First line will be drawn from here to the bottom right corner
    CGContextMoveToPoint(con, drawingPoint.x, drawingPoint.y);
    
    //Drawing
    drawingPoint.x += thickness;
    drawingPoint.y -= thickness;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    
    drawingPoint.x += (size * 2);
    drawingPoint.y += (size * 2);
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    
    drawingPoint.x -= thickness;
    drawingPoint.y += thickness;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    
    //Filling the drawing
    CGContextFillPath(con);
    
    //Moving the the upper right hand corner
    drawingPoint.x += 0;
    drawingPoint.y -= (size * 2) + thickness;
    //First line will be drawn from here to the bottom left corner
    CGContextMoveToPoint(con, drawingPoint.x, drawingPoint.y);
    //Drawing
    drawingPoint.x += thickness;
    drawingPoint.y += thickness;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    
    drawingPoint.x -= (size * 2);
    drawingPoint.y += (size * 2);
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    
    drawingPoint.x -= thickness;
    drawingPoint.y -= thickness;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    
    //Filling the drawing
    CGContextFillPath(con);
}//- (void)drawRect:(CGRect)rect

@end//@implementation NA_CancelSign
