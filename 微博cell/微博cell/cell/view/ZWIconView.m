//
//  ZWIconView.m
//  ZW微博
//
//  Created by rayootech on 16/2/8.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWIconView.h"
#import "ZWUser.h"
#import "UIImageView+WebCache.h"
#import "UIView+Extension.h"
@interface ZWIconView ()

@end
@implementation ZWIconView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.clipsToBounds=YES;
    }
    return self;
}

-(void)setUser:(ZWUser *)user
{
    _user=user;
    if ([user.iconImage hasPrefix:@"http://"]||[user.iconImage hasPrefix:@"https://"]) {
        //下载图片
        [self sd_setImageWithURL:[NSURL URLWithString:user.iconImage] placeholderImage:[UIImage imageNamed:@"avatar_default_small"]];
    }else{
        self.image = [UIImage imageNamed:user.iconImage];
    }
}


@end
