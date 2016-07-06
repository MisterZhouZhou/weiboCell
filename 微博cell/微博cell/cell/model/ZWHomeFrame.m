//
//  ZWHomeFrame.m
//  ZW微博
//
//  Created by rayootech on 16/1/31.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWHomeFrame.h"
#import "ZWStatus.h"
#import "ZWUser.h"
@implementation ZWHomeFrame

-(void)setStatus:(ZWStatus *)status
{
    _status=status;
    
    //计算原创微博
    [self setUpOriginalViewFrame];
    
    CGFloat toolBarY=CGRectGetMaxY(_originalViewFrame);
    
    //计算工具条高度
    CGFloat toolBarX=0;
    CGFloat toolBarW=kScreen_Width;
    CGFloat toolBarH=35;
    _statusToolBarViewFrame=CGRectMake(toolBarX, toolBarY, toolBarW, toolBarH);
    
    //计算cell高度
    _cellHight=CGRectGetMaxY(_statusToolBarViewFrame);
}

#pragma mark-计算原创微博
-(void)setUpOriginalViewFrame
{
    //头像
    CGFloat imageX=ZWStatusCellMargin;
    CGFloat imageY=imageX;
    CGFloat imageWH=ZWIconWH;
    _iconViewFrame=CGRectMake(imageX, imageY, imageWH, imageWH);
    
    //昵称
    CGFloat nameX=CGRectGetMaxX(_iconViewFrame)+ZWStatusCellMargin;
    CGFloat nameY=imageY;
    CGSize nameSize=[_status.user.name sizeWithFont:ZWNameFont];
    _nameLabelFrame=(CGRect){{nameX,nameY},nameSize};
    
    //二级标题
    CGFloat titleTwoY = CGRectGetMaxY(_nameLabelFrame)+2;
    CGSize titleTwoSize=[_status.titleTwo sizeWithFont:ZWTitleTwoFont];
    _titleTwoLabelFrame = (CGRect){{nameX,titleTwoY},titleTwoSize};
    
    //正文
    CGFloat textX=imageX;
    CGFloat textY=CGRectGetMaxY(_iconViewFrame)+ZWStatusCellMargin;
    CGFloat textW=kScreen_Width-2*ZWStatusCellMargin;
    CGSize textSize=[_status.text sizeWithFont:ZWTextFont constrainedToSize:CGSizeMake(textW, MAXFLOAT)];
    _contentLabelFrame=(CGRect){{textX,textY},textSize};
    
    CGFloat originH=CGRectGetMaxY(_contentLabelFrame)+ZWStatusCellMargin;
    //配图
    if (_status.pic_urls.count) {
        CGFloat photosX=ZWStatusCellMargin;
        CGFloat photosY=CGRectGetMaxY(_contentLabelFrame)+ZWStatusCellMargin;
        CGSize photosSize=[self photosSizeWithCount:_status.pic_urls.count];
        _originPhotoViewFrame=(CGRect){{photosX,photosY},photosSize};
        
        originH=CGRectGetMaxY(_originPhotoViewFrame)+ZWStatusCellMargin;
    }
    
    //原创动态的frame
    CGFloat originX=0;
    CGFloat originY=10;
    CGFloat originW=kScreen_Width;
    
    _originalViewFrame=CGRectMake(originX, originY, originW, originH);
    
}

#pragma mark-计算配图的尺寸
-(CGSize)photosSizeWithCount:(NSInteger)count
{
    //获得总列数
    NSInteger cols;
    CGFloat photoW;
    CGFloat photoH;
#warning zw --- 此次根据图片格式计算高度
    if (count) {
        cols = count;
        if (count==1) {
            photoW = kScreen_Width -20;
//            photoH = photoW/5*3;
        }else if (count==2) {
            photoW = (kScreen_Width - margin_left_right -ZWStatusCellMargin)/2;
//            photoH = photoW/5*3;
        }else if (count==3){
            photoW = (kScreen_Width - margin_left_right -ZWStatusCellMargin*2)/3;
//            photoH = photoW/5*3;
        }else{
            cols = count-1;
            photoW = (kScreen_Width - margin_left_right -ZWStatusCellMargin*2)/3;
//            photoH = photoW/5*3;
        }
         photoH = photoW/5*3;
    }
    //获得总行数
    NSInteger rols=(count-1) / cols + 1;
    CGFloat w=cols*photoW+(cols-1)*ZWStatusCellMargin;
    CGFloat h=rols*photoH+(rols-1)*ZWStatusCellMargin;
 
    return CGSizeMake(w, h);
}



@end
