//
//  ZWPhotoView.m
//  ZW微博
//
//  Created by rayootech on 16/2/6.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWPhotoView.h"
#import "ZWPhoto.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"
#import "ZWPhotoImageView.h"
@interface ZWPhotoView ()

@end

@implementation ZWPhotoView

-(instancetype)initWithFrame:(CGRect)frame{

    if (self=[super initWithFrame:frame]) {
        
        //添加所有控件
        [self setUpAllChileView];
    }
    return self;
}

-(void)setUpAllChileView
{
   //添加9个子控件
    for (int i=0; i<9; i++) {
        ZWPhotoImageView *imageV=[[ZWPhotoImageView alloc]init];
        
        imageV.tag=i;
        //添加手势
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [imageV addGestureRecognizer:tap];
        
        [self addSubview: imageV];
    }
}

-(void)setPic_urls:(NSArray *)pic_urls
{

    _pic_urls=pic_urls;
    NSInteger count=self.subviews.count;
    for (int i=0; i<count; i++) {
        
        ZWPhotoImageView *imageV=self.subviews[i];
        
        if(i<_pic_urls.count){
            
            imageV.hidden=NO;
            
            ZWPhoto *photo= [[ZWPhoto alloc]init];
            photo.thumbnail_pic = _pic_urls[i];
            
            //赋值
            imageV.photo=photo;
        }
        else{
            imageV.hidden=YES;
        }
    }
}

#pragma mark-计算显示出来的imageView尺寸
-(void)layoutSubviews{

    [super layoutSubviews];
    
    CGFloat x=0;
    CGFloat y=0;
    CGFloat w=70;
    CGFloat h=70;
    CGFloat margin=10;
    NSInteger col=0;
    NSInteger rol=0;
    NSInteger cols=0;
    #warning zw --- 此次根据图片格式计算高度
    if (_pic_urls.count) {
        if (_pic_urls.count==1) {
            cols = 1;
            w = kScreen_Width -20;
            h = w/5*3;
        }else if (_pic_urls.count == 2) {
            cols = 2;
            w = (kScreen_Width -20 -margin)/2;
            h = w/5*3;
        }else if(_pic_urls.count == 3){
           cols = 3;
            w = (kScreen_Width -20 -margin*2)/3;
            h = w/5*3;
        }else{
            cols = _pic_urls.count-1;
            w = (kScreen_Width -20 -ZWStatusCellMargin*2)/3;
            h = w/5*3;
        }
    }
    
    for(int i=0;i<_pic_urls.count;i++)
    {
        col=i%cols;
        rol=i/cols;
        UIImageView *imageV=self.subviews[i];
        x=col*(w+margin);
        y=rol*(h+margin);
        imageV.frame=CGRectMake(x, y, w, h);
    }
}

#pragma mark-Tap 点击图片时调用
-(void)tap:(UITapGestureRecognizer *)tap
{
    UIImageView *tapView=(UIImageView *)tap.view;
    //模型转化
    int i=0;
    NSMutableArray *arrM=[NSMutableArray array];
    for (NSString *imageString in _pic_urls) {
        MJPhoto *p=[[MJPhoto alloc]init];
        NSString *urlStr = imageString;
        urlStr=[urlStr stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
        p.url=[NSURL URLWithString:urlStr];
        p.index=i;
        p.srcImageView=tapView;
        [arrM addObject:p];
        
        i++;
    }
    
  
    //创建浏览器对象
    MJPhotoBrowser *brower=[[MJPhotoBrowser alloc]init];
    brower.photos=arrM;
    brower.currentPhotoIndex=tapView.tag;
    [brower show];
}
@end
