//
//  ZWStatusToolBar.m
//  ZW微博
//
//  Created by rayootech on 16/1/31.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWStatusToolBar.h"
#import "UIImage+ZWImage.h"
#import "ZWStatus.h"
#import "UIView+Extension.h"

@interface ZWStatusToolBar ()

@property(nonatomic,strong)NSMutableArray *btns;//评论按钮数组
@property(nonatomic,strong)NSMutableArray *divideVs;//分隔线

@property(nonatomic,weak)UIButton *retweet;//转发
@property(nonatomic,weak)UIButton *comment;//评论
@property(nonatomic,weak)UIButton *unlike;//赞

@end
@implementation ZWStatusToolBar

-(NSMutableArray *)btns
{
    if (_btns==nil) {
        _btns=[NSMutableArray array];
    }
    return _btns;
}

-(NSMutableArray *)divideVs
{

    if (_divideVs==nil) {
        _divideVs=[NSMutableArray array];
    }
    
    return _divideVs;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    
    if (self=[super initWithFrame:frame]) {
        //添加所有子控件
        [self setUpAllChileView];
        self.userInteractionEnabled=YES;
        
        self.image=[UIImage imageWithStretchableName:@"timeline_card_bottom_background"];
    }
    
    return self;
}

-(void)setUpAllChileView
{
    //转发
    UIButton *retweet=[self setUpOneButtonWithTitle:@"转发" image:[UIImage imageNamed:@"timeline_icon_retweet"]];
    _retweet=retweet;
    //评论
    UIButton *comment=[self setUpOneButtonWithTitle:@"转发" image:[UIImage imageNamed:@"timeline_icon_comment"]];
    _comment=comment;
    //赞
    UIButton *unlike=[self setUpOneButtonWithTitle:@"赞" image:[UIImage imageNamed:@"timeline_icon_unlike"]];
    _unlike=unlike;
    //添加分割线
    for ( int i=0; i<2 ; i++) {
        UIImageView *imageV=[[UIImageView alloc
                              ]initWithImage:[UIImage imageNamed:@"timeline_card_bottom_line"]];
        [self addSubview:imageV];
        [self.divideVs addObject:imageV];
    }
}

-(UIButton *)setUpOneButtonWithTitle:(NSString *)title image:(UIImage *)image
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = self.btns.count;
    btn.titleLabel.font=[UIFont systemFontOfSize:12];
    btn.titleEdgeInsets=UIEdgeInsetsMake(0, 5, 0, 0);
    [self addSubview:btn];
    [self.btns addObject:btn];
    return btn;
}

-(void)layoutSubviews{

    [super layoutSubviews];
    
    //设置按钮的frame
    NSInteger count=self.btns.count;
    CGFloat w=kScreen_Width/self.btns.count;
    CGFloat h=self.height;
    CGFloat x=0;
    CGFloat y=0;
    for ( int i=0; i<count ; i++) {
        UIButton *btn=self.btns[i];
        x=i*w;
        btn.frame=CGRectMake(x, y, w, h);
    }
    
    int i=1;
    for ( UITableView *divide in self.divideVs) {
        UIButton *btn=self.btns[i];
        divide.x=btn.x;
        i++;
    }
    
}


-(void)setStatus:(ZWStatus *)status
{
    _status=status;
    //设置转发的标题
    [self setBtn:_retweet Title:status.reposts_count];
    
    //设置评论的标题
    [self setBtn:_comment Title:status.comments_count];
    
    //设置赞的标题
    [self setBtn:_unlike Title:status.attitudes_count];
    
}

#pragma mark-设置按钮标题
-(void)setBtn:(UIButton *)btn Title:(int)count
{
    NSString *title=nil;
    if (count) {
        if (count>10000) {
            CGFloat floatCount=count/10000.0;
            title=[NSString stringWithFormat:@"%.1fW",floatCount];
            title=[title stringByReplacingOccurrencesOfString:@".0" withString:@""];
        }else
        {
            title=[NSString stringWithFormat:@"%d",count];
        }
        //设置转发数
        [btn setTitle:title forState:UIControlStateNormal];
        
    }
    
}

#pragma mark - 工具条按钮点击事件
-(void)btnClick:(UIButton *)btn
{
    ToolBarType type = ToolBarType_Share;
    switch (btn.tag) {
        case ToolBarType_Share:
            type = ToolBarType_Share;
            break;
        case ToolBarType_Message:
            type = ToolBarType_Message;
            break;
        case ToolBarType_Good:
            type = ToolBarType_Good;
            break;
        default:
            break;
    }
    if (self.ToolBarBlock) {
        self.ToolBarBlock(type);
    }
}

@end
