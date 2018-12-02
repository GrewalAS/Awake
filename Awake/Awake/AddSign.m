//
//  AddSign.m
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-21.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import "AddSign.h"

@implementation AddSign

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame: frame]) {
        self.opaque = NO;
    }
    return self;
}//-(id)initWithFrame:(CGRect)frame

-(void)drawRect:(CGRect)rect {
    //Setting thickess and size of each part
    float thickness = 1.0;
    float size = 7;
    //Getting the graphics context
    CGContextRef con = UIGraphicsGetCurrentContext();
    //Setting the fill colour
    CGContextSetFillColorWithColor(con, [[Colors SymbolColor] CGColor]);
    //Setting up the drawing point, used like the tip of a pencil
    CGPoint drawingPoint = {7.f, 0.f};
    //Moving to the point of origin of the plus sign
    //The top left corner of the add sign
    CGContextMoveToPoint(con, drawingPoint.x, drawingPoint.y);
    //Drawing the plus sign
    drawingPoint.x += thickness;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    drawingPoint.y += size;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    
    drawingPoint.x += size;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    drawingPoint.y += thickness;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    drawingPoint.x -= size;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    
    drawingPoint.y += size;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    drawingPoint.x -= thickness;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    drawingPoint.y -= size;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    
    drawingPoint.x -= size;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    drawingPoint.y -= thickness;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    drawingPoint.x += size;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    
    drawingPoint.y += size;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    
    //Filling the drawing
    CGContextFillPath(con);
}//-(void)drawRect:(CGRect)rect

-(void)setNeedsDisplay{
    [super setNeedsDisplay];
}//-(void)setNeedsDisplay

@end//@implementation AddSign
