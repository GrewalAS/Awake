//
//  ViewController.m
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-08.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#pragma mark CHANGE COLOR FOR SETTING SIGN
#pragma mark FIX_SOUNDS

#import "ViewController.h"

@interface ViewController ()

@end//@interface ViewController ()

@implementation ViewController

@synthesize settingsHandler;
@synthesize background;
@synthesize homePage;
@synthesize addSign;
@synthesize alarmList;
@synthesize settingsSign;
@synthesize alarmText;
@synthesize secondsBar;
@synthesize timeChanged;
@synthesize handler;

@synthesize listAlarmsViewController;
@synthesize createNewAlarmViewController;

@synthesize createNewAlarmViewControllerRightCons;
@synthesize listAlarmsViewControllerRightCons;

@synthesize left;
@synthesize right;
@synthesize up;

@synthesize alarms;
@synthesize sortedArray;

@synthesize upYet;
@synthesize completed;

@synthesize startDate;
@synthesize percentDone;
@synthesize numberOfSteps;
@synthesize shakeLevel;

@synthesize cmPedometer;
@synthesize firstData;
@synthesize operationQueue;


- (void)viewDidLoad {
    [super viewDidLoad];
    //Creating background
    self.background = [Background new];
    //Placing background
    self.background.frame = self.view.bounds;
    //Adding background as subview
    [self.view addSubview: self.background];
    
    //Starting the timer for when the time needs to be changed and when the background needs to be redendered again
    self.timeChanged = [TimeHasChanged new];
    self.timeChanged.background = self.background;
    
    [self.view addSubview:self.AC.volumeView];
    self.AC.volumeView.frame = CGRectMake(-10, -10, 5, 5);
    
    [self LoadHomePage];
    //Loaded here so that if the user decides
    [self LoadSettingsViewController];
}//- (void)viewDidLoad

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}//- (void)didReceiveMemoryWarning

- (BOOL)prefersStatusBarHidden{
    return YES;
}//- (BOOL)prefersStatusBarHidden

- (NSLayoutConstraint*) PlaceSubViewWithTheSameSizeAsSuperView: (UIView*) view{
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: view
                                                          attribute: NSLayoutAttributeTop
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.background
                                                          attribute: NSLayoutAttributeTop
                                                         multiplier: 1.0
                                                           constant: 0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: view
                                                          attribute: NSLayoutAttributeLeft
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.background
                                                          attribute: NSLayoutAttributeLeft
                                                         multiplier: 1.0
                                                           constant: 0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: view
                                                          attribute: NSLayoutAttributeBottom
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.background
                                                          attribute: NSLayoutAttributeBottom
                                                         multiplier: 1.0
                                                           constant: 0.0]];
    NSLayoutConstraint *rightCons = [NSLayoutConstraint constraintWithItem: view
                                                                 attribute: NSLayoutAttributeRight
                                                                 relatedBy: NSLayoutRelationEqual
                                                                    toItem: self.background
                                                                 attribute: NSLayoutAttributeRight
                                                                multiplier: 1.0
                                                                  constant: 0.0];
    [self.view addConstraint:rightCons];
    return rightCons;
}//- (NSLayoutConstraint*) PlaceSubViewWithTheSameSizeAsSuperView: (UIView*) view

