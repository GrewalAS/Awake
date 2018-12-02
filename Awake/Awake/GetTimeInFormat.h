//
//  GetTimeInFormat.h
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-08.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TF_AMPM_FORMAT @"a"
#define TF_SECONDS_FORMAT @"ss"
#define TF_HOUR_FORMAT @"HH"
#define TF_HOUR_12_FORMAT @"hh"
#define TF_MINUTE_FORMAT @"mm"

@interface GetTimeInFormat : NSObject

+(NSString*) GetTimeInFormat:(NSString*) _format;

@end//@interface GetTimeInFormat : NSObject
