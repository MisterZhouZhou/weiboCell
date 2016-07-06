//
//  ZWHomeTableViewCell.m
//  ZW微博
//
//  Created by rayootech on 16/1/31.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWHomeTableViewCell.h"
#import "ZWOriginalView.h"
#import "ZWStatusToolBar.h"
#import "ZWStatus.h"
#import "ZWHomeFrame.h"
#import "ZWIconView.h"
@interface ZWHomeTableViewCell()

//记录cell的信息
@property(nonatomic,strong)NSIndexPath *currentIndexPath;

@property(nonatomic,weak)ZWOriginalView *originalView;

@property(nonatomic,weak)ZWStatusToolBar *statToolbarView;

@end

@implementation ZWHomeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

//cell是用
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withIndexPath:(NSIndexPath *)path
{
 
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.currentIndexPath = path;
        //添加所有子控件
        [self setUpAllChileView];
        self.backgroundColor=[UIColor clearColor];
    }
    return  self;
}


-(void)setUpAllChileView
{
    //原创微博
    ZWOriginalView *originalView=[[ZWOriginalView alloc]init];
    _originalView=originalView;
    [self addSubview:originalView];
    
    //工具条
    __weak typeof (self) weakSelf = self;
    ZWStatusToolBar *statusToolbarView=[[ZWStatusToolBar alloc]init];
    statusToolbarView.ToolBarBlock = ^(ToolBarType type){
        if (weakSelf.delegate) {
            [weakSelf.delegate tableViewCellToolWithIndePath:self.currentIndexPath andClickAtIndex:type];
        }
    };
    _statToolbarView=statusToolbarView;
    [self addSubview:statusToolbarView];
    
}

+(instancetype)cellWithTableView:(UITableView *)tableview withIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"cell";
    id cell=[tableview dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[self alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID withIndexPath:indexPath];
    }
    return cell;
    
}

-(void)setStatusF:(ZWHomeFrame *)statusF
{
     _statusF=statusF;
    
    //设置原创微博的frame
    _originalView.frame=statusF.originalViewFrame;
    _originalView.statusFrame=statusF;
    
    //设置工具条的frame
    _statToolbarView.frame=statusF.statusToolBarViewFrame;
    _statToolbarView.status=statusF.status;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
