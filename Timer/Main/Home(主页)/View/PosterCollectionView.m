//
//  PosterCollectionView.m
//  Timer
//
//  Created by lx on 16/5/14.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "PosterCollectionView.h"
#import "HomeModel.h"

@implementation PosterCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        //注册单元格
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        self.itemWidth = kScreenWidth - 100;
    }
    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    
    //获取model
    HomeModel *model = self.dataList[indexPath.row];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
    [imageView setImageWithURL:[NSURL URLWithString:model.img]];
    [cell addSubview:imageView];
    
    
    return cell;
    
}


@end
