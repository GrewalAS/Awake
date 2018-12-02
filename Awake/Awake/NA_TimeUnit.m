//
//  NA_TimeUnit.m
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-28.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import "NA_TimeUnit.h"

@implementation NA_TimeUnit

@synthesize timeUnitValue;

-(id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {
        self.opaque = NO;
    }
    return self;
}//-(id)initWithFrame:(CGRect)frame

- (void)drawRect:(CGRect)rect {
    NSMutableParagraphStyle *paraStyleNATimeUnit = [[NSMutableParagraphStyle alloc] init];
    paraStyleNATimeUnit.alignment = NSTextAlignmentCenter;
    
    [self.timeUnitValue addAttribute: NSParagraphStyleAttributeName value: paraStyleNATimeUnit range: NSMakeRange(0, self.timeUnitValue.length)];
    [self.timeUnitValue addAttribute: NSForegroundColorAttributeName value: [Colors TextColor] range: NSMakeRange(0, timeUnitValue.length)];
    [self.timeUnitValue addAttribute: NSFontAttributeName value: [UIFont fontWithName: @"HelveticaNeue-Light" size:50] range: NSMakeRange(0, self.timeUnitValue.length)];
    [self.timeUnitValue addAttribute: NSBackgroundColorAttributeName value: [UIColor clearColor] range: NSMakeRange(0, self.timeUnitValue.length)];
    [self.timeUnitValue drawInRect: CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)];
}//- (void)drawRect:(CGRect)rect 

@end//@implementation NA_Hour
