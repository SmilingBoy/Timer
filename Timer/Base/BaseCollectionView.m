//
//  BaseCollectionView.m
//  Timer
//
//  Created by lx on 16/5/14.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "BaseCollectionView.h"

@interface BaseCollectionView ()

@end

@implementation BaseCollectionView


- (instancetype)initWithFrame:(CGRect)frame
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
        
    }
    return self;
}

/**
 *  cell大小
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(self.itemWidth, 400);
    
}

/**
  * cell间距
  */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    CGFloat width = (kScreenWidth - self.itemWidth) / 2.0;
    
    return UIEdgeInsetsMake(0, width, 0, width);
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    return nil;
}

/**
 *  活动结束时调用
 */

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    CGFloat xOffset = targetContentOffset -> x;
    
    NSInteger index = xOffset/self.itemWidth;
    
    if (index > self.dataList.count - 1) {
        index = self.dataList.count - 1;
    }
    
    self.currentIndex = index;
    
}

@end
