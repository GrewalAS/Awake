//
//  Background.m
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-08.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import "Background.h"

@implementation Background

@synthesize hour;
@synthesize grad;

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame: frame]) {
        self.grad = nil;
        self.opaque = NO;
        //Getting the hour value to determine color in the gradient
        self.hour = [NSNumber numberWithInt:[[GetTimeInFormat GetTimeInFormat: TF_HOUR_FORMAT] intValue]];
    }
    return self;
}//-(id)initWithFrame:(CGRect)frame

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //Needs new hour value or the colour won't change
    self.hour = [NSNumber numberWithInt:[[GetTimeInFormat GetTimeInFormat: TF_HOUR_FORMAT] intValue]];
    if ((self.hour.intValue < 4) || (self.hour.intValue >= 22)) {
        //Color for time between 10PM and 4AM
        //Getting the graphics context
        CGContextRef con = UIGraphicsGetCurrentContext();
        //Setting the colour
        CGContextSetFillColorWithColor(con, [[Colors HomeBackgroundDarkColor] CGColor]);
        //Starting the line at the origin at point of origin of rect
        CGContextMoveToPoint(con, rect.origin.x, rect.origin.y);
        CGContextAddLineToPoint(con, rect.origin.x, rect.size.height);
        CGContextAddLineToPoint(con, rect.size.width, rect.size.height);
        CGContextAddLineToPoint(con, rect.size.width, rect.origin.y);
        //Filling the drawing
        CGContextFillPath(con);
    } else{
        gradientStruct gradient = [Colors GradientColorWithHour: [self.hour intValue]];
        [self CreateGradientWithNumber:2 atLocations:gradient.locations withColors:gradient.colors];
    }
}//- (void)drawRect:(CGRect)rect


-(void) CreateGradientWithNumber: (size_t) _number atLocations: (CGFloat*) _location withColors: (CGFloat*) _colors {
    //Getting the graphics context
    CGContextRef con = UIGraphicsGetCurrentContext();
    
    //Creating the color soace, then gradient and releasing the color space afterwards
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef locGrad = CGGradientCreateWithColorComponents(colorSpace, _colors, _location, _number);
    CGColorSpaceRelease(colorSpace);
    
    //getting center and radius of the gradient
    CGPoint gradCenter = CGPointMake(self.bounds.size.width/2, self.bounds.size.height);
    float gradRadius = self.bounds.size.height/1.2;
    
    //Drawing the radial gradient
    CGContextDrawRadialGradient(con, locGrad, gradCenter, 0, gradCenter, gradRadius, kCGGradientDrawsAfterEndLocation);
    self.grad = locGrad;
    CGGradientRelease(locGrad);
}//-(void) CreateGradientWithNumber: (size_t) number atLocations: (CGFloat*) location withColors: (CGFloat*) colors

@end//@implementation Background