-(void) LoadHomePage{
    //Creating Homepage
    self.homePage = [HomePage new];
    [self.view addSubview: self.homePage];
    //Placing the Homepage
    [self PlaceSubViewWithTheSameSizeAsSuperView: self.homePage];
    
    //Creating Add Sign
    self.addSign = [AddSign new];
    [self.homePage addSubview: self.addSign];
    //Placing Add Sign
    self.addSign.translatesAutoresizingMaskIntoConstraints = NO;
    [self.homePage addConstraint:[NSLayoutConstraint constraintWithItem: self.addSign
                                                              attribute: NSLayoutAttributeTop
                                                              relatedBy: NSLayoutRelationEqual
                                                                 toItem: self.homePage
                                                              attribute: NSLayoutAttributeTop
                                                             multiplier: 1
                                                               constant: 5]];
    
    [self.homePage addConstraint:[NSLayoutConstraint constraintWithItem: self.addSign
                                                              attribute: NSLayoutAttributeRight
                                                              relatedBy: NSLayoutRelationEqual
                                                                 toItem: self.homePage
                                                              attribute: NSLayoutAttributeRight
                                                             multiplier: 1
                                                               constant: 10]];
    
    [self.addSign addConstraint:[NSLayoutConstraint constraintWithItem: self.addSign
                                                             attribute: NSLayoutAttributeHeight
                                                             relatedBy: NSLayoutRelationEqual
                                                                toItem: nil
                                                             attribute: NSLayoutAttributeNotAnAttribute
                                                            multiplier: 1.0
                                                              constant: 30.0]];
    
    [self.addSign addConstraint:[NSLayoutConstraint constraintWithItem: self.addSign
                                                             attribute: NSLayoutAttributeWidth
                                                             relatedBy: NSLayoutRelationEqual
                                                                toItem: nil
                                                             attribute: NSLayoutAttributeNotAnAttribute
                                                            multiplier: 1.0
                                                              constant: 30.0]];
    
    //Creating the alarm list
    self.alarmList = [AlarmList new];
    [self.homePage addSubview: self.alarmList];
    //Placing alarm list
    self.alarmList.translatesAutoresizingMaskIntoConstraints = NO;
    [self.homePage addConstraint:[NSLayoutConstraint constraintWithItem: self.alarmList
                                                              attribute: NSLayoutAttributeTop
                                                              relatedBy: NSLayoutRelationEqual
                                                                 toItem: self.homePage
                                                              attribute: NSLayoutAttributeTop
                                                             multiplier: 1
                                                               constant: 5]];
    
    [self.homePage addConstraint:[NSLayoutConstraint constraintWithItem: self.alarmList
                                                              attribute: NSLayoutAttributeLeft
                                                              relatedBy: NSLayoutRelationEqual
                                                                 toItem: self.homePage
                                                              attribute: NSLayoutAttributeLeft
                                                             multiplier: 1
                                                               constant: 5]];
    
    [self.alarmList addConstraint:[NSLayoutConstraint constraintWithItem: self.alarmList
                                                               attribute: NSLayoutAttributeHeight
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: nil
                                                               attribute: NSLayoutAttributeNotAnAttribute
                                                              multiplier: 1.0
                                                                constant: 30.0]];
    
    [self.alarmList addConstraint:[NSLayoutConstraint constraintWithItem: self.alarmList
                                                               attribute: NSLayoutAttributeWidth
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: nil
                                                               attribute: NSLayoutAttributeNotAnAttribute
                                                              multiplier: 1.0
                                                                constant: 30.0]];
    
    //Creating the alarm text
    self.alarmText = [AlarmText new];
    [self.homePage addSubview: self.alarmText];
    //Placing alarm text
    self.alarmText.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.alarmText
                                                          attribute: NSLayoutAttributeCenterX
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeCenterX
                                                         multiplier: 1.0f
                                                           constant: 0.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.alarmText
                                                          attribute: NSLayoutAttributeCenterY
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeCenterY
                                                         multiplier: 1.0f
                                                           constant: -7.0f]];
    [self.alarmText addConstraint:[NSLayoutConstraint constraintWithItem: self.alarmText
                                                               attribute: NSLayoutAttributeHeight
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: nil
                                                               attribute: NSLayoutAttributeNotAnAttribute
                                                              multiplier: 1.0
                                                                constant: 76.0f]];
    [self.alarmText addConstraint:[NSLayoutConstraint constraintWithItem: self.alarmText
                                                               attribute: NSLayoutAttributeWidth
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: nil
                                                               attribute: NSLayoutAttributeNotAnAttribute
                                                              multiplier: 1.0
                                                                constant: 250.0f]];
    //Set in this function because the text so far had not been loaded, therefore it did not exist
    self.timeChanged.alarmText = self.alarmText;
    
    //Creating the SecondsBar
    self.secondsBar = [SecondsBar new];
    [self.homePage addSubview: self.secondsBar];
    //Placing the SecondsBarself
    self.secondsBar.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.secondsBar
                                                          attribute: NSLayoutAttributeTop
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.alarmText
                                                          attribute: NSLayoutAttributeBottom
                                                         multiplier: 1.0f
                                                           constant: 0.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.secondsBar
                                                          attribute: NSLayoutAttributeCenterX
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeCenterX
                                                         multiplier: 1.0f
                                                           constant: 0.0f]];
    [self.secondsBar addConstraint:[NSLayoutConstraint constraintWithItem: self.secondsBar
                                                                attribute: NSLayoutAttributeHeight
                                                                relatedBy: NSLayoutRelationEqual
                                                                   toItem: nil
                                                                attribute: NSLayoutAttributeNotAnAttribute
                                                               multiplier: 1.0
                                                                 constant: 5.0f]];
    [self.secondsBar addConstraint:[NSLayoutConstraint constraintWithItem: self.secondsBar
                                                                attribute: NSLayoutAttributeWidth
                                                                relatedBy: NSLayoutRelationEqual
                                                                   toItem: nil
                                                                attribute: NSLayoutAttributeNotAnAttribute
                                                               multiplier: 1.0
                                                                 constant: 250.0f]];
    self.timeChanged.secondsBar = self.secondsBar;
    
    /**********After all the views have loaded and have been drawn, the gesture recognizers will be loaded**********/
    //GR = GestureRecognizer
    //Add new alarms
    //3 gestures because it is assigned to 3 different views and a UIGestureRecoginer can only be attached to one view
    UITapGestureRecognizer* tapNewAlarmGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(LoadNewAlarmViewController:)];
    tapNewAlarmGR.delegate = self;
    tapNewAlarmGR.numberOfTapsRequired = 1;
    tapNewAlarmGR.numberOfTouchesRequired = 1;
    UIScreenEdgePanGestureRecognizer* edgePanNewAlarmGR = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(LoadNewAlarmViewController:)];
    edgePanNewAlarmGR.delegate = self;
    edgePanNewAlarmGR.edges = UIRectEdgeRight;
    
    [self.addSign addGestureRecognizer: tapNewAlarmGR];
    [self.view addGestureRecognizer: edgePanNewAlarmGR];
    self.right = edgePanNewAlarmGR;
    
    UITapGestureRecognizer* tapNewAlarmTimeGR = [[UITapGestureRecognizer alloc] initWithTarget:self.AC action:@selector(PlayWakeUp)];
    tapNewAlarmTimeGR.delegate = self;
    tapNewAlarmTimeGR.numberOfTapsRequired = 1;
    tapNewAlarmTimeGR.numberOfTouchesRequired = 1;
    [self.alarmText addGestureRecognizer: tapNewAlarmTimeGR];
    
    UITapGestureRecognizer* tapNewAlarmBarGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(LoadNewAlarmViewController:)];
    tapNewAlarmBarGR.delegate = self;
    tapNewAlarmBarGR.numberOfTapsRequired = 1;
    tapNewAlarmBarGR.numberOfTouchesRequired = 1;
    [self.secondsBar addGestureRecognizer: tapNewAlarmBarGR];
    
    //List Alarms
    UITapGestureRecognizer* tapListAlarmsGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(LoadListViewController:)];
    tapListAlarmsGR.delegate = self;
    tapListAlarmsGR.numberOfTapsRequired = 1;
    tapListAlarmsGR.numberOfTouchesRequired = 1;
    UIScreenEdgePanGestureRecognizer* edgePanListAlarmsGR = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(LoadListViewController:)];
    edgePanListAlarmsGR.delegate = self;
    edgePanListAlarmsGR.edges = UIRectEdgeLeft;
    
    [self.alarmList addGestureRecognizer: tapListAlarmsGR];
    [self.view addGestureRecognizer: edgePanListAlarmsGR];
    self.left = edgePanListAlarmsGR;
    
    self.slideToTurnOff = [[SlideView alloc] init];
    self.slideToTurnOff.frame = self.background.frame;
    //[self.view addSubview:self.slideToTurnOff];
}//-(void) LoadHomePage

