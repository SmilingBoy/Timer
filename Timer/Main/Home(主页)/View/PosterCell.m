//
//  PosterCell.m
//  Timer
//
//  Created by lx on 16/5/14.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "PosterCell.h"
#import "HomeModel.h"
#import "DetailView.h"

@interface PosterCell ()

@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)DetailView *detailView;
@property (nonatomic, assign, getter = isLeft)BOOL left;

@end

@implementation PosterCell

- (void)setModel:(HomeModel *)model{
    
    _model = model;
    _detailView.model = model;
    
    [_imageView setImageWithURL:[NSURL URLWithString:self.model.img]];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        
        _detailView = [[[NSBundle mainBundle] loadNibNamed:@"DetailView" owner:nil options:nil] lastObject];
        
        _detailView.frame = self.contentView.bounds;
        
        [self.contentView addSubview:_detailView];
        [self.contentView addSubview:_imageView];

    }
    return self;
}
- (void)flipViews{
    
    //在这个方法中做反转
    //UIViewAnimationOptionTransitionFlipFromLeft
    
    UIViewAnimationOptions options = self.isLeft ? UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight;
    
    //获取所有的子视图
    NSArray *subViews = self.contentView.subviews;
    
    //获取子视图在父视图上的下标
    NSInteger index1 = [subViews indexOfObject:_detailView];
    NSInteger index2 = [subViews indexOfObject:_imageView];
    [UIView transitionWithView:self duration:0.5 options:options animations:^{
        //交换子视图的位置
        [self.contentView exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
        
    } completion:^(BOOL finished) {
        //每一次点击切换是否向左反转
        self.left = !_left;
        
    }];
    
    
}

//把ImageView拿到最上层
-(void)bringImageView{
    
    [self.contentView bringSubviewToFront:_imageView];
    
    _left = NO;
}


@end
