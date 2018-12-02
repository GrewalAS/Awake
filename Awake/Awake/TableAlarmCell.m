//
//  TableAlarmCell.m
//  Awake
//
//  Created by Amrinder Grewal on 2014-12-07.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import "TableAlarmCell.h"

@implementation TableAlarmCell

@synthesize indexNumber;
@synthesize weekBased;
@synthesize sun;
@synthesize mon;
@synthesize tues;
@synthesize wed;
@synthesize thurs;
@synthesize fri;
@synthesize sat;
@synthesize holder;

@synthesize on;
@synthesize blurView;
@synthesize timeLabel;
@synthesize sunLabel;
@synthesize monLabel;
@synthesize tuesLabel;
@synthesize wedLabel;
@synthesize thursLabel;
@synthesize friLabel;
@synthesize satLabel;

@synthesize days;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.opaque = NO;
        
        //If blur was not set in here, it does not appear
        //Creating the blur effect
        UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        UIVisualEffectView * viewWithBlurredBackground =[[UIVisualEffectView alloc] initWithEffect:blurEffect];
        //Creating the vibrancy effect
        UIVisualEffectView * viewInducingVibrancy =
        [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        [viewWithBlurredBackground.contentView addSubview: viewInducingVibrancy];
        viewWithBlurredBackground.translatesAutoresizingMaskIntoConstraints = NO;
        [viewWithBlurredBackground addConstraint:[NSLayoutConstraint constraintWithItem: viewInducingVibrancy
                                                                              attribute: NSLayoutAttributeTop
                                                                              relatedBy: NSLayoutRelationEqual
                                                                                 toItem: viewWithBlurredBackground
                                                                              attribute: NSLayoutAttributeTop
                                                                             multiplier: 1.0
                                                                               constant: 0.0]];
        [viewWithBlurredBackground addConstraint:[NSLayoutConstraint constraintWithItem: viewInducingVibrancy
                                                                              attribute: NSLayoutAttributeLeft
                                                                              relatedBy: NSLayoutRelationEqual
                                                                                 toItem: viewWithBlurredBackground
                                                                              attribute: NSLayoutAttributeLeft
                                                                             multiplier: 1.0
                                                                               constant: 0.0]];
        [viewWithBlurredBackground addConstraint:[NSLayoutConstraint constraintWithItem: viewInducingVibrancy
                                                                              attribute: NSLayoutAttributeRight
                                                                              relatedBy: NSLayoutRelationEqual
                                                                                 toItem: viewWithBlurredBackground
                                                                              attribute: NSLayoutAttributeRight
                                                                             multiplier: 1.0
                                                                               constant: 0.0]];
        [viewWithBlurredBackground addConstraint:[NSLayoutConstraint constraintWithItem: viewInducingVibrancy
                                                                              attribute: NSLayoutAttributeBottom
                                                                              relatedBy: NSLayoutRelationEqual
                                                                                 toItem: viewWithBlurredBackground
                                                                              attribute: NSLayoutAttributeBottom
                                                                             multiplier: 1.0
                                                                               constant: 0.0]];
        //Adding the blurred background
        [self.contentView addSubview: viewWithBlurredBackground];
        self.blurView = viewInducingVibrancy;
        self.contentView.backgroundColor = [UIColor clearColor];
        viewInducingVibrancy.layer.cornerRadius = 5.0f;
        viewInducingVibrancy.clipsToBounds = YES;
        viewWithBlurredBackground.layer.cornerRadius = 5.0f;
        viewWithBlurredBackground.clipsToBounds = YES;
        
        //clipsToBounds need to be YES of corner radius will not work
        self.blurView.clipsToBounds = YES;
        //Setting border
        self.blurView.layer.cornerRadius = 5.0f;
        
        //Initializing views
        //On/Off indicator
        self.on = [UIView new];
        self.on.layer.cornerRadius = 10.00f;//To get the diamond shape
        //timeLabel
        self.timeLabel = [self SetUpLabelsWithSize: 18 andUpperCaseText:nil];
        //dayLabels
        if (weekBased) {
            float sizeOfFont = 12.0;
            self.sunLabel = [self SetUpLabelsWithSize: sizeOfFont andUpperCaseText:AH_SUN];
            self.monLabel = [self SetUpLabelsWithSize: sizeOfFont andUpperCaseText:AH_MON];
            self.tuesLabel = [self SetUpLabelsWithSize: sizeOfFont andUpperCaseText:AH_TUES];
            self.wedLabel = [self SetUpLabelsWithSize: sizeOfFont andUpperCaseText:AH_WED];
            self.thursLabel = [self SetUpLabelsWithSize: sizeOfFont andUpperCaseText:AH_THURS];
            self.friLabel = [self SetUpLabelsWithSize: sizeOfFont andUpperCaseText:AH_FRI];
            self.satLabel = [self SetUpLabelsWithSize: sizeOfFont andUpperCaseText:AH_SAT];
            
            self.days = [NSArray arrayWithObjects:
                         self.sunLabel,
                         self.monLabel,
                         self.tuesLabel,
                         self.wedLabel,
                         self.thursLabel,
                         self.friLabel,
                         self.satLabel,
                         nil];
            
            self.daysBool = [NSArray arrayWithObjects:
                             [NSNumber numberWithBool: self.sun],
                             [NSNumber numberWithBool: self.mon],
                             [NSNumber numberWithBool: self.tues],
                             [NSNumber numberWithBool: self.wed],
                             [NSNumber numberWithBool: self.thurs],
                             [NSNumber numberWithBool: self.fri],
                             [NSNumber numberWithBool: self.sat],
                             nil];
        }
        
        //Adding as subview
        [self.contentView addSubview: self.on];
        
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
    }
    return self;
}//- (id)initWithFrame:(CGRect)frame

