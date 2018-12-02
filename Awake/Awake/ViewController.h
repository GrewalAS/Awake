//
//  ViewController.h
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-08.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

#import "Background.h"
#import "HomePage.h"
#import "AlarmHolder.h"
#import "GetTimeInFormat.h"
#import "TimeHasChanged.h"
#import "FileHandler.h"
#import "AudioController.h"

#import "NewAlarmViewController.h"
#import "ListAlarmsViewController.h"
#import "SettingsViewController.h"

#import "SlideView.h"
#import "ProgressView.h"

#import "AnimationDefines.h"

/*****ListAlarmsViewController needs to be created here or the compiler will not let this compile*****/
@class ListAlarmsViewController;

@interface ViewController : UIViewController <UIGestureRecognizerDelegate, NA_CancelSign, NA_ConfirmSign, NewAlarmViewController, SettingsSign>

-(NSLayoutConstraint*) PlaceSubViewWithTheSameSizeAsSuperView: (UIView*) view;
-(void) LoadHomePage;
-(void) LoadNewAlarmViewController:(UIGestureRecognizer*) sender;
-(void) UnLoadNewViewController;
-(void) LoadListViewController:(UIGestureRecognizer*) sender;
-(void) UnLoadListViewController;
-(void) LoadSettingsViewController;
-(void) UnLoadSettingsViewController;

-(NSMutableArray*) SortAlarms: (NSMutableArray*) toBeSorted;
-(void) ClearNotifications;

-(void) RunShake;
-(void) RunWalk;
-(void) WalkToWake;
-(void) ShakeToWake;

-(void) SetLocalSoon;
-(void) SaveAndNotifications;

@property SettingsPlistHandler *settingsHandler;
@property Background *background;
@property HomePage *homePage;
@property AddSign *addSign;
@property AlarmList *alarmList;
@property SettingsSign *settingsSign;
@property AlarmText *alarmText;
@property SecondsBar *secondsBar;
@property TimeHasChanged *timeChanged;
@property FileHandler *handler;

@property ListAlarmsViewController *listAlarmsViewController;
@property NewAlarmViewController *createNewAlarmViewController;
@property SettingsViewController *settingsViewController;

@property NSLayoutConstraint *createNewAlarmViewControllerRightCons;
@property NSLayoutConstraint *listAlarmsViewControllerRightCons;
@property NSLayoutConstraint *settingsViewControllerTopCons;
@property NSLayoutConstraint *settingsViewControllerPanTopCons;

@property UIPanGestureRecognizer* left;
@property UIPanGestureRecognizer* right;
@property UIPanGestureRecognizer* up;

@property (atomic, retain) NSMutableArray* alarms;
@property (atomic, retain) NSMutableArray* sortedArray;

@property BOOL upYet;
@property BOOL completed;

@property NSString *fadeSoundName;
@property NSDate* startDate;
@property double percentDone;
@property int numberOfSteps;
@property int shakeLevel;

@property (atomic, strong) CMPedometer *cmPedometer;
@property (atomic, strong) CMPedometerData *firstData;
@property (atomic, strong) NSOperationQueue *operationQueue;

@property AudioController* AC;

@property (atomic, retain) SlideView *slideToTurnOff;
@property (atomic, retain) ProgressView *progressForTurnOff;

@end//@interface ViewController : UIViewController <UIGestureRecognizerDelegate, NA_CancelSign, NA_ConfirmSign, NewAlarmViewController>
