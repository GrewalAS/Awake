//
//  SettingsViewController.m
//  Awake
//
//  Created by Amrinder Grewal on 2015-01-15.
//  Copyright (c) 2015 Amrinder Grewal. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end//@interface SettingsViewController ()

@implementation SettingsViewController

@synthesize blurView;
@synthesize settingsBlurView;
@synthesize scrollView;
@synthesize settingsLabelBlurView;
@synthesize settingsLabel;

@synthesize settingsHandler;
@synthesize alarmStyleButtonsHolder;
@synthesize AC;

@synthesize shakeSliderHolder;
@synthesize shakeSlider;
@synthesize shakeLevel;
@synthesize easyShakeLabel;
@synthesize hardShakeLabel;
@synthesize shakeCancelSign;
@synthesize shakeConfirmSign;

@synthesize walkSliderholder;
@synthesize walkSlider;
@synthesize steps;
@synthesize minimumWalkLimit;
@synthesize maximumWalkLimit;
@synthesize walkCancelSign;
@synthesize walkConfirmSign;

@synthesize alarmsSoundsView;
@synthesize mediaPicker;

@synthesize sleepMusicholder;
@synthesize playGR;
@synthesize pauseGR;
@synthesize backGR;
@synthesize skipGR;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];

    //Adding the blurred background
    self.blurView = [self CreateBlurView];
    [self.view addSubview: self.blurView];
    
    //Placing blurView
    self.blurView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.blurView
                                                          attribute: NSLayoutAttributeTop
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeTop
                                                         multiplier: 1.0
                                                           constant: 0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.blurView
                                                          attribute: NSLayoutAttributeBottom
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeBottom
                                                         multiplier: 1.0
                                                           constant: 0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.blurView
                                                          attribute: NSLayoutAttributeLeft
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeLeft
                                                         multiplier: 1.0
                                                           constant: 0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.blurView
                                                          attribute: NSLayoutAttributeRight
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeRight
                                                         multiplier: 1.0
                                                           constant: 0.0]];
    
    //Creating the scrollView
    self.scrollView = [[UIScrollView alloc] init];
    [self.view addSubview: self.scrollView];
    //Placing the scrollView
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.scrollView
                                                          attribute: NSLayoutAttributeTop
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeTop
                                                         multiplier: 1.0
                                                           constant: 0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.scrollView
                                                          attribute: NSLayoutAttributeHeight
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeHeight
                                                         multiplier: 1.0
                                                           constant: -80.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.scrollView
                                                          attribute: NSLayoutAttributeLeft
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeLeft
                                                         multiplier: 1.0
                                                           constant: 0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.scrollView
                                                          attribute: NSLayoutAttributeWidth
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeWidth
                                                         multiplier: 1.0
                                                           constant: 0.0]];
    //Configuring the scrollView
    self.scrollView.delegate = self;
    self.scrollView.scrollEnabled=YES;
    self.scrollView.userInteractionEnabled=YES;
    self.scrollView.scrollsToTop = NO;
    self.scrollView.alwaysBounceVertical = YES;
    self.scrollView.alwaysBounceHorizontal = NO;
    self.scrollView.directionalLockEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    
    //Creating a blurview behind the settingsLabel
    self.settingsLabelBlurView = [self CreateBlurView];
    [self.view addSubview: self.settingsLabelBlurView];
    //Placing the settingsLabelBlurView
    self.settingsLabelBlurView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.settingsLabelBlurView
                                                          attribute: NSLayoutAttributeTop
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeTop
                                                         multiplier: 1.0
                                                           constant: 0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.settingsLabelBlurView
                                                          attribute: NSLayoutAttributeHeight
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: nil
                                                          attribute: NSLayoutAttributeNotAnAttribute
                                                         multiplier: 1.0
                                                           constant: HEIGHTOFEACHSETTING]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.settingsLabelBlurView
                                                          attribute: NSLayoutAttributeLeft
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeLeft
                                                         multiplier: 1.0
                                                           constant: 0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.settingsLabelBlurView
                                                          attribute: NSLayoutAttributeRight
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeRight
                                                         multiplier: 1.0
                                                           constant: 0.0]];
    
    //Creating the settings Label
    self.settingsLabel = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, 5, 5)];
    self.settingsLabel.textColor = [Colors MainLabelTextColor];
    self.settingsLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size: 20.0];
    self.settingsLabel.text = [NSString stringWithFormat:@"Settings"];
    [self.settingsLabel sizeToFit];
    [self.view addSubview:self.settingsLabel];
    
    self.settingsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.settingsLabel
                                                          attribute: NSLayoutAttributeCenterX
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeCenterX
                                                         multiplier: 1.0
                                                           constant: 0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.settingsLabel
                                                                      attribute: NSLayoutAttributeTop
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: self.view
                                                                      attribute: NSLayoutAttributeTop
                                                                     multiplier: 1.0
                                                                       constant: 18.0]];
    //Creating the AlarmStylesButtonsHolder
    self.alarmStyleButtonsHolder = [[AlarmStyleButtonsHolder alloc] init];
    [self.scrollView addSubview: self.alarmStyleButtonsHolder];
    //Placing the AlarmStylesButtonsHolder
    self.alarmStyleButtonsHolder.frame = CGRectMake(0, HEIGHTOFEACHSETTING * 1.125, self.view.frame.size.width, HEIGHTOFEACHSETTING);
    //Setting up delegate so GRs work
    self.alarmStyleButtonsHolder.delegate = self;
    
