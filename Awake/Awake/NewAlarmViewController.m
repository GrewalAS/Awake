//
//  NewAlarmViewController.m
//  Awake
//
//  Created by Amrinder Grewal on 2014-10-28.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import "NewAlarmViewController.h"

@interface NewAlarmViewController ()

@end//@interface NewAlarmViewController ()

@implementation NewAlarmViewController

@synthesize alarmHour;
@synthesize alarmMinute;
@synthesize alarmAmpm;

@synthesize timeBlock;
@synthesize hourSlider;
@synthesize minuteSlider;
@synthesize ampmSlider;

@synthesize cancelSign;
@synthesize confirmSign;
@synthesize hour;
@synthesize minute;
@synthesize ampm;

@synthesize sun;
@synthesize mon;
@synthesize tues;
@synthesize wed;
@synthesize thurs;
@synthesize fri;
@synthesize sat;

@synthesize sunGR;
@synthesize monGR;
@synthesize tuesGR;
@synthesize wedGR;
@synthesize thursGR;
@synthesize friGR;
@synthesize satGR;

@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Setting view controller
    self.delegate = self.parentViewController;
    
    //Creating Cancel Sign
    self.cancelSign = [NA_CancelSign new];
    [self.view addSubview: self.cancelSign];
    //Placing Creating Cancel
    self.cancelSign.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.cancelSign
                                                          attribute: NSLayoutAttributeTop
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeTop
                                                         multiplier: 1
                                                           constant: 5]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.cancelSign
                                                          attribute: NSLayoutAttributeLeft
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeLeft
                                                         multiplier: 1
                                                           constant: 5]];
    
    [self.cancelSign addConstraint:[NSLayoutConstraint constraintWithItem: self.cancelSign
                                                                attribute: NSLayoutAttributeHeight
                                                                relatedBy: NSLayoutRelationEqual
                                                                   toItem: nil
                                                                attribute: NSLayoutAttributeNotAnAttribute
                                                               multiplier: 1.0
                                                                 constant: 30.0]];
    
    [self.cancelSign addConstraint:[NSLayoutConstraint constraintWithItem: self.cancelSign
                                                                attribute: NSLayoutAttributeWidth
                                                                relatedBy: NSLayoutRelationEqual
                                                                   toItem: nil
                                                                attribute: NSLayoutAttributeNotAnAttribute
                                                               multiplier: 1.0
                                                                 constant: 30.0]];
    
    //Creating the Confirm Sign
    self.confirmSign = [NA_ConfirmSign new];
    [self.view addSubview: self.confirmSign];
    //Placing Confirm Sign
    self.confirmSign.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.confirmSign
                                                          attribute: NSLayoutAttributeTop
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeTop
                                                         multiplier: 1
                                                           constant: 5]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.confirmSign
                                                          attribute: NSLayoutAttributeRight
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeRight
                                                         multiplier: 1
                                                           constant: 10]];
    
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
    
    //Creating the week block
    self.weekBlock = [UIView new];
    [self.view addSubview: self.weekBlock];
    //Placing the week block
    self.weekBlock.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.weekBlock
                                                          attribute: NSLayoutAttributeBottom
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeBottom
                                                         multiplier: 1.0
                                                           constant: 0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.weekBlock
                                                          attribute: NSLayoutAttributeLeft
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeLeft
                                                         multiplier: 1.0
                                                           constant: 0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.weekBlock
                                                          attribute: NSLayoutAttributeRight
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeRight
                                                         multiplier: 1.0
                                                           constant: 0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.weekBlock
                                                          attribute: NSLayoutAttributeHeight
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: nil
                                                          attribute: NSLayoutAttributeNotAnAttribute
                                                         multiplier: 1.0
                                                           constant: 30]];
    
    self.weekBlock.layer.borderWidth = 1.0;
    self.weekBlock.layer.borderColor = [[Colors BorderColor] CGColor];
    
    float widthOfWeekUnit = (self.view.frame.size.width / 7);
    
    //Creating the days subview, HERE WE GO, FUCKKKKKKK
    self.sun = [NA_WeekUnit new];
    self.mon = [NA_WeekUnit new];
    self.tues = [NA_WeekUnit new];
    self.wed = [NA_WeekUnit new];
    self.thurs = [NA_WeekUnit new];
    self.fri = [NA_WeekUnit new];
    self.sat = [NA_WeekUnit new];
    
    //Setting the strings
    self.sun.day.text = [AH_SUN uppercaseString];
    self.mon.day.text = [AH_MON uppercaseString];
    self.tues.day.text = [AH_TUES uppercaseString];
    self.wed.day.text = [AH_WED uppercaseString];
    self.thurs.day.text = [AH_THURS uppercaseString];
    self.fri.day.text = [AH_FRI uppercaseString];
    self.sat.day.text = [AH_SAT uppercaseString];

    //Adding it as subview
    [self.weekBlock addSubview: self.sun];
    [self.weekBlock addSubview: self.mon];
    [self.weekBlock addSubview: self.tues];
    [self.weekBlock addSubview: self.wed];
    [self.weekBlock addSubview: self.thurs];
    [self.weekBlock addSubview: self.fri];
    [self.weekBlock addSubview: self.sat];
    
    //Place days within week block
    //All Top Constraints
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.weekBlock
                                                               attribute: NSLayoutAttributeTop
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: self.sun
                                                               attribute: NSLayoutAttributeTop
                                                              multiplier: 1.0
                                                                constant: 0.0]];
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.weekBlock
                                                               attribute: NSLayoutAttributeTop
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: self.mon
                                                               attribute: NSLayoutAttributeTop
                                                              multiplier: 1.0
                                                                constant: 0.0]];
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.weekBlock
                                                               attribute: NSLayoutAttributeTop
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: self.tues
                                                               attribute: NSLayoutAttributeTop
                                                              multiplier: 1.0
                                                                constant: 0.0]];
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.weekBlock
                                                               attribute: NSLayoutAttributeTop
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: self.wed
                                                               attribute: NSLayoutAttributeTop
                                                              multiplier: 1.0
                                                                constant: 0.0]];
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.weekBlock
                                                               attribute: NSLayoutAttributeTop
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: self.thurs
                                                               attribute: NSLayoutAttributeTop
                                                              multiplier: 1.0
                                                                constant: 0.0]];
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.weekBlock
                                                               attribute: NSLayoutAttributeTop
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: self.fri
                                                               attribute: NSLayoutAttributeTop
                                                              multiplier: 1.0
                                                                constant: 0.0]];
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.weekBlock
                                                               attribute: NSLayoutAttributeTop
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: self.sat
                                                               attribute: NSLayoutAttributeTop
                                                              multiplier: 1.0
                                                                constant: 0.0]];
    //All bottom constraints
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.weekBlock
                                                               attribute: NSLayoutAttributeBottom
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: self.sun
                                                               attribute: NSLayoutAttributeBottom
                                                              multiplier: 1.0
                                                                constant: 0.0]];
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.weekBlock
                                                               attribute: NSLayoutAttributeBottom
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: self.mon
                                                               attribute: NSLayoutAttributeBottom
                                                              multiplier: 1.0
                                                                constant: 0.0]];
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.weekBlock
                                                               attribute: NSLayoutAttributeBottom
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: self.tues
                                                               attribute: NSLayoutAttributeBottom
                                                              multiplier: 1.0
                                                                constant: 0.0]];
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.weekBlock
                                                               attribute: NSLayoutAttributeBottom
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: self.wed
                                                               attribute: NSLayoutAttributeBottom
                                                              multiplier: 1.0
                                                                constant: 0.0]];
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.weekBlock
                                                               attribute: NSLayoutAttributeBottom
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: self.thurs
                                                               attribute: NSLayoutAttributeBottom
                                                              multiplier: 1.0
                                                                constant: 0.0]];
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.weekBlock
                                                               attribute: NSLayoutAttributeBottom
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: self.fri
                                                               attribute: NSLayoutAttributeBottom
                                                              multiplier: 1.0
                                                                constant: 0.0]];
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.weekBlock
                                                               attribute: NSLayoutAttributeBottom
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: self.sat
                                                               attribute: NSLayoutAttributeBottom
                                                              multiplier: 1.0
                                                                constant: 0.0]];
    //All left constraints
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.weekBlock
                                                               attribute: NSLayoutAttributeLeft
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: self.sun
                                                               attribute: NSLayoutAttributeLeft
                                                              multiplier: 1.0
                                                                constant: 0.0]];
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.sun
                                                               attribute: NSLayoutAttributeRight
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: self.mon
                                                               attribute: NSLayoutAttributeLeft
                                                              multiplier: 1.0
                                                                constant: 0.0]];
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.mon
                                                               attribute: NSLayoutAttributeRight
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: self.tues
                                                               attribute: NSLayoutAttributeLeft
                                                              multiplier: 1.0
                                                                constant: 0.0]];
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.tues
                                                               attribute: NSLayoutAttributeRight
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: self.wed
                                                               attribute: NSLayoutAttributeLeft
                                                              multiplier: 1.0
                                                                constant: 0.0]];
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.wed
                                                               attribute: NSLayoutAttributeRight
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: self.thurs
                                                               attribute: NSLayoutAttributeLeft
                                                              multiplier: 1.0
                                                                constant: 0.0]];
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.thurs
                                                               attribute: NSLayoutAttributeRight
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: self.fri
                                                               attribute: NSLayoutAttributeLeft
                                                              multiplier: 1.0
                                                                constant: 0.0]];
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.fri
                                                               attribute: NSLayoutAttributeRight
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: self.sat
                                                               attribute: NSLayoutAttributeLeft
                                                              multiplier: 1.0
                                                                constant: 0.0]];
    //All width constraints
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.sun
                                                               attribute: NSLayoutAttributeWidth
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: nil
                                                               attribute: NSLayoutAttributeNotAnAttribute
                                                              multiplier: 1.0
                                                                constant: widthOfWeekUnit]];
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.mon
                                                               attribute: NSLayoutAttributeWidth
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: nil
                                                               attribute: NSLayoutAttributeNotAnAttribute
                                                              multiplier: 1.0
                                                                constant: widthOfWeekUnit]];
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.tues
                                                               attribute: NSLayoutAttributeWidth
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: nil
                                                               attribute: NSLayoutAttributeNotAnAttribute
                                                              multiplier: 1.0
                                                                constant: widthOfWeekUnit]];
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.wed
                                                               attribute: NSLayoutAttributeWidth
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: nil
                                                               attribute: NSLayoutAttributeNotAnAttribute
                                                              multiplier: 1.0
                                                                constant: widthOfWeekUnit]];
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.thurs
                                                               attribute: NSLayoutAttributeWidth
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: nil
                                                               attribute: NSLayoutAttributeNotAnAttribute
                                                              multiplier: 1.0
                                                                constant: widthOfWeekUnit]];
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.fri
                                                               attribute: NSLayoutAttributeWidth
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: nil
                                                               attribute: NSLayoutAttributeNotAnAttribute
                                                              multiplier: 1.0
                                                                constant: widthOfWeekUnit]];
    [self.weekBlock addConstraint:[NSLayoutConstraint constraintWithItem: self.sat
                                                               attribute: NSLayoutAttributeWidth
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: nil
                                                               attribute: NSLayoutAttributeNotAnAttribute
                                                              multiplier: 1.0
                                                                constant: widthOfWeekUnit]];
    
    //GR for weekBlock
    //Getting the GRs
    sunGR = [self PrepareTapGR];
    monGR = [self PrepareTapGR];
    tuesGR = [self PrepareTapGR];
    wedGR = [self PrepareTapGR];
    thursGR = [self PrepareTapGR];
    friGR = [self PrepareTapGR];
    satGR = [self PrepareTapGR];
    //Settings the GRs
    [self.sun addGestureRecognizer: sunGR];
    [self.mon addGestureRecognizer: monGR];
    [self.tues addGestureRecognizer: tuesGR];
    [self.wed addGestureRecognizer: wedGR];
    [self.thurs addGestureRecognizer: thursGR];
    [self.fri addGestureRecognizer: friGR];
    [self.sat addGestureRecognizer: satGR];
    
    //Creating the time block
    self.timeBlock = [UIView new];
    [self.view addSubview: timeBlock];
    //Placing the time block
    self.timeBlock.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.timeBlock
                                                          attribute: NSLayoutAttributeTop
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.confirmSign
                                                          attribute: NSLayoutAttributeBottom
                                                         multiplier: 1.0
                                                           constant: -10.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.timeBlock
                                                          attribute: NSLayoutAttributeBottom
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.weekBlock
                                                          attribute: NSLayoutAttributeTop
                                                         multiplier: 1.0
                                                           constant: 0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.timeBlock
                                                          attribute: NSLayoutAttributeWidth
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeWidth
                                                         multiplier: 1.0
                                                           constant: 0.0]];
    
    UITapGestureRecognizer* tapCancelGR = [[UITapGestureRecognizer alloc] initWithTarget:self.delegate action:@selector(Cancel)];
    tapCancelGR.delegate = self;
    tapCancelGR.numberOfTapsRequired = 1;
    tapCancelGR.numberOfTouchesRequired = 1;
    [self.cancelSign addGestureRecognizer: tapCancelGR];
}//- (void)viewDidLoad

