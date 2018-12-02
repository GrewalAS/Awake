//
//  SettingsSign.m
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-21.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import "SettingsSign.h"

@implementation SettingsSign

@synthesize settingsViewControllerCons;
@synthesize settingsViewControllerPanCons;
@synthesize originalFrame;
@synthesize originalGestureFrame;
@synthesize originalCenter;
@synthesize openOnRelease;
@synthesize closeOnRelease;
@synthesize settingsViewController;
@synthesize delegate;

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame: frame]) {
        self.opaque = NO;
    }
    return self;
}//-(id)initWithFrame:(CGRect)frame

- (void)drawRect:(CGRect)rect {
    UIImage *settingsSign = [UIImage imageNamed: @"settings-sign"];
    UIImageView *settingsSignView = [[UIImageView alloc] initWithImage: settingsSign];
    [self addSubview: settingsSignView];
    
    settingsSignView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem: settingsSignView
                                                     attribute: NSLayoutAttributeCenterX
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeCenterX
                                                    multiplier: 1.0
                                                      constant: 0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: settingsSignView
                                                     attribute: NSLayoutAttributeTop
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeTop
                                                    multiplier: 1.0
                                                      constant: -5.0]];
    self.originalFrame = self.frame;
}//- (void)drawRect:(CGRect)rect

-(BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer{
    CGPoint translation = [gestureRecognizer translationInView:[self superview]];
    //Vertical translation
    if (fabs(translation.y) > fabs(translation.x)){
        return YES;
    }else {
        return NO;
    }
}//-(BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer

//Gesture recognizer delegate methods
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    // return
    return true;
}//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizers

-(void) handlePan:(UIPanGestureRecognizer*) gesture{
    CGRect openFrame = self.originalFrame;
    openFrame.origin.y = 50;
    if (gesture.state == UIGestureRecognizerStateBegan) {
        //If it just started, record the location so it can come back to it later if the gesture is cancelled
        self.originalCenter = self.center;
        self.originalGestureFrame = self.frame;
        [self.delegate ChangeConsForPan];
    }
    
    if (gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gesture translationInView:self.superview];
        self.center = CGPointMake(self.originalCenter.x, self.originalCenter.y + translation.y);
        CGRect VCFrame = self.settingsViewController.view.frame;
        VCFrame.origin.y = (self.frame.origin.y + self.frame.size.height);
        self.settingsViewController.view.frame = VCFrame;
        [self.settingsViewController.view setNeedsDisplay];
        if ((fabs(translation.y) > self.superview.frame.size.height/5) && (translation.y < 0)) {
            self.closeOnRelease = NO;
            self.openOnRelease = YES;
        }else {
            self.openOnRelease = NO;
            self.closeOnRelease = YES;
        }
    }
    
    if (gesture.state == UIGestureRecognizerStateEnded) {
        if (closeOnRelease) {
            [UIView animateWithDuration:0.2 animations:^{
                self.frame = self.originalFrame;
                CGRect VCFrame = self.settingsViewController.view.frame;
                VCFrame.origin.y = (self.frame.origin.y + self.frame.size.height);
                self.settingsViewController.view.frame = VCFrame;
                [self.settingsViewController.view setNeedsDisplay];
                [self.delegate AddEdgePanGesture];
            }];
        } else if (openOnRelease){
            [UIView animateWithDuration:0.2 animations:^{
                self.frame = openFrame;
                CGRect VCFrame = self.settingsViewController.view.frame;
                VCFrame.origin.y = (self.frame.origin.y + self.frame.size.height);
                self.settingsViewController.view.frame = VCFrame;
                [self.settingsViewController.view setNeedsDisplay];
                [self.delegate RemoveEdgePanGestures];
            }];
        }
    }
}//-(void) HandlePan:(UIPanGestureRecognizer*) gesture

@end//@implementation SettingsSign