#pragma mark FINISH_ALARM_SOUNDS_CLASS_AFTER_FINDING_SOUNDS
    //Creating the AlarmsSoundsView
    self.alarmsSoundsView = [[AlarmSounds alloc] initWithFrame: CGRectMake(0, HEIGHTOFEACHSETTING * 2.25, self.view.frame.size.width, HEIGHTOFEACHSETTING * 1.25)];
    self.alarmsSoundsView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview: self.alarmsSoundsView];
    UILabel *FINISHME = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, self.view.frame.size.width, HEIGHTOFEACHSETTING)];
    FINISHME.font = [UIFont fontWithName: @"HelveticaNeue-Bold" size: 62];
    FINISHME.textColor = [UIColor blackColor];
    FINISHME.text = @"FINISH ME";
    [self.alarmsSoundsView addSubview:FINISHME];
#pragma mark FIX_THIS
    UITapGestureRecognizer *tapGRLoadMPMediaPicker = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(LoadMPMediaPicker)];
    tapGRLoadMPMediaPicker.numberOfTapsRequired = 1;
    tapGRLoadMPMediaPicker.numberOfTouchesRequired = 1;
    [self.alarmsSoundsView addGestureRecognizer:tapGRLoadMPMediaPicker];
    
    //Creating the sleepMusic, its a holder for the volume only for now
    self.sleepMusicholder = [[SleepMusic alloc] initWithFrame: CGRectMake(0, HEIGHTOFEACHSETTING * 3.50, self.view.frame.size.width, HEIGHTOFEACHSETTING * 0.75)];
    self.sleepMusicholder.delegate = self;
    [self.scrollView addSubview: self.sleepMusicholder];
}//- (void)viewDidLoad

-(UIView*) CreateBlurView{
    //If blur was not set in here, it does not appear
    //Creating the blur effect
    UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView * viewWithBlurredBackground =[[UIVisualEffectView alloc] initWithEffect:blurEffect];
    //Creating the vibrancy effect
    UIVisualEffectView * viewInducingVibrancy =
    [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    [viewWithBlurredBackground.contentView addSubview: viewInducingVibrancy];
    viewInducingVibrancy.translatesAutoresizingMaskIntoConstraints = NO;
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

    return viewWithBlurredBackground;
}//-(UIView*) CreateBlurView

-(void) SetUpForAlarmStyleButtonsHolder{
    //Creating GR for alarmsStyleButtons swipe
    self.swipeTapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(AlarmStyleButtonTapped:)];
    self.swipeTapGR.numberOfTapsRequired = 1;
    self.swipeTapGR.numberOfTouchesRequired = 1;
    [self.alarmStyleButtonsHolder.swipe addGestureRecognizer: self.swipeTapGR];
    
    //Creating GR for alarmsStyleButtons shake
    self.shakeTapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(AlarmStyleButtonTapped:)];
    self.shakeTapGR.numberOfTapsRequired = 1;
    self.shakeTapGR.numberOfTouchesRequired = 1;
    [self.alarmStyleButtonsHolder.shake addGestureRecognizer: self.shakeTapGR];
    
    if ([self.alarmStyleButtonsHolder.walk.imageName isEqualToString:@"walk-icon"]) {
        //Creating GR for alarmsStyleButtons walk
        self.walkTapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(AlarmStyleButtonTapped:)];
        self.walkTapGR.numberOfTapsRequired = 1;
        self.walkTapGR.numberOfTouchesRequired = 1;
        [self.alarmStyleButtonsHolder.walk addGestureRecognizer: self.walkTapGR];
    }
    
    switch (self.settingsHandler.indexForTurnOffStyle) {
        case 0:
            self.alarmStyleButtonsHolder.swipe.alpha = [Colors AlphaOfActiveImage];
            break;
            
        case 1:
            self.alarmStyleButtonsHolder.shake.alpha = [Colors AlphaOfActiveImage];
            break;
            
        case 2:
            self.alarmStyleButtonsHolder.walk.alpha = [Colors AlphaOfActiveImage];
            break;
            
        default:
            self.alarmStyleButtonsHolder.swipe.alpha = [Colors AlphaOfActiveImage];
            break;
    }
    [self LoadShakeSlider];
    [self LoadWalkSlider];
}//-(void) SetUpForAlarmStyleButtonsHolder

