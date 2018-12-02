//
//  TableAlarmCell.h
//  Awake
//
//  Created by Amrinder Grewal on 2014-12-07.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "Colors.h"
#import "AlarmHolder.h"
#import "GetTimeInFormat.h"
#import "SWTableViewCell.h"
#import "Colors.h"

@interface TableAlarmCell : SWTableViewCell

-(void) ChangeStateWithGR:(UILongPressGestureRecognizer*) GR;
-(void) LayoutCenterYConstraintForDaysWithLabel: (UILabel*) label;
-(void) UpdateDayLabelColors: (UILabel*) label;

@property long long indexNumber;
@property BOOL weekBased;
@property BOOL sun;
@property BOOL mon;
@property BOOL tues;
@property BOOL wed;
@property BOOL thurs;
@property BOOL fri;
@property BOOL sat;
@property AlarmHolder* holder;

@property NSLayoutConstraint *YCons;
@property UIView* on;
@property UIView* blurView;

@property UILabel* timeLabel;
@property UILabel *sunLabel;
@property UILabel *monLabel;
@property UILabel *tuesLabel;
@property UILabel *wedLabel;
@property UILabel *thursLabel;
@property UILabel *friLabel;
@property UILabel *satLabel;

@property NSArray *daysBool;
@property NSArray *days;

@end//@interface TableAlarmCell : SWTableViewCell
