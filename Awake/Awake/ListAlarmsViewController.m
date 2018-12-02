//
//  ListAlarmsViewController.m
//  Awake
//
//  Created by Amrinder Grewal on 2014-11-20.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import "ListAlarmsViewController.h"

@interface ListAlarmsViewController ()

@end//@interface ListAlarmsViewController ()

@implementation ListAlarmsViewController 

@synthesize content;
@synthesize banner;
@synthesize screenLabel;

@synthesize editAlarms;

@synthesize addSign;
@synthesize confirmSign;
@synthesize handler;
@synthesize table;

@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    //Loading the ListAlarmsViewController
    [self LoadListViewController];
}//- (void)viewDidLoad

-(void) LoadListViewController{
    //So constraints work
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    //So taps work
    self.view.userInteractionEnabled = YES;
    
    self.content = [UIView new];
    [self.view addSubview: self.content];
    self.content.frame = self.view.frame;
    
    //Creating the top banner, this is where the text will go
    //[self.banner addSubview: effectView];
    self.banner = [UIView new];
    [self.content addSubview:self.banner];
    self.banner.backgroundColor = [UIColor clearColor];
    //Placing the top banner
    self.banner.translatesAutoresizingMaskIntoConstraints = NO;
    [self.content addConstraint:[NSLayoutConstraint constraintWithItem: self.banner
                                                          attribute: NSLayoutAttributeLeft
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.content
                                                          attribute: NSLayoutAttributeLeft
                                                         multiplier: 1.0
                                                           constant: 0.0]];
    [self.content addConstraint:[NSLayoutConstraint constraintWithItem: self.banner
                                                          attribute: NSLayoutAttributeRight
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.content
                                                          attribute: NSLayoutAttributeRight
                                                         multiplier: 1.0
                                                           constant: 0.0]];
    [self.content addConstraint:[NSLayoutConstraint constraintWithItem: self.banner
                                                          attribute: NSLayoutAttributeTop
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.content
                                                          attribute: NSLayoutAttributeTop
                                                         multiplier: 1.0
                                                           constant: 0.0]];
    [self.banner addConstraint:[NSLayoutConstraint constraintWithItem: self.banner
                                                            attribute: NSLayoutAttributeHeight
                                                            relatedBy: NSLayoutRelationEqual
                                                               toItem: nil
                                                            attribute: NSLayoutAttributeNotAnAttribute
                                                           multiplier: 1.0
                                                             constant: 45]];
    
    //Creating the blur effect
    UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView * viewWithBlurredBackground =[[UIVisualEffectView alloc] initWithEffect:blurEffect];
    //Creating the vibrancy effect
    UIVisualEffectView * viewInducingVibrancy =
    [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    [viewWithBlurredBackground.contentView addSubview: viewInducingVibrancy];
    viewInducingVibrancy.translatesAutoresizingMaskIntoConstraints = NO;
    [viewWithBlurredBackground addConstraint:[NSLayoutConstraint constraintWithItem: viewInducingVibrancy
                                                                          attribute: NSLayoutAttributeTop
                                                                          relatedBy: NSLayoutRelationEqual
                                                                             toItem: viewWithBlurredBackground
                                                                          attribute: NSLayoutAttributeTop
                                                                         multiplier: 1.0
                                                                           constant: 0.0]];
    [viewWithBlurredBackground addConstraint:[NSLayoutConstraint constraintWithItem: viewInducingVibrancy
                                                                          attribute: NSLayoutAttributeLeft
                                                                          relatedBy: NSLayoutRelationEqual
                                                                             toItem: viewWithBlurredBackground
                                                                          attribute: NSLayoutAttributeLeft
                                                                         multiplier: 1.0
                                                                           constant: 0.0]];
    [viewWithBlurredBackground addConstraint:[NSLayoutConstraint constraintWithItem: viewInducingVibrancy
                                                                          attribute: NSLayoutAttributeRight
                                                                          relatedBy: NSLayoutRelationEqual
                                                                             toItem: viewWithBlurredBackground
                                                                          attribute: NSLayoutAttributeRight
                                                                         multiplier: 1.0
                                                                           constant: 0.0]];
    [viewWithBlurredBackground addConstraint:[NSLayoutConstraint constraintWithItem: viewInducingVibrancy
                                                                          attribute: NSLayoutAttributeBottom
                                                                          relatedBy: NSLayoutRelationEqual
                                                                             toItem: viewWithBlurredBackground
                                                                          attribute: NSLayoutAttributeBottom
                                                                         multiplier: 1.0
                                                                           constant: 0.0]];
    //Adding the blurred background
    [self.banner addSubview: viewWithBlurredBackground];
    //Placing blurView
    viewWithBlurredBackground.translatesAutoresizingMaskIntoConstraints = NO;
    [self.banner addConstraint:[NSLayoutConstraint constraintWithItem: viewWithBlurredBackground
                                                            attribute: NSLayoutAttributeTop
                                                            relatedBy: NSLayoutRelationEqual
                                                               toItem: self.banner
                                                            attribute: NSLayoutAttributeTop
                                                           multiplier: 1.0
                                                             constant: 0.0]];
    [self.banner addConstraint:[NSLayoutConstraint constraintWithItem: viewWithBlurredBackground
                                                            attribute: NSLayoutAttributeBottom
                                                            relatedBy: NSLayoutRelationEqual
                                                               toItem: self.banner
                                                            attribute: NSLayoutAttributeBottom
                                                           multiplier: 1.0
                                                             constant: 0.0]];
    [self.banner addConstraint:[NSLayoutConstraint constraintWithItem: viewWithBlurredBackground
                                                            attribute: NSLayoutAttributeLeft
                                                            relatedBy: NSLayoutRelationEqual
                                                               toItem: self.banner
                                                            attribute: NSLayoutAttributeLeft
                                                           multiplier: 1.0
                                                             constant: 0.0]];
    [self.banner addConstraint:[NSLayoutConstraint constraintWithItem: viewWithBlurredBackground
                                                            attribute: NSLayoutAttributeRight
                                                            relatedBy: NSLayoutRelationEqual
                                                               toItem: self.banner
                                                            attribute: NSLayoutAttributeRight
                                                           multiplier: 1.0
                                                             constant: 0.0]];
    
    //Creating the middle label
    //Contents will be alarms
    self.screenLabel = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, 5, 5)];;
    self.screenLabel.textColor = [Colors MainLabelTextColor];
    self.screenLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size: 20.0];
    [self.banner addSubview: self.screenLabel];
    self.screenLabel.text = [NSString stringWithFormat:@"Alarms"];
    [self.screenLabel sizeToFit];
    //Placing the label
    self.screenLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.banner addConstraint: [NSLayoutConstraint constraintWithItem: self.screenLabel
                                                             attribute: NSLayoutAttributeCenterX
                                                             relatedBy: NSLayoutRelationEqual
                                                                toItem: self.banner
                                                             attribute: NSLayoutAttributeCenterX
                                                            multiplier: 1.0
                                                              constant: 0.0]];
    [self.banner addConstraint: [NSLayoutConstraint constraintWithItem: self.screenLabel
                                                             attribute: NSLayoutAttributeCenterY
                                                             relatedBy: NSLayoutRelationEqual
                                                                toItem: self.banner
                                                             attribute: NSLayoutAttributeCenterY
                                                            multiplier: 1.0
                                                              constant: 0.0]];
    
    //Creating the done label
    //Contents will be alarms
    //Creating the Confirm Sign
    self.confirmSign = [NA_ConfirmSign new];
    [self.banner addSubview: self.confirmSign];
    //Placing Confirm Sign
    self.confirmSign.translatesAutoresizingMaskIntoConstraints = NO;
    [self.banner addConstraint:[NSLayoutConstraint constraintWithItem: self.confirmSign
                                                          attribute: NSLayoutAttributeTop
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.banner
                                                          attribute: NSLayoutAttributeTop
                                                         multiplier: 1
                                                           constant: 5]];
    
    [self.banner addConstraint:[NSLayoutConstraint constraintWithItem: self.confirmSign
                                                          attribute: NSLayoutAttributeRight
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.banner
                                                          attribute: NSLayoutAttributeRight
                                                         multiplier: 1
                                                           constant: 10]];//Negative cause the line needs to be moved to the left
    
    [self.confirmSign addConstraint:[NSLayoutConstraint constraintWithItem: self.confirmSign
                                                                 attribute: NSLayoutAttributeHeight
                                                                 relatedBy: NSLayoutRelationEqual
                                                                    toItem: nil
                                                                 attribute: NSLayoutAttributeNotAnAttribute
                                                                multiplier: 1.0
                                                                  constant: 30.0]];
    
    [self.confirmSign addConstraint:[NSLayoutConstraint constraintWithItem: self.confirmSign
                                                                 attribute: NSLayoutAttributeWidth
                                                                 relatedBy: NSLayoutRelationEqual
                                                                    toItem: nil
                                                                 attribute: NSLayoutAttributeNotAnAttribute
                                                                multiplier: 1.0
                                                                  constant: 30.0]];
    
    //Creating Gesture Recognizer for the confirm sign
    //This time the GRs will be loaded as the view is drawn
    //Tap only
    UITapGestureRecognizer *tapConfirmGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(UnLoadSelf)];
    tapConfirmGR.delegate = self;
    tapConfirmGR.numberOfTapsRequired = 1;
    tapConfirmGR.numberOfTouchesRequired = 1;
    //Adding the gesture
    [self.confirmSign addGestureRecognizer:tapConfirmGR];
    
    //Creating Add Sign
    self.addSign = [AddSign new];
    [self.banner addSubview: self.addSign];
    //Placing Add Sign
    self.addSign.translatesAutoresizingMaskIntoConstraints = NO;
    [self.banner addConstraint:[NSLayoutConstraint constraintWithItem: self.addSign
                                                            attribute: NSLayoutAttributeTop
                                                            relatedBy: NSLayoutRelationEqual
                                                                toItem: self.banner
                                                            attribute: NSLayoutAttributeTop
                                                           multiplier: 1
                                                             constant: 6]];
    
    [self.banner addConstraint:[NSLayoutConstraint constraintWithItem: self.addSign
                                                            attribute: NSLayoutAttributeLeft
                                                            relatedBy: NSLayoutRelationEqual
                                                               toItem: self.banner
                                                            attribute: NSLayoutAttributeLeft
                                                           multiplier: 1
                                                             constant: 6]];
    
    [self.addSign addConstraint:[NSLayoutConstraint constraintWithItem: self.addSign
                                                             attribute: NSLayoutAttributeHeight
                                                             relatedBy: NSLayoutRelationEqual
                                                                toItem: nil
                                                             attribute: NSLayoutAttributeNotAnAttribute
                                                            multiplier: 1.0
                                                              constant: 15.0]];
    
    [self.addSign addConstraint:[NSLayoutConstraint constraintWithItem: self.addSign
                                                             attribute: NSLayoutAttributeWidth
                                                             relatedBy: NSLayoutRelationEqual
                                                                toItem: nil
                                                             attribute: NSLayoutAttributeNotAnAttribute
                                                            multiplier: 1.0
                                                              constant: 15.0]];
    
    //Creating Gesture Recognizer for the confirm sign
    //This time the GRs will be loaded as the view is drawn
    //Tap only
    UITapGestureRecognizer *tapAddGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(AddAlarm)];
    tapAddGR.delegate = self;
    tapAddGR.numberOfTapsRequired = 1;
    tapAddGR.numberOfTouchesRequired = 1;
    //Adding the gesture
    [self.addSign addGestureRecognizer:tapAddGR];
    
    //Creating the table
    self.table = [[UITableView alloc] init];
    self.table.delegate = self;
    self.table.dataSource = self;
    self.table.separatorColor = [UIColor clearColor];
    self.table.backgroundColor = [UIColor clearColor];
    [self.content addSubview: self.table];
    // During startup (viewDidLoad or in storyboard) do:
    self.table.allowsMultipleSelectionDuringEditing = NO;
    //[self.table registerClass:[TableAlarmCell class] forCellReuseIdentifier:@"AlarmCell"]; Cells not created when this line is not commented out
    //Placing the table
    self.table.translatesAutoresizingMaskIntoConstraints = NO;
    [self.content addConstraint: [NSLayoutConstraint constraintWithItem: self.table
                                                              attribute: NSLayoutAttributeTop
                                                              relatedBy: NSLayoutRelationEqual
                                                                 toItem: self.banner
                                                              attribute: NSLayoutAttributeBottom
                                                             multiplier: 1.0
                                                               constant: 0.0]];
    [self.content addConstraint: [NSLayoutConstraint constraintWithItem: self.table
                                                              attribute: NSLayoutAttributeBottom
                                                              relatedBy: NSLayoutRelationEqual
                                                                 toItem: self.content
                                                              attribute: NSLayoutAttributeBottom
                                                             multiplier: 1.0
                                                               constant: 0.0]];
    [self.content addConstraint: [NSLayoutConstraint constraintWithItem: self.table
                                                              attribute: NSLayoutAttributeLeft
                                                              relatedBy: NSLayoutRelationEqual
                                                                 toItem: self.content
                                                              attribute: NSLayoutAttributeLeft
                                                             multiplier: 1.0
                                                               constant: 0.0]];//Will be set in TableAlarmCell so that when the view slides, it goes to the edge of screen and not till the table cause it looks odd
    [self.content addConstraint: [NSLayoutConstraint constraintWithItem: self.table
                                                              attribute: NSLayoutAttributeRight
                                                              relatedBy: NSLayoutRelationEqual
                                                                 toItem: self.content
                                                              attribute: NSLayoutAttributeRight
                                                             multiplier: 1.0
                                                               constant: -15.0]];
    
    //Doing last minute changes
    self.table.showsHorizontalScrollIndicator = NO;
    self.table.showsVerticalScrollIndicator = NO;
    if (table.contentSize.height < table.frame.size.height) {
        table.scrollEnabled = NO;
    }
    else {
        table.scrollEnabled = YES;
    }
}//-(void) LoadListViewController

