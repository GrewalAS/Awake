//
//  TimeHasChanged.h
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-21.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AlarmText.h"
#import "GetTimeInFormat.h"
#import "Background.h"
#import "SecondsBar.h"

//The class methods will be called after the timer has run to change the time onscreen

@interface TimeHasChanged : NSObject

@property int secondsLeft;
@property NSTimer* timer;
@property AlarmText* alarmText;
@property Background* background;
@property SecondsBar* secondsBar;

- (id) init;
- (void) SetUpTimer;
- (void) TimeHasChanged;

@end//@interface TimeHasChanged : NSObject