-(void) LoadNewAlarmViewController: (UIGestureRecognizer*) gesture {
    if (gesture.state == UIGestureRecognizerStateBegan || [gesture isKindOfClass:[UITapGestureRecognizer class]]) {
        //Creating the View Controller
        self.createNewAlarmViewController = [NewAlarmViewController new];
        [self addChildViewController: self.createNewAlarmViewController];
        self.createNewAlarmViewController.alarmHour = [GetTimeInFormat GetTimeInFormat: TF_HOUR_12_FORMAT];
        self.createNewAlarmViewController.alarmMinute = [GetTimeInFormat GetTimeInFormat: TF_MINUTE_FORMAT];
        self.createNewAlarmViewController.alarmAmpm = [GetTimeInFormat GetTimeInFormat: TF_AMPM_FORMAT];
        
        //Creating transition for the new View Controller and the old homepage view
        CATransition *transition = [CATransition animation];
        transition.duration = VIEWCONTROLLERANIMATIONTIMECHANGE;
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromRight;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        //Adding the transition
        [self.createNewAlarmViewController.view.layer addAnimation:transition forKey:nil];
        [self.view addSubview: self.createNewAlarmViewController.view];
        self.createNewAlarmViewController.delegate = self;
        //Index set to -1 so that NewAlarmViewController calls Confirm here and not in ListAlarmsViewController
        self.createNewAlarmViewController.index = -1;
        
        [UIView animateWithDuration: VIEWCONTROLLERANIMATIONTIMECHANGE
                         animations:^{
                             self.homePage.transform = CGAffineTransformTranslate(self.homePage.transform, -self.view.bounds.size.width, 0);
                             [self.homePage setNeedsLayout];
                         } completion:^(BOOL finished) {
                             [self.homePage removeFromSuperview];
                         }];
        
        //Removing the pan gestures, they still work since this view controller still exists under the other one
        [self.view removeGestureRecognizer: self.left];
        [self.view removeGestureRecognizer: self.right];
        [self.view removeGestureRecognizer: self.up];
        [self UnLoadSettingsViewController];
        self.createNewAlarmViewControllerRightCons = [self PlaceSubViewWithTheSameSizeAsSuperView: self.createNewAlarmViewController.view];
    }else if(gesture.state == UIGestureRecognizerStateCancelled){
        [self UnLoadNewViewController];
        [self LoadSettingsViewController];
    }
}//-(void) LoadNewAlarmViewController

-(void) UnLoadNewViewController {
    [self.createNewAlarmViewController.view addConstraint:[NSLayoutConstraint constraintWithItem: self.createNewAlarmViewController.view
                                                                                       attribute: NSLayoutAttributeWidth
                                                                                       relatedBy: NSLayoutRelationEqual
                                                                                          toItem: nil
                                                                                       attribute: NSLayoutAttributeNotAnAttribute
                                                                                      multiplier: 1.0
                                                                                        constant: self.view.frame.size.width]];
    [self.view removeConstraint:createNewAlarmViewControllerRightCons];
    
    [UIView animateWithDuration:VIEWCONTROLLERANIMATIONTIMECHANGE
                     animations:^{
                         self.createNewAlarmViewController.view.transform = CGAffineTransformTranslate(self.createNewAlarmViewController.view.transform, (self.createNewAlarmViewController.view.frame.size.width), 0);
                     } completion:^(BOOL finished) {
                         [self.createNewAlarmViewController.view removeFromSuperview];
                         [self.createNewAlarmViewController removeFromParentViewController];
                         self.createNewAlarmViewController = nil;
                     }];
    
    [self LoadHomePage];
    //Creating transition for the new homepage which was just created
    CATransition *transitionLoad = [CATransition animation];
    transitionLoad.duration = VIEWCONTROLLERANIMATIONTIMECHANGE;
    transitionLoad.type = kCATransitionPush;
    transitionLoad.subtype = kCATransitionFromLeft;
    transitionLoad.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //Adding the transition
    [self.homePage.layer addAnimation:transitionLoad forKey:nil];
    //Adding homepage as subview
    [self.view addSubview: self.homePage];
    
    //Adding the pan gestures, they were removed before in LoadNewViewController
    [self.view addGestureRecognizer: self.left];
    [self.view addGestureRecognizer: self.right];
    
    [self LoadSettingsViewController];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [self SaveAndNotifications];
    });
}//-(void) UnLoadNewViewController

