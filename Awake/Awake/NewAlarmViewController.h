//
//  NewAlarmViewController.h
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-28.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AlarmHolder.h"
#import "GetTimeInFormat.h"
#import "Colors.h"

#import "NA_CancelSign.h"
#import "NA_ConfirmSign.h"
#import "NA_TimeUnit.h"
#import "NA_WeekUnit.h"

@class NewAlarmViewController;

@protocol NewAlarmViewController <NSObject>

-(void) Cancel;
-(void) Confirm;
-(void) ConfirmWithIndex: (NSUInteger) index;
-(void) SaveAndNotifications;

@end//@protocol NewAlarmViewController <NSObject>

@interface NewAlarmViewController : UIViewController <UIGestureRecognizerDelegate>

-(void) SwitchDayStatus: (UITapGestureRecognizer*) recognizer;

@property NSUInteger index;
@property NSString *alarmHour;
@property NSString *alarmMinute;
@property NSString *alarmAmpm;

@property UIView *timeBlock;
@property UIView *weekBlock;
@property UISlider *hourSlider;
@property UISlider *minuteSlider;
@property UISlider *ampmSlider;

@property NA_CancelSign *cancelSign;
@property NA_ConfirmSign *confirmSign;
@property NA_TimeUnit *hour;
@property NA_TimeUnit *minute;
@property NA_TimeUnit *ampm;

@property NA_WeekUnit* sun;
@property NA_WeekUnit* mon;
@property NA_WeekUnit* tues;
@property NA_WeekUnit* wed;
@property NA_WeekUnit* thurs;
@property NA_WeekUnit* fri;
@property NA_WeekUnit* sat;

@property UITapGestureRecognizer *sunGR;
@property UITapGestureRecognizer *monGR;
@property UITapGestureRecognizer *tuesGR;
@property UITapGestureRecognizer *wedGR;
@property UITapGestureRecognizer *thursGR;
@property UITapGestureRecognizer *friGR;
@property UITapGestureRecognizer *satGR;

@property id delegate;

@end//@interface NewAlarmViewController : UIViewController <TouchSensitiveSeriesViewController>
