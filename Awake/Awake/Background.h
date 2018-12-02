//
//  Background.h
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-08.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "GetTimeInFormat.h"
#import "Colors.h"

@interface Background : UIView

@property NSNumber* hour;
@property CGGradientRef grad;

-(void) CreateGradientWithNumber: (size_t) _number atLocations: (CGFloat*) _location withColors: (CGFloat*) _colors;

@end//@interface Background : UIView
