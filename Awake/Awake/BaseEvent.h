//
//  BaseEvent.h
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-08.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define BE_HOUR @"hour"
#define BE_MINUTE @"minute"
#define BE_AMPM @"ampm"

//Class will never be created or its methods called
//It is only here to act as a unifying factor across all model classes and it is the only reason it exists

@interface BaseEvent : NSObject <NSCoding>

@property (nonatomic) int hour;
@property (nonatomic) int minute;
@property (nonatomic, retain) NSString* ampm;

-(id) init;
-(id) initWithHour:(int) _hour andMinute:(int) _minute withAMPM:(NSString*) _ampm;

@end//@interface BaseEvent : NSObject <NSCoding>