-(void) LoadListViewController: (UIGestureRecognizer*) gesture {
    if ((gesture.state == UIGestureRecognizerStateBegan) || [gesture isKindOfClass:[UITapGestureRecognizer class]]) {
        //Creating the View Controller
        self.listAlarmsViewController = [ListAlarmsViewController new];
        [self addChildViewController: self.listAlarmsViewController];
        
        //Creating transition for the new View Controller and the old homepage view
        CATransition *transition = [CATransition animation];
        transition.duration = VIEWCONTROLLERANIMATIONTIMECHANGE;
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromLeft;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        //Adding the transition
        [self.listAlarmsViewController.view.layer addAnimation:transition forKey:nil];
        [self.view addSubview: self.listAlarmsViewController.view];
        //Setting the alarms list
        self.listAlarmsViewController.alarms = self.alarms;
        //Setting ListAlarms delegate
        self.listAlarmsViewController.delegate = self;
        //Setting alarms FileHandler
        self.listAlarmsViewController.handler = self.handler;
        
        [UIView animateWithDuration: VIEWCONTROLLERANIMATIONTIMECHANGE
                         animations:^{
                             self.homePage.transform = CGAffineTransformTranslate(self.homePage.transform, self.view.bounds.size.width, 0);
                             [self.homePage setNeedsLayout];
                         } completion:^(BOOL finished) {
                             [self.homePage removeFromSuperview];
                         }];
        
        //Removing the pan gestures, they still work since this view controller still exists under the other one
        [self.view removeGestureRecognizer: self.left];
        [self.view removeGestureRecognizer: self.right];
        [self.view removeGestureRecognizer: self.up];
        
        [self UnLoadSettingsViewController];
        self.listAlarmsViewControllerRightCons = [self PlaceSubViewWithTheSameSizeAsSuperView: self.listAlarmsViewController.view];
    }else if(gesture.state == UIGestureRecognizerStateCancelled){
        [self UnLoadListViewController];
        [self LoadSettingsViewController];
    }
}//-(void) LoadListViewController

-(void) UnLoadListViewController {
    //Saving alarms
    [self.handler writeAlarms: self.alarms];
    
    //Adding a width constraint and removing the horizontal constraint so that the view slides off screen
    [self.listAlarmsViewController.view addConstraint:[NSLayoutConstraint constraintWithItem: self.listAlarmsViewController.view
                                                                                   attribute: NSLayoutAttributeWidth
                                                                                   relatedBy: NSLayoutRelationEqual
                                                                                      toItem: nil
                                                                                   attribute: NSLayoutAttributeNotAnAttribute
                                                                                  multiplier: 1.0
                                                                                    constant: self.view.frame.size.width]];
    [self.view removeConstraint:self.listAlarmsViewControllerRightCons];
    
    //Creating animation to send view off screen
    [UIView animateWithDuration:VIEWCONTROLLERANIMATIONTIMECHANGE
                     animations:^{
                         self.listAlarmsViewController.view.transform = CGAffineTransformTranslate(self.listAlarmsViewController.view.transform, -(self.listAlarmsViewController.view.frame.size.width), 0);
                     } completion:^(BOOL finished) {
                         self.alarms = self.listAlarmsViewController.alarms;
                         [self.listAlarmsViewController.view removeFromSuperview];
                         [self.listAlarmsViewController removeFromParentViewController];
                         self.listAlarmsViewController= nil;
                     }];
    
    //Loading home page
    [self LoadHomePage];
    //Creating transition for the new homepage which was just created
    CATransition *transitionLoad = [CATransition animation];
    transitionLoad.duration = VIEWCONTROLLERANIMATIONTIMECHANGE;
    transitionLoad.type = kCATransitionPush;
    transitionLoad.subtype = kCATransitionFromRight;
    transitionLoad.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //Adding the transition
    [self.homePage.layer addAnimation:transitionLoad forKey:nil];
    //Adding homepage as subview
    [self.view addSubview: self.homePage];
    
    [self LoadSettingsViewController];
    
    //Adding the pan gestures, they were removed before in LoadNewViewController
    [self.view addGestureRecognizer: self.left];
    [self.view addGestureRecognizer: self.right];
}//-(void) UnLoadListViewController

