//
//  PosterCell.h
//  Timer
//
//  Created by lx on 16/5/14.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeModel;

@interface PosterCell : UICollectionViewCell

@property (nonatomic, strong)HomeModel *model;

- (void)flipViews;

- (void)bringImageView;


@end