-(void) UnLoadSelf{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [self.delegate SaveAndNotifications];
    });
    [self.delegate UnLoadListViewController];
}//-(void) UnLoadSelf

-(void) AddAlarm{
    [self LoadNewAlarmViewControllerWithHour:[GetTimeInFormat GetTimeInFormat:TF_HOUR_12_FORMAT] minute:[GetTimeInFormat GetTimeInFormat:TF_MINUTE_FORMAT] andAMPM:[GetTimeInFormat GetTimeInFormat:TF_AMPM_FORMAT]];
    self.editAlarms.index = -1;
}//-(void) AddAlarm

-(void) LoadNewAlarmViewControllerWithHour: (NSString*)hour minute:(NSString*)minute andAMPM:(NSString*)ampm {
    //Creating the View Controller
    [UIView animateWithDuration: VIEWCONTROLLERANIMATIONTIMECHANGE
                     animations:^{
                         self.content.transform = CGAffineTransformTranslate(self.content.transform, self.view.bounds.size.width + 2, 0);//2 points added cause border is 2 points and to not show that, the content box needs to be moved 2 more points than the view width
                         [self.content setNeedsLayout];
                     }];

    self.editAlarms = [NewAlarmViewController new];
    [self addChildViewController: self.editAlarms];
    self.editAlarms.alarmHour = hour;
    self.editAlarms.alarmMinute = minute;
    self.editAlarms.alarmAmpm = ampm;
    
    //Creating transition for the new View Controller and the old view view
    CATransition *transition = [CATransition animation];
    transition.duration = VIEWCONTROLLERANIMATIONTIMECHANGE;
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //Adding the transition
    [self.editAlarms.view.layer addAnimation:transition forKey:nil];
    [self.view addSubview: self.editAlarms.view];
    
    self.editAlarms.delegate = self;
    
    self.editAlarmsRightCons = [self.delegate PlaceSubViewWithTheSameSizeAsSuperView: self.editAlarms.view];
}//-(void) LoadNewAlarmViewControllerWithHour: (NSString*)hour minute:(NSString*)minute andAMPM:(NSString*)ampm

