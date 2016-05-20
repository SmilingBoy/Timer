//
//  NewMovieHeadView.m
//  Timer
//
//  Created by lx on 16/5/19.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "NewMovieHeadView.h"
#import "AttentMovieCell.h"

@interface NewMovieHeadView ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>



@end

@implementation NewMovieHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
//        self.backgroundColor = [UIColor whiteColor];
        
        [self setUpChildView];
        
    }
    return self;
}

- (void)setUpChildView{
    
    CGFloat viewWidth = self.frame.size.width;
    CGFloat viewHeight = self.frame.size.height;
    
//    NSLog(@"%f,%f",viewWidth,viewHeight);
    
    //添加label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    label.text = @"最受关注";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:25];
    
    [self addSubview:label];
    
    //添加collectionView
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(viewWidth, viewHeight - 40);
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 40, viewWidth, viewHeight - 40) collectionViewLayout:layout];
    
    collection.delegate = self;
    collection.dataSource = self;
    
    collection.backgroundColor = [UIColor clearColor];
    collection.pagingEnabled = YES;
    
    [collection registerNib:[UINib nibWithNibName:@"AttentMovieCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    [self addSubview:collection];
    
}


#pragma mark -UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _dataList.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    AttentMovieCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.model = _dataList[indexPath.row];
    
    return cell;
}

@end
