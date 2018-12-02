//
//  AppDelegate.m
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-08.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end//@interface AppDelegate ()

@implementation AppDelegate

@synthesize alarms;
@synthesize handler;
@synthesize holder;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch
    //Reading from file
    self.handler = [[FileHandler alloc] init];
    self.alarms = [self.handler readAlarms];

    //Creating the window and setting the color
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    //Creating and adding the view controller
    ViewController *rootViewController = [[ViewController alloc] init];
    rootViewController.alarms = self.alarms;
    self.window.rootViewController = rootViewController;
    //Creating AudioController
    self.AC = [[AudioController alloc] init];
    [(ViewController*)self.window.rootViewController setAC:self.AC];
    rootViewController.handler = self.handler;
    //Making the window visible and making the reciever the key window
    [self.window makeKeyAndVisible];
    
    //Creating the settingsHandler
    self.settingsHandler = [[SettingsPlistHandler alloc] init];
    [self.settingsHandler ReadUserDefaults];
    //Settings settingsHandler for rootViewController
    [(ViewController*)self.window.rootViewController setSettingsHandler: self.settingsHandler];
    [[(ViewController*)self.window.rootViewController settingsViewController] setSettingsHandler: self.settingsHandler];
    //Finishing set up for alarms and notifications
    [(ViewController*)self.window.rootViewController setUpYet:YES];
    [(ViewController*)self.window.rootViewController setCompleted:YES];
    [(ViewController*)self.window.rootViewController setPercentDone: 0];
    //Reading from settingsHandler
    [(ViewController*)self.window.rootViewController setNumberOfSteps: (int)self.settingsHandler.stepsRequiredToTurnOff];
    [(ViewController*)self.window.rootViewController setShakeLevel: self.settingsHandler.shakeLevel];
#pragma mark CREATE_CLASS_TO_GET_FADE_FROM_STANDARD
    [(ViewController*)self.window.rootViewController setFadeSoundName:@"wakeFadeTemp.aif"];
    //Setting the settingsHandler for audioController(AC)
    self.AC.settingsHandler = self.settingsHandler;
    if (self.AC.settingsHandler.songURL != nil) {
        self.AC.settingsHandler.songURL = self.settingsHandler.songURL;
    }
    
    //Checking and getting permssion
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil];
        [application registerUserNotificationSettings:settings];
    }
    
    UILocalNotification *localNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if (localNotification || (application.applicationIconBadgeNumber > 0)) {
        [self ReceivedNotification:localNotification andApplication:application];
    }
    
    return YES;
}//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions

- (void)application:(UIApplication*)application didReceiveLocalNotification:(UILocalNotification *)notification{
    [self ReceivedNotification:notification andApplication:application];
}//- (void)application:(UIApplication*)application didReceiveLocalNotification:(UILocalNotification *)notification

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        {case 0:
            [(ViewController*)self.window.rootViewController ClearNotifications];
            if (self.settingsHandler.indexForTurnOffStyle == 1) {
                [self setUpYetandCompletedForMoreTime];
                [(ViewController*)self.window.rootViewController RunShake];
            } else if (self.settingsHandler.indexForTurnOffStyle == 2) {
                [self setUpYetandCompletedForMoreTime];
                [(ViewController*)self.window.rootViewController RunWalk];
            } else{
                [(ViewController*)self.window.rootViewController setUpYet: YES];
                [(ViewController*)self.window.rootViewController setCompleted: YES];
                [self.AC StopWakeUp];
            }
            break;}
            
        {case 1:
            [(ViewController*)self.window.rootViewController ClearNotifications];
            [(ViewController*)self.window.rootViewController SaveAndNotifications];
            [(ViewController*)self.window.rootViewController setUpYet: NO];
            [(ViewController*)self.window.rootViewController setCompleted: NO];
            [(ViewController*)self.window.rootViewController SetLocalSoon];
            [self.AC StopWakeUp];
            break;}
            
        {default:
            break;}
    }
}//-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex

-(void) setUpYetandCompletedForMoreTime{
    [(ViewController*)self.window.rootViewController setUpYet: YES];
    [(ViewController*)self.window.rootViewController setCompleted: NO];
}//-(void) setUpYetandCompletedForMoreTime

