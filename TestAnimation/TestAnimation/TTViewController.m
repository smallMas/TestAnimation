//
//  TTViewController.m
//  TestAnimation
//
//  Created by love on 2017/6/28.
//  Copyright © 2017年 love. All rights reserved.
//

#import "TTViewController.h"
#import "TTCollectionCell.h"

static const void * const specificKey = &specificKey;

void func(dispatch_queue_t queue, dispatch_block_t block)

{
    if (dispatch_get_specific(specificKey)) {
        
        block();
        
    }else{
        
        dispatch_sync(queue, block);
        
    }
    
}

@interface TTViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end

@implementation TTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(testAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupView {
    [self.collectionView setBackgroundColor:[UIColor grayColor]];
    
    self.flowLayout.minimumLineSpacing = 2;
    // 布局方式改为从上至下，默认从左到右
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // Section Inset就是某个section中cell的边界范围
    self.flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    // 每行内部cell item的间距
    self.flowLayout.minimumInteritemSpacing = 0.0f;
    // 每行的间距
    self.flowLayout.minimumLineSpacing = 20.0f;
//
//    self.flowLayout.itemSize = CGSizeMake(80, 100);
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"TTCollectionCell" bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([TTCollectionCell class])];
    self.collectionView.scrollsToTop = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
}


#pragma mark - btn action 
- (void)testAction:(id)sender {
    dispatch_queue_t queueA = dispatch_queue_create("com.yiyaaixuexi.queueA", NULL);

    dispatch_queue_t queueB = dispatch_queue_create("com.yiyaaixuexi.queueB", NULL);

    dispatch_queue_set_specific(queueA, specificKey, &specificKey, NULL);
    
    dispatch_set_target_queue(queueB, queueA);
    
    NSLog(@"======1");
//    dispatch_sync(queueA, ^{
    
        NSLog(@"======2 当前队列是: %@ ",dispatch_get_current_queue());
        dispatch_sync(queueB, ^{
            
            NSLog(@"======3  当前队列是: %@",dispatch_get_current_queue());
            dispatch_block_t block = ^{
                
                //do something
                NSLog(@"do something 当前队列是: %@",dispatch_get_current_queue());
            };
            NSLog(@"======4");
            func(queueA, block);
            NSLog(@"======5");
            
        });  
        
//    });
}

#pragma mark UIColectionViewDelegate
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TTCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([TTCollectionCell class]) forIndexPath:indexPath];
    
    if (indexPath.row % 4 == 0) {
        [cell.imgView setBackgroundColor:[UIColor redColor]];
    }else if (indexPath.row % 4 == 1) {
        [cell.imgView setBackgroundColor:[UIColor yellowColor]];
    }else if (indexPath.row % 4 == 2) {
        [cell.imgView setBackgroundColor:[UIColor greenColor]];
    }else if (indexPath.row % 4 == 3) {
        [cell.imgView setBackgroundColor:[UIColor blueColor]];
    }
//    [cell setBackgroundColor:[UIColor blackColor]];
    [cell.titleLabel setText:[NSString stringWithFormat:@"%d-%d",indexPath.section,indexPath.row]];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(80, 100);
}


@end
