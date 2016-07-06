//
//  ZWPhotoImageView.m
//  ZW微博
//
//  Created by rayootech on 16/2/7.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWPhotoImageView.h"
#import "ZWPhoto.h"
#import "UIView+Extension.h"
#import "UIImageView+WebCache.h"
@interface ZWPhotoImageView ()
@property(nonatomic,weak)UIImageView *gifView;

@end

@implementation ZWPhotoImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled=YES;
        self.contentMode=UIViewContentModeScaleAspectFill;
        self.clipsToBounds=YES;
        UIImageView *gifView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"timeline_image_gif"]];
        [self addSubview:gifView];
        _gifView=gifView;
    }
    return self;
}

#pragma mark--设置gif图片
-(void)layoutSubviews{

    [super layoutSubviews];
    
    self.gifView.x=self.width-self.gifView.width;
    self.gifView.y=self.height-self.gifView.height;
}

-(void)setPhoto:(ZWPhoto *)photo
{
 _photo=photo;
 [self sd_setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    
    //判断是否是gif
    NSString *urlStr=photo.thumbnail_pic;
    if ([urlStr hasSuffix:@".gif"]) {
        self.gifView.hidden=NO;
    }else{
        self.gifView.hidden=YES;
    }
}

@end