-(void) ReceivedNotification: (UILocalNotification *)notification andApplication: (UIApplication*)application{
    [(ViewController*)self.window.rootViewController setCompleted: NO];
    if((!self.alert.visible && ([notification.alertBody isEqualToString: @"Time to wake up!"])) || (application.applicationIconBadgeNumber > 0)){
        UIAlertView *alertView;
        if (self.settingsHandler.indexForTurnOffStyle == 0) {
            alertView =
            [[UIAlertView alloc] initWithTitle:notification.alertAction
                                       message:notification.alertBody
                                      delegate:nil
                             cancelButtonTitle:nil
                             otherButtonTitles:NSLocalizedString(@"I'm Up", nil), nil];
            [application setApplicationIconBadgeNumber: 0];
        } else{
            alertView =
            [[UIAlertView alloc] initWithTitle:notification.alertAction
                                       message:notification.alertBody
                                      delegate:nil
                             cancelButtonTitle:nil
                             otherButtonTitles:NSLocalizedString(@"I'm Up", nil), NSLocalizedString(@"Give me 2 mins", nil), nil];
            [application setApplicationIconBadgeNumber: 0];
        }
        /**********FIX THIS**********/
        alertView.delegate = self;
        
        self.alert = alertView;
        [alertView show];
        [(ViewController*)self.window.rootViewController SaveAndNotifications];
    }else if([notification.alertBody isEqualToString: @"Open the app and shake."] || ((self.settingsHandler.indexForTurnOffStyle == 1) && (application.applicationIconBadgeNumber >= 10))){
        if (application.applicationState == UIApplicationStateActive) {
            [self setUpForShakeOrWalk];
            [(ViewController*)self.window.rootViewController RunShake];
            [application setApplicationIconBadgeNumber: 0];
        }
    } else if ([notification.alertBody isEqualToString: @"Open the app and walk."] || ((self.settingsHandler.indexForTurnOffStyle == 2) && (application.applicationIconBadgeNumber >= 10))){
        if (application.applicationState == UIApplicationStateActive) {
            [self setUpForShakeOrWalk];
            [(ViewController*)self.window.rootViewController RunWalk];
            [application setApplicationIconBadgeNumber: 0];
        }
    }
    [self.AC PlayWakeUp];
    //[self TurnOffNonRepeatWithNotification: notification];
}//-(void) ReceivedNotification: (UILocalNotification *)notification andApplication: (UIApplication*)application

-(void) setUpForShakeOrWalk{
    [(ViewController*)self.window.rootViewController ClearNotifications];
    [(ViewController*)self.window.rootViewController setUpYet: YES];
    [(ViewController*)self.window.rootViewController setCompleted: NO];
}//-(void) setUpForShakeOrWalk

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:
    [[(ViewController*)self.window.rootViewController handler] writeAlarms: self.alarms];
    if ((([(ViewController*)self.window.rootViewController completed] == NO) && ([(ViewController*)self.window.rootViewController upYet] == YES)) || (self.alert.visible)) {//Notification will start ringing immediatly, so [(ViewController*)self.window.rootViewController SaveAndNotifications]; is not needed
        NSDate *timeForAlert = [NSDate date];
        int counterLimit = 2;
        NSCalendar *cal = [NSCalendar currentCalendar];
        
        for (int counter = 0; counter < counterLimit; ++counter) {
            //Setting up notification
            UILocalNotification *alert = [[UILocalNotification alloc] init];
            alert.timeZone = [NSTimeZone systemTimeZone];
            alert.fireDate = timeForAlert;
            alert.repeatCalendar = cal;
            alert.repeatInterval = NSCalendarUnitMinute;
            alert.soundName = [(ViewController*)self.window.rootViewController fadeSoundName];
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
            NSDate *tempTime = [NSDate dateWithTimeInterval:30 sinceDate:timeForAlert];
            timeForAlert = tempTime;
        }
    } else {
        [(ViewController*)self.window.rootViewController SaveAndNotifications];
        [(ViewController*)self.window.rootViewController SetLocalSoon];
    }
    NSArray *nots = [[UIApplication sharedApplication] scheduledLocalNotifications];
    NSLog(@"%@", nots);
}//- (void)applicationWillTerminate:(UIApplication *)application

-(void) TurnOffNonRepeatWithNotification: (UILocalNotification*) notification{
    for (int i = 0; i < self.alarms.count; ++i) {
        if (([[notification.userInfo objectForKey:@"id"] isEqualToString:[[self.alarms objectAtIndex:i] description]]) && ([[self.alarms objectAtIndex:i] WeekBased] == NO)) {
            [(AlarmHolder*)[self.alarms objectAtIndex:i] setOn: NO];
            NSLog(@"%@", (AlarmHolder*)[self.alarms objectAtIndex:i]);
        }
    }
}//-(void) TurnOffNonRepeatWithNotification: (UILocalNotification*) notification

/******************************************************************************/
/********************Useless cause multitasking is disabled********************/
/******************************************************************************/
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}//- (void)applicationWillResignActive:(UIApplication *)application

/******************************************************************************/
/********************Useless cause multitasking is disabled********************/
/******************************************************************************/
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}//- (void)applicationDidEnterBackground:(UIApplication *)application

/******************************************************************************/
/********************Useless cause multitasking is disabled********************/
/******************************************************************************/
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}//- (void)applicationWillEnterForeground:(UIApplication *)application

/******************************************************************************/
/********************Useless cause multitasking is disabled********************/
/******************************************************************************/
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}//- (void)applicationDidBecomeActive:(UIApplication *)application

@end//@implementation AppDelegate
