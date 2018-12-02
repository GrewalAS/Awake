//
//  SettingsPlistHandler.h
//  Awake
//
//  Created by Amrinder Grewal on 2015-02-10.
//  Copyright (c) 2015 Amrinder Grewal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>

#define UD_FIRSTLAUNCH @"firstLaunch"
#define UD_INDEXFORTURNOFFSTYLE @"indexForTurnOffStyle"
#define UD_STEPSREQUIREDTOTURNOFF @"stepsRequiredToTurnOff"
#define UD_SHAKELEVEL @"shakeLevel"
#define UD_VOLUME @"volume"
#define UD_SOUND @"sound"
#define UD_SONGURL @"songURL"
#define UD_SONGNAME @"songName"

@interface SettingsPlistHandler : NSObject

@property (nonatomic) NSNumber *firstLaunch;
@property (nonatomic) NSInteger indexForTurnOffStyle;
@property (nonatomic) NSInteger stepsRequiredToTurnOff;
@property (nonatomic) float shakeLevel;
@property (nonatomic) float volume;
@property (nonatomic, retain) NSString *sound;
@property (nonatomic) NSURL *songURL;
@property (nonatomic, retain) NSString *songName;

-(void) SaveUserDefaults;
-(void) ReadUserDefaults;

@end//@interface SettingsPlistHandler : NSObject