-(void) viewDidLayoutSubviews{
    //Adding gestures to confirm or cancel this alarm
    UITapGestureRecognizer* tapConfirmGR;
    if (self.index == -1) {
        //Send Confirm to self so that index is sent
        tapConfirmGR = [[UITapGestureRecognizer alloc] initWithTarget:self.delegate action:@selector(Confirm)];
    } else{
        //Send Confirm to delegate so that no index is sent
        tapConfirmGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ConfirmWithIndex)];
    }
    tapConfirmGR.delegate = self;
    tapConfirmGR.numberOfTapsRequired = 1;
    tapConfirmGR.numberOfTouchesRequired = 1;
    [self.confirmSign addGestureRecognizer: tapConfirmGR];
    
    float width = (self.timeBlock.bounds.size.width / 3);
    
    UISlider *localHourSlider = [self AddNewSlider];
    CGPoint newLocation = [self.timeBlock convertPoint:CGPointMake(0, 0) toView:localHourSlider];
    localHourSlider.transform = CGAffineTransformTranslate(localHourSlider.transform, self.timeBlock.frame.origin.x - localHourSlider.frame.origin.x, newLocation.y);
    //At this point the slider is upside down, meaning it increases going up the screen not down
    localHourSlider.transform = CGAffineTransformRotate(localHourSlider.transform, M_PI);
    //Adding slider to class
    self.hourSlider = localHourSlider;
    //Setting settings specific to the hour slider
    self.hourSlider.minimumValue = 1.0;
    self.hourSlider.maximumValue = 13.0;//Number greater than 12 so that the person does not need to slide to the very edge of the screen to set the time to 12
    self.hourSlider.value = [self.alarmHour intValue];
    
    //Next line to reposition the third slider
    newLocation.y = newLocation.y + width;
    
    //Dividing line
    CALayer *sublayerHour = [CALayer layer];
    sublayerHour.backgroundColor = [[Colors BorderColor] CGColor];
    sublayerHour.frame = CGRectMake(0, 0, self.hourSlider.frame.size.height, 1);
    [self.hourSlider.layer addSublayer:sublayerHour];
    
    UISlider *localMinuteSlider = [self AddNewSlider];
    localMinuteSlider.transform = CGAffineTransformTranslate(localMinuteSlider.transform, self.timeBlock.frame.origin.x - localMinuteSlider.frame.origin.x, newLocation.y);
    //At this point the slider is upside down, meaning it increases going up the screen not down
    localMinuteSlider.transform = CGAffineTransformRotate(localMinuteSlider.transform, M_PI);
    //Adding slider to class
    self.minuteSlider = localMinuteSlider;
    //Setting settings specific to the hour slider
    self.minuteSlider.minimumValue = 0.0;
    self.minuteSlider.maximumValue = 62.0;//Number greater than 59 so that the person does not need to slide to the very edge of the screen to set the time to 59
    self.minuteSlider.value = [self.alarmMinute intValue];
    
    //Dividing line
    CALayer *sublayerMin = [CALayer layer];
    sublayerMin.backgroundColor = [[Colors BorderColor] CGColor];
    sublayerMin.frame = CGRectMake(0, 0, self.minuteSlider.frame.size.height, 1);
    [self.minuteSlider.layer addSublayer:sublayerMin];
    
    //Next line to reposition the third slider
    newLocation.y = newLocation.y + width;
    UISlider *localAmPmSlider = [self AddNewSlider];
    localAmPmSlider.transform = CGAffineTransformTranslate(localAmPmSlider.transform, self.timeBlock.frame.origin.x - localAmPmSlider.frame.origin.x, newLocation.y);
    //At this point the slider is upside down, meaning it increases going up the screen not down
    localAmPmSlider.transform = CGAffineTransformRotate(localAmPmSlider.transform, M_PI);
    //Adding slider to class
    self.ampmSlider = localAmPmSlider;
    //Setting settings specific to the hour slider
    self.ampmSlider.minimumValue = 0.0;
    self.ampmSlider.maximumValue = 1.0;
    if ([self.alarmAmpm  isEqual: @"AM"]) {
        self.ampmSlider.value = 0.25;
    } else {
        self.ampmSlider.value = 0.75;
    }
    
    //Setting value of strings that will set the value of NA classes
    self.alarmHour = [GetTimeInFormat GetTimeInFormat: TF_HOUR_12_FORMAT];
    self.alarmMinute = [GetTimeInFormat GetTimeInFormat: TF_MINUTE_FORMAT];
    self.alarmAmpm = [GetTimeInFormat GetTimeInFormat: TF_AMPM_FORMAT];
    
    //Hour TimeUnit set up
    self.hour = [NA_TimeUnit new];
    self.hour.timeUnitValue = [[NSMutableAttributedString alloc] initWithString:self.alarmHour];
    //Add hour NA_TimeUnit as subview of hour slider
    self.hour.timeUnitValue = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat: @"%d", (int)self.hourSlider.value]];
    self.hour.frame = CGRectMake(0, 0, self.hourSlider.frame.size.width, 50);
    self.hour.userInteractionEnabled = NO;
    [self.timeBlock addSubview: self.hour];
    //Placing the hour timeUnit
    [self PlaceTimeUnit:self.hour withSlider:self.hourSlider];
    //Change of value set up
    [self.hourSlider addTarget:self
                        action:@selector(HourValueChanged)
              forControlEvents:UIControlEventValueChanged];
    
    //Minute TimeUnit set up
    self.minute = [NA_TimeUnit new];
    self.minute.timeUnitValue = [[NSMutableAttributedString alloc] initWithString: self.alarmMinute];
    //Add minute NA_TimeUnit as subview of minute slider
    self.minute.timeUnitValue = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat: @"%d", (int)self.minuteSlider.value]];
    self.minute.frame = CGRectMake(0, 0, self.minuteSlider.frame.size.width, 50);
    self.minute.userInteractionEnabled = NO;
    [self.timeBlock addSubview: self.minute];
    //Placing the minute time unit
    [self PlaceTimeUnit:self.minute withSlider:self.minuteSlider];
    //Change of value set up
    [self.minuteSlider addTarget:self
                          action:@selector(MinuteValueChanged)
                forControlEvents:UIControlEventValueChanged];
    
    //ampm TimeUnit set up
    self.ampm = [NA_TimeUnit new];
    self.ampm.timeUnitValue = [[NSMutableAttributedString alloc] initWithString:self.alarmAmpm];
    //Add ampm NA_TimeUnit as subview of ampm slider
    if (self.ampmSlider.value < 0.5) {
        self.ampm.timeUnitValue = [[NSMutableAttributedString alloc] initWithString:@"AM"];
    }else{
        self.ampm.timeUnitValue = [[NSMutableAttributedString alloc] initWithString:@"PM"];
    }
    self.ampm.frame = CGRectMake(0, 0, self.ampmSlider.frame.size.width, 50);
    self.ampm.userInteractionEnabled = NO;
    [self.timeBlock addSubview: self.ampm];
    //Placing the ampm time unit
    [self PlaceTimeUnit:self.ampm withSlider:self.ampmSlider];
    //Change of value set up
    [self.ampmSlider addTarget:self
                        action:@selector(AMPMHasChanged)
              forControlEvents:UIControlEventValueChanged];
}//-(void) viewDidLayoutSubviews

