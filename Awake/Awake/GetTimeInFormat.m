//
//  GetTimeInFormat.m
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-08.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import "GetTimeInFormat.h"

@implementation GetTimeInFormat

+(NSString*) GetTimeInFormat:(NSString*) _format{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:_format];
    return [dateFormatter stringFromDate: [NSDate date]];
}//+(NSString*) GetTimeInFormat:(NSString*) _format

@end//@implementation GetTimeInFormat
