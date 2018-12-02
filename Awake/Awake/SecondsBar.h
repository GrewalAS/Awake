//
//  SecondsBar.h
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-25.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SecondsBarGradient.h"
#import "Colors.h"

@interface SecondsBar : UIView

@property int direction;//(+1) is right, (-1) is left
@property CGRect originalFrame;
@property CGRect animatedFrame;
@property CGFloat rotationAngle;
@property SecondsBarGradient *gradientView;

-(void) AnimateGradient;

@end//@interface SecondsBar : UIView
