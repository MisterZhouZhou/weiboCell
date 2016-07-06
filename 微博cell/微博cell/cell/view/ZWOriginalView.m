//
//  ZWOriginalView.m
//  ZW微博
//
//  Created by rayootech on 16/1/31.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWOriginalView.h"
#import "ZWHomeFrame.h"
#import "ZWStatus.h"
#import "UIImageView+MJWebCache.h"
#import "ZWPhotoView.h"
#import "ZWIconView.h"
#import "UIImage+ZWImage.h"
@interface ZWOriginalView ()
//头像
@property(nonatomic,weak) ZWIconView *iconView;
//昵称
@property(nonatomic,weak) UILabel *nameLabel;
//vip
@property(nonatomic,weak) UIImageView *vipView;
//时间
@property(nonatomic,weak) UILabel *titleTwoLabel;
//来源
@property(nonatomic,weak) UILabel *souceLabel;
//正文
@property(nonatomic,weak) UILabel *contentLabel;

//配图
@property(nonatomic,weak)ZWPhotoView *photoView;

@end
@implementation ZWOriginalView

-(instancetype)initWithFrame:(CGRect)frame
{

    if (self=[super initWithFrame:frame]) {
        //添加所有子控件
        [self setUpAllChileView];
        self.userInteractionEnabled=YES;
        self.image=[UIImage imageWithStretchableName:@"timeline_card_top_background"];
    }
    
    return self;
}

-(void)setUpAllChileView
{
    //头像
    ZWIconView *iconView=[[ZWIconView alloc]init];
    iconView.layer.cornerRadius =  ZWIconWH/2;
    iconView.layer.masksToBounds = YES;
    _iconView=iconView;
    [self addSubview:iconView];
    
    //昵称
    UILabel *nameLabel=[[UILabel alloc]init];
    nameLabel.font=ZWNameFont;
    _nameLabel=nameLabel;
    [self addSubview:nameLabel];
    
    //二级标题
    UILabel *titleTwoLabel=[[UILabel alloc]init];
    titleTwoLabel.font=ZWTitleTwoFont;
    titleTwoLabel.textColor=[UIColor orangeColor];
    _titleTwoLabel=titleTwoLabel;
    [self addSubview:titleTwoLabel];
    
    //正文
    UILabel *contentLabel=[[UILabel alloc]init];
    contentLabel.numberOfLines=0;
    contentLabel.font=ZWTextFont;
    _contentLabel=contentLabel;
    [self addSubview:contentLabel];
    
    //配图
    ZWPhotoView *photoView=[[ZWPhotoView alloc]init];
    [self addSubview:photoView];
    _photoView=photoView;
    
}

-(void)setStatusFrame:(ZWHomeFrame *)statusFrame
{
    _statusFrame=statusFrame;
    
    //设置frame
    [self setUpFrame];
    
    //设置数据
    [self setUpData];
    
}

//设置数据
-(void)setUpData
{

    ZWStatus *status=_statusFrame.status;
    //头像
    _iconView.user=status.user;
    
    //昵称
    _nameLabel.textColor=[UIColor blackColor];
    _nameLabel.text=status.user.name;
    
    _titleTwoLabel.textColor = [UIColor lightGrayColor];
    _titleTwoLabel.text = status.titleTwo;
    
    //正文
    _contentLabel.text=status.text;
    
    //配图
    _photoView.pic_urls=status.pic_urls;
}


//设置frame
-(void)setUpFrame
{
    //头像
    _iconView.frame=_statusFrame.iconViewFrame;

    //昵称
    _nameLabel.frame=_statusFrame.nameLabelFrame;
    
    //二级标题
    _titleTwoLabel.frame = _statusFrame.titleTwoLabelFrame;
    
    //正文
    _contentLabel.frame=_statusFrame.contentLabelFrame;
    
    //配图
    _photoView.frame=_statusFrame.originPhotoViewFrame;
}

@end
