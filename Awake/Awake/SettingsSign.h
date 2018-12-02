//
//  SettingsSign.h
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-21.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SettingsViewController.h"
#import "Colors.h"

@protocol SettingsSign <NSObject>

-(void) ChangeConsForPan;
-(void) RemoveEdgePanGestures;
-(void) AddEdgePanGesture;

@end

@interface SettingsSign : UIView <UIGestureRecognizerDelegate>

@property NSLayoutConstraint *settingsViewControllerCons;
@property NSLayoutConstraint *settingsViewControllerPanCons;
@property CGRect originalFrame;
@property CGRect originalGestureFrame;
@property CGPoint originalCenter;
@property BOOL openOnRelease;
@property BOOL closeOnRelease;
@property SettingsViewController *settingsViewController;
@property id delegate;

-(void) handlePan:(UIPanGestureRecognizer*) gesture;

@end//@interface SettingsSign : UIView
