//
//  NA_WeekUnit.h
//  Awake
//
//  Created by Amrinder Grewal on 2015-02-05.
//  Copyright (c) 2015 Amrinder Grewal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Colors.h"

@interface NA_WeekUnit : UIView

@property UILabel *day;
@property BOOL on;
@property NSLayoutConstraint *YConstraint;
@property NSLayoutConstraint *XConstraint;

-(void) ChangeLabelPlacement;
-(void) SetColorsAndPlacement;

@end//@interface NA_WeekUnit : UIView