-(void) UnLoadNewViewController {
    [self.handler writeAlarms:self.alarms];
    [self.editAlarms.view addConstraint:[NSLayoutConstraint constraintWithItem: self.editAlarms.view
                                                                                       attribute: NSLayoutAttributeWidth
                                                                                       relatedBy: NSLayoutRelationEqual
                                                                                          toItem: nil
                                                                                       attribute: NSLayoutAttributeNotAnAttribute
                                                                                      multiplier: 1.0
                                                                                        constant: self.view.frame.size.width]];
    [self.editAlarms.view removeConstraint: self.editAlarmsRightCons];
    [UIView animateWithDuration:VIEWCONTROLLERANIMATIONTIMECHANGE
                     animations:^{
                         self.editAlarms.view.transform = CGAffineTransformTranslate(self.editAlarms.view.transform, -(self.editAlarms.view.frame.size.width), 0);
                     } completion:^(BOOL finished) {
                         [self.editAlarms.view removeFromSuperview];
                         [self.editAlarms removeFromParentViewController];
                         self.editAlarms = nil;
                     }];
    
    //Creating transition for the new view which was just created
    CATransition *transitionLoad = [CATransition animation];
    transitionLoad.duration = VIEWCONTROLLERANIMATIONTIMECHANGE;
    transitionLoad.type = kCATransitionPush;
    transitionLoad.subtype = kCATransitionFromRight;
    transitionLoad.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //Adding the transition
    [self.content.layer addAnimation:transitionLoad forKey:nil];
    //Adding view as subview
    [self.view addSubview: self.content];
    CGRect frame = self.content.frame;
    frame.origin.x = 0;
    self.content.frame = frame;
}//-(void) UnLoadNewViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}//- (void)didReceiveMemoryWarning

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/**********Delegate Methods**********/

