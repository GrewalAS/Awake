//
//  FileReader.m
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-16.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import "FileHandler.h"

@implementation FileHandler

@synthesize directoryPathString;

-(id) init{
    if (self = [super init]) {
        self.directoryPathString = [self GetDirectoryURL];
    }
    return self;
}//-(id) init

//Files are read and written using NSKeyedArchiver and NSKeyedUnarchiver
//This is due to the fact that AlarmHolder is a custom class

-(NSMutableArray*) readAlarms{
    NSMutableArray* alarms = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithFile: self.directoryPathString]];
    if (!alarms) {
        NSLog(@"ERROR: ALARMS COULD NOT BE READ FROM FILE");
        alarms = [NSMutableArray arrayWithCapacity: 24];
    }
    return alarms;
}//-(NSArray*) readFile

-(void) writeAlarms: (NSArray*) alarms{
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath: self.directoryPathString];
    
    if (!fileExists) {
        BOOL success = [[NSFileManager defaultManager] createFileAtPath:self.directoryPathString contents:nil attributes:nil];
        if (!success) {
            NSLog(@"ERROR: FILE COULD NOT BE CREATED");
        }
    }
    
    BOOL success = [NSKeyedArchiver archiveRootObject:alarms toFile: self.directoryPathString];
    
    if (!success) {
        NSLog(@"ERROR: ALARMS COULD NOT BE WRITTEN TO FILE");
    }
}//-(void) writeFile: (NSArray*) alarms

-(NSString*) GetDirectoryURL{//Created to prevent code duplication and to prevent mistakes with
    //Get to the directory called Application Supoort
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //Add the file name to the directory name
    NSString *pathString = [[pathArray objectAtIndex:0] stringByAppendingPathComponent:@"Trial.txt"];
    //Return the parth to the directory
    return pathString;
}//-(NSURL*) GetFileLocation

@end//@implementation FileHandler