-(void) LoadShakeSlider{
    //Creating the shakeSlider and its holder here because creating it later made it disappear
    CGRect shakeSliderHolderFrame = self.alarmStyleButtonsHolder.frame;
    shakeSliderHolderFrame.origin.x = shakeSliderHolderFrame.size.width;
    
    self.shakeSliderHolder = [[UIView alloc] initWithFrame: shakeSliderHolderFrame];
    self.shakeSliderHolder.userInteractionEnabled = YES;
    [self.scrollView addSubview: self.shakeSliderHolder];
    
    self.shakeSlider = [[UISlider alloc] init];
    self.shakeSlider.continuous = YES;
    self.shakeSlider.minimumValue = SHAKEMINIMUMVALUE;
    self.shakeSlider.maximumValue = SHAKEMAXIMUMVALUE;
    
    //Changing the apperance of the slider
    UIImage *sliderMarker = [UIImage imageNamed: @"slider-marker"];
    UIImage *clearPixel = [[UIImage alloc] init];
    [self.shakeSlider setThumbImage: sliderMarker forState: UIControlStateNormal];
    [self.shakeSlider setMinimumTrackImage: clearPixel forState: UIControlStateNormal];
    [self.shakeSlider setMaximumTrackImage: clearPixel forState: UIControlStateNormal];
    
    [self.shakeSliderHolder addSubview: self.shakeSlider];
    self.shakeSlider.translatesAutoresizingMaskIntoConstraints = NO;
    [self.shakeSliderHolder addConstraint:[NSLayoutConstraint constraintWithItem: self.shakeSlider
                                                                       attribute: NSLayoutAttributeLeft
                                                                       relatedBy: NSLayoutRelationEqual
                                                                          toItem: self.shakeSliderHolder
                                                                       attribute: NSLayoutAttributeLeft
                                                                      multiplier: 1.0
                                                                        constant: 50.0]];
    [self.shakeSliderHolder addConstraint:[NSLayoutConstraint constraintWithItem: self.shakeSlider
                                                                       attribute: NSLayoutAttributeTop
                                                                       relatedBy: NSLayoutRelationEqual
                                                                          toItem: self.shakeSliderHolder
                                                                       attribute: NSLayoutAttributeTop
                                                                      multiplier: 1.0
                                                                        constant: 0.0]];
    [self.shakeSliderHolder addConstraint:[NSLayoutConstraint constraintWithItem: self.shakeSlider
                                                                       attribute: NSLayoutAttributeRight
                                                                       relatedBy: NSLayoutRelationEqual
                                                                          toItem: self.shakeSliderHolder
                                                                       attribute: NSLayoutAttributeRight
                                                                      multiplier: 1.0
                                                                        constant: -50.0]];
    [self.shakeSliderHolder addConstraint:[NSLayoutConstraint constraintWithItem: self.shakeSlider
                                                                       attribute: NSLayoutAttributeBottom
                                                                       relatedBy: NSLayoutRelationEqual
                                                                          toItem: self.shakeSliderHolder
                                                                       attribute: NSLayoutAttributeBottom
                                                                      multiplier: 1.0
                                                                        constant: 0.0]];
    //Connecting the value change event to a function
    UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(sliderTapped:)];
    longPressGestureRecognizer.minimumPressDuration = 0.0;
    [self.shakeSlider addGestureRecognizer: longPressGestureRecognizer];
    
    //Creating the "shake level" title label
    self.shakeLevel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    self.shakeLevel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size: 12.5];
    NSString *shakeLevelLocal = @"Shake Level";
    self.shakeLevel.text = shakeLevelLocal;
    self.shakeLevel.textColor = [Colors ActiveAlarmText];
    //Adding as subview and giving correct size
    [self.shakeSliderHolder addSubview: self.shakeLevel];
    [self.shakeLevel sizeToFit];
    //Placing it
    self.shakeLevel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.shakeSliderHolder addConstraint:[NSLayoutConstraint constraintWithItem: self.shakeLevel
                                                                       attribute: NSLayoutAttributeCenterX
                                                                       relatedBy: NSLayoutRelationEqual
                                                                          toItem: self.shakeSliderHolder
                                                                       attribute: NSLayoutAttributeCenterX
                                                                      multiplier: 1.0
                                                                        constant: 0.0]];
    [self.shakeSliderHolder addConstraint:[NSLayoutConstraint constraintWithItem: self.shakeLevel
                                                                       attribute: NSLayoutAttributeTop
                                                                       relatedBy: NSLayoutRelationEqual
                                                                          toItem: self.shakeSliderHolder
                                                                       attribute: NSLayoutAttributeTop
                                                                      multiplier: 1.0
                                                                        constant: 2.0]];
    
    //Creating labels for shake slider
    //Easy
    self.easyShakeLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 5, 5)];
    self.easyShakeLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size: 10.0];
    NSString *easy = @"Easy";
    self.easyShakeLabel.text = easy;
    self.easyShakeLabel.textColor = [Colors ActiveAlarmText];
    //Adding as subview
    [self.shakeSliderHolder addSubview: self.easyShakeLabel];
    [self.easyShakeLabel sizeToFit];
    //Rotating the label
    self.easyShakeLabel.transform = CGAffineTransformRotate(self.easyShakeLabel.transform, -M_PI_2);
    //Placing the easy label
    self.easyShakeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.shakeSliderHolder addConstraint:[NSLayoutConstraint constraintWithItem: self.easyShakeLabel
                                                                       attribute: NSLayoutAttributeCenterY
                                                                       relatedBy: NSLayoutRelationEqual
                                                                          toItem: self.shakeSlider
                                                                       attribute: NSLayoutAttributeTop
                                                                      multiplier: 1.0
                                                                        constant: 25.0]];
    [self.shakeSliderHolder addConstraint:[NSLayoutConstraint constraintWithItem: self.easyShakeLabel
                                                                       attribute: NSLayoutAttributeRight
                                                                       relatedBy: NSLayoutRelationEqual
                                                                          toItem: self.shakeSlider
                                                                       attribute: NSLayoutAttributeLeft
                                                                      multiplier: 1.0
                                                                        constant: -2.5]];
    
    //Hard
    self.hardShakeLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 5, 5)];
    self.hardShakeLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size: 10.0];
    NSString *hard = @"Hard";
    self.hardShakeLabel.text = hard;
    self.hardShakeLabel.textColor = [Colors ActiveAlarmText];
    //Adding as subview
    [self.shakeSliderHolder addSubview: self.hardShakeLabel];
    [self.hardShakeLabel sizeToFit];
    //Rotating the label
    self.hardShakeLabel.transform = CGAffineTransformRotate(self.hardShakeLabel.transform, M_PI_2);
    //Placing the hard label
    self.hardShakeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.shakeSliderHolder addConstraint:[NSLayoutConstraint constraintWithItem: self.hardShakeLabel
                                                                       attribute: NSLayoutAttributeCenterY
                                                                       relatedBy: NSLayoutRelationEqual
                                                                          toItem: self.shakeSlider
                                                                       attribute: NSLayoutAttributeTop
                                                                      multiplier: 1.0
                                                                        constant: 25.0]];
    [self.shakeSliderHolder addConstraint:[NSLayoutConstraint constraintWithItem: self.hardShakeLabel
                                                                       attribute: NSLayoutAttributeLeft
                                                                       relatedBy: NSLayoutRelationEqual
                                                                          toItem: self.shakeSlider
                                                                       attribute: NSLayoutAttributeRight
                                                                      multiplier: 1.0
                                                                        constant: 2.5]];
    //Creating the confirm and reject change signs
    //Creating Cancel Sign
    self.shakeCancelSign = [[NA_CancelSign alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
    [self.shakeSliderHolder addSubview: self.shakeCancelSign];
    //Placing Creating Cancel
    self.shakeCancelSign.translatesAutoresizingMaskIntoConstraints = NO;
    [self.shakeCancelSign addConstraint:[NSLayoutConstraint constraintWithItem: self.shakeCancelSign
                                                                     attribute: NSLayoutAttributeHeight
                                                                     relatedBy: NSLayoutRelationEqual
                                                                        toItem: nil
                                                                     attribute: NSLayoutAttributeNotAnAttribute
                                                                    multiplier: 1.0
                                                                      constant: 15.0]];
    [self.shakeCancelSign addConstraint:[NSLayoutConstraint constraintWithItem: self.shakeCancelSign
                                                                     attribute: NSLayoutAttributeWidth
                                                                     relatedBy: NSLayoutRelationEqual
                                                                        toItem: nil
                                                                     attribute: NSLayoutAttributeNotAnAttribute
                                                                    multiplier: 1.0
                                                                      constant: 15.0]];
    [self.shakeSliderHolder addConstraint:[NSLayoutConstraint constraintWithItem: self.shakeCancelSign
                                                                       attribute: NSLayoutAttributeCenterY
                                                                       relatedBy: NSLayoutRelationEqual
                                                                          toItem: self.shakeSliderHolder
                                                                       attribute: NSLayoutAttributeCenterY
                                                                      multiplier: 1.0
                                                                        constant: 0.0]];
    [self.shakeSliderHolder addConstraint:[NSLayoutConstraint constraintWithItem: self.shakeCancelSign
                                                                       attribute: NSLayoutAttributeRight
                                                                       relatedBy: NSLayoutRelationEqual
                                                                          toItem: self.easyShakeLabel
                                                                       attribute: NSLayoutAttributeLeft
                                                                      multiplier: 1.0
                                                                        constant: -5.0]];
    UITapGestureRecognizer* tapCancelGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(CancelShake)];
    tapCancelGR.numberOfTapsRequired = 1;
    tapCancelGR.numberOfTouchesRequired = 1;
    [self.shakeCancelSign addGestureRecognizer: tapCancelGR];
    
    //Creating the Confirm Sign
    self.shakeConfirmSign = [[NA_ConfirmSign alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
    [self.shakeSliderHolder addSubview: self.shakeConfirmSign];
    //Placing Confirm Sign
    self.shakeConfirmSign.translatesAutoresizingMaskIntoConstraints = NO;
    [self.shakeConfirmSign addConstraint:[NSLayoutConstraint constraintWithItem: self.shakeConfirmSign
                                                                      attribute: NSLayoutAttributeHeight
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: nil
                                                                      attribute: NSLayoutAttributeNotAnAttribute
                                                                     multiplier: 1.0
                                                                       constant: 15.0]];
    [self.shakeConfirmSign addConstraint:[NSLayoutConstraint constraintWithItem: self.shakeConfirmSign
                                                                      attribute: NSLayoutAttributeWidth
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: nil
                                                                      attribute: NSLayoutAttributeNotAnAttribute
                                                                     multiplier: 1.0
                                                                       constant: 15.0]];
    [self.shakeSliderHolder addConstraint:[NSLayoutConstraint constraintWithItem: self.shakeConfirmSign
                                                                       attribute: NSLayoutAttributeCenterY
                                                                       relatedBy: NSLayoutRelationEqual
                                                                          toItem: self.shakeSliderHolder
                                                                       attribute: NSLayoutAttributeCenterY
                                                                      multiplier: 1.0
                                                                        constant: 0.0]];
    [self.shakeSliderHolder addConstraint:[NSLayoutConstraint constraintWithItem: self.shakeConfirmSign
                                                                       attribute: NSLayoutAttributeLeft
                                                                       relatedBy: NSLayoutRelationEqual
                                                                          toItem: self.hardShakeLabel
                                                                       attribute: NSLayoutAttributeRight
                                                                      multiplier: 1
                                                                        constant: 5.0]];
    //Adding gestures to confirm or cancel this alarm
    UITapGestureRecognizer* tapConfirmGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ConfirmShake)];
    tapConfirmGR.numberOfTapsRequired = 1;
    tapConfirmGR.numberOfTouchesRequired = 1;
    [self.shakeConfirmSign addGestureRecognizer: tapConfirmGR];
}//-(void) LoadShakeSlider

