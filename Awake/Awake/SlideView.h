//
//  SlideView.h
//  Awake
//
//  Created by Amrinder Grewal on 2015-03-06.
//  Copyright (c) 2015 Amrinder Grewal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Colors.h"

@interface SlideView : UIView

@property UILabel *twoMinsLabel;
@property UIImageView *pointDownTriangle;
@property UIView *topLine;
@property UILabel *upLabel;
@property UIImageView *pointUpTriangle;
@property UIView *bottomLine;

-(void) handlePan:(UIPanGestureRecognizer*) gesture;

@end
