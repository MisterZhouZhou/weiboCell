//
//  ZWStatus.h
//  ZW微博
//
//  Created by rayootech on 16/1/3.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZWUser.h"
#import "MJExtension.h"

@interface ZWStatus : NSObject<MJKeyValue>

//二级标题
@property(nonatomic,copy)NSString *titleTwo;

//动态信息内容
@property(nonatomic,copy)NSString *text;

 //	动态作者的用户信息
@property(nonatomic,strong)ZWUser *user;

 //转发数
@property(nonatomic,assign)int reposts_count;

//评论数
@property(nonatomic,assign)int comments_count;

//表态数
@property(nonatomic,assign)int attitudes_count;

//配图数据
@property(nonatomic,strong)NSArray* pic_urls;


@end
