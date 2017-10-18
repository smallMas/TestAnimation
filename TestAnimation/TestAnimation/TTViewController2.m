//
//  TTViewController2.m
//  TestAnimation
//
//  Created by love on 2017/6/28.
//  Copyright © 2017年 love. All rights reserved.
//

#import "TTViewController2.h"
#import "TTCollectionCell.h"

@interface TTViewController2 ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end

@implementation TTViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setupView];
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

- (void)setupView {
    [self.collectionView setBackgroundColor:[UIColor grayColor]];
    
    self.flowLayout.minimumLineSpacing = 0;
    // 布局方式改为从上至下，默认从左到右
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    // Section Inset就是某个section中cell的边界范围
    self.flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    // 每行内部cell item的间距
    self.flowLayout.minimumInteritemSpacing = 0;
    // 每行的间距
    self.flowLayout.minimumLineSpacing = 10;
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"TTCollectionCell" bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([TTCollectionCell class])];
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
    return CGSizeMake(100, 100);
}

@end