-(void) ConfirmWithIndex: (NSUInteger) index{
    int hour = [self.editAlarms.hour.timeUnitValue.string intValue];
    int minute = [self.editAlarms.minute.timeUnitValue.string intValue];
    NSString* ampm = self.editAlarms.ampm.timeUnitValue.string;
    
    AlarmHolder* newAlarm = [[AlarmHolder alloc] initWithHour:hour andMinute:minute withAMPM:ampm withAlarmOn:YES];
    newAlarm.sun = self.editAlarms.sun.on;
    newAlarm.mon =  self.editAlarms.mon.on;
    newAlarm.tues = self.editAlarms.tues.on;
    newAlarm.wed = self.editAlarms.wed.on;
    newAlarm.thurs = self.editAlarms.thurs.on;
    newAlarm.fri = self.editAlarms.fri.on;
    newAlarm.sat = self.editAlarms.sat.on;
    
    [self.alarms replaceObjectAtIndex:index withObject:newAlarm];
    [self.table reloadData];
    
    [self.handler writeAlarms:self.alarms];
    
    [self UnLoadNewViewController];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [self.delegate SaveAndNotifications];
    });
}//-(void) ConfirmWithIndex: (long long) index

-(void) Confirm{
    //Creating new alarm and putting it with the other alarms
    int hour = [self.editAlarms.hour.timeUnitValue.string intValue];
    int minute = [self.editAlarms.minute.timeUnitValue.string intValue];
    NSString* ampm = self.editAlarms.ampm.timeUnitValue.string;
    
    AlarmHolder* newAlarm = [[AlarmHolder alloc] initWithHour:hour andMinute:minute withAMPM:ampm withAlarmOn:YES];
    newAlarm.sun = self.editAlarms.sun.on;
    newAlarm.mon =  self.editAlarms.mon.on;
    newAlarm.tues = self.editAlarms.tues.on;
    newAlarm.wed = self.editAlarms.wed.on;
    newAlarm.thurs = self.editAlarms.thurs.on;
    newAlarm.fri = self.editAlarms.fri.on;
    newAlarm.sat = self.editAlarms.sat.on;
    
    [self.alarms addObject:newAlarm];
    [self.table reloadData];
    
    [self.handler writeAlarms:self.alarms];
    
    [self UnLoadNewViewController];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [self.delegate SaveAndNotifications];
    });
}//-(void) Confirm

