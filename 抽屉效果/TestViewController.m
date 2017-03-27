//
//  TestViewController.m
//  抽屉效果
//
//  Created by lijiongjiong on 2017/3/26.
//  Copyright © 2017年 lijiongjiong. All rights reserved.
//

#import "TestViewController.h"
#import "LJDrawerViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"点击侧滑" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonClick:)];
    
}

- (void)leftBarButtonClick:(UIBarButtonItem *)item {
    [[LJDrawerViewController getDrawerViewController] openLeftMenu];
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
