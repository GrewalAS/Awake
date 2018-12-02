//
//  SleepMusic.m
//  Awake
//
//  Created by Amrinder Grewal on 2015-02-24.
//  Copyright (c) 2015 Amrinder Grewal. All rights reserved.
//

#import "SleepMusic.h"

@implementation SleepMusic

@synthesize delegate;

@synthesize volumeLabel;

/*@synthesize play;
@synthesize pause;
@synthesize back;
@synthesize skip;*/

@synthesize volumeSlider;

@synthesize volDown;
@synthesize volUp;

-(id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {
        self.opaque = NO;
        self.userInteractionEnabled = YES;
    }
    return self;
}//-(id)initWithFrame:(CGRect)frame

- (void)drawRect:(CGRect)rect {
    //Creating the "Volume Label" title label
    self.volumeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    self.volumeLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size: 12.5];
    NSString *volumeLabelLocal = @"Alarm Volume";
    self.volumeLabel.text = volumeLabelLocal;
    self.volumeLabel.textColor = [Colors ActiveAlarmText];
    //Adding as subview and giving correct size
    [self addSubview: self.volumeLabel];
    [self.volumeLabel sizeToFit];
    //Placing it
    self.volumeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.volumeLabel
                                                     attribute: NSLayoutAttributeCenterX
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeCenterX
                                                    multiplier: 1.0
                                                      constant: 0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.volumeLabel
                                                     attribute: NSLayoutAttributeTop
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeTop
                                                    multiplier: 1.0
                                                      constant: 2.0]];
    //Creating the play sign
/*    UIImage *playImage = [UIImage imageNamed:@"play"];
    self.play = [[UIImageView alloc] initWithImage: playImage];
    self.play.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.play];
    //Placing the play sign
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.play
                                                     attribute: NSLayoutAttributeCenterX
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeCenterX
                                                    multiplier: 1.0
                                                      constant: 0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.play
                                                     attribute: NSLayoutAttributeCenterY
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeCenterY
                                                    multiplier: 1.0
                                                      constant: -10.0]];
    
    //Creating the pause sign
    UIImage *pauseImage = [UIImage imageNamed:@"pause"];
    self.pause = [[UIImageView alloc] initWithImage: pauseImage];
    self.pause.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.pause];
    //Placing the pause sign
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.pause
                                                     attribute: NSLayoutAttributeCenterX
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeCenterX
                                                    multiplier: 1.0
                                                      constant: 0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.pause
                                                     attribute: NSLayoutAttributeCenterY
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeCenterY
                                                    multiplier: 1.0
                                                      constant: -10.0]];
    
    //Creating the back sign
    UIImage *backImage = [UIImage imageNamed:@"back"];
    self.back = [[UIImageView alloc] initWithImage: backImage];
    self.back.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.back];
    //Placing the back sign
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.back
                                                     attribute: NSLayoutAttributeCenterX
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeCenterX
                                                    multiplier: 1.0
                                                      constant: -60.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.back
                                                     attribute: NSLayoutAttributeCenterY
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeCenterY
                                                    multiplier: 1.0
                                                      constant: -10.0]];
    
    //Creating the skip sign
    UIImage *skipImage = [UIImage imageNamed:@"skip"];
    self.skip = [[UIImageView alloc] initWithImage: skipImage];
    self.skip.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.skip];
    //Placing the skip sign
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.skip
                                                     attribute: NSLayoutAttributeCenterX
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeCenterX
                                                    multiplier: 1.0
                                                      constant: 60.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.skip
                                                     attribute: NSLayoutAttributeCenterY
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeCenterY
                                                    multiplier: 1.0
                                                      constant: -10.0]];*/
    
    //Creating the volumeSlider
    self.volumeSlider = [[UISlider alloc] init];
    self.volumeSlider.minimumValue = 0.0;
    self.volumeSlider.maximumValue = 100.0;
    [self addSubview: self.volumeSlider];
    //Placing the volumeSlider
    self.volumeSlider.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.volumeSlider
                                                     attribute: NSLayoutAttributeLeft
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeLeft
                                                    multiplier: 1.0
                                                      constant: 35.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.volumeSlider
                                                     attribute: NSLayoutAttributeTop
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self.volumeLabel
                                                     attribute: NSLayoutAttributeTop
                                                    multiplier: 1.0
                                                      constant: 7.50]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.volumeSlider
                                                     attribute: NSLayoutAttributeRight
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeRight
                                                    multiplier: 1.0
                                                      constant: -35.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.volumeSlider
                                                     attribute: NSLayoutAttributeBottom
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self
                                                     attribute: NSLayoutAttributeBottom
                                                    multiplier: 1.0
                                                      constant: 0.0]];
    
    //vol-slider-marker needs to be larger than 5px, so the width of the image is 20px, but the width of the slider is still 5px
    //A bug that caused the slider to stay at 0% volume was triggerd with the @"slider-marker"
    UIImage *sliderMarker = [UIImage imageNamed: @"vol-slider-marker"];
    UIImage *clearPixel = [[UIImage alloc] init];
    [self.volumeSlider setThumbImage: sliderMarker forState: UIControlStateNormal];
    [self.volumeSlider setMinimumTrackImage: clearPixel forState: UIControlStateNormal];
    [self.volumeSlider setMaximumTrackImage: clearPixel forState: UIControlStateNormal];
    
    //Creating the volDown view
    UIImage *volDownImage = [UIImage imageNamed: @"vol-down"];
    self.volDown = [[UIImageView alloc] initWithImage: volDownImage];
    [self addSubview: self.volDown];
    //Placing the volDown view
    self.volDown.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.volDown
                                                     attribute: NSLayoutAttributeCenterY
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self.volumeSlider
                                                     attribute: NSLayoutAttributeCenterY
                                                    multiplier: 1.0
                                                      constant: 1.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.volDown
                                                     attribute: NSLayoutAttributeRight
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self.volumeSlider
                                                     attribute: NSLayoutAttributeLeft
                                                    multiplier: 1.0
                                                      constant: -10.0]];
    
    //Creating the volUp view
    UIImage *volUpImage = [UIImage imageNamed: @"vol-up"];
    self.volUp = [[UIImageView alloc] initWithImage: volUpImage];
    [self addSubview: self.volUp];
    //Placing the volUp view
    self.volUp.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.volUp
                                                     attribute: NSLayoutAttributeCenterY
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self.volumeSlider
                                                     attribute: NSLayoutAttributeCenterY
                                                    multiplier: 1.0
                                                      constant: 1.00]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem: self.volUp
                                                     attribute: NSLayoutAttributeLeft
                                                     relatedBy: NSLayoutRelationEqual
                                                        toItem: self.volumeSlider
                                                     attribute: NSLayoutAttributeRight
                                                    multiplier: 1.0
                                                      constant: 10.0]];
    [self.delegate SetUpForSleepMusic];
}//- (void)drawRect:(CGRect)rect

@end//@implementation SleepMusic