-(UISlider*) AddNewSlider{
    float height = self.timeBlock.bounds.size.height;
    float width = (self.timeBlock.bounds.size.width / 3);
    
    //Height and width reversed because it will be fixed after transformation
    CGRect starterFrame = CGRectMake(0, 0, height, width);
    
    //Creating and Positioning the slider
    UISlider* localSlider = [[UISlider alloc] initWithFrame: starterFrame];
    [self.timeBlock addSubview: localSlider];
    localSlider.transform = CGAffineTransformRotate(localSlider.transform, -(M_PI * 0.5));
    //Adjusting Slider settings
    localSlider.continuous = NO;
    
    //Setting slider appearance
    UIImage *clearPixel = [[UIImage alloc] init];
    [localSlider setThumbImage:clearPixel forState:UIControlStateNormal];
    [localSlider setMinimumTrackImage:clearPixel forState: UIControlStateNormal];
    [localSlider setMaximumTrackImage:clearPixel forState: UIControlStateNormal];
    
    //Setting border
    //localSlider.layer.borderColor = [[Colors BorderColor] CGColor];
    //localSlider.layer.borderWidth = 0.3;
    
    //OR
    //CALayer *sublayer = [CALayer layer];
    //sublayer.backgroundColor = [[Colors BorderColor] CGColor];
    //sublayer.frame = CGRectMake(0, localSlider.bounds.size.height - 1, 1, localSlider.frame.size.height);
    //[localSlider.layer addSublayer:sublayer];
    
    //Adding tap and slide option
    UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(sliderTapped:)];
    longPressGestureRecognizer.minimumPressDuration = 0.0;
    [localSlider addGestureRecognizer: longPressGestureRecognizer];
    return localSlider;
}//-(UISlider*) AddNewSlider

