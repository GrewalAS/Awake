//
//  AlarmStyleButtonsHolder.h
//  Awake
//
//  Created by Amrinder Grewal on 2015-02-10.
//  Copyright (c) 2015 Amrinder Grewal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import "AlarmStyleButtons.h"
#import "Colors.h"

@class AlarmStyleButtonsHolder;

@protocol AlarmStyleButtonsHolder <NSObject>

@required
-(void) SetUpForAlarmStyleButtonsHolder;

@end//@protocol AlarmStyleButtonsHolder <NSObject>

@interface AlarmStyleButtonsHolder : UIView

-(void) DeactivateAll;
-(void) DeactivateAllExpect: (AlarmStyleButtons*) button;

@property UILabel *header;
@property AlarmStyleButtons *swipe;
@property AlarmStyleButtons *shake;
@property AlarmStyleButtons *walk;

@property id delegate;

@end//@interface AlarmStyleButtonsHolder : UIView
