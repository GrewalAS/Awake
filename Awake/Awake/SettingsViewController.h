//
//  SettingsViewController.h
//  Awake
//
//  Created by Amrinder Grewal on 2015-01-15.
//  Copyright (c) 2015 Amrinder Grewal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Colors.h"
#import "SettingsPlistHandler.h"
#import "NewAlarmViewController.h"
#import "AlarmStyleButtonsHolder.h"
#import "AlarmStyleButtons.h"
#import "AudioController.h"
#import "NA_CancelSign.h"
#import "NA_ConfirmSign.h"
#import "AlarmSounds.h"
#import "SleepMusic.h"

#import "AnimationDefines.h"

#define HEIGHTOFEACHSETTING 50.0

#define SHAKEMINIMUMVALUE 1.0
#define SHAKEMAXIMUMVALUE 4.0
#define WALKMINIMUMVALUE 15
#define WALKMAXIMUMVALUE 150

@protocol SettingsViewController <NSObject>

@optional
-(void) LoadSettingsViewController;
-(void) UnLoadSettingsViewController;
@end//@protocol SettingsViewController <NSObject>

@interface SettingsViewController : UIViewController<UIScrollViewDelegate, AlarmStyleButtonsHolder, MPMediaPickerControllerDelegate>

-(void) AlarmStyleButtonTapped: (UITapGestureRecognizer*) gesture;
-(void) ShakeSlider;
-(void) WalkSlider;

@property UIView *blurView;
@property UIView *settingsBlurView;
@property UIScrollView *scrollView;
@property UIView *settingsLabelBlurView;
@property UILabel *settingsLabel;

@property SettingsPlistHandler *settingsHandler;
@property AlarmStyleButtonsHolder *alarmStyleButtonsHolder;
@property AudioController* AC;

@property UITapGestureRecognizer *swipeTapGR;
@property UITapGestureRecognizer *shakeTapGR;
@property UITapGestureRecognizer *walkTapGR;

@property UIView *shakeSliderHolder;
@property UISlider *shakeSlider;
@property UILabel *shakeLevel;
@property UILabel *easyShakeLabel;
@property UILabel *hardShakeLabel;
@property NA_CancelSign *shakeCancelSign;
@property NA_ConfirmSign *shakeConfirmSign;

@property UIView *walkSliderholder;
@property UISlider *walkSlider;
@property UILabel *steps;
@property UILabel *minimumWalkLimit;
@property UILabel *maximumWalkLimit;
@property NA_CancelSign *walkCancelSign;
@property NA_ConfirmSign *walkConfirmSign;

@property AlarmSounds *alarmsSoundsView;
@property MPMediaPickerController *mediaPicker;

@property SleepMusic *sleepMusicholder;
@property UITapGestureRecognizer *playGR;
@property UITapGestureRecognizer *pauseGR;
@property UITapGestureRecognizer *backGR;
@property UITapGestureRecognizer *skipGR;

@end//@interface SettingsViewController : UINavigationController<UIScrollViewDelegate, AlarmStyleButtonsHolder>
