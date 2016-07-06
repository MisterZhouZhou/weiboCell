//
//  ZWHomeFrame.h
//  ZW微博
//
//  Created by rayootech on 16/1/31.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class ZWStatus;
@interface ZWHomeFrame : NSObject

@property(nonatomic,strong)ZWStatus *status;

/**
 *原创动态
 */
@property(nonatomic,assign)CGRect originalViewFrame;
//头像
@property(nonatomic,assign) CGRect iconViewFrame;
//昵称
@property(nonatomic,assign) CGRect nameLabelFrame;
//二级标题
@property(nonatomic,assign) CGRect titleTwoLabelFrame;
//正文
@property(nonatomic,assign) CGRect contentLabelFrame;
//配图
@property(nonatomic,assign) CGRect originPhotoViewFrame;
//工具条
@property(nonatomic,assign)CGRect statusToolBarViewFrame;
//cell的高
@property(nonatomic,assign)CGFloat cellHight;

@end