-(void) LoadWalkSlider{
    //Creating the walkSlider and its holder here because creating it later made it disappear
    CGRect walkSliderholderFrame = self.alarmStyleButtonsHolder.frame;
    walkSliderholderFrame.origin.x = walkSliderholderFrame.size.width;
    
    self.walkSliderholder = [[UIView alloc] initWithFrame: walkSliderholderFrame];
    self.walkSliderholder.userInteractionEnabled = YES;
    [self.scrollView addSubview: self.walkSliderholder];
    
    self.walkSlider = [[UISlider alloc] init];
    self.walkSlider.continuous = YES;
    self.walkSlider.minimumValue = WALKMINIMUMVALUE;
    self.walkSlider.maximumValue = WALKMAXIMUMVALUE;
    
    //Changing the apperance of the slider
    UIImage *sliderMarker = [UIImage imageNamed: @"slider-marker"];
    UIImage *clearPixel = [[UIImage alloc] init];
    
    [self.walkSlider setThumbImage: sliderMarker forState:UIControlStateNormal];
    [self.walkSlider setMinimumTrackImage: clearPixel forState: UIControlStateNormal];
    [self.walkSlider setMaximumTrackImage: clearPixel forState: UIControlStateNormal];
    
    [self.walkSliderholder addSubview: self.walkSlider];
    self.walkSlider.translatesAutoresizingMaskIntoConstraints = NO;
    [self.walkSliderholder addConstraint:[NSLayoutConstraint constraintWithItem: self.walkSlider
                                                                      attribute: NSLayoutAttributeLeft
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: self.walkSliderholder
                                                                      attribute: NSLayoutAttributeLeft
                                                                     multiplier: 1.0
                                                                       constant: 50.0]];
    [self.walkSliderholder addConstraint:[NSLayoutConstraint constraintWithItem: self.walkSlider
                                                                      attribute: NSLayoutAttributeTop
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: self.walkSliderholder
                                                                      attribute: NSLayoutAttributeTop
                                                                     multiplier: 1.0
                                                                       constant: 0.0]];
    [self.walkSliderholder addConstraint:[NSLayoutConstraint constraintWithItem: self.walkSlider
                                                                      attribute: NSLayoutAttributeRight
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: self.walkSliderholder
                                                                      attribute: NSLayoutAttributeRight
                                                                     multiplier: 1.0
                                                                       constant: -50.0]];
    [self.walkSliderholder addConstraint:[NSLayoutConstraint constraintWithItem: self.walkSlider
                                                                      attribute: NSLayoutAttributeBottom
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: self.walkSliderholder
                                                                      attribute: NSLayoutAttributeBottom
                                                                     multiplier: 1.0
                                                                       constant: 0.0]];
    //Connecting the value change event to a function
    UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(sliderTapped:)];
    longPressGestureRecognizer.minimumPressDuration = 0.0;
    [self.walkSlider addGestureRecognizer: longPressGestureRecognizer];
    
    //Creating the "steps" title label
    self.steps = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    self.steps.font = [UIFont fontWithName:@"HelveticaNeue-Light" size: 12.5];
    NSString *stepsLocal = @"Steps";
    self.steps.text = stepsLocal;
    self.steps.textColor = [Colors ActiveAlarmText];
    //Adding as subview and giving correct size
    [self.walkSliderholder addSubview: self.steps];
    [self.steps sizeToFit];
    //Placing it
    self.steps.translatesAutoresizingMaskIntoConstraints = NO;
    [self.walkSliderholder addConstraint:[NSLayoutConstraint constraintWithItem: self.steps
                                                                       attribute: NSLayoutAttributeCenterX
                                                                       relatedBy: NSLayoutRelationEqual
                                                                          toItem: self.walkSliderholder
                                                                       attribute: NSLayoutAttributeCenterX
                                                                      multiplier: 1.0
                                                                        constant: 0.0]];
    [self.walkSliderholder addConstraint:[NSLayoutConstraint constraintWithItem: self.steps
                                                                       attribute: NSLayoutAttributeTop
                                                                       relatedBy: NSLayoutRelationEqual
                                                                          toItem: self.walkSliderholder
                                                                       attribute: NSLayoutAttributeTop
                                                                      multiplier: 1.0
                                                                        constant: 2.0]];

    
    //Creating labels for walk slider
    //Easy
    self.minimumWalkLimit = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 5, 5)];
    self.minimumWalkLimit.font = [UIFont fontWithName:@"HelveticaNeue-Light" size: 10.0];
    NSString *minimum = @"15";
    self.minimumWalkLimit.text = minimum;
    self.minimumWalkLimit.textColor = [Colors ActiveAlarmText];
    //Adding as subview
    [self.walkSliderholder addSubview: self.minimumWalkLimit];
    [self.minimumWalkLimit sizeToFit];
    //Rotating the label
    self.minimumWalkLimit.transform = CGAffineTransformRotate(self.minimumWalkLimit.transform, -M_PI_2);
    //Placing the easy label
    self.minimumWalkLimit.translatesAutoresizingMaskIntoConstraints = NO;
    [self.walkSliderholder addConstraint:[NSLayoutConstraint constraintWithItem: self.minimumWalkLimit
                                                                      attribute: NSLayoutAttributeCenterY
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: self.walkSlider
                                                                      attribute: NSLayoutAttributeTop
                                                                     multiplier: 1.0
                                                                       constant: 25.0]];
    [self.walkSliderholder addConstraint:[NSLayoutConstraint constraintWithItem: self.minimumWalkLimit
                                                                      attribute: NSLayoutAttributeRight
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: self.walkSlider
                                                                      attribute: NSLayoutAttributeLeft
                                                                     multiplier: 1.0
                                                                       constant: -7.5]];
    
    //Hard
    self.maximumWalkLimit = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 5, 5)];
    self.maximumWalkLimit.font = [UIFont fontWithName:@"HelveticaNeue-Light" size: 10.0];
    NSString *max = @"150";
    self.maximumWalkLimit.text = max;
    self.maximumWalkLimit.textColor = [Colors ActiveAlarmText];
    //Adding as subview
    [self.walkSliderholder addSubview: self.maximumWalkLimit];
    [self.maximumWalkLimit sizeToFit];
    //Rotating the label
    self.maximumWalkLimit.transform = CGAffineTransformRotate(self.maximumWalkLimit.transform, M_PI_2);
    //Placing the hard label
    self.maximumWalkLimit.translatesAutoresizingMaskIntoConstraints = NO;
    [self.walkSliderholder addConstraint:[NSLayoutConstraint constraintWithItem: self.maximumWalkLimit
                                                                      attribute: NSLayoutAttributeCenterY
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: self.walkSlider
                                                                      attribute: NSLayoutAttributeTop
                                                                     multiplier: 1.0
                                                                       constant: 25.0]];
    [self.walkSliderholder addConstraint:[NSLayoutConstraint constraintWithItem: self.maximumWalkLimit
                                                                      attribute: NSLayoutAttributeLeft
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: self.walkSlider
                                                                      attribute: NSLayoutAttributeRight
                                                                     multiplier: 1.0
                                                                       constant: 5.0]];
    //Creating the confirm and reject change signs
    //Creating Cancel Sign
    self.walkCancelSign = [[NA_CancelSign alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
    [self.walkSliderholder addSubview: self.walkCancelSign];
    //Placing Creating Cancel
    self.walkCancelSign.translatesAutoresizingMaskIntoConstraints = NO;
    [self.walkCancelSign addConstraint:[NSLayoutConstraint constraintWithItem: self.walkCancelSign
                                                                    attribute: NSLayoutAttributeHeight
                                                                    relatedBy: NSLayoutRelationEqual
                                                                       toItem: nil
                                                                    attribute: NSLayoutAttributeNotAnAttribute
                                                                   multiplier: 1.0
                                                                     constant: 15.0]];
    [self.walkCancelSign addConstraint:[NSLayoutConstraint constraintWithItem: self.walkCancelSign
                                                                    attribute: NSLayoutAttributeWidth
                                                                    relatedBy: NSLayoutRelationEqual
                                                                       toItem: nil
                                                                    attribute: NSLayoutAttributeNotAnAttribute
                                                                   multiplier: 1.0
                                                                     constant: 15.0]];
    [self.walkSliderholder addConstraint:[NSLayoutConstraint constraintWithItem: self.walkCancelSign
                                                                      attribute: NSLayoutAttributeCenterY
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: self.walkSliderholder
                                                                      attribute: NSLayoutAttributeCenterY
                                                                     multiplier: 1.0
                                                                       constant: 0.0]];
    [self.walkSliderholder addConstraint:[NSLayoutConstraint constraintWithItem: self.walkCancelSign
                                                                      attribute: NSLayoutAttributeRight
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: self.minimumWalkLimit
                                                                      attribute: NSLayoutAttributeLeft
                                                                     multiplier: 1.0
                                                                       constant: -5.0]];
    UITapGestureRecognizer* tapCancelGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(CancelWalk)];
    tapCancelGR.numberOfTapsRequired = 1;
    tapCancelGR.numberOfTouchesRequired = 1;
    [self.walkCancelSign addGestureRecognizer: tapCancelGR];
    
    //Creating the Confirm Sign
    self.walkConfirmSign = [[NA_ConfirmSign alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
    [self.walkSliderholder addSubview: self.walkConfirmSign];
    //Placing Confirm Sign
    self.walkConfirmSign.translatesAutoresizingMaskIntoConstraints = NO;
    [self.walkConfirmSign addConstraint:[NSLayoutConstraint constraintWithItem: self.walkConfirmSign
                                                                     attribute: NSLayoutAttributeHeight
                                                                     relatedBy: NSLayoutRelationEqual
                                                                        toItem: nil
                                                                     attribute: NSLayoutAttributeNotAnAttribute
                                                                    multiplier: 1.0
                                                                      constant: 15.0]];
    [self.walkConfirmSign addConstraint:[NSLayoutConstraint constraintWithItem: self.walkConfirmSign
                                                                     attribute: NSLayoutAttributeWidth
                                                                     relatedBy: NSLayoutRelationEqual
                                                                        toItem: nil
                                                                     attribute: NSLayoutAttributeNotAnAttribute
                                                                    multiplier: 1.0
                                                                      constant: 15.0]];
    [self.walkSliderholder addConstraint:[NSLayoutConstraint constraintWithItem: self.walkConfirmSign
                                                                      attribute: NSLayoutAttributeCenterY
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: self.walkSliderholder
                                                                      attribute: NSLayoutAttributeCenterY
                                                                     multiplier: 1.0
                                                                       constant: 0.0]];
    [self.walkSliderholder addConstraint:[NSLayoutConstraint constraintWithItem: self.walkConfirmSign
                                                                      attribute: NSLayoutAttributeLeft
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: self.maximumWalkLimit
                                                                      attribute: NSLayoutAttributeRight
                                                                     multiplier: 1
                                                                       constant: 5.0]];
    //Adding gestures to confirm or cancel this alarm
    UITapGestureRecognizer* tapConfirmGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ConfirmWalk)];
    tapConfirmGR.numberOfTapsRequired = 1;
    tapConfirmGR.numberOfTouchesRequired = 1;
    [self.walkConfirmSign addGestureRecognizer: tapConfirmGR];
}//-(void) LoadWalkSlider