-(void) LoadSettingsViewController {
    //Creating the settings sign
    self.settingsSign = [SettingsSign new];
    [self.homePage addSubview: self.settingsSign];
    self.settingsSign.delegate = self;
    //Placing settings sign
    self.settingsSign.translatesAutoresizingMaskIntoConstraints = NO;
    [self.homePage addConstraint:[NSLayoutConstraint constraintWithItem: self.settingsSign
                                                              attribute: NSLayoutAttributeBottom
                                                              relatedBy: NSLayoutRelationEqual
                                                                 toItem: self.homePage
                                                              attribute: NSLayoutAttributeBottom
                                                             multiplier: 1
                                                               constant: 10]];//Negative because it needs to be moved up
    
    [self.homePage addConstraint:[NSLayoutConstraint constraintWithItem: self.settingsSign
                                                              attribute: NSLayoutAttributeCenterX
                                                              relatedBy: NSLayoutRelationEqual
                                                                 toItem: self.homePage
                                                              attribute: NSLayoutAttributeCenterX
                                                             multiplier: 1
                                                               constant: 0]];
    
    [self.homePage addConstraint:[NSLayoutConstraint constraintWithItem: self.settingsSign
                                                              attribute: NSLayoutAttributeWidth
                                                              relatedBy: NSLayoutRelationEqual
                                                                 toItem: self.homePage
                                                              attribute: NSLayoutAttributeWidth
                                                             multiplier: 1.0
                                                               constant: 0.0]];
    
    [self.settingsSign addConstraint:[NSLayoutConstraint constraintWithItem: self.settingsSign
                                                                  attribute: NSLayoutAttributeHeight
                                                                  relatedBy: NSLayoutRelationEqual
                                                                     toItem: nil
                                                                  attribute: NSLayoutAttributeNotAnAttribute
                                                                 multiplier: 1.0
                                                                   constant: 30.0]];
    
    //Creating the viewController
    self.settingsViewController = [SettingsViewController new];
    self.settingsViewController.AC = self.AC;
    [self addChildViewController: self.settingsViewController];
    [self.view addSubview:self.settingsViewController.view];
    self.settingsViewController.settingsHandler = self.settingsHandler;
    
    //Settings
    UIPanGestureRecognizer* panSettingsGR = [[UIPanGestureRecognizer alloc] initWithTarget:self.settingsSign action:@selector(handlePan:)];
    panSettingsGR.delegate = self.settingsSign;
    
    [panSettingsGR setMaximumNumberOfTouches:1];
    [panSettingsGR setMinimumNumberOfTouches:1];
    [panSettingsGR setDelegate:self];
    [panSettingsGR setDelaysTouchesBegan:NO];
    [panSettingsGR setDelaysTouchesEnded:NO];
    [panSettingsGR setCancelsTouchesInView:NO];
    
    [self.settingsSign addGestureRecognizer: panSettingsGR];
    self.up = panSettingsGR;
    
    //Custom constraints since the viewController is loaded under the screen not on it and the height is smaller than the screen
    self.settingsViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.settingsViewController.view
                                                          attribute: NSLayoutAttributeLeft
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.background
                                                          attribute: NSLayoutAttributeLeft
                                                         multiplier: 1.0
                                                           constant: 0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.settingsViewController.view
                                                          attribute: NSLayoutAttributeRight
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.background
                                                          attribute: NSLayoutAttributeRight
                                                         multiplier: 1.0
                                                           constant: 0.0]];

    self.settingsViewControllerTopCons = [NSLayoutConstraint constraintWithItem: self.settingsViewController.view
                                                                      attribute: NSLayoutAttributeTop
                                                                      relatedBy: NSLayoutRelationEqual
                                                                         toItem: self.background
                                                                      attribute: NSLayoutAttributeBottom
                                                                     multiplier: 1.0
                                                                       constant: 0.0];
    [self.view addConstraint: self.settingsViewControllerTopCons];
    self.settingsSign.settingsViewControllerCons = self.settingsViewControllerTopCons;
    self.settingsViewControllerPanTopCons = [NSLayoutConstraint constraintWithItem: self.settingsViewController.view
                                                                         attribute: NSLayoutAttributeTop
                                                                         relatedBy: NSLayoutRelationEqual
                                                                            toItem: self.settingsSign
                                                                         attribute: NSLayoutAttributeBottom
                                                                        multiplier: 1.0
                                                                          constant: 0];
    self.settingsSign.settingsViewControllerPanCons = self.settingsViewControllerPanTopCons;
    [self.settingsViewController.view addConstraint:[NSLayoutConstraint constraintWithItem: self.settingsViewController.view
                                                                                 attribute: NSLayoutAttributeHeight
                                                                                 relatedBy: NSLayoutRelationEqual
                                                                                    toItem: nil
                                                                                 attribute: NSLayoutAttributeNotAnAttribute
                                                                                multiplier: 1.0
                                                                                  constant: self.view.frame.size.height]];
}//-(void) LoadSettingsViewController

-(void) UnLoadSettingsViewController {
#pragma mark WRITE_SETTINGS_TO_FILE
    [self.settingsViewController.view removeFromSuperview];
    [self.settingsViewController removeFromParentViewController];
    self.settingsViewController.AC = nil;
    self.settingsViewController = nil;
    
    [self.settingsSign removeFromSuperview];
    [self.settingsSign removeGestureRecognizer: self.up];
    self.up = nil;
    self.settingsSign = nil;
}//-(void) UnLoadSettingsViewController

- (void) ClearNotifications{
    UIApplication* app = [UIApplication sharedApplication];
    [app cancelAllLocalNotifications];
}//- (void) ClearNotifications

#pragma mark Finish_SetLocalNotification

-(void) SetLocalSoon{
    if (!self.upYet && !self.completed) {
        NSDate *notUpYet = [NSDate dateWithTimeIntervalSinceNow: 120];
        int counterLimit = 2;
        NSCalendar *cal = [NSCalendar currentCalendar];
        
        for (int counter = 0; counter < counterLimit; ++counter) {
            //Setting up notification
            UILocalNotification *alert = [[UILocalNotification alloc] init];
            alert.timeZone = [NSTimeZone systemTimeZone];
            alert.fireDate = notUpYet;
            alert.repeatCalendar = cal;
            alert.repeatInterval = NSCalendarUnitMinute;
            alert.soundName = self.fadeSoundName;
            alert.applicationIconBadgeNumber += 10;
            switch (self.settingsHandler.indexForTurnOffStyle) {
                case 0:
                    alert.alertBody = @"Time to wake up!";
                    break;
                    
                case 1:
                    alert.alertBody = @"Open the app and shake.";
                    break;
                    
                case 2:
                    alert.alertBody = @"Open the app and walk.";
                    break;
                    
                default:
                    break;
            }
            
            [[UIApplication sharedApplication] scheduleLocalNotification: alert];
            
            //Updating the date
            NSDate *tempTime = [NSDate dateWithTimeInterval:30 sinceDate: notUpYet];
            notUpYet = tempTime;
        }
    }
}//-(void) SetLocalSoon

