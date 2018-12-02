//
//  SettingsPlistHandler.m
//  Awake
//
//  Created by Amrinder Grewal on 2015-02-10.
//  Copyright (c) 2015 Amrinder Grewal. All rights reserved.
//

#import "SettingsPlistHandler.h"

@implementation SettingsPlistHandler

@synthesize indexForTurnOffStyle;
@synthesize stepsRequiredToTurnOff;
@synthesize shakeLevel;
@synthesize sound;
@synthesize songURL;
@synthesize songName;

-(void) SaveUserDefaults{
    NSLog(@"%ld", (long)self.indexForTurnOffStyle);
    //Store data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: self.firstLaunch forKey: UD_FIRSTLAUNCH];
    [defaults setObject: [NSNumber numberWithInteger: self.indexForTurnOffStyle] forKey: UD_INDEXFORTURNOFFSTYLE];
    [defaults setObject: [NSNumber numberWithInteger: self.stepsRequiredToTurnOff] forKey: UD_STEPSREQUIREDTOTURNOFF];
    [defaults setObject: [NSNumber numberWithFloat: self.shakeLevel] forKey: UD_SHAKELEVEL];
    [defaults setObject: [NSNumber numberWithFloat: self.volume] forKey: UD_VOLUME];
    [defaults setObject: self.sound forKey: UD_SOUND];
    [defaults setObject: self.songName forKey: UD_SONGNAME];
    
    //Can't save a NSURL in a property list so this needs to be done
    NSString *songURLString = [self.songURL absoluteString];
    [defaults setObject: songURLString forKey: UD_SONGURL];
    
    [defaults synchronize];
}//-(void) SaveUserDefaults

-(void) ReadUserDefaults{
    //Retrive Date
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    self.firstLaunch = [defaults objectForKey: UD_FIRSTLAUNCH];
    if (self.firstLaunch == nil) {
        self.firstLaunch = [NSNumber numberWithBool: NO];
        self.indexForTurnOffStyle = 0;
        self.stepsRequiredToTurnOff = 15;
        self.shakeLevel = 1;
        self.volume = 100;
#pragma mark FIX
        self.sound = @"wakeTemp.aif";
        [self SaveUserDefaults];
    } else {
        self.indexForTurnOffStyle = [[defaults objectForKey: UD_INDEXFORTURNOFFSTYLE] integerValue];
        self.stepsRequiredToTurnOff = [[defaults objectForKey: UD_STEPSREQUIREDTOTURNOFF] integerValue];
        self.shakeLevel = [[defaults objectForKey: UD_SHAKELEVEL] floatValue];
        self.volume = [[defaults objectForKey: UD_VOLUME] floatValue];
        if ([defaults objectForKey: UD_SOUND] != nil) {
            self.sound = [defaults objectForKey: UD_SOUND];
        } else{
#pragma mark FIX_WITH_REAL_NAME
            self.sound = @"wakeTemp.aif";
        }
        self.sound = [defaults objectForKey: UD_SOUND];
        if (([defaults objectForKey: UD_SONGNAME] != nil) && ([defaults objectForKey: UD_SONGURL] != nil)) {
            self.songName = [defaults objectForKey: UD_SONGNAME];
            //Extra steps required to get song back
            //Written as a string so needs to be read as a string before being converted to NSURL
            NSString *songURLString = [defaults objectForKey: UD_SONGURL];
            self.songURL = [NSURL URLWithString: songURLString];
        }
    }
}//-(void) ReadUserDefaults

//Custom Setters

-(void) setSound:(NSString *) newSound{
    sound = newSound;
    
    //So this sound is played and not the song
    songName = nil;
    songURL = nil;
}//-(void) setSound:(NSString *) newSound

@end//@implementation SettingsPlistHandler
