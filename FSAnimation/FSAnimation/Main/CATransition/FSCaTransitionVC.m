//
//  FSCaTransitionVC.m
//  FSAnimation
//
//  Created by love on 2017/10/18.
//  Copyright © 2017年 love. All rights reserved.
//

#import "FSCaTransitionVC.h"
typedef enum {
    // 淡化效果
    XHAnimationTypeFade,
    // 推进效果
    XHAnimationTypePush,
    // 滑入效果
    XHAnimationTypeMoveIn,
    // 滑出效果
    XHAnimationTypeReveal,
    // 立方体效果
    XHAnimationTypeCube,
    // 吮吸效果
    XHAnimationTypeSuckEffect,
    // 翻转效果
    XHAnimationTypeOglFlip,
    // 波纹效果
    XHAnimationTypeRippleEffect,
    // 翻页效果
    XHAnimationTypePageCurl,
    // 反翻页效果
    XHAnimationTypePageUnCurl,
    // 开镜头效果
    XHAnimationTypeCameraHollowOpen,
    // 关镜头效果
    XHAnimationTypeCameraHollowClose,
}XHAnimationType;


@interface FSCaTransitionVC ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation FSCaTransitionVC

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

#pragma mark - 懒方法
- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@(XHAnimationTypeFade),
                       @(XHAnimationTypePush),
                       @(XHAnimationTypeMoveIn),
                       @(XHAnimationTypeReveal),
                       @(XHAnimationTypeCube),
                       @(XHAnimationTypeSuckEffect),
                       @(XHAnimationTypeOglFlip),
                       @(XHAnimationTypeRippleEffect),
                       @(XHAnimationTypePageCurl),
                       @(XHAnimationTypePageUnCurl),
                       @(XHAnimationTypeCameraHollowOpen),
                       @(XHAnimationTypeCameraHollowClose)];
    }
    return _dataArray;
}

#pragma mark - 私有方法
- (CATransition *)transitonAnimationType:(NSString *)type subType:(NSString *)subType {
    CATransition *transiton = [CATransition animation];
    
    transiton.duration = 0.5;
    transiton.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    transiton.type = type;
    transiton.subtype = subType;
    
    return transiton;
}

- (NSString *)nameWithType:(XHAnimationType)type {
    NSString *typeName = nil;
    switch (type) {
        case XHAnimationTypeFade:
            typeName = kCATransitionFade;
            break;
            
        case XHAnimationTypePush:
            typeName = kCATransitionPush;
            break;
            
        case XHAnimationTypeMoveIn:
            typeName = kCATransitionMoveIn;
            break;
            
        case XHAnimationTypeReveal:
            typeName = kCATransitionReveal;
            break;
            
        case XHAnimationTypeCube:
            typeName = @"cube";
            break;
            
        case XHAnimationTypeSuckEffect:
            typeName = @"suckEffect";
            break;
            
        case XHAnimationTypeOglFlip:
            typeName = @"oglFlip";
            break;
            
        case XHAnimationTypeRippleEffect:
            typeName = @"rippleEffect";
            break;
            
        case XHAnimationTypePageCurl:
            typeName = @"pageCurl";
            break;
            
        case XHAnimationTypePageUnCurl:
            typeName = @"pageUnCurl";
            break;
            
        case XHAnimationTypeCameraHollowOpen:
            typeName = @"cameraIrisHollowOpen";
            break;
            
        case XHAnimationTypeCameraHollowClose:
            typeName = @"cameraIrisHollowClose";
            break;
            
        default:
            break;
    }
    return typeName;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /**** 测试代码 ****/
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    
    cell.textLabel.text = [self nameWithType:((NSNumber *)self.dataArray[indexPath.row]).intValue];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSNumber *type = self.dataArray[indexPath.row];
    NSString *name = [self nameWithType:type.intValue];
    
    [self.view.layer addAnimation:[self transitonAnimationType:name subType:kCATransitionFromLeft] forKey:nil];
}

@end
