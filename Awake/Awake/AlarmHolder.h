//
//  AlarmHolder.h
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-08.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseEvent.h"

#define AH_ON @"on"
#define AH_SUN @"sun"
#define AH_MON @"mon"
#define AH_TUES @"tues"
#define AH_WED @"wed"
#define AH_THURS @"thurs"
#define AH_FRI @"fri"
#define AH_SAT @"sat"

@interface AlarmHolder : BaseEvent <NSCoding>

@property BOOL on;
//@property BOOL wakeUp;
@property BOOL tempOn;

@property BOOL sun;
@property BOOL mon;
@property BOOL tues;
@property BOOL wed;
@property BOOL thurs;
@property BOOL fri;
@property BOOL sat;

-(id) init;
-(id) initWithHour:(int) _hour andMinute:(int) _minute withAMPM:(NSString*) _ampm withAlarmOn:(BOOL) _on;
-(id) initWithHour:(int) _hour andMinute:(int) _minute;
-(int) Return24Hour;
-(long long) ReturnInMinutes;
-(BOOL) WeekBased;
-(BOOL) ActiveOnThisDay:(NSString*) day;

@end//@interface AlarmHolder : RepeatingEvent <NSCoding>
