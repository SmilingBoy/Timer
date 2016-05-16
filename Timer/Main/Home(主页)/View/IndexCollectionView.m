//
//  IndexCollectionView.m
//  Timer
//
//  Created by lx on 16/5/16.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "IndexCollectionView.h"
#import "HomeModel.h"
#import "IndexCell.h"

@implementation IndexCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self registerClass:[IndexCell class] forCellWithReuseIdentifier:@"indexCell"];
        self.itemWidth = 100;
        
    }
    return self;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    IndexCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"indexCell" forIndexPath:indexPath];
    
    HomeModel *model = self.dataList[indexPath.row];
    
    cell.model = model;
    
    return cell;
}


@end