-(void) SetLocalNotification{
    //alert == notification, I used alert in this fuction so that name confliction does not occur
    //Counter to count upto 64, so that limit is not crossed
    //How the alarms will be setup (1+32+16+8+4+2+1)
    int alertCounter  = 0;
    //Limit of notification that will be setup by the alarms
    const int alertLimit = 61;
    //Cancelling all local notification so that new ones can be set up without any interference from the old ones
    [self ClearNotifications];
    
    //Setting up new notifications
    self.sortedArray = [self SortAlarms: self.alarms];
    
    //Getting Info thats needed in general
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDate *today = [NSDate date];
    
    NSInteger year = [cal component:NSCalendarUnitYear fromDate:today];
    NSInteger month = [cal component:NSCalendarUnitMonth fromDate:today];
    NSInteger date = [cal component:NSCalendarUnitDay fromDate:today];
    NSInteger hour = [cal component:NSCalendarUnitHour fromDate:today];
    NSInteger minute = [cal component:NSCalendarUnitMinute fromDate:today];
    long long minutesInCurrentTime = ((hour * 60) + minute);
    if (minutesInCurrentTime >= 1440) {
        minutesInCurrentTime = 0;
    }
#pragma mark YAY_OR_NAY
    //Setting up nightly alarms to open the app
    //Will be at 8 every night
    NSDateComponents *nightTimeAlertComps = [[NSDateComponents alloc] init];
    nightTimeAlertComps.year = year;
    nightTimeAlertComps.month = month;
    if (minutesInCurrentTime > 1200) {
        nightTimeAlertComps.day = (date + 1);
    } else{
        nightTimeAlertComps.day = date;
    }
    nightTimeAlertComps.hour = 20;//8:00 PM
    nightTimeAlertComps.minute = 0;//8:00 PM
    NSDate *nightTime = [cal dateFromComponents:nightTimeAlertComps];
    
    UILocalNotification *nightTimeAlert = [[UILocalNotification alloc] init];
    nightTimeAlert.timeZone = [NSTimeZone systemTimeZone];
    nightTimeAlert.fireDate = nightTime;
    nightTimeAlert.repeatCalendar = cal;
    nightTimeAlert.repeatInterval = NSCalendarUnitDay;
    nightTimeAlert.alertBody = @"Please open Awake before going to bed tonight.";
    nightTimeAlert.soundName = UILocalNotificationDefaultSoundName;
    
    //[[UIApplication sharedApplication] scheduleLocalNotification: nightTimeAlert];
    //Incrementing alarmCounter because the first alarm has been set
    //++alertCounter;

    //Creating a new array in which alarms for which the time has passed will be set up for nextDay
    NSMutableArray *savedForLater = [[NSMutableArray alloc] initWithCapacity: self.alarms.count];
    
    //Starting the alerts creation process
    for (int counter = 0; (alertCounter <= (alertLimit/*alertCounter is aleardy 1 when it reaches this point*/)) && (counter < self.sortedArray.count/*In case the number of alarms is smaller than the number of alarms that can be setup*/); ++counter) {
        if (minutesInCurrentTime > [[self.sortedArray objectAtIndex:counter] ReturnInMinutes]) {/*&& ([[self.sortedArray objectAtIndex:counter] wakeUp] == YES)*/
            [savedForLater addObject: [self.sortedArray objectAtIndex:counter]];
        } else if([[self.sortedArray objectAtIndex:counter] ReturnInMinutes] != minutesInCurrentTime){
            //Setting up time here so that it doesnt need to be set up in
            NSDateComponents *alertComps = [[NSDateComponents alloc] init];
            alertComps.year = year;
            alertComps.month = month;
            alertComps.day = date;
            alertComps.hour = [(AlarmHolder*)[self.sortedArray objectAtIndex:counter] Return24Hour];
            alertComps.minute = [(AlarmHolder*)[self.sortedArray objectAtIndex:counter] minute];
            alertComps.second = 0;
            
            NSDate *timeForAlert = [cal dateFromComponents:alertComps];
            
            /*****if ([[self.sortedArray objectAtIndex:counter] wakeUp] == NO) {
             NSDate *minsLater = [NSDate dateWithTimeInterval:(self.minutesTillItRingsAgain * 60) sinceDate:timeForAlert];
             timeForAlert = minsLater;
             }*****/
            
            if ([(AlarmHolder*)[self.sortedArray objectAtIndex:counter] on] == YES) {
                static int secondaryCounterLimit = 2;
#pragma mark Fix_Alert_Bodies
                for (int secondaryCounter = 0; (secondaryCounter < secondaryCounterLimit)&& (alertCounter < (alertLimit + 2)); ++secondaryCounter) {
                    //Setting up notification
                    UILocalNotification *alert = [[UILocalNotification alloc] init];
                    alert.timeZone = [NSTimeZone systemTimeZone];
                    alert.fireDate = timeForAlert;
                    alert.repeatCalendar = cal;
                    alert.repeatInterval = NSCalendarUnitMinute;
                    alert.soundName = self.fadeSoundName;
                    alert.userInfo = [NSDictionary dictionaryWithObject:[(AlarmHolder*)[self.sortedArray objectAtIndex:counter] description] forKey:@"id"];
                    alert.alertBody = @"Time to wake up!";
                    alert.applicationIconBadgeNumber++;
                    
#pragma mark FINISH
                    if(([(AlarmHolder*)[self.sortedArray objectAtIndex:counter] WeekBased] == NO) || [(AlarmHolder*)[self.sortedArray objectAtIndex:counter] ActiveOnThisDay: [self DayOfWeekFromDate: alert.fireDate]]){
                        [[UIApplication sharedApplication] scheduleLocalNotification: alert];
                    }
                    
                    //Updating the date
                    NSDate *tempTime = [NSDate dateWithTimeInterval:30 sinceDate:timeForAlert];
                    timeForAlert = tempTime;
                    ++alertCounter;
                }
                //[[self.sortedArray objectAtIndex:counter] setWakeUp: YES];
                if (([(AlarmHolder*)[self.sortedArray objectAtIndex:counter] WeekBased] == YES)) {
                    [savedForLater addObject:[self.sortedArray objectAtIndex:counter]];
                }
            }
        }
    }
    savedForLater = [self SortAlarms:savedForLater];
    //Updating variables for nextDay, month and year are updated in case the day changed
    NSDate *nextDay = [NSDate dateWithTimeInterval:86400/*86400 seconds in one day*/ sinceDate:today];
    year = [cal component:NSCalendarUnitYear fromDate:nextDay];
    month = [cal component:NSCalendarUnitMonth fromDate:nextDay];
    date = [cal component:NSCalendarUnitDay fromDate:nextDay];
    
    BOOL deactiveNonWeekBasedAlerts = NO;//deactive alerts for non week based alarms so the bug doesn't occur of repeating daily alarms and not moving onto the weekly alarms
    NSDate *twoWeeksFromNow = [NSDate dateWithTimeIntervalSinceNow: 1209600];//Two weeks from now
    while ((savedForLater.count != 0) && (alertCounter < alertLimit) && ([cal component:NSCalendarUnitDay fromDate:nextDay] != [cal component:NSCalendarUnitDay fromDate:twoWeeksFromNow])) {
        //Starting the alerts creation process
        for (int counter = 0; (alertCounter < (alertLimit/*alertCounter is already 1 when it reaches this point*/)) && (counter < savedForLater.count/*In case the number of alarms is smaller than the number of alarms that can be setup*/); ++counter) {
            //Setting up time here so that it doesnt need to be set up in
            NSDateComponents *alertComps = [[NSDateComponents alloc] init];
            alertComps.year = year;
            alertComps.month = month;
            alertComps.day = date;
            alertComps.hour = [(AlarmHolder*)[savedForLater objectAtIndex:counter] Return24Hour];
            alertComps.minute = [(AlarmHolder*)[savedForLater objectAtIndex:counter] minute];
            alertComps.second = 0;
            
            NSDate *timeForAlert = [cal dateFromComponents:alertComps];
            if (([(AlarmHolder*)[savedForLater objectAtIndex:counter] on] == YES)) {
                //If 11 alerts are setup per minute, then (1+(11*5)) = 56, so to save the 64th alert for the warning,
                static int secondaryCounterLimit = 2;
                for (int secondaryCounter = 0; (secondaryCounter < secondaryCounterLimit)/*11 alerts per minutes because the last one of the 11 will ring at 55 seconds*/ && (alertCounter < alertLimit); ++secondaryCounter) {
                    //Setting up notification
                    UILocalNotification *alert = [[UILocalNotification alloc] init];
                    alert.timeZone = [NSTimeZone systemTimeZone];
                    alert.fireDate = timeForAlert;
                    alert.repeatCalendar = cal;
                    alert.repeatInterval = NSCalendarUnitMinute;
                    alert.alertBody = @"Time to wake up!";
                    alert.soundName = self.fadeSoundName;
                    alert.userInfo = [NSDictionary dictionaryWithObject:[(AlarmHolder*)[savedForLater objectAtIndex:counter] description] forKey:@"id"];
                    alert.applicationIconBadgeNumber++;
                    
                    if((!deactiveNonWeekBasedAlerts && ([(AlarmHolder*)[savedForLater objectAtIndex:counter] WeekBased] == NO)) || [(AlarmHolder*)[savedForLater objectAtIndex:counter] ActiveOnThisDay: [self DayOfWeekFromDate: alert.fireDate]]){
                        [[UIApplication sharedApplication] scheduleLocalNotification: alert];
                    }
                    
                    //Updating the date
                    NSDate *tempTime = [NSDate dateWithTimeInterval:30 sinceDate:timeForAlert];
                    timeForAlert = tempTime;
                    ++alertCounter;
                }
                //[[self.sortedArray objectAtIndex:counter] setWakeUp: YES];
            }
        }
        //Updating variables for nextDay, month and year are updated in case the day changed
        nextDay = [NSDate dateWithTimeInterval:86400/*86400 seconds in one day*/ sinceDate:nextDay];
        year = [cal component:NSCalendarUnitYear fromDate:nextDay];
        month = [cal component:NSCalendarUnitMonth fromDate:nextDay];
        date = [cal component:NSCalendarUnitDay fromDate:nextDay];
        deactiveNonWeekBasedAlerts = YES;//deactiving daily alarms
    }
}//-(void) SetLocalNotification

