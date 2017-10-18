//
//  MainVC.m
//  TestAnimation
//
//  Created by love on 2017/6/27.
//  Copyright © 2017年 love. All rights reserved.
//

#import "MainVC.h"
#import "AniamtionView.h"
#import "YSCRippleView.h"
#import "TTViewController.h"
#import "TTViewController2.h"
#import "TTViewController3.h"

BOOL aa() {
    NSLog(@"sb");
    return YES;
};

typedef enum {
    TypeNameType1 = 'abcd',
    TypeNameType2 = 'abce',
}TypeName;

@interface MainVC ()

@property (nonatomic, strong) AniamtionView *antView;
@property (nonatomic, strong) YSCRippleView *rippleView;

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.antView];
//    [self.view addSubview:self.rippleView];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"test" style:UIBarButtonItemStyleDone target:self action:@selector(clickTest:)];
    self.navigationItem.rightBarButtonItem = right;
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStyleDone target:self action:@selector(clickLeftTest:)];
    self.navigationItem.leftBarButtonItem = left;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (AniamtionView *)antView {
    if (!_antView) {
        _antView = [[AniamtionView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
        [_antView setBackgroundColor:[UIColor yellowColor]];
    }
    return _antView;
}

- (YSCRippleView *)rippleView
{
    if (!_rippleView) {
        self.rippleView = [[YSCRippleView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300)];
        //        self.rippleView = [[YSCRippleView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        [self.rippleView setBackgroundColor:[UIColor grayColor]];
    }
    
    return _rippleView;
}

- (void)clickTest:(id)sender {
//    [self.antView startAnimation2];
    
//    [_rippleView showWithRippleType:YSCRippleTypeRing];
    
//    TTViewController2 *vc = [TTViewController2 new];
//    [self.navigationController pushViewController:vc animated:YES];
    
    TTViewController3 *vc = [TTViewController3 new];
//    [self.navigationController pushViewController:vc animated:YES];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}

- (void)clickLeftTest:(id)sender {
//    [self.antView stopAnimation2];
    
    TTViewController *vc = [TTViewController new];
//    [self.navigationController pushViewController:vc animated:YES];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}


@end