-(UILabel*) SetUpLabelsWithSize: (double) size andUpperCaseText: (NSString*) text{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size: size];
    label.backgroundColor = [Colors LabelTextColorBackground];
    label.textColor = [Colors TextColor];
    if (text != nil) {
        label.text = [text uppercaseString];
    }
    
    [self.contentView addSubview: label];
    [label sizeToFit];
    return label;
}//-(UILabel*) SetUpLabelsWithSize: (double) size andUpperCaseText: (NSString*) text

-(void) layoutSubviews{
    [super layoutSubviews];
    //On/Off indicator
    self.on.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: self.on
                                                                 attribute: NSLayoutAttributeCenterY
                                                                 relatedBy: NSLayoutRelationEqual
                                                                    toItem: self.blurView
                                                                 attribute: NSLayoutAttributeCenterY
                                                                multiplier: 1.0
                                                                  constant: 0.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: self.on
                                                                 attribute: NSLayoutAttributeRight
                                                                 relatedBy: NSLayoutRelationEqual
                                                                    toItem: self.blurView
                                                                 attribute: NSLayoutAttributeRight
                                                                multiplier: 1.0
                                                                  constant: -8.0]];
    [self.on addConstraint:[NSLayoutConstraint constraintWithItem: self.on
                                                        attribute: NSLayoutAttributeHeight
                                                        relatedBy: NSLayoutRelationEqual
                                                           toItem: nil
                                                        attribute: NSLayoutAttributeNotAnAttribute
                                                       multiplier: 1.0
                                                         constant: 10.0]];
    [self.on addConstraint:[NSLayoutConstraint constraintWithItem: self.on
                                                        attribute: NSLayoutAttributeWidth
                                                        relatedBy: NSLayoutRelationEqual
                                                           toItem: nil
                                                        attribute: NSLayoutAttributeNotAnAttribute
                                                       multiplier: 1.0
                                                         constant: 10.0]];
    //timeLabel
    self.timeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView removeConstraint: self.YCons];
    if (weekBased) {
        self.YCons = [NSLayoutConstraint constraintWithItem: self.timeLabel
                                                  attribute: NSLayoutAttributeTop
                                                  relatedBy: NSLayoutRelationEqual
                                                     toItem: self.blurView
                                                  attribute: NSLayoutAttributeTop
                                                 multiplier: 1.0
                                                   constant: 10.0];
        [self.contentView addConstraint: self.YCons];
    } else{
        self.YCons = [NSLayoutConstraint constraintWithItem: self.timeLabel
                                                  attribute: NSLayoutAttributeCenterY
                                                  relatedBy: NSLayoutRelationEqual
                                                     toItem: self.blurView
                                                  attribute: NSLayoutAttributeCenterY
                                                 multiplier: 1.0
                                                   constant: 0.0];
        [self.contentView addConstraint: self.YCons];
    }
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: self.timeLabel
                                                                 attribute: NSLayoutAttributeLeft
                                                                 relatedBy: NSLayoutRelationEqual
                                                                    toItem: self.blurView
                                                                 attribute: NSLayoutAttributeLeft
                                                                multiplier: 1.0
                                                                  constant: 10.0]];
    
    //Day Labels
    if (weekBased) {
        //Need to happen here cause when init is called, weekBased isn't set
        float sizeOfFont = 8.0;
        self.sunLabel = [self SetUpLabelsWithSize: sizeOfFont andUpperCaseText:AH_SUN];
        self.monLabel = [self SetUpLabelsWithSize: sizeOfFont andUpperCaseText:AH_MON];
        self.tuesLabel = [self SetUpLabelsWithSize: sizeOfFont andUpperCaseText:AH_TUES];
        self.wedLabel = [self SetUpLabelsWithSize: sizeOfFont andUpperCaseText:AH_WED];
        self.thursLabel = [self SetUpLabelsWithSize: sizeOfFont andUpperCaseText:AH_THURS];
        self.friLabel = [self SetUpLabelsWithSize: sizeOfFont andUpperCaseText:AH_FRI];
        self.satLabel = [self SetUpLabelsWithSize: sizeOfFont andUpperCaseText:AH_SAT];
        
        self.days = [NSArray arrayWithObjects:
                     self.sunLabel,
                     self.monLabel,
                     self.tuesLabel,
                     self.wedLabel,
                     self.thursLabel,
                     self.friLabel,
                     self.satLabel,
                     nil];
        
        self.daysBool = [NSArray arrayWithObjects:
                         [NSNumber numberWithBool: self.sun],
                         [NSNumber numberWithBool: self.mon],
                         [NSNumber numberWithBool: self.tues],
                         [NSNumber numberWithBool: self.wed],
                         [NSNumber numberWithBool: self.thurs],
                         [NSNumber numberWithBool: self.fri],
                         [NSNumber numberWithBool: self.sat],
                         nil];
        //CenterY constraints
        for (UILabel *label in self.days) {
            [self LayoutCenterYConstraintForDaysWithLabel: label];
            [self UpdateDayLabelColors: label];
        }
        
        for (UILabel *label in self.days) {
            label.translatesAutoresizingMaskIntoConstraints = NO;
        }
        double halfSapceBetweenDays = 2.5;
        [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: self.sunLabel
                                                                      attribute: NSLayoutAttributeLeft
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: self.blurView
                                                                      attribute: NSLayoutAttributeLeft
                                                                     multiplier: 1.0
                                                                       constant: 10.0]];
        [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: self.monLabel
                                                                      attribute: NSLayoutAttributeLeft
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: self.sunLabel
                                                                      attribute: NSLayoutAttributeRight
                                                                     multiplier: 1.0
                                                                       constant: halfSapceBetweenDays]];
        [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: self.tuesLabel
                                                                      attribute: NSLayoutAttributeLeft
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: self.monLabel
                                                                      attribute: NSLayoutAttributeRight
                                                                     multiplier: 1.0
                                                                       constant: halfSapceBetweenDays]];
        [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: self.wedLabel
                                                                      attribute: NSLayoutAttributeLeft
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: self.tuesLabel
                                                                      attribute: NSLayoutAttributeRight
                                                                     multiplier: 1.0
                                                                       constant: halfSapceBetweenDays]];
        [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: self.thursLabel
                                                                      attribute: NSLayoutAttributeLeft
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: self.wedLabel
                                                                      attribute: NSLayoutAttributeRight
                                                                     multiplier: 1.0
                                                                       constant: halfSapceBetweenDays]];
        [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: self.friLabel
                                                                      attribute: NSLayoutAttributeLeft
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: self.thursLabel
                                                                      attribute: NSLayoutAttributeRight
                                                                     multiplier: 1.0
                                                                       constant: halfSapceBetweenDays]];
        [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: self.satLabel
                                                                      attribute: NSLayoutAttributeLeft
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: self.friLabel
                                                                      attribute: NSLayoutAttributeRight
                                                                     multiplier: 1.0
                                                                       constant: halfSapceBetweenDays]];
    } else{
        for (UIView *label in self.days) {
            [label removeFromSuperview];
        }
    }
    
    
    //Placing blurView
    self.blurView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: self.blurView
                                                                 attribute: NSLayoutAttributeTop
                                                                 relatedBy: NSLayoutRelationEqual
                                                                    toItem: self.contentView
                                                                 attribute: NSLayoutAttributeTop
                                                                multiplier: 1.0
                                                                  constant: 5.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: self.blurView
                                                                 attribute: NSLayoutAttributeBottom
                                                                 relatedBy: NSLayoutRelationEqual
                                                                    toItem: self.contentView
                                                                 attribute: NSLayoutAttributeBottom
                                                                multiplier: 1.0
                                                                  constant: -5.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: self.blurView
                                                                 attribute: NSLayoutAttributeLeft
                                                                 relatedBy: NSLayoutRelationEqual
                                                                    toItem: self.contentView
                                                                 attribute: NSLayoutAttributeLeft
                                                                multiplier: 1.0
                                                                  constant: 15.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: self.blurView
                                                                 attribute: NSLayoutAttributeRight
                                                                 relatedBy: NSLayoutRelationEqual
                                                                    toItem: self.contentView
                                                                 attribute: NSLayoutAttributeRight
                                                                multiplier: 1.0
                                                                  constant: 0.0]];
}//-(void) layoutSubviews

