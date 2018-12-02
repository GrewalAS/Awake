//
//  AlarmStyleButtons.m
//  Awake
//
//  Created by Amrinder Grewal on 2015-02-10.
//  Copyright (c) 2015 Amrinder Grewal. All rights reserved.
//

#import "AlarmStyleButtons.h"

@implementation AlarmStyleButtons

@synthesize imageName;

-(id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {
        self.opaque = NO;
        self.layer.borderColor = [[Colors BorderColor] CGColor];
        self.layer.borderWidth = 2;
        self.layer.cornerRadius = 45/2;
        self.userInteractionEnabled = YES;
    }
    return self;
}//-(id)initWithFrame:(CGRect)frame

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //Creating image
    UIImage *image = [UIImage imageNamed:self.imageName];
    self.imageView = [[UIImageView alloc] initWithImage: image];
    [self addSubview:self.imageView];
    
    //Placing image
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.imageView
                                                     attribute: NSLayoutAttributeCenterX
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeCenterX
                                                    multiplier: 1.0
                                                      constant: 0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.imageView
                                                     attribute: NSLayoutAttributeCenterY
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeCenterY
                                                    multiplier: 1.0
                                                      constant: 0.0]];
    
    if ([self.imageName isEqualToString: @"not-available"]) {
        self.alpha = [Colors AlphaOfInActiveImage];
    }
}//- (void)drawRect:(CGRect)rect 

@end//@implementation AlarmStyleButtons