-(void) sliderTapped:(UIGestureRecognizer *)g {
    UISlider* s = (UISlider*)g.view;
    if (s.highlighted)
        return; // tap on thumb, let slider deal with it
    CGPoint pt = [g locationInView: s];
    CGFloat percentage = pt.x / s.bounds.size.width;//Using width since the slider is transformed and not created that way
    CGFloat delta = percentage * (s.maximumValue - s.minimumValue);
    CGFloat value = s.minimumValue + delta;
    [s setValue:value animated: NO];
    [s sendActionsForControlEvents: UIControlEventValueChanged];
}//-(void) sliderTapped:(UIGestureRecognizer *)g

-(void) HourValueChanged {
    if (self.hourSlider.value > 12) {
        self.hour.timeUnitValue = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat: @"%d", 12]];
    } else{
        self.hour.timeUnitValue = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat: @"%d", (int)self.hourSlider.value]];
    }
    [self.hour setNeedsDisplay];
    [self PlaceTimeUnit:self.hour withSlider:self.hourSlider];
}//-(void) HourValueChanged

-(void) MinuteValueChanged {
    if (self.minuteSlider.value > 59) {
        self.minute.timeUnitValue = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat: @"%d", 59]];
    } else{
        self.minute.timeUnitValue = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat: @"%d", (int)self.minuteSlider.value]];
    }
    [self.minute setNeedsDisplay];
    [self PlaceTimeUnit:self.minute withSlider:self.minuteSlider];
}//-(void) MinuteValueChanged

