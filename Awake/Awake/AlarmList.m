//
//  AlarmText.m
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-21.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import "AlarmList.h"

@implementation AlarmList

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame: frame]) {
        self.opaque = NO;
    }
    return self;
}//-(id)initWithFrame:(CGRect)frame

- (void)drawRect:(CGRect)rect {
    //Setting the thickness and width of the lines
    float thicknessOfLines = 1.0;
    float thicknessOfSpaces = 4;
    float widthOfLines = 15;
    //Getting the context
    CGContextRef con = UIGraphicsGetCurrentContext();
    //Setting the fill colour
    CGContextSetFillColorWithColor(con, [[Colors SymbolColor] CGColor]);
    //Setting up the drawing point, used like the tip of a pencil
    CGPoint drawingPoint = { 0, 2.0};
    //Moving to the top right in the context
    CGContextMoveToPoint(con, drawingPoint.x, drawingPoint.y);
    //Drawing the list symbol
    //Top line
    drawingPoint.x += widthOfLines;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    drawingPoint.y += thicknessOfLines;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    drawingPoint.x -= widthOfLines;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    drawingPoint.y -= thicknessOfLines;
    //Filling the drawing so far
    CGContextFillPath(con);
    
    //Moving to the top left of the middle line
    drawingPoint.y += (thicknessOfLines + thicknessOfSpaces);
    CGContextMoveToPoint(con, drawingPoint.x, drawingPoint.y);
    //Drawing the list symbol
    //Middle Line
    drawingPoint.x += widthOfLines;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    drawingPoint.y += thicknessOfLines;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    drawingPoint.x -= widthOfLines;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    drawingPoint.y -= thicknessOfLines;
    //Filling the drawing so far
    CGContextFillPath(con);
    
    //Moving to the top left of the last line
    drawingPoint.y += (thicknessOfLines + thicknessOfSpaces);
    CGContextMoveToPoint(con, drawingPoint.x, drawingPoint.y);
    //Drawing the list symbol
    //Last Line
    drawingPoint.x += widthOfLines;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    drawingPoint.y += thicknessOfLines;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    drawingPoint.x -= widthOfLines;
    CGContextAddLineToPoint(con, drawingPoint.x, drawingPoint.y);
    drawingPoint.y -= thicknessOfLines;
    //Filling the last line
    CGContextFillPath(con);
}//- (void)drawRect:(CGRect)rect

@end//@implementation AlarmList
