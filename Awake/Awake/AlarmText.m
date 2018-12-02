//
//  AlarmText.m
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-24.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import "AlarmText.h"

@implementation AlarmText

@synthesize hour;
@synthesize minutes;
@synthesize am_pm;

-(id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {
        self.opaque = NO;
    }
    return self;
}//-(id)initWithFrame:(CGRect)frame

- (void)drawRect:(CGRect)rect {
    //getting time
    self.hour = [GetTimeInFormat GetTimeInFormat: TF_HOUR_12_FORMAT];
    self.minutes = [GetTimeInFormat GetTimeInFormat: TF_MINUTE_FORMAT];
    self.am_pm = [GetTimeInFormat GetTimeInFormat:TF_AMPM_FORMAT];
    
    NSMutableAttributedString *time = [[NSMutableAttributedString alloc] initWithString: [NSString stringWithFormat: @"%@:%@", self.hour, self.minutes]];
    
    NSMutableParagraphStyle *paraStyleTime = [[NSMutableParagraphStyle alloc] init];
    paraStyleTime.alignment = NSTextAlignmentLeft;
    
    //drawing time
    [time addAttribute:NSParagraphStyleAttributeName value:paraStyleTime range:NSMakeRange(0, time.length)];
    [time addAttribute:NSForegroundColorAttributeName value:[Colors TextColor] range: NSMakeRange(0, time.length)];
    [time addAttribute:NSFontAttributeName value:[UIFont fontWithName: @"HelveticaNeue-Light" size: 80] range: NSMakeRange(0, time.length)];
    [time addAttribute:NSBackgroundColorAttributeName value:[UIColor clearColor] range: NSMakeRange(0, time.length)];
    [time drawInRect: CGRectMake(rect.origin.x, rect.origin.y-10, rect.size.width-37, rect.size.height+15)];
    
    //drawing am/pm
    NSMutableAttributedString *_am_pm = [[NSMutableAttributedString alloc] initWithString: [NSString stringWithFormat:@"%@", self.am_pm]];
    [_am_pm addAttribute:NSParagraphStyleAttributeName value:paraStyleTime range:NSMakeRange(0, _am_pm.length)];
    [_am_pm addAttribute:NSForegroundColorAttributeName value:[Colors TextColor] range: NSMakeRange(0, _am_pm.length)];
    [_am_pm addAttribute:NSFontAttributeName value:[UIFont fontWithName: @"HelveticaNeue-Light" size: 30] range: NSMakeRange(0, _am_pm.length)];
    [_am_pm addAttribute:NSBackgroundColorAttributeName value:[UIColor clearColor] range: NSMakeRange(0, _am_pm.length)];
    [_am_pm drawInRect: CGRectMake(rect.origin.x + 198, rect.origin.y + 37, rect.size.width-200, rect.size.height/2)];
}//- (void)drawRect:(CGRect)rect

@end//@implementation AlarmText
