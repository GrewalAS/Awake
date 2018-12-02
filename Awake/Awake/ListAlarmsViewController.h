//
//  ListAlarmsViewController.h
//  Awake
//
//  Created by Amrinder Grewal on 2014-11-20.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <NotificationCenter/NotificationCenter.h>

#import "Colors.h"
#import "AddSign.h"
#import "NA_ConfirmSign.h"
#import "TableAlarmCell.h"
#import "ViewController.h"
#import "NewAlarmViewController.h"
#import "FileHandler.h"
#import "NA_WeekUnit.h"

#import "AnimationDefines.h"

@class ListAlarmsViewController;

@protocol ListAlarmsViewController <NSObject>

@optional
-(void) SaveAndNotifications;

@end//@protocol ListAlarmsViewController <NSObject>

@interface ListAlarmsViewController : UIViewController<UIGestureRecognizerDelegate, NewAlarmViewController, UITableViewDelegate, UITableViewDataSource, SWTableViewCellDelegate>

-(void) LoadNewAlarmViewControllerWithHour: (NSString*)hour minute:(NSString*)minute andAMPM:(NSString*)ampm;

@property UIView* content;
@property UIView* banner;
@property UILabel* screenLabel;

@property AddSign *addSign;
@property NA_ConfirmSign *confirmSign;
@property FileHandler *handler;
@property UITableView* table;

@property NewAlarmViewController *editAlarms;

@property (retain) NSMutableArray *alarms;
@property NSLayoutConstraint *editAlarmsRightCons;

@property id delegate;

@end//@interface ListAlarmsViewController : UIViewController<UIGestureRecognizerDelegate, NewAlarmViewController, UITableViewDelegate, UITableViewDataSource, 