-(NSString*) DayOfWeekFromDate: (NSDate*) date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"c"];// day number, like 7 for saturday
    NSString *dayOfWeekNumber = [dateFormatter stringFromDate: date];
    
    return dayOfWeekNumber;
}//-(NSString*) DayOfWeekFromDate: (NSDate*) date

-(void) RunShake{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [self ShakeToWake];
    });
}//-(void) RunShake

-(void) RunWalk{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [self WalkToWake];
    });
}//-(void) RunWalk

-(void) WalkToWake{
    __block int volumeDecreaseLoopNumber = 0;
    __block NSNumber *lastSteps;
    [self.AC PlayWakeUp];
    self.cmPedometer = [[CMPedometer alloc] init];
    self.startDate = [NSDate date];
    if ([CMPedometer isStepCountingAvailable]) {
        while (!completed) {
            NSDate *rightNow = [NSDate date];
            [self.cmPedometer queryPedometerDataFromDate:self.startDate toDate:rightNow withHandler:^(CMPedometerData *pedometerData, NSError *error) {
                NSNumber *steps = pedometerData.numberOfSteps;
                NSLog(@"STEPS: %@", steps);
                [self ProgressUpdateWithSteps: [steps doubleValue]];
                if ([lastSteps doubleValue] == [steps doubleValue]) {
                    self.AC.constantVolume = NO;
                    self.AC.increaseVolume = YES;
                    self.AC.decreaseVolume = NO;
                    [self.AC FullVolume];
                    volumeDecreaseLoopNumber = 0;
                }else if(volumeDecreaseLoopNumber < 2){
                    self.AC.constantVolume = NO;
                    self.AC.increaseVolume = NO;
                    self.AC.decreaseVolume = YES;
                    [self.AC FadeVolume];
                } else {
                    self.AC.constantVolume = YES;
                    self.AC.increaseVolume = NO;
                    self.AC.decreaseVolume = NO;
                }
                [self.AC FadeVolume];
                lastSteps = steps;
            }];
            [NSThread sleepForTimeInterval: 0.30f];///////confirm
        }
    }else{
        NSLog(@"Step Count: Not Available");
    }
    [self.AC StopWakeUp];
}//-(void) WalkToWake

