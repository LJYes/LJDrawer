//
//  LJDrawerViewController.m
//  抽屉效果
//
//  Created by lijiongjiong on 2017/3/26.
//  Copyright © 2017年 lijiongjiong. All rights reserved.
//

#import "LJDrawerViewController.h"

@interface LJDrawerViewController ()
@property (nonatomic, strong) UIViewController *mainVC;     //  根控制器
@property (nonatomic, strong) UIViewController *leftMenuVC; //  左边菜单控制器
@property (nonatomic, assign) CGFloat leftWidth;            //  左边菜单控制器的偏移宽度
@property (nonatomic, strong) UIView *coverView;            //  遮盖的View
@property (nonatomic, assign) CGFloat mainViewOldPointX;    //  根控制器视图原本的偏移值

@end

@implementation LJDrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self initSetting];
}


+ (instancetype)getDrawerViewController {
    return (LJDrawerViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
}


+ (instancetype)drawerVCWithMainVC:(UIViewController *)mainVC leftMenuVC:(UIViewController *)leftMenuVC leftWidth:(CGFloat)leftWidth {
    
    //  创建抽屉控制器
    LJDrawerViewController *drawerVC = [LJDrawerViewController new];
    
    //  记录传进来的VC
    drawerVC.mainVC = mainVC;
    drawerVC.leftMenuVC = leftMenuVC;
    //  记录左边菜单控制器偏移的宽度
    if (!leftWidth) {
        //默认左边菜单偏移的宽度为屏幕的0.7
        drawerVC.leftWidth = [UIScreen mainScreen].bounds.size.width *0.7;
    } else {
        drawerVC.leftWidth = leftWidth;
    }
    
    //  将左边菜单控制器的view添加到抽屉控制器的view上
    //  将根控制器的view添加到抽屉控制器的view上
    //  先加菜单view,再加根控制器,让根控制器在菜单view的上面
    [drawerVC.view addSubview:leftMenuVC.view];
    [drawerVC.view addSubview:mainVC.view];
    [drawerVC addChildViewController:leftMenuVC];
    [drawerVC addChildViewController:mainVC];
    
    return drawerVC;
}


- (void)openLeftMenu {
    [self.mainVC.view addSubview:self.coverView];
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.leftMenuVC.view.transform = CGAffineTransformIdentity;
        self.mainVC.view.transform = CGAffineTransformMakeTranslation(self.leftWidth, 0); // 偏移
        self.coverView.alpha = 0.5;
    } completion:^(BOOL finished) {
        
    }];
}


- (void)closeLeftMenu {
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.mainVC.view.transform = CGAffineTransformIdentity;
        self.leftMenuVC.view.transform = CGAffineTransformMakeTranslation(-self.leftWidth *0.5, 0); // 偏移
        self.coverView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.coverView removeFromSuperview];
    }];
}


- (void)initSetting {
    [self setMainVCShadow];
    self.leftMenuVC.view.transform = CGAffineTransformMakeTranslation(-self.leftWidth *0.5, 0);
}


- (void)setMainVCShadow {
    self.mainVC.view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.mainVC.view.layer.shadowOffset = CGSizeMake(-1, -1);
    self.mainVC.view.layer.shadowOpacity = 0.3;
    self.mainVC.view.layer.shadowRadius = 1;
}


#pragma mark - coverViewGestureRecognizer
#pragma mark

/**
 点按手势
 */
- (void)coverViewTap:(UITapGestureRecognizer *)tap {
    [self closeLeftMenu];
}


/**
 长按手势
 */
- (void)coverViewPan:(UIPanGestureRecognizer *)pan {
    CGFloat translationInViewPointX = [pan translationInView:self.mainVC.view].x;
    
    if (pan.state == UIGestureRecognizerStateChanged && translationInViewPointX<0 && translationInViewPointX > -self.leftWidth) {
        if (self.mainVC.view.frame.origin.x > self.leftWidth ) {
            self.mainVC.view.transform = CGAffineTransformMakeTranslation(self.leftWidth, 0); // 偏移
        } else {
            self.mainVC.view.transform = CGAffineTransformMakeTranslation(translationInViewPointX+self.leftWidth, 0); // 偏移
        }
        self.leftMenuVC.view.transform = CGAffineTransformMakeTranslation(translationInViewPointX *0.5, 0); // 偏移
    }
    
    self.coverView.alpha = self.mainVC.view.frame.origin.x / self.leftWidth *0.5;
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        if (self.mainVC.view.frame.origin.x >= self.leftWidth *0.5) {
            [UIView animateWithDuration:0.2 animations:^{
                self.mainVC.view.transform = CGAffineTransformMakeTranslation(self.leftWidth, 0); // 偏移
                self.leftMenuVC.view.transform = CGAffineTransformIdentity;
                self.coverView.alpha = self.mainVC.view.frame.origin.x / self.leftWidth *0.5;
            }];
        } else {
            [self closeLeftMenu];
        }
    }
    
}


#pragma mark - lazy
#pragma mark
- (UIView *)coverView {
    if (!_coverView) {
        _coverView = [[UIView alloc] initWithFrame:self.mainVC.view.bounds];
        _coverView.backgroundColor = [UIColor blackColor];
        _coverView.alpha = 0;
        [_coverView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(coverViewTap:)]];
        [_coverView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(coverViewPan:)]];
    }
    return _coverView;
}

@end
