//
//  BaseCollectionViewController.h
//  Timer
//
//  Created by lx on 16/5/14.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)NSArray *dataList;

@property (nonatomic,assign)CGFloat itemWidth;

@property (nonatomic,assign)NSInteger currentIndex;

@end
