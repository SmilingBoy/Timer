//
//  ImageScanCollectionView.m
//  Timer
//
//  Created by lx on 16/5/24.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "ImageScanCollectionView.h"

@implementation ImageScanCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    
    self.itemWidth = kScreenWidth;
    self.pagingEnabled = YES;
    self = [super initWithFrame:frame];
    if (self) {
        //注册单元格
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    NSLog(@"%ld",self.dataList.count);
    
    return self.dataList.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    for (UIView *view in cell.subviews) {
        
        if ([view isKindOfClass:[UIImageView class]]) {
            [view removeFromSuperview];
        }
        
    }
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 300)];
    
    NSLog(@"%@",self.dataList[indexPath.item]);
    
    [imageView setImageWithURL:[NSURL URLWithString:self.dataList[indexPath.item]]];
    
    [cell.contentView addSubview:imageView];
    
    return cell;
    
}


@end
