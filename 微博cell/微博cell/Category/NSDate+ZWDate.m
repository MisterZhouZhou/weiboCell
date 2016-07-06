//
//  NSDate+ZWDate.m
//  ZW微博
//
//  Created by rayootech on 16/2/6.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "NSDate+ZWDate.h"

@implementation NSDate (ZWDate)

/**
 *  是否是今年
 */
-(BOOL)isThisYear
{
    NSCalendar *calendar=[NSCalendar currentCalendar];
    int unit=NSCalendarUnitYear;
    
    //获取当前时间的年月日
    NSDateComponents *nowCmps=[calendar components:unit fromDate:[NSDate date]];
    
    //获得self的年与日
    NSDateComponents *selfCmps=[calendar components:unit fromDate:self];
    
    return nowCmps.year==selfCmps.year;
}

/**
 *  是否是今天
 */
-(BOOL)isToday
{
    NSCalendar *calendar=[NSCalendar currentCalendar];
    int  unit=NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear;
    
    //获取当前时间的年月日
    NSDateComponents *nowCmps=[calendar components:unit fromDate:[NSDate date]];
    
    //获取self的年月日
    NSDateComponents *selfCmps=[calendar components:unit fromDate:self];
    
    return(selfCmps.year==nowCmps.year && selfCmps.month==nowCmps.month &&selfCmps.day==nowCmps.day);
}

/**
 *  是否是昨天
 */
-(BOOL)isYesterday
{

    NSDate *nowDate=[[NSDate date] dateWithYMD];
    
    NSDate *selfDate=[self dateWithYMD];
    
    //获取nowDate和selfDate的差距
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSDateComponents *cmps=[calendar components:NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    return cmps.day==1;
}
-(NSDate*)dateWithYMD
{
    NSDateFormatter *fmt=[[NSDateFormatter alloc]init];
    fmt.dateFormat=@"yyyy-MM--dd";
    NSString *selfStr=[fmt stringFromDate:self];
    return [fmt dateFromString:selfStr];
}

/**
 *  时间对比
 */
-(NSDateComponents *)deltaWithNow
{
    NSCalendar *calendar=[NSCalendar currentCalendar];
    int unit=NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}
@end
