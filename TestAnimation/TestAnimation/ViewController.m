//
//  ViewController.m
//  TestAnimation
//
//  Created by love on 2017/6/27.
//  Copyright © 2017年 love. All rights reserved.
//

#import "ViewController.h"
#import "AniamtionView.h"

@interface ViewController ()

@property (nonatomic, strong) AniamtionView *antView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.antView];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"test" style:UIBarButtonItemStyleDone target:self action:@selector(clickTest:)];
    self.navigationItem.rightBarButtonItem = right;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (AniamtionView *)antView {
    if (!_antView) {
        _antView = [[AniamtionView alloc] initWithFrame:self.view.bounds];
    }
    return _antView;
}

- (void)clickTest:(id)sender {
    [self.antView startAnimation];
}

@end
