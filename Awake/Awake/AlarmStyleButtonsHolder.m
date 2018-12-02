//
//  AlarmStyleButtonsHolder.m
//  Awake
//
//  Created by Amrinder Grewal on 2015-02-10.
//  Copyright (c) 2015 Amrinder Grewal. All rights reserved.
//

#import "AlarmStyleButtonsHolder.h"

@implementation AlarmStyleButtonsHolder

@synthesize header;
@synthesize swipe;
@synthesize shake;
@synthesize walk;

@synthesize delegate;

-(id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {
        self.opaque = NO;
        self.userInteractionEnabled = YES;
    }
    return self;
}//-(id)initWithFrame:(CGRect)frame

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //Creating the header
    self.header = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    self.header.textColor = [Colors ActiveAlarmText];
    self.header.font = [UIFont fontWithName:@"HelveticaNeue-Light" size: 17.5];
    self.header.text = @"Alarm Style";
    [self.header sizeToFit];
    [self addSubview:self.header];
    //Placing the header
    self.header.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.header
                                                     attribute: NSLayoutAttributeLeft
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeLeft
                                                    multiplier: 1.0
                                                      constant: 20.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.header
                                                     attribute: NSLayoutAttributeCenterY
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeCenterY
                                                    multiplier: 1.0
                                                      constant: 0.0]];
    
    //Creating AlarmStyleButtons for walk
    self.walk = [[AlarmStyleButtons alloc] init];
    if ([CMPedometer isStepCountingAvailable]) {
        self.walk.imageName = @"walk-icon";
    } else{
        self.walk.imageName = @"not-available";
    }
    [self addSubview: self.walk];
    //Placing AlarmStyleButtons for walk
    self.walk.frame = CGRectMake(0, 0, 5, 5);
    self.walk.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.walk
                                                     attribute: NSLayoutAttributeRight
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeRight
                                                    multiplier: 1.0
                                                      constant: -20.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.walk
                                                     attribute: NSLayoutAttributeCenterY
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeCenterY
                                                    multiplier: 1.0
                                                      constant: 0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.walk
                                                     attribute: NSLayoutAttributeHeight
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: nil
                                                     attribute: NSLayoutAttributeNotAnAttribute
                                                    multiplier: 1.0
                                                      constant: 45]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.walk
                                                     attribute: NSLayoutAttributeWidth
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: nil
                                                     attribute: NSLayoutAttributeNotAnAttribute
                                                    multiplier: 1.0
                                                      constant: 45]];
    
    //Creating AlarmStyleButtons for shake
    self.shake = [[AlarmStyleButtons alloc] init];
    self.shake.imageName = @"shake-icon";
    [self addSubview: self.shake];
    //Placing AlarmStyleButtons for shake
    self.shake.frame = CGRectMake(0, 0, 5, 5);
    self.shake.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.shake
                                                     attribute: NSLayoutAttributeRight
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self.walk
                                                     attribute: NSLayoutAttributeLeft
                                                    multiplier: 1.0
                                                      constant: -5.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.shake
                                                     attribute: NSLayoutAttributeCenterY
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeCenterY
                                                    multiplier: 1.0
                                                      constant: 0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.shake
                                                     attribute: NSLayoutAttributeHeight
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: nil
                                                     attribute: NSLayoutAttributeNotAnAttribute
                                                    multiplier: 1.0
                                                      constant: 45]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.shake
                                                     attribute: NSLayoutAttributeWidth
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: nil
                                                     attribute: NSLayoutAttributeNotAnAttribute
                                                    multiplier: 1.0
                                                      constant: 45]];
    
    //Creating AlarmStyleButtons for swipe
    self.swipe = [[AlarmStyleButtons alloc] init];
    self.swipe.imageName = @"swipe-icon";
    [self addSubview: self.swipe];
    //Placing AlarmStyleButtons for swipe
    self.swipe.frame = CGRectMake(0, 0, 5, 5);
    self.swipe.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.swipe
                                                     attribute: NSLayoutAttributeRight
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self.shake
                                                     attribute: NSLayoutAttributeLeft
                                                    multiplier: 1.0
                                                      constant: -5.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.swipe
                                                     attribute: NSLayoutAttributeCenterY
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeCenterY
                                                    multiplier: 1.0
                                                      constant: 0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.swipe
                                                     attribute: NSLayoutAttributeHeight
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: nil
                                                     attribute: NSLayoutAttributeNotAnAttribute
                                                    multiplier: 1.0
                                                      constant: 45]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.swipe
                                                     attribute: NSLayoutAttributeWidth
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: nil
                                                     attribute: NSLayoutAttributeNotAnAttribute
                                                    multiplier: 1.0
                                                      constant: 45]];
    [self DeactivateAll];
    [self.delegate SetUpForAlarmStyleButtonsHolder];
}//- (void)drawRect:(CGRect)rect

-(void) DeactivateAll{
    self.swipe.alpha = [Colors AlphaOfInActiveImage];
    self.shake.alpha = [Colors AlphaOfInActiveImage];
    self.walk.alpha = [Colors AlphaOfInActiveImage];
}//-(void) DeactivateAll

-(void) DeactivateAllExpect: (AlarmStyleButtons*) button{
    [self DeactivateAll];
    
    button.alpha = [Colors AlphaOfActiveImage];
}//-(void) DeactivateAllExpect: (AlarmStyleButtons*) button

@end//@implementation AlarmStyleButtonsHolder
