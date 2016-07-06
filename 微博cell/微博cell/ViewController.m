//
//  ViewController.m
//  微博cell
//
//  Created by rayootech on 16/5/24.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ViewController.h"
#import "ZWHomeTableViewCell.h"
#import "ZWHomeFrame.h"
#import "ZWStatusToolBar.h"
#import "ZWStatus.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,TableViewCellDelegate>

//数据
@property(nonatomic,strong)NSMutableArray *statusesFrames;

//表格
@property(nonatomic,strong)UITableView *mainTableView;

@end

@implementation ViewController

static NSString *ID=@"cell";

-(UITableView *)mainTableView
{
    if (_mainTableView==nil) {
        _mainTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    }
    return _mainTableView;
}

-(NSMutableArray *)statusesFrames{
    if (_statusesFrames == nil) {
        _statusesFrames = [NSMutableArray array];
    }
    return _statusesFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //设置表格
    [self.view addSubview:self.mainTableView];
    self.mainTableView.dataSource=self;
    self.mainTableView.delegate=self;
    self.mainTableView.backgroundColor= RGB(240, 240, 240);
    self.mainTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    [self getData];
}


-(void)getData
{
    NSMutableArray *staF=[NSMutableArray array];
    //进行模型转化
    for (int i = 0; i<10; i++) {
        ZWUser *user = [[ZWUser alloc]init];
        user.iconImage = @"春节特别版8";
        user.name = @"小七";
        
        ZWStatus *sta = [[ZWStatus alloc]init];
        sta.user = user;
        sta.titleTwo = @"hello world";
        sta.reposts_count = 1;
        sta.comments_count = 2;
        sta.attitudes_count = 3;
        sta.text = @"今天是个好日子啊";
        NSArray * array0;
        if (i == 0) {
             array0 = @[@"http://avatar.csdn.net/5/F/0/1_zww1984774346.jpg"];
            
        }else if(i == 1){
            array0 = @[@"http://avatar.csdn.net/5/F/0/1_zww1984774346.jpg",@"http://s.img.mix.sina.com.cn/auto/resize?size=235_156&img=http://www.sinaimg.cn/dy/slidenews/4_img/2016_21/704_1927797_449620.jpg"];
            sta.text = @"小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七小七";
        }
        else if (i == 2){
            array0 = @[@"http://avatar.csdn.net/5/F/0/1_zww1984774346.jpg",@"http://s.img.mix.sina.com.cn/auto/resize?size=235_156&img=http://www.sinaimg.cn/dy/slidenews/4_img/2016_21/704_1927797_449620.jpg",@"http://s.img.mix.sina.com.cn/auto/resize?size=235_156&img=http://www.sinaimg.cn/dy/slidenews/4_img/2016_21/704_1927789_512253.jpg"];
        }
        else if (i == 3){
             array0 = @[@"http://avatar.csdn.net/5/F/0/1_zww1984774346.jpg",@"http://s.img.mix.sina.com.cn/auto/resize?size=235_156&img=http://www.sinaimg.cn/dy/slidenews/4_img/2016_21/704_1927797_449620.jpg",@"http://s.img.mix.sina.com.cn/auto/resize?size=235_156&img=http://www.sinaimg.cn/dy/slidenews/4_img/2016_21/704_1927789_512253.jpg",@"http://avatar.csdn.net/5/F/0/1_zww1984774346.jpg"];
            
        }
        
        sta.pic_urls = array0;
       
        ZWHomeFrame *statusF=[[ZWHomeFrame alloc]init];
        statusF.status=sta;
        
        [staF addObject:statusF];

    }
    [self.statusesFrames addObjectsFromArray:staF];
    
//    NSIndexSet *indexset=[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 0)];
//    
//    [self.statusesFrames insertObjects:staF atIndexes:indexset];
    [self.mainTableView reloadData];
}

#pragma mark-UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.statusesFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //创建cell
    ZWHomeTableViewCell *cell=[ZWHomeTableViewCell cellWithTableView:tableView withIndexPath:indexPath];
    cell.delegate = self;
    cell.statusF=self.statusesFrames[indexPath.row];
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ZWHomeFrame *homeF=self.statusesFrames[indexPath.row];
    return homeF.cellHight;
}

#pragma mark - ZWHomeTableViewCell Delegate
-(void)tableViewCellToolWithIndePath:(NSIndexPath *)path andClickAtIndex:(NSInteger)index
{
    NSString * tipMSG = [NSString stringWithFormat:@"row =%ld",(long)path.row];
    switch (index) {
        case ToolBarType_Share:
           tipMSG = [tipMSG stringByAppendingString:@"点击了分享"];
            break;
        case ToolBarType_Message:
           tipMSG = [tipMSG stringByAppendingString:@"点击了消息"];
            break;
        case ToolBarType_Good:
           tipMSG = [tipMSG stringByAppendingString:@"点击了赞"];
            break;
        default:
            break;
    }
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:tipMSG delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
