//
//  FSMainVC.m
//  FSAnimation
//
//  Created by love on 2017/10/18.
//  Copyright © 2017年 love. All rights reserved.
//

#import "FSMainVC.h"
#import "FSCaTransitionVC.h"

typedef enum {
    // CATransition
    FSAnimationMethodCaTransition,
}FSAnimationMethod;

@interface FSMainVC ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation FSMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@(FSAnimationMethodCaTransition)];
    }
    return _dataArray;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /**** 测试代码 ****/
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    
    NSNumber *num = self.dataArray[indexPath.row];
    FSAnimationMethod method = num.intValue;
    
    NSString *text = @"";
    switch (method) {
        case FSAnimationMethodCaTransition:
            text = @"CATransition";
            break;
            
        default:
            break;
    }
    cell.textLabel.text = text;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSNumber *num = self.dataArray[indexPath.row];
    FSAnimationMethod method = num.intValue;
    
    switch (method) {
        case FSAnimationMethodCaTransition:
        {
            FSCaTransitionVC *vc = [FSCaTransitionVC new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
}


@end
