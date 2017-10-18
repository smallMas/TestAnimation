//
//  TTViewController3.m
//  TestAnimation
//
//  Created by love on 2017/6/28.
//  Copyright © 2017年 love. All rights reserved.
//

#import "TTViewController3.h"
#import "TTCollectionCell.h"

NSString *const kMyCollectionViewCellID = @"kMyCollectionViewCellID";

@interface TTViewController3 () <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;

@end

@implementation TTViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    _collectionView = ({
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        //        layout.itemSize = CGSizeMake(130, 130);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 2;
        
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 244, self.view.frame.size.width,130) collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.scrollsToTop = NO;
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        //        [collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:kMyCollectionViewCellID];
        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kMyCollectionViewCellID];
        [self.view addSubview:collectionView];
        collectionView;
    });
    
    
    struct animal *anim = NULL;
    struct pig *pig = NULL;
    struct dog *dog = NULL;
    
    // pig 子类
    pig = init_pig();
    printf("name = %s\n",animal_get_name(pig));
    
    printf("----------------------------------\n");
    
    // dog 子类
    dog = init_dog();
    printf("name = %s\n",animal_get_name(dog));
    
    printf("----------------------------------\n");
    
    // 转向 动物父类进行操作
    anim = (struct animal *)dog;
    printf("name = %s\n",animal_get_name(anim));
    animal_shout(anim, 100);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}


- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //     return [collectionView dequeueReusableCellWithReuseIdentifier:kMyCollectionViewCellID forIndexPath:indexPath];
    
    //    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kMyCollectionViewCellID forIndexPath:indexPath];
    //    [cell configureCellWithPostURL:@"postImage.jpg"];
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kMyCollectionViewCellID forIndexPath:indexPath];
    if (indexPath.row % 4 == 0) {
        [cell setBackgroundColor:[UIColor redColor]];
    }else if (indexPath.row % 4 == 1) {
        [cell setBackgroundColor:[UIColor yellowColor]];
    }else if (indexPath.row % 4 == 2) {
        [cell setBackgroundColor:[UIColor greenColor]];
    }else if (indexPath.row % 4 == 3) {
        [cell setBackgroundColor:[UIColor blueColor]];
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
//
//- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
//    [(MyCollectionViewCell *)cell configureCellWithPostURL:@"postImage.jpg"];
//}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(130, 130);
}



@end
