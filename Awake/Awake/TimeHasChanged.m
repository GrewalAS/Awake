//
//  TimeHasChanged.m
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-21.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import "TimeHasChanged.h"

@implementation TimeHasChanged

@synthesize secondsLeft;
@synthesize timer;
@synthesize alarmText;
@synthesize background;
@synthesize secondsBar;

- (id) init{
    if (self = [super init]) {
        [self SetUpTimer];
    }
    return self;
}//- (id) init

- (void) SetUpTimer{
    NSTimer* _timer;
    self.secondsLeft = 1.0;
    _timer = [NSTimer scheduledTimerWithTimeInterval: self.secondsLeft
                                              target: self
                                            selector: @selector(TimeHasChanged)
                                            userInfo: nil
                                             repeats: NO];
    self.timer = _timer;
}//- (void) SetUpTimer

- (void) TimeHasChanged{
    [self.background setNeedsDisplay];
    [self.alarmText setNeedsDisplay];
    [self.secondsBar AnimateGradient];
    [self SetUpTimer];
}//- (void) TimeHasChanged

@end//@implementation TimeHasChanged
