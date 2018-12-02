//
//  FileReader.h
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-16.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileHandler : NSObject

@property NSString* directoryPathString;

-(id) init;
-(NSMutableArray*) readAlarms;
-(void) writeAlarms: (NSArray*) alarms;
-(NSString*) GetDirectoryURL;

@end//@interface FileHandler : NSObject
