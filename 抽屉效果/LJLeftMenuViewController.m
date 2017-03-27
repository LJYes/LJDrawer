//
//  LJLeftMenuViewController.m
//  抽屉效果
//
//  Created by lijiongjiong on 2017/3/26.
//  Copyright © 2017年 lijiongjiong. All rights reserved.
//

#import "LJLeftMenuViewController.h"


NSString *const leftMenureusableCellWithIdentifier = @"leftMenureusableCellWithIdentifier";
@interface LJLeftMenuViewController ()<UITableViewDataSource> {
    UITableView *m_tableView;
}

@property (nonatomic, strong) NSArray *dataSource;


@end

@implementation LJLeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    
}


- (void)initTableView {
    m_tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    m_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [m_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:leftMenureusableCellWithIdentifier];
    m_tableView.dataSource = self;
    [self.view addSubview:m_tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:leftMenureusableCellWithIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:leftMenureusableCellWithIdentifier];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}


- (NSArray *)dataSource {
    if (!_dataSource) {
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSInteger i=0; i<10; i++) {
            [arrM addObject:[NSString stringWithFormat:@"%zd", i]];
        }
        _dataSource = arrM.copy;
    }
    return _dataSource;
}



@end
