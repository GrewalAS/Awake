//
//  SecondsBarGradient.m
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-25.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import "SecondsBarGradient.h"

@implementation SecondsBarGradient

@synthesize grad;

-(id) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {
        self.opaque = NO;
    }
    return self;
}//-(id)initWithFrame:(CGRect)frame


- (void)drawRect:(CGRect)rect {
    //Setting up the locations for the gradient
    CGFloat locations[2] = { 0.0f, 1.0f };
    CGFloat colors[8] = { 0.900f, 0.900f, 0.900f, 1.0f, 0.900f, 0.900f,  0.900f, 0.0f };
    
    //Creating the gradient
    //Getting the graphics context
    CGContextRef con = UIGraphicsGetCurrentContext();
    
    //Creating the color soace, then gradient and releasing the color space afterwards
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef localGrad = CGGradientCreateWithColorComponents(colorSpace, colors, locations, 2);
    CGColorSpaceRelease(colorSpace);
    
    CGPoint gradientStart = CGPointMake(self.bounds.origin.x + 10, self.bounds.origin.y);
    CGPoint gradientEnd = CGPointMake(self.bounds.origin.x, self.bounds.origin.y);
    
    //Drawing the gradient
    CGContextDrawLinearGradient(con, localGrad, gradientStart, gradientEnd, kCGGradientDrawsAfterEndLocation);
    
    self.grad = localGrad;
    CGGradientRelease(localGrad);
}//- (void)drawRect:(CGRect)rect

@end//@implementation SecondsBarGradient
