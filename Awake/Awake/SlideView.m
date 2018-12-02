//
//  SlideView.m
//  Awake
//
//  Created by Amrinder Grewal on 2015-03-06.
//  Copyright (c) 2015 Amrinder Grewal. All rights reserved.
//

#import "SlideView.h"

@implementation SlideView

@synthesize twoMinsLabel;
@synthesize pointDownTriangle;
@synthesize topLine;
@synthesize upLabel;
@synthesize pointUpTriangle;
@synthesize bottomLine;

-(id) init{
    if (self = [super init]) {
        self.opaque = YES;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void) drawRect:(CGRect)rect{
    //Creating the twoMinsLabel
    self.twoMinsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    self.twoMinsLabel.textColor = [Colors ActiveAlarmText];
    self.twoMinsLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size: 12.5];
    self.twoMinsLabel.text = @"Give me two mins";
    [self.twoMinsLabel sizeToFit];
    [self addSubview:self.twoMinsLabel];
    //Placing the twoMinsLabel
    self.twoMinsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.twoMinsLabel
                                                     attribute: NSLayoutAttributeTop
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeTop
                                                    multiplier: 1.0
                                                      constant: 5.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.twoMinsLabel
                                                     attribute: NSLayoutAttributeCenterX
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeCenterX
                                                    multiplier: 1.0
                                                      constant: 0.0]];
    
    //Creating the triangle pointing down
    //Creating image
    UIImage *image = [UIImage imageNamed:@"triangle"];
    self.pointDownTriangle = [[UIImageView alloc] initWithImage: image];
    self.pointDownTriangle.transform = CGAffineTransformRotate(self.pointDownTriangle.transform, M_PI);//Flipping it upside down
    self.pointDownTriangle.alpha = 0.50;
    [self addSubview:self.pointDownTriangle];
    
    //Placing image
    self.pointDownTriangle.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.pointDownTriangle
                                                     attribute: NSLayoutAttributeCenterX
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self.twoMinsLabel
                                                     attribute: NSLayoutAttributeCenterX
                                                    multiplier: 1.0
                                                      constant: 0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.pointDownTriangle
                                                     attribute: NSLayoutAttributeTop
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self.twoMinsLabel
                                                     attribute: NSLayoutAttributeBottom
                                                    multiplier: 1.0
                                                      constant: 5.0]];
    
    //Creating the line
    self.topLine = [[UIView alloc] init];
    self.topLine.frame = CGRectMake(0, 0, self.frame.size.width, 20);
    self.topLine.backgroundColor = [Colors ActiveAlarmText];
    [self addSubview: self.topLine];
    //Positioning the line;
    self.topLine.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.topLine
                                                     attribute: NSLayoutAttributeCenterX
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeCenterX
                                                    multiplier: 1.0
                                                      constant: 0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.topLine
                                                     attribute: NSLayoutAttributeTop
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self.pointDownTriangle
                                                     attribute: NSLayoutAttributeBottom
                                                    multiplier: 1.0
                                                      constant: 5.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.topLine
                                                     attribute: NSLayoutAttributeWidth
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: nil
                                                     attribute: NSLayoutAttributeNotAnAttribute
                                                    multiplier: 1.0
                                                      constant: self.frame.size.width]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.topLine
                                                     attribute: NSLayoutAttributeHeight
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: nil
                                                     attribute: NSLayoutAttributeNotAnAttribute
                                                    multiplier: 1.0
                                                      constant: 1.0]];
    
    //Creating the upLabel
    self.upLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    self.upLabel.textColor = [Colors ActiveAlarmText];
    self.upLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size: 12.5];
    self.upLabel.text = @"I'm up!";
    [self.upLabel sizeToFit];
    [self addSubview:self.upLabel];
    //Placing the twoMinsLabel
    self.upLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.upLabel
                                                     attribute: NSLayoutAttributeBottom
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeBottom
                                                    multiplier: 1.0
                                                      constant: -5.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.upLabel
                                                     attribute: NSLayoutAttributeCenterX
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeCenterX
                                                    multiplier: 1.0
                                                      constant: 0.0]];
    
    //Creating the triangle pointing up
    //Creating image
    UIImage *upImage = [UIImage imageNamed:@"triangle"];
    self.pointUpTriangle = [[UIImageView alloc] initWithImage: upImage];
    //self.pointUpTriangle.transform = CGAffineTransformRotate(self.pointUpTriangle.transform, M_PI);
    self.pointUpTriangle.alpha = 0.50;
    [self addSubview:self.pointUpTriangle];
    
    //Placing image
    self.pointUpTriangle.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.pointUpTriangle
                                                     attribute: NSLayoutAttributeCenterX
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self.upLabel
                                                     attribute: NSLayoutAttributeCenterX
                                                    multiplier: 1.0
                                                      constant: 0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.pointUpTriangle
                                                     attribute: NSLayoutAttributeBottom
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self.upLabel
                                                     attribute: NSLayoutAttributeTop
                                                    multiplier: 1.0
                                                      constant: -5.0]];
    
    //Creating the bottom line
    self.bottomLine = [[UIView alloc] init];
    self.bottomLine.frame = CGRectMake(0, 0, self.frame.size.width, 20);
    self.bottomLine.backgroundColor = [Colors ActiveAlarmText];
    [self addSubview: self.bottomLine];
    //Positioning the bottom line;
    self.bottomLine.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.bottomLine
                                                     attribute: NSLayoutAttributeCenterX
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeCenterX
                                                    multiplier: 1.0
                                                      constant: 0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.bottomLine
                                                     attribute: NSLayoutAttributeBottom
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self.pointUpTriangle
                                                     attribute: NSLayoutAttributeTop
                                                    multiplier: 1.0
                                                      constant: -5.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.bottomLine
                                                     attribute: NSLayoutAttributeWidth
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: nil
                                                     attribute: NSLayoutAttributeNotAnAttribute
                                                    multiplier: 1.0
                                                      constant: self.frame.size.width]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.bottomLine
                                                     attribute: NSLayoutAttributeHeight
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: nil
                                                     attribute: NSLayoutAttributeNotAnAttribute
                                                    multiplier: 1.0
                                                      constant: 1.0]];
}//-(void) drawRect:(CGRect)rect

-(void) handlePan:(UIPanGestureRecognizer *)gesture{
    
}//-(void) handlePan:(UIPanGestureRecognizer *)gesture

@end
