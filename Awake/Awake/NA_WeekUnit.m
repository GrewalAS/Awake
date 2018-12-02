//
//  NA_WeekUnit.m
//  Awake
//
//  Created by Amrinder Grewal on 2015-02-05.
//  Copyright (c) 2015 Amrinder Grewal. All rights reserved.
//

#import "NA_WeekUnit.h"

@implementation NA_WeekUnit

@synthesize day;
@synthesize on;
@synthesize YConstraint;
@synthesize XConstraint;

-(id) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [[Colors BorderColor] CGColor];
        self.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self SetUpLabel];
    }
    
    return self;
}//-(id) initWithFrame:(CGRect)frame


/*- (void)drawRect:(CGRect)rect {
    [self SetUpLabel];
}*////*- (void)drawRect:(CGRect)rect

-(void) SetUpLabel{
    //Setting up self
    self.backgroundColor = [UIColor clearColor];
    
    //Setting up day
    self.day = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, 5, 5)];
    self.day.font = [UIFont fontWithName:@"HelveticaNeue-Light" size: 11.5];
    [self addSubview:self.day];
    
    self.day.translatesAutoresizingMaskIntoConstraints = NO;
    //Y placed here because it does not change
    XConstraint = [NSLayoutConstraint constraintWithItem: self.day
                                               attribute: NSLayoutAttributeCenterX
                                               relatedBy: NSLayoutRelationEqual
                                                  toItem: self
                                               attribute: NSLayoutAttributeCenterX
                                              multiplier: 1.0
                                                constant: 0.0];
    [self addConstraint: XConstraint];
    if (self.on) {
        self.day.textColor = [Colors ActiveAlarmText];
        //X placed here because it changes depending on if its on or not
        YConstraint = [NSLayoutConstraint constraintWithItem: self.day
                                                   attribute: NSLayoutAttributeCenterY
                                                   relatedBy: NSLayoutRelationEqual
                                                      toItem: self
                                                   attribute: NSLayoutAttributeCenterY
                                                  multiplier: 1.0
                                                    constant: -2.5];
        [self addConstraint: YConstraint];
    } else{
        self.day.textColor = [Colors InactiveAlarmText];
        //X placed here because it changes depending on if its on or not
        YConstraint = [NSLayoutConstraint constraintWithItem: self.day
                                                   attribute: NSLayoutAttributeCenterY
                                                   relatedBy: NSLayoutRelationEqual
                                                      toItem: self
                                                   attribute: NSLayoutAttributeCenterY
                                                  multiplier: 1.0
                                                    constant: 2.6];
        [self addConstraint: YConstraint];
    }
    [self.day sizeToFit];
}//-(void) SetUpLabel

-(void) ChangeLabelPlacement{
    if (!self.on) {
        self.on = YES;
        [self SetColorsAndPlacement];
    } else{
        self.on = NO;
        [self SetColorsAndPlacement];
    }
}//-(void) ChangeLabelPlacement

-(void) SetColorsAndPlacement{
    if (self.on) {
        self.day.textColor = [Colors ActiveAlarmText];
        [UIView animateWithDuration:0.2
                         animations:^{
                             CGAffineTransform tranform = CGAffineTransformMakeTranslation(0, -5.0);
                             self.day.transform = tranform;
                         } completion:^(BOOL finished) {
                         }];
    } else{
        self.day.textColor = [Colors InactiveAlarmText];
        [UIView animateWithDuration:0.2
                         animations:^{
                             CGAffineTransform tranform = CGAffineTransformMakeTranslation(0, 0);
                             self.day.transform = tranform;
                         } completion:^(BOOL finished) {
                         }];
    }
}//-(void) SetColorsAndPlacement

@end//@implementation NA_WeekUnit