-(void) LayoutCenterYConstraintForDaysWithLabel: (UILabel*) label{
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: label
                                                                 attribute: NSLayoutAttributeBottom
                                                                 relatedBy: NSLayoutRelationEqual
                                                                    toItem: self.blurView
                                                                 attribute: NSLayoutAttributeBottom
                                                                multiplier: 1.0
                                                                  constant: -10.0]];
}

-(void) ChangeStateWithGR:(UILongPressGestureRecognizer*) GR{
    if (GR.state == UIGestureRecognizerStateBegan) {
        if (self.holder.on == NO) {
            self.holder.on = YES;
            self.on.backgroundColor = [Colors OnIndicator];
            self.timeLabel.textColor = [Colors ActiveAlarmText];
            
            for (UILabel *label in self.days) {
                [self UpdateDayLabelColors: label];
            }
            
            [self.timeLabel setNeedsDisplay];
            [self.on setNeedsDisplay];
        }else{
            self.holder.on = NO;
            self.on.backgroundColor = [Colors OffIndicator];
            self.timeLabel.textColor = [Colors InactiveAlarmText];
            
            for (UILabel *label in self.days) {
                label.textColor = [Colors InactiveAlarmText];
            }
            
            [self.timeLabel setNeedsDisplay];
            [self.on setNeedsDisplay];
        }
    }
}//-(void) ChangeStateWithGR:(UILongPressGestureRecognizer*) GR

-(void) UpdateDayLabelColors: (UILabel*) label{
    long index = [days indexOfObject: label];
    if ([[self.daysBool objectAtIndex: index] boolValue]) {
        label.textColor = [Colors ActiveAlarmText];
    } else{
        label.textColor = [Colors InactiveAlarmText];
    }
}//-(void) UpdateDayLabelColors: (UILabel*) label

@end
