//
//  PosterCollectionView.m
//  Timer
//
//  Created by lx on 16/5/14.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "PosterCollectionView.h"
#import "PosterCell.h"
#import "HomeModel.h"

@implementation PosterCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        //注册单元格
        [self registerClass:[PosterCell class] forCellWithReuseIdentifier:@"cell"];
        
        self.itemWidth = kScreenWidth - 100;
    }
    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PosterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    
    //获取model
    HomeModel *model = self.dataList[indexPath.row];
    
    cell.model = model;
    
    
    return cell;
    
}

//单元格点击的时候
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.item == self.currentIndex) {
        
        PosterCell *cell = (PosterCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [cell flipViews];
        
    } else{
        
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        self.currentIndex = indexPath.item;
    }
    
}

//已经结束显示单元格的时候调用这个方法
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PosterCell *posterCell = (PosterCell *)cell;
    
    [posterCell bringImageView];
    
    
}


@end