-(void) sliderTapped:(UIGestureRecognizer *)g {
    UISlider* s = (UISlider*)g.view;
    if (s.highlighted)
        return; // tap on thumb, let slider deal with it
    CGPoint pt = [g locationInView: s];
    CGFloat percentage = pt.x / s.bounds.size.width;//Using width since the slider is transformed and not created that way
    CGFloat delta = percentage * (s.maximumValue - s.minimumValue);
    CGFloat value = s.minimumValue + delta;
    [s setValue:value animated: NO];
    [s sendActionsForControlEvents: UIControlEventValueChanged];
}//-(void) sliderTapped:(UIGestureRecognizer *)g

-(void) AlarmStyleButtonTapped: (UITapGestureRecognizer*) gesture{
    AlarmStyleButtons *buttonTapped = (AlarmStyleButtons*)gesture.view;

    [self.alarmStyleButtonsHolder DeactivateAllExpect:buttonTapped];
    
    if ([buttonTapped.imageName isEqualToString: @"shake-icon"]) {
        [self ShakeSlider];
        self.settingsHandler.indexForTurnOffStyle = 1;
    } else if([buttonTapped.imageName isEqualToString: @"walk-icon"]) {
        [self WalkSlider];
        self.settingsHandler.indexForTurnOffStyle = 2;
    } else{
        self.settingsHandler.indexForTurnOffStyle = 0;
    }
    [self.settingsHandler SaveUserDefaults];
}//-(void) AlarmStyleButtonTapped: (UITapGestureRecognizer*) gesture

