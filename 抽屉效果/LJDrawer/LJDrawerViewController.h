//
//  LJDrawerViewController.h
//  抽屉效果
//
//  Created by lijiongjiong on 2017/3/26.
//  Copyright © 2017年 lijiongjiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJDrawerViewController : UIViewController


/**
 快速创建抽屉控制器

 @param mainVC 根控制器
 @param leftMenuVC 左边的控制器
 @param leftWidth 左边的菜单控制器显示的最大范围，默认为屏幕宽度的0.7倍
 @return 抽屉控制器
 */
+ (instancetype)drawerVCWithMainVC:(UIViewController *)mainVC leftMenuVC:(UIViewController *)leftMenuVC leftWidth:(CGFloat)leftWidth;


/**
 打开左边的菜单
 */
- (void)openLeftMenu;


/**
 关闭左边菜单
 */
- (void)closeLeftMenu;

/**
 获取抽屉控制器
 */
+ (instancetype)getDrawerViewController;
@end
