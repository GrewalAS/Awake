//
//  Colors.h
//  Awake
//
//  Created by Amrinder Grewal on 2014-11-24.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "gradient.h"

@interface Colors : NSObject

+(UIColor*) TextColor;
+(UIColor*) BorderColor;
+(UIColor*) SymbolColor;
+(gradientStruct) GradientColorWithHour: (int) minute;
+(UIColor*) HomeBackgroundDarkColor;
+(UIColor*) MainLabelTextColor;
+(UIColor*) LabelTextColorBackground;
+(UIColor*) ActiveAlarmText;
+(UIColor*) InactiveAlarmText;
+(UIColor*) DeleteIconBackGround;
+(UIColor*) DeleteIconBorder;
+(UIColor*) OnIndicator;
+(UIColor*) OffIndicator;

+(CGFloat) AlphaOfActiveImage;
+(CGFloat) AlphaOfInActiveImage;

@end//@interface Colors : NSObject
