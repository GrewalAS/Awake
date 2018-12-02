//
//  SleepMusic.h
//  Awake
//
//  Created by Amrinder Grewal on 2015-02-24.
//  Copyright (c) 2015 Amrinder Grewal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "AudioController.h"
#import "Colors.h"

@class  SleepMusic;

@protocol SleepMusic <NSObject>

-(void) SetUpForSleepMusic;

@end//@protocol SleepMusic <NSObject>

@interface SleepMusic : UIView

@property id delegate;

@property UILabel *volumeLabel;

/*@property UIImageView* play;
@property UIImageView* pause;
@property UIImageView* back;
@property UIImageView* skip;*/

@property UISlider *volumeSlider;

@property UIImageView* volDown;
@property UIImageView *volUp;

@end//@interface SleepMusic : UIView
