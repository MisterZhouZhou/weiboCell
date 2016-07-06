//
//  ZWStatus.m
//  ZW微博
//
//  Created by rayootech on 16/1/3.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWStatus.h"
#import "ZWPhoto.h"
#import "NSDate+ZWDate.h"
@implementation ZWStatus

//实现这个方法，就会自动吧数组中的字典转化成对应的模型
- (NSDictionary *)objectClassInArray
{
    return @{@"pic_urls":[ZWPhoto class]};
}

@end
