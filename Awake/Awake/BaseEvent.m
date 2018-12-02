//
//  BaseEvent.m
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-08.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import "BaseEvent.h"

//Class will never be created or its methods called
//It is only here to act as a unifying factor across all model classes and it is the only reason it exists

@implementation BaseEvent

@synthesize hour;
@synthesize minute;
@synthesize ampm;

-(id) init{
    return (self = [super init]);
}//-(id) init

-(id) initWithHour:(int) _hour andMinute:(int) _minute withAMPM:(NSString*) _ampm{
    if (self = [super init]) {
        self.hour = _hour;
        self.minute = _minute;
        self.ampm = _ampm;
    }
    return self;
}//-(id) initWithTime: (NSDate*) _time

-(id) initWithCoder:(NSCoder *) decoder{
    if (self = [super init]) {
        self.hour = [[decoder decodeObjectForKey: BE_HOUR] intValue];
        self.minute = [[decoder decodeObjectForKey: BE_MINUTE] intValue];
        self.ampm = [decoder decodeObjectForKey: BE_AMPM];
    }
    return self;
}//-(id) initWithCoder:(NSCoder *) decoder

-(void) encodeWithCoder:(NSCoder *) coder{
    [coder encodeObject:[NSNumber numberWithInt:self.hour] forKey:BE_HOUR];
    [coder encodeObject:[NSNumber numberWithInt:self.minute] forKey:BE_MINUTE];
    [coder encodeObject:self.ampm forKey:BE_AMPM];
}//-(void) encodeWithCoder:(NSCoder *) coder

@end//@implementation BaseEventxr
