//
//  AudioController.m
//  Awake
//
//  Created by Amrinder Grewal on 2015-01-10.
//  Copyright (c) 2015 Amrinder Grewal. All rights reserved.
//

#import "AudioController.h"

@implementation AudioController

@synthesize volumeView;
@synthesize volumeSlider;
@synthesize sound;
@synthesize audioPlayer;

//Volume controls
@synthesize increaseVolume;
@synthesize decreaseVolume;
@synthesize constantVolume;

@synthesize settingsHandler;

-(id) init{
    if (self = [super init]){
        self.volumeView = [[MPVolumeView alloc] init];
        self.volumeView.showsVolumeSlider = NO;
        // Find the MPVolumeSlider
        for (UIView *view in [volumeView subviews]){
            if ([[[view class] description] isEqualToString:@"MPVolumeSlider"]) {
                self.volumeSlider = (UISlider*)view;
            }
        }
        AVAudioSession* audioSession = [AVAudioSession sharedInstance];
        
        [audioSession setActive:YES error:nil];
        [audioSession addObserver:self
                       forKeyPath:@"outputVolume"
                          options:0
                          context:nil];
    }
    return self;
}//-(id) init

-(void) PlayWakeUp{
    NSURL *urlForFile = nil;
    if (self.settingsHandler.songURL != nil) {
        urlForFile = self.settingsHandler.songURL;
    } else{
        NSString *path = [[NSBundle mainBundle] pathForResource: self.settingsHandler.sound ofType:nil];
        urlForFile = [NSURL URLWithString:path];
    }
    
    NSError *error;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: urlForFile error: &error];
    self.audioPlayer.volume = 0.0;
    self.audioPlayer.delegate = self;
    [self.audioPlayer setNumberOfLoops:-1]; // -1 for the forever looping
    //AVAudioSession is to fix the issue that was being caused due to the music not playing when in silent/vibrate mode
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive: YES error: nil];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    //Preping to play then playing
    [self.audioPlayer prepareToPlay];
    [self.audioPlayer play];
    
    self.volumeSlider.value = 1.0;
    self.increaseVolume = YES;
    self.decreaseVolume = NO;
    self.constantVolume = NO;
    [self NoVolume];
    [self FadeVolume];
}//-(void) PlayWakeUp

-(void) StopWakeUp{
    if (self.audioPlayer != nil) {
        self.constantVolume = NO;
        self.increaseVolume = NO;
        self.decreaseVolume = YES;
        [self FadeVolume];
    }
}//-(void) StopWakeUp

-(void) FullVolume{
    if (self.audioPlayer != nil) {
        self.audioPlayer.volume = (self.settingsHandler.volume/100);
    }
}//-(void) FullVolume

-(void) NoVolume{
    if (self.audioPlayer != nil) {
        self.audioPlayer.volume = 0;
    }
}//-(void) NoVolume

-(void) FadeVolume{
    if (self.audioPlayer != nil) {
        if ((self.increaseVolume == YES) && (self.constantVolume == NO)) {
            if (self.audioPlayer.volume < (self.settingsHandler.volume/100)) {
                self.audioPlayer.volume += 0.025;//Check
                [self performSelector:@selector(FadeVolume) withObject:nil afterDelay:0.1];
            }
        } else if ((self.decreaseVolume == YES) && (self.constantVolume == NO)){
            if (self.audioPlayer.volume > 0) {
                self.audioPlayer.volume -= 0.025;
                [self performSelector:@selector(FadeVolume) withObject:nil afterDelay:0.1];
            } else{
                [self.audioPlayer stop];
                self.audioPlayer = nil;
            }
        }
    }
}//-(void) FadeVolume

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqual:@"outputVolume"]) {
        if ((self.audioPlayer != nil) && (self.audioPlayer.playing)) {
            self.volumeSlider.value = 1.0;
        }
    }
}

@end//@implementation AudioController