-(void) Cancel{
    [self UnLoadNewViewController];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [self.delegate SaveAndNotifications];
    });
}//-(void) Cancel

-(void) SaveAndNotifications{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [self.delegate SaveAndNotifications];
    });
}//-(void) SaveAndNotifications

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    // If the gesture recognizer is a UITapGestureRecongizer, but the other
    // gesture detected is a UILongPressGestureRecognizer, require the
    // UITapGestureRecognizer to fail.
    if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]] &&
        [otherGestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]]) {
        return NO;
    } else {
        return YES;
    }
}//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer

//Table View Data Sources
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // Return the number of sections.
    return 1;
}//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // Return the number of rows in the section.
    return self.alarms.count;
}//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"AlarmCell";
    
    TableAlarmCell *cell = (TableAlarmCell*)[tableView dequeueReusableCellWithIdentifier: cellIdentifier];
    
    if (cell == nil) {
        cell = [[TableAlarmCell alloc] initWithFrame:CGRectMake(5, 5, 5, 5)];
        //Only right utility buttons will be created, no buttons will exist on the left hand side
        NSMutableArray* rightUtilityButtons = [NSMutableArray new];
        [rightUtilityButtons sw_addUtilityButtonWithColor: [Colors DeleteIconBackGround] normalIcon:[UIImage imageNamed:@"trash"] selectedIcon:[UIImage imageNamed:@"trash-selected"]];
        [cell setRightUtilityButtons:rightUtilityButtons WithButtonWidth:50.0f];
        [[[cell.rightUtilityButtons objectAtIndex:0] layer] setCornerRadius: 20.0];
        [[[cell.rightUtilityButtons objectAtIndex:0] layer] setBorderWidth: 3.0];
        [[[cell.rightUtilityButtons objectAtIndex:0] layer] setBorderColor:[[Colors DeleteIconBorder] CGColor]];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //Adding GR
    UILongPressGestureRecognizer *stateChangeGR = [[UILongPressGestureRecognizer alloc] initWithTarget:cell action:@selector(ChangeStateWithGR:)];
    stateChangeGR.minimumPressDuration = 0.250;;
    [cell.blurView addGestureRecognizer:stateChangeGR];
    
    AlarmHolder* holder = [self.alarms objectAtIndex:indexPath.row];
    int hourVal = holder.hour;
    int minVal = holder.minute;
    NSString* ampmVal = holder.ampm;
    if ((minVal < 10) && (hourVal < 10)) {
        cell.timeLabel.text = [NSString stringWithFormat:@"0%d:0%d %@", hourVal, minVal, ampmVal];
    }else if (minVal < 10){
        cell.timeLabel.text = [NSString stringWithFormat:@"%d:0%d %@", hourVal, minVal, ampmVal];
    }else if (hourVal < 10){
        cell.timeLabel.text = [NSString stringWithFormat:@"0%d:%d %@", hourVal, minVal, ampmVal];
    }else{
        cell.timeLabel.text = [NSString stringWithFormat:@"%d:%d %@", hourVal, minVal, ampmVal];
    }
    cell.indexNumber = indexPath.row;
    
    if (holder.on == NO) {
        cell.timeLabel.textColor = [Colors InactiveAlarmText];
        cell.on.backgroundColor = [Colors OffIndicator];
    } else{
        cell.timeLabel.textColor = [Colors ActiveAlarmText];
        cell.on.backgroundColor = [Colors OnIndicator];
    }
    
    cell.weekBased = [holder WeekBased];
    cell.sun = holder.sun;
    cell.mon = holder.mon;
    cell.tues = holder.tues;
    cell.wed = holder.wed;
    cell.thurs = holder.thurs;
    cell.fri = holder.fri;
    cell.sat = holder.sat;
    cell.holder = holder;
    cell.delegate = self;
    stateChangeGR.delegate = self;
    
    return cell;
}//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

