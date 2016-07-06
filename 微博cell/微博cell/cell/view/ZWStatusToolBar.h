//
//  ZWStatusToolBar.h
//  ZW微博
//
//  Created by rayootech on 16/1/31.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  ZWStatus;
typedef NS_ENUM(NSInteger,ToolBarType)
{
    ToolBarType_Share=0,  //分享
    ToolBarType_Message,  //消息
    ToolBarType_Good      //赞
};

@interface ZWStatusToolBar : UIImageView

@property(nonatomic,strong)ZWStatus *status;

@property(nonatomic,copy)void (^ToolBarBlock)(ToolBarType);

@end