-(void) ShakeSlider{
    [UIView animateWithDuration: VIEWANIMATIONTIMECHANGE
                     animations:^{
                         self.alarmStyleButtonsHolder.transform = CGAffineTransformTranslate(self.alarmStyleButtonsHolder.transform, (-self.alarmStyleButtonsHolder.frame.size.width), 0);
                         self.shakeSliderHolder.transform = CGAffineTransformTranslate(self.shakeSliderHolder.transform, (-self.alarmStyleButtonsHolder.frame.size.width), 0);
                         self.shakeSlider.value = self.settingsHandler.shakeLevel;
                     }];
}//-(void) ShakeSlider

-(void) WalkSlider{
    [UIView animateWithDuration: VIEWANIMATIONTIMECHANGE
                     animations:^{
                         self.alarmStyleButtonsHolder.transform = CGAffineTransformTranslate(self.alarmStyleButtonsHolder.transform, (-self.alarmStyleButtonsHolder.frame.size.width), 0);
                         self.walkSliderholder.transform = CGAffineTransformTranslate(self.shakeSliderHolder.transform, (-self.alarmStyleButtonsHolder.frame.size.width), 0);
                         self.walkSlider.value = self.settingsHandler.stepsRequiredToTurnOff;
                     }];
}//-(void) WalkSlider

