//
//  ViewController.m
//  SKCalendar
//
//  Created by Alexander on 2018/7/18.
//  Copyright © 2018年 alexander. All rights reserved.
//

#import "ViewController.h"
#import <FSCalendar.h>


@interface ViewController ()<FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance>
@property (nonatomic, retain) FSCalendar *calendar;// 日历控件
@property (strong, nonatomic) NSDateFormatter *dateFormatter; // 日期格式器


@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	self.dateFormatter = [[NSDateFormatter alloc] init];
    self.dateFormatter.dateFormat = @"yyyy.MM.dd";
	
	self.calendar = [[FSCalendar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 400)];
    _calendar.delegate = self;
    _calendar.dataSource = self;
    _calendar.scrollDirection = 0;
    _calendar.rowHeight = 28;
    _calendar.appearance.headerDateFormat = @"yyyy年MM月";
    _calendar.appearance.headerMinimumDissolvedAlpha = 0;
    _calendar.appearance.headerTitleColor = [UIColor blackColor]; // 标题的颜色
    _calendar.appearance.weekdayTextColor = [UIColor blackColor]; // 日期的颜色
    _calendar.appearance.titleDefaultColor = [UIColor blackColor];
    _calendar.appearance.selectionColor = [UIColor blueColor]; // 圆球的颜色
    _calendar.placeholderType = 0;
	
	self.calendar.accessibilityIdentifier = @"calendar";
	
	[self.view addSubview:self.calendar];
	
}
#pragma mark - 4 Delegate Method
// FSCalendarDelegate 选中的日期

// 选中的date
- (void)calendar:(FSCalendar *)calendar didDeselectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition
{
    NSLog(@"did deselect date %@",[self.dateFormatter stringFromDate:date]);
	
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
