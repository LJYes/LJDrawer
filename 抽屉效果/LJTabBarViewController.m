//
//  LJTabBarViewController.m
//  抽屉效果
//
//  Created by lijiongjiong on 2017/3/26.
//  Copyright © 2017年 lijiongjiong. All rights reserved.
//

#import "LJTabBarViewController.h"
#import "TestViewController.h"

@interface LJTabBarViewController ()

@end

@implementation LJTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewController:[[UINavigationController alloc] initWithRootViewController:[TestViewController new]]];
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