-(void) ShakeSliderValueChanged: (UISlider*) slider{
    float value = slider.value;
    self.settingsHandler.shakeLevel = value;
    [self.settingsHandler SaveUserDefaults];
}//-(void) ShakeSliderValueChanged: (UISlider*) slider

-(void) CancelShake{
    [self MoveShakeBack];
}//-(void) CancelShake

-(void) ConfirmShake{
    float value = self.shakeSlider.value;
    self.settingsHandler.shakeLevel = value;
    [self.settingsHandler SaveUserDefaults];
    
    [self MoveShakeBack];
}//-(void) ConfirmShake

-(void) MoveShakeBack{
    [UIView animateWithDuration: VIEWANIMATIONTIMECHANGE
                     animations:^{
                         self.alarmStyleButtonsHolder.transform = CGAffineTransformTranslate(self.alarmStyleButtonsHolder.transform, self.alarmStyleButtonsHolder.frame.size.width, 0);
                         self.shakeSliderHolder.transform = CGAffineTransformTranslate(self.shakeSliderHolder.transform, self.alarmStyleButtonsHolder.frame.size.width, 0);
                     }];
}//-(void) MoveShakeBack

-(void) CancelWalk{
    [self MoveWalkBack];
}//-(void) CancelWalk

-(void) ConfirmWalk{
    float value = self.walkSlider.value;
    self.settingsHandler.stepsRequiredToTurnOff = value;
    [self.settingsHandler SaveUserDefaults];
    
    [self MoveWalkBack];
}//-(void) ConfirmShake