//Table View Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if ([cell isKindOfClass:[TableAlarmCell class]]) {
        AlarmHolder* holder = [self.alarms objectAtIndex:indexPath.row];
        int hourVal = holder.hour;
        int minVal = holder.minute;
        NSString* ampmVal = holder.ampm;
        [self LoadNewAlarmViewControllerWithHour: [NSString stringWithFormat:@"%d", hourVal]
                                          minute: [NSString stringWithFormat:@"%d", minVal]
                                         andAMPM: ampmVal];
        editAlarms.sun.on = holder.sun;
        editAlarms.mon.on = holder.mon;
        editAlarms.tues.on = holder.tues;
        editAlarms.wed.on = holder.wed;
        editAlarms.thurs.on = holder.thurs;
        editAlarms.fri.on = holder.fri;
        editAlarms.sat.on = holder.sat;
        
        self.editAlarms.index = indexPath.row;
        [self.editAlarms.sun SetColorsAndPlacement];
        [self.editAlarms.mon SetColorsAndPlacement];
        [self.editAlarms.tues SetColorsAndPlacement];
        [self.editAlarms.wed SetColorsAndPlacement];
        [self.editAlarms.thurs SetColorsAndPlacement];
        [self.editAlarms.fri SetColorsAndPlacement];
        [self.editAlarms.sat SetColorsAndPlacement];
        
        TableAlarmCell *alarmCell = (TableAlarmCell*)cell;
        [alarmCell.blurView setBackgroundColor:[UIColor whiteColor]];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            [alarmCell.blurView setBackgroundColor:[UIColor clearColor]];
        });
    }
    
    return indexPath;
}//- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath


/*****Delegate For SWTableViewCell*****/

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index{
    [self.handler writeAlarms:self.alarms];
    [self.alarms removeObjectAtIndex: (NSUInteger)[(TableAlarmCell*)cell indexNumber]];
    [self.table deleteRowsAtIndexPaths:[NSArray arrayWithObject:[self.table indexPathForCell:cell]] withRowAnimation:UITableViewRowAnimationLeft];
    [self.table reloadData];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [self.delegate SaveAndNotifications];
    });
}//- (void)swipeableTableViewCell:(TableAlarmCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index

@end//@implementation ListAlarmsViewController
