//
//  ZWHomeTableViewCell.h
//  ZW微博
//
//  Created by rayootech on 16/1/31.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZWHomeFrame;

@protocol TableViewCellDelegate <NSObject>

-(void)tableViewCellToolWithIndePath:(NSIndexPath *)path  andClickAtIndex:(NSInteger)index;

@end

@interface ZWHomeTableViewCell : UITableViewCell

@property(nonatomic,strong)ZWHomeFrame *statusF;

//代理
@property(nonatomic,weak)id <TableViewCellDelegate>delegate;

+(instancetype)cellWithTableView:(UITableView *)tableview withIndexPath:(NSIndexPath *)indexPath;

@end
