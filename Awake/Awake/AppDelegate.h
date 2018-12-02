//
//  AppDelegate.h
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-08.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AlarmHolder.h"
#import "ViewController.h"
#import "FileHandler.h"
#import "Colors.h"
#import "AudioController.h"
#import "SettingsPlistHandler.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (retain) NSMutableArray* alarms;
@property FileHandler* handler;
@property AlarmHolder* holder;
@property UIAlertView *alert;
@property AudioController* AC;
@property SettingsPlistHandler *settingsHandler;

@end//@interface AppDelegate : UIResponder <UIApplicationDelegate> 
