//
//  SecondsBar.m
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-25.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import "SecondsBar.h"

@implementation SecondsBar

@synthesize direction;//(+1) is right, (-1) is left
@synthesize originalFrame;
@synthesize animatedFrame;
@synthesize rotationAngle;
@synthesize gradientView;

-(id) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {
        self.opaque = NO;
    }
    return self;
}//-(id)initWithFrame:(CGRect)frame

-(void) drawRect:(CGRect)rect {
    //Creating the rect under the AlarmText
    UIBezierPath *backRect = [UIBezierPath bezierPathWithRect: rect];
    [[UIColor clearColor] setFill];
    [backRect fill];

    //Creating the gradient
    self.gradientView = [SecondsBarGradient new];
    self.originalFrame = CGRectMake(0 , 0, 10, 5);
    self.gradientView.frame = self.originalFrame;
    [self addSubview: self.gradientView];
    
    //Setting direction
    self.direction = 1;//Going right
    
    //Animating the gradient
    self.animatedFrame = CGRectMake(self.bounds.size.width-10 , 0, 10, 5);
    self.rotationAngle = M_PI;
    [self AnimateGradient];
}//- (void)drawRect:(CGRect)rect

-(void) AnimateGradient{
    if (self.direction == 1) {
        if (self.gradientView) {
            [UIView animateWithDuration:1.0
                             animations:^{
                                 CGRect newFrame = self.animatedFrame;
                                 self.gradientView.frame = newFrame;
                             }
                             completion:^(BOOL finished) {
                                 self.gradientView.transform = CGAffineTransformRotate(self.gradientView.transform, self.rotationAngle);
                             }];
        };
        self.direction = -1;
    } else{
        if (self.gradientView) {
            [UIView animateWithDuration:1.0
                             animations:^{
                                 self.gradientView.frame = self.originalFrame;
                             }
                             completion:^(BOOL finished) {
                                 self.gradientView.transform = CGAffineTransformRotate(self.gradientView.transform, self.rotationAngle);
                             }];
        }
        self.direction = +1;
    }
}//-(void) AnimateGradient

@end//@implementation SecondsBar