-(void) MoveWalkBack{
    [UIView animateWithDuration: VIEWANIMATIONTIMECHANGE
                     animations:^{
                         self.alarmStyleButtonsHolder.transform = CGAffineTransformTranslate(self.alarmStyleButtonsHolder.transform, self.alarmStyleButtonsHolder.frame.size.width, 0);
                         self.walkSliderholder.transform = CGAffineTransformTranslate(self.walkSliderholder.transform, self.alarmStyleButtonsHolder.frame.size.width, 0);
                     }];
}//-(void) MoveWalkBack

-(void) SetUpForSleepMusic{
    self.sleepMusicholder.volumeSlider.value = self.settingsHandler.volume;
    [self.sleepMusicholder.volumeSlider addTarget:self action:@selector(VolumeChanged:) forControlEvents:UIControlEventValueChanged];
    //Connecting the value change event to a function
    UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(sliderTapped:)];
    longPressGestureRecognizer.minimumPressDuration = 0.0;
    [self.sleepMusicholder.volumeSlider addGestureRecognizer: longPressGestureRecognizer];
}//-(void) SetUpForSleepMusic

-(void) VolumeChanged: (UISlider*) slider{
    self.settingsHandler.volume = slider.value;
    [self.settingsHandler SaveUserDefaults];
}//-(void) VolumeChanged: (UISlider*) slider

-(void) LoadMPMediaPicker{
    //Preping the mediaPicker Controller
    self.mediaPicker = [[MPMediaPickerController alloc] initWithMediaTypes: MPMediaTypeMusic];
    self.mediaPicker.delegate = self;
    self.mediaPicker.allowsPickingMultipleItems = NO;
    self.mediaPicker.showsCloudItems = NO;
    self.mediaPicker.prompt = NSLocalizedString(@"Pick A Song You Would Like To Wake Up To", nil);
    //Adding the mediaPicker Controller
    [self addChildViewController: self.mediaPicker];
    
    //Preping the mediaPicker View
    self.mediaPicker.view.frame = CGRectMake(self.scrollView.frame.size.width, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    //Adding the mediaPicker View
    [self.view addSubview: self.mediaPicker.view];
    [UIView animateWithDuration: VIEWANIMATIONTIMECHANGE
                     animations:^{
                         self.scrollView.transform = CGAffineTransformTranslate(self.scrollView.transform, (-self.scrollView.frame.size.width), 0);
                         self.mediaPicker.view.transform = CGAffineTransformTranslate(self.mediaPicker.view.transform, (-self.mediaPicker.view.frame.size.width), 0);
                     }];
}//-(void) LoadMPMediaPicker

-(void) UnloadMPMediaPicker{
    [UIView animateWithDuration: VIEWANIMATIONTIMECHANGE
                     animations:^{
                         self.scrollView.transform = CGAffineTransformTranslate(self.scrollView.transform, self.scrollView.frame.size.width, 0);
                         self.mediaPicker.view.transform = CGAffineTransformTranslate(self.mediaPicker.view.transform, self.mediaPicker.view.frame.size.width, 0);
                     } completion:^(BOOL finished) {
                         [self.mediaPicker removeFromParentViewController];
                         [self.mediaPicker.view removeFromSuperview];
                         self.mediaPicker = nil;
                     }];
}

//MPMediaPickerController delegate

-(void) mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection{
    [self UnloadMPMediaPicker];
    
    MPMediaItem *mediaItem = [[mediaItemCollection items] objectAtIndex: 0];
    self.settingsHandler.songName = [mediaItem valueForKey: MPMediaItemPropertyTitle];
    NSString *songURL = [[mediaItem valueForKey: MPMediaItemPropertyAssetURL] absoluteString];
    self.settingsHandler.songURL = [NSURL URLWithString: songURL];
    [self.settingsHandler SaveUserDefaults];
}

-(void) mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker{
    [self UnloadMPMediaPicker];
}

//Gesture recognizer delegate methods
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    // return
    return true;
}//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}//- (void)didReceiveMemoryWarning 

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end//@implementation SettingsViewController
