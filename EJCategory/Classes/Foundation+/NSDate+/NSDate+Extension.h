//
//  NSDate+Extension.h
//
//  Created by liblto on 2016/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

+ (NSCalendar *)currentCalendar;

+ (NSDate *)dateTomorrow;
+ (NSDate *)dateYesterday;
+ (NSDate *)dateWithDaysFromNow:(NSInteger) days;
+ (NSDate *)dateWithDaysBeforeNow:(NSInteger) days;
+ (NSDate *)dateWithHoursFromNow:(NSInteger) dHours;
+ (NSDate *)dateWithHoursBeforeNow:(NSInteger) dHours;
+ (NSDate *)dateWithMinutesFromNow:(NSInteger) dMinutes;
+ (NSDate *)dateWithMinutesBeforeNow:(NSInteger) dMinutes;
+ (NSDate *)date:(NSString *)datestr byFormat:(NSString *)format;

- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;
- (NSString *)stringWithFormat:(NSString *)format;

@property (nonatomic, readonly) NSString *shortString;
@property (nonatomic, readonly) NSString *shortDateString;
@property (nonatomic, readonly) NSString *shortTimeString;
@property (nonatomic, readonly) NSString *mediumString;
@property (nonatomic, readonly) NSString *mediumDateString;
@property (nonatomic, readonly) NSString *mediumTimeString;
@property (nonatomic, readonly) NSString *longString;
@property (nonatomic, readonly) NSString *longDateString;
@property (nonatomic, readonly) NSString *longTimeString;

- (BOOL)isEqualToDateIgnoringTime: (NSDate *) aDate;

- (BOOL)isYesterday;
- (BOOL)isToday;
- (BOOL)isTomorrow;
- (BOOL)isTheDayAfterTomorrow;

- (BOOL)isSameWeekAsDate:(NSDate *)aDate;
- (BOOL)isThisWeek;
- (BOOL)isNextWeek;
- (BOOL)isLastWeek;

- (BOOL)isSameMonthAsDate:(NSDate *)aDate;
- (BOOL)isThisMonth;
- (BOOL)isNextMonth;
- (BOOL)isLastMonth;

- (BOOL)isSameYearAsDate:(NSDate *)aDate;
- (BOOL)isThisYear;
- (BOOL)isNextYear;
- (BOOL)isLastYear;

- (BOOL)isEarlierThanDate:(NSDate *)aDate;
- (BOOL)isLaterThanDate:(NSDate *)aDate;

- (BOOL)isInFuture;
- (BOOL)isInPast;

- (BOOL)isTypicallyWeekend;
- (BOOL)isTypicallyWorkday;

- (NSDate *)dateByAddingYears:(NSInteger)dYears;
- (NSDate *)dateBySubtractingYears:(NSInteger)dYears;
- (NSDate *)dateByAddingMonths:(NSInteger)dMonths;
- (NSDate *)dateBySubtractingMonths:(NSInteger)dMonths;
- (NSDate *)dateByAddingDays:(NSInteger)dDays;
- (NSDate *)dateBySubtractingDays:(NSInteger)dDays;
- (NSDate *)dateByAddingHours:(NSInteger)dHours;
- (NSDate *)dateBySubtractingHours:(NSInteger)dHours;
- (NSDate *)dateByAddingMinutes:(NSInteger)dMinutes;
- (NSDate *)dateBySubtractingMinutes:(NSInteger)dMinutes;

- (NSDate *)dateAtStartOfDay;
- (NSDate *)dateAtEndOfDay;

- (NSInteger)minutesAfterDate:(NSDate *)aDate;
- (NSInteger)minutesBeforeDate:(NSDate *)aDate;
- (NSInteger)hoursAfterDate:(NSDate *)aDate;
- (NSInteger)hoursBeforeDate:(NSDate *)aDate;
- (NSInteger)daysAfterDate:(NSDate *)aDate;
- (NSInteger)daysBeforeDate:(NSDate *)aDate;
- (NSInteger)distanceInDaysToDate:(NSDate *)anotherDate;


@property (readonly) NSInteger nearestHour;
@property (readonly) NSInteger hour;
@property (readonly) NSInteger minute;
@property (readonly) NSInteger seconds;
@property (readonly) NSInteger day;
@property (readonly) NSInteger month;
@property (readonly) NSInteger week;
@property (readonly) NSInteger weekday;
@property (readonly) NSInteger nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property (readonly) NSInteger year;

/**
 获取星期几(名称)
 
 @return Return weekday as a localized string
 [1 - Sunday]
 [2 - Monday]
 [3 - Tuerday]
 [4 - Wednesday]
 [5 - Thursday]
 [6 - Friday]
 [7 - Saturday]
 */
- (NSString *)dayFromWeekday; // 星期几的形式
- (NSString *)day_CNFromWeekday; // 周几的形式
- (NSString *)day_ENFromWeekday; // 英文的形式

+ (NSString *)dayFromWeekday:(NSDate *)date; // 星期几的形式
+ (NSString *)day_CNFromWeekday:(NSDate *)date; // 周几的形式
+ (NSString *)day_ENFromWeekday:(NSDate *)date; // 英文的形式

+ (NSString *)ymdFormatJoinedByString:(NSString *)string;
+ (NSString *)ymdHmsFormat;
+ (NSString *)ymdFormat;
+ (NSString *)hmsFormat;
+ (NSString *)dmyFormat; // day month years format
+ (NSString *)myFormat; // month years format

/// 获取当前时间戳字符串
+ (NSString *)currentTimestamp;

/// 当前date转换成时间字符串 (+方法)
+ (NSString *)stringWithFormat:(NSString *)format;

/// 将date转换成时间字符串 (NSDate => TimeString)
+ (NSString *)stringWithDate:(NSDate *)date format:(NSString *)format;

/**
 将时间字符串转换成date
 NSDate *date = [NSDate dateWithString:@"2017-09-15" format:@"yyyy-MM-dd"];
 */
+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format;

/// 将date转换成时间戳
+ (NSInteger)timestampFromDate:(NSDate *)date;

/// 将时间戳转换成date
+ (NSDate *)dateFromTimestamp:(NSInteger)timestamp;

/**
 将时间字符串转换成时间戳 / 北京时间
 NSInteger timestamp = [NSDate timestampFromTimeString:@"2017-09-15 15:39" formatter:@"yyyy-MM-dd HH:mm"];
 */
+ (NSInteger)timestampFromTimeString:(NSString *)timeString formatter:(NSString *)format;

/// 将时间戳转换成时间字符串 (Timestamp => TimeString) / 北京时间
+ (NSString *)timeStringFromTimestamp:(NSInteger)timestamp formatter:(NSString *)format;

/// 获取当前系统时间的时间戳 / 北京时间
+ (NSInteger)getNowTimestampWithFormatter:(NSString *)format;

/// 获取某个月的天数
+ (NSInteger)getSumOfDaysMonth:(NSInteger)month inYear:(NSInteger)year;

/// 获取当前的"年月日时分"
+ (NSArray<NSString *> *)getCurrentTimeComponents;

- (NSDateComponents *)componentsWithOffsetFromDate:(NSDate *)aDate;

/**
 比较两个date的大小关系 return NSComparisonResult
 NSOrderedAscending     => (aString < bString)
 NSOrderedDescending    => (aString > bString)
 NSOrderedSame          => (aString = bString)
 */
- (NSComparisonResult)compareDateString:(NSString *)aString
                             dateString:(NSString *)bString
                              formatter:(NSString *)format;
/// 比较两个date是否是同一天
- (BOOL)isSameDay:(NSDate *)date;

@end