-(void) ShakeToWake{
    //Getting manager to start work
    NSLog(@"SHAKE: BEGIN");
    [self.AC PlayWakeUp];
    CMMotionManager *manager = [[CMMotionManager alloc] init];
    [manager startAccelerometerUpdates];
    CMAccelerometerData *lastData = manager.accelerometerData;
    [NSThread sleepForTimeInterval:0.30f];
    
    //Go into a loop until shake to wake is completed
    while (!completed) {
        CMAccelerometerData *data = manager.accelerometerData;
        if ([self ConfirmAboveShakeLevelWithLast:lastData current:data]) {
            //The parameter is -20 to indicate that the shake level has been reached and walk to wake has not been activated
            [self ProgressUpdateWithSteps:-20];
        }
        lastData = data;
        [self.AC FullVolume];
        [NSThread sleepForTimeInterval:0.30f];
    }
    [self.AC StopWakeUp];
}//-(void) ShakeToWake

-(BOOL) ConfirmAboveShakeLevelWithLast:(CMAccelerometerData*) last current:(CMAccelerometerData*) data{
    double lastX = last.acceleration.x;
    double lastY = last.acceleration.y;
    double lastZ = last.acceleration.z;
    
    double x = data.acceleration.x;
    double y = data.acceleration.y;
    double z = data.acceleration.z;
    
    double deltaX = fabs(lastX - x);
    double deltaY = fabs(lastY - y);
    double deltaZ = fabs(lastZ - z);
    
    if ((deltaX > shakeLevel) || (deltaX > shakeLevel) || (deltaY > shakeLevel)) {
        NSLog(@"Shaking: deltaX = %f, deltaY = %f, deltaZ = %f", deltaX, deltaY, deltaZ);
        
    }
    return (deltaX > shakeLevel) || (deltaX > shakeLevel) || (deltaY > shakeLevel);
}//-(BOOL) ConfirmAboveShakeLevelWithLast:(CMAccelerometerData*) last current:(CMAccelerometerData*) data

-(void) ProgressUpdateWithSteps: (double) steps{
    //Negative steps are here to indicate that wake to walk has not been activated and the shake level has been reached
    if (steps > -1) {
        self.percentDone = (steps/numberOfSteps) * 100;
    } else{
        self.percentDone += 3;
    }
    if (self.percentDone >= 100) {
        self.percentDone = 0;
        self.completed = YES;
        self.upYet = YES;
        [self SaveAndNotifications];
    }
}//-(void) ProgressUpdateWithSteps: (double) steps

-(void) SaveAndNotifications{
    [self SetLocalNotification];
    [self.handler writeAlarms: self.alarms];
}//-(void) SaveAndNotifications

/*****Delegate Methods*****/

-(void) Confirm{
    //Creating new alarm and putting it to with the other alarms
    int hour = [self.createNewAlarmViewController.hour.timeUnitValue.string intValue];
    int minute = [self.createNewAlarmViewController.minute.timeUnitValue.string intValue];
    NSString* ampm = self.createNewAlarmViewController.ampm.timeUnitValue.string;
    
    AlarmHolder* newAlarm = [[AlarmHolder alloc] initWithHour:hour andMinute:minute withAMPM:ampm withAlarmOn:YES];
    newAlarm.sun = self.createNewAlarmViewController.sun.on;
    newAlarm.mon =  self.createNewAlarmViewController.mon.on;
    newAlarm.tues = self.createNewAlarmViewController.tues.on;
    newAlarm.wed = self.createNewAlarmViewController.wed.on;
    newAlarm.thurs = self.createNewAlarmViewController.thurs.on;
    newAlarm.fri = self.createNewAlarmViewController.fri.on;
    newAlarm.sat = self.createNewAlarmViewController.sat.on;
    
    [self.alarms addObject:newAlarm];
    //Saving alarms to file
    [self.handler writeAlarms: self.alarms];
    
    [self UnLoadNewViewController];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [self SaveAndNotifications];
    });
}//-(void) Confirm

-(void) Cancel{
    [self UnLoadNewViewController];
}//-(void) Cancel

-(void) ConfirmWithIndex: (NSUInteger) index{
    //Will never be called, just to make ARC warning go away
}//-(void) ConfirmWithIndex: (long long) index

-(NSMutableArray*) SortAlarms: (NSMutableArray*) toBeSorted{
    NSMutableArray *sorted = [NSMutableArray arrayWithArray:[toBeSorted sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        long long aMinutes = [(AlarmHolder *)a ReturnInMinutes];
        long long bMinutes = [(AlarmHolder *)b ReturnInMinutes];
        
        //Calculating the correct return value
        if (aMinutes < bMinutes) {
            return NO;
        }else{
            return YES;
        }
    }]];//sortedArray = [NSMutableArray arrayWithArray:[self.alarms sortedArrayUsingComparator:^NSComparisonResult(id a, id b)
    return sorted;
}//-(void) SortAlarms

-(void) ChangeConsForPan{
    [self.view removeConstraint:self.settingsViewControllerTopCons];
    [self.view addConstraint:self.settingsViewControllerPanTopCons];
    self.settingsSign.settingsViewController = self.settingsViewController;
}//-(void) ChangeConsForPan

-(void) RemoveEdgePanGestures{
    [self.view removeGestureRecognizer: left];
    [self.view removeGestureRecognizer: right];
}//-(void) RemoveEdgePanGestures

-(void) AddEdgePanGesture{
    [self.view addGestureRecognizer: left];
    [self.view addGestureRecognizer: right];
}//-(void) AddEdgePanGesture

//Gesture recognizer delegate methods
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    // return
    return true;
}//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer

@end//@implementation ViewController
