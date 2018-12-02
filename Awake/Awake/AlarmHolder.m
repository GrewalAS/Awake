//
//  AlarmHolder.m
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-08.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import "AlarmHolder.h"

@implementation AlarmHolder

@synthesize on;
//@synthesize wakeUp;
@synthesize tempOn;

@synthesize sun;
@synthesize mon;
@synthesize tues;
@synthesize wed;
@synthesize thurs;
@synthesize fri;
@synthesize sat;

-(id) init{
    return (self = [super init]);
}//-(id) init

-(id) initWithHour:(int) _hour andMinute:(int) _minute withAMPM:(NSString*) _ampm withAlarmOn:(BOOL) _on{
    if( self = [super initWithHour:_hour andMinute:_minute withAMPM:_ampm]){
        self.on = _on;
        //self.wakeUp = YES;//Will only be modified later when the alarm rings the first time.
                          //This will be used when the alarms rings the second time to indicate that its time to start walking
    }
    return self;
}//-(id) initWithHour:(int) _hour andMinute:(int) _minute withAMPM:(NSString*) _ampm withAlarmOn:(BOOL) _on

-(id) initWithHour:(int) _hour andMinute:(int) _minute {
    NSString *ampmPass = nil;
    if( self = [super initWithHour:_hour andMinute:_minute withAMPM: ampmPass]){
        
    }
    return self;
}//-(id) initWithHour:(int) _hour andMinute:(int) _minute {

-(id) initWithCoder:(NSCoder *) decoder{
    self = [super initWithCoder: decoder];
    self.on = [[decoder decodeObjectForKey: AH_ON] boolValue];
    self.sun = [[decoder decodeObjectForKey: AH_SUN] boolValue];
    self.mon = [[decoder decodeObjectForKey: AH_MON] boolValue];
    self.tues = [[decoder decodeObjectForKey: AH_TUES] boolValue];
    self.wed = [[decoder decodeObjectForKey: AH_WED] boolValue];
    self.thurs = [[decoder decodeObjectForKey: AH_THURS] boolValue];
    self.fri = [[decoder decodeObjectForKey: AH_FRI] boolValue];
    self.sat = [[decoder decodeObjectForKey: AH_SAT] boolValue];
    
    return self;
}//-(id) initWithCoder:(NSCoder *) decoder

-(void) encodeWithCoder:(NSCoder *) coder{
    [super encodeWithCoder:coder];
    [coder encodeObject:[NSNumber numberWithBool: self.on] forKey: AH_ON];
    [coder encodeObject:[NSNumber numberWithBool: self.sun] forKey: AH_SUN];
    [coder encodeObject:[NSNumber numberWithBool: self.mon] forKey: AH_MON];
    [coder encodeObject:[NSNumber numberWithBool: self.tues] forKey: AH_TUES];
    [coder encodeObject:[NSNumber numberWithBool: self.wed] forKey: AH_WED];
    [coder encodeObject:[NSNumber numberWithBool: self.thurs] forKey:AH_THURS];
    [coder encodeObject:[NSNumber numberWithBool: self.fri] forKey: AH_FRI];
    [coder encodeObject:[NSNumber numberWithBool: self.sat] forKey: AH_SAT];
}//-(void) encodeWithCoder:(NSCoder *) coder

-(int) Return24Hour{
    NSDateFormatter *dateFor = [[NSDateFormatter alloc] init];
    dateFor.dateFormat = @"hh:mm a";
    NSDate *date12Hour;
    NSString *date12HourString;
    if (self.hour < 10) {
        date12HourString = [NSString  stringWithFormat:@"0%d:%d %@", self.hour, self.minute, self.ampm];
        date12Hour = [dateFor dateFromString:date12HourString];
    } else if (self.minute < 10){
        date12HourString = [NSString  stringWithFormat:@"%d:0%d %@", self.hour, self.minute, self.ampm];
        date12Hour = [dateFor dateFromString:date12HourString];
    } else if ((self.hour < 10) && (self.minute < 10)){
        date12HourString = [NSString  stringWithFormat:@"0%d:0%d %@", self.hour, self.minute, self.ampm];
        date12Hour = [dateFor dateFromString:date12HourString];
    } else{
        date12HourString = [NSString  stringWithFormat:@"%d:%d %@", self.hour, self.minute, self.ampm];
        date12Hour = [dateFor dateFromString:date12HourString];
    }
    
    dateFor.dateFormat = @"HH";
    NSString *hourString = [dateFor stringFromDate: date12Hour];
    
    return [hourString intValue];
}//-(int) Return24Hour

-(long long) ReturnInMinutes{
    //Converting all properties to minutes
    //AM will be 0
    //PM will be 720 minutes
    //Hours will be 60 minutes each because an hour has 60 minutes
    //Minutes will of course remain the same
    
    //Assigning the mintues
    const int hourMinutes = 60;
    int minutesSum = 0;
    
    int Hour24 = [self Return24Hour];
    
    minutesSum = (Hour24 * hourMinutes);
    minutesSum += self.minute;
    
    //12:00 AM, so its 0
    if (minutesSum == 1440) {
        minutesSum = 0;
    }
    
    return minutesSum;
}//-(long long) ReturnInMinutes

-(BOOL) WeekBased{
    BOOL repeating;
    if ((self.sun == YES) || (self.mon == YES) || (self.tues) || (self.wed) || (self.thurs) || (self.fri) || (self.sat)) {
        repeating = YES;
    } else {
        repeating = NO;
    }
    return repeating;
}//-(BOOL) WeekBased

-(BOOL) ActiveOnThisDay:(NSString*) day{
    int dayNumber = [day intValue];
    
    switch (dayNumber) {
        case 1:
            if (self.sun == YES) {
                return YES;
            }
            break;
            
        case 2:
            if (self.mon == YES) {
                return YES;
            }
            break;
            
        case 3:
            if (self.tues == YES) {
                return YES;
            }
            break;
            
        case 4:
            if (self.wed == YES) {
                return YES;
            }
            break;
            
        case 5:
            if (self.thurs == YES) {
                return YES;
            }
            break;
            
        case 6:
            if (self.fri == YES) {
                return YES;
            }
            break;
            
        case 7:
            if (self.sat == YES) {
                return YES;
            }
            break;
            
        default:
            return NO;
            break;
    }
    return NO;
}//-(BOOL) ActiveOnThisDay:(NSString*) day

- (NSString *)description{
    return [NSString stringWithFormat:@"%d:%d %@ ON:%d SUN:%d MON:%d TUES:%d WED:%d THRUS:%d FRI:%d SAT:%d", self.hour, self.minute, self.ampm, self.on, self.sun, self.mon, self.tues, self.wed, self.thurs, self.fri, self.sat];
}//- (NSString *)description

@end//@implementation AlarmHolder