-(void) AMPMHasChanged {
    if (self.ampmSlider.value < 0.5) {
        self.ampm.timeUnitValue = [[NSMutableAttributedString alloc] initWithString:@"AM"];
    }else{
        self.ampm.timeUnitValue = [[NSMutableAttributedString alloc] initWithString:@"PM"];
    }
    [self.ampm setNeedsDisplay];
    [self PlaceTimeUnit:self.ampm withSlider:self.ampmSlider];
}//-(void) AMPMHasChanged

- (void) PlaceTimeUnit: (NA_TimeUnit*) givenUnit withSlider: (UISlider*) slider{
    float sliderRangeY = slider.frame.size.height;
    float sliderOriginY = slider.frame.origin.y;
    
    float timeUnitPointY = ((((slider.value-slider.minimumValue)/(slider.maximumValue-slider.minimumValue)) * sliderRangeY) + sliderOriginY);
    
    CGPoint newLocation = CGPointMake(slider.frame.origin.x - (givenUnit.frame.size.width/8), timeUnitPointY - (givenUnit.frame.size.height / 2));
    
    if (newLocation.y < (slider.frame.origin.y - 5)) {
        newLocation.y = -5;
    } else if (newLocation.y > (slider.frame.size.height - givenUnit.frame.size.height)){
        newLocation.y = (slider.frame.size.height - givenUnit.frame.size.height);
    }
    
    CGRect frame = givenUnit.frame;
    frame.origin = newLocation;
    givenUnit.frame = frame;
}//- (void) PlaceTimeUnit: (NA_TimeUnit*) giveUnit withSlider: (UISlider*) slider

-(void) ConfirmWithIndex{
    [self.delegate ConfirmWithIndex: self.index];
}//-(void) ConfirmWithIndex

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}//- (void)didReceiveMemoryWarning

-(UITapGestureRecognizer*) PrepareTapGR{
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(SwitchDayStatus:)];
    tapGR.delegate = self;
    tapGR.numberOfTapsRequired = 1;
    tapGR.numberOfTouchesRequired = 1;

    return tapGR;
}//-(UITapGestureRecognizer*) PrepareTapGR

-(void) SwitchDayStatus: (UITapGestureRecognizer*) recognizer{
    NA_WeekUnit *unit = (NA_WeekUnit*)recognizer.view;

    [unit ChangeLabelPlacement];
}//-(void) SwitchDayStatus: (UITapGestureRecognizer*) recognizer

@end//@implementation NewAlarmViewController
