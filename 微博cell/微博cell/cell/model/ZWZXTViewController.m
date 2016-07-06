//
//  ZWZXTViewController.m
//  ECharts-OC
//
//  Created by rayootech on 16/5/25.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWZXTViewController.h"
#import "ZWWebViewManager.h"
@interface ZWZXTViewController ()

@end

@implementation ZWZXTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ZWWebViewManager *manager = [[ZWWebViewManager alloc]initWithFrame:CGRectMake(0, 0, 450, 450)];
    
    [manager createZheXianTuWithTitle:@[@"未来一周气温变化",@"纯属虚构"] Legend:@[@"最高气温",@"最低气温"] ValueX:@[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"] data:@[@[@11, @11, @15, @13, @12, @13,@10],@[@1, @-2, @2, @5, @3, @2, @0]]];
    [self.view addSubview:manager];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
