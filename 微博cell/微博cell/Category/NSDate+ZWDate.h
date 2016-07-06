//
//  NSDate+ZWDate.h
//  ZW微博
//
//  Created by rayootech on 16/2/6.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ZWDate)
/**
 *  是今年
 */
-(BOOL)isThisYear;

/**
 *  是今天
 */
-(BOOL)isToday;


/**
 *  是昨天
 */
-(BOOL)isYesterday;

/**
 *  时间对比
 */
-(NSDateComponents *)deltaWithNow;

@end
