//
//  AudioController.h
//  Awake
//
//  Created by Amrinder Grewal on 2015-01-10.
//  Copyright (c) 2015 Amrinder Grewal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import "SettingsPlistHandler.h"

@interface AudioController : NSObject <AVAudioPlayerDelegate>

@property (atomic, retain) MPVolumeView *volumeView;
@property (atomic, retain) UISlider *volumeSlider;
@property (nonatomic, retain) NSString *sound;
@property (atomic, retain) AVAudioPlayer *audioPlayer;

//Volume controls
@property (atomic) BOOL increaseVolume;
@property (atomic) BOOL decreaseVolume;
@property (atomic) BOOL constantVolume;

@property SettingsPlistHandler *settingsHandler;

-(id) init;

-(void) PlayWakeUp;
-(void) StopWakeUp;

-(void) FullVolume;
-(void) NoVolume;
-(void) FadeVolume;

@end//@interface AudioController : NSObject
