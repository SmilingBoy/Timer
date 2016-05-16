//
//  PosterView.m
//  Timer
//
//  Created by lx on 16/5/14.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "PosterView.h"
#import "PosterCollectionView.h"
#import "IndexCollectionView.h"

@interface PosterView ()

@property (nonatomic, weak)PosterCollectionView *posterCollectionView;
@property (nonatomic, weak)IndexCollectionView *indexCollectionView;

@property (nonatomic, weak)UIImageView *headView;
@property (nonatomic, weak)UIView *mask;




@end

@implementation PosterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self posterCollectionView];
        [self createMaskView];
        [self headView];
        [self createLight];
        [self addObserver];
    }
    return self;
}


- (PosterCollectionView *)posterCollectionView{
    
    if (!_posterCollectionView) {
        
        PosterCollectionView *posterCollectionView = [[PosterCollectionView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        _posterCollectionView = posterCollectionView;
        
        [self addSubview:_posterCollectionView];
        
    }
    return _posterCollectionView;
}

- (IndexCollectionView *)indexCollectionView{
    
    if (!_indexCollectionView) {
        
        IndexCollectionView *indexCollectionView = [[IndexCollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 120)];
        _indexCollectionView = indexCollectionView;
        
        [self.headView addSubview:_indexCollectionView];
    }
    return _indexCollectionView;
}

- (void)setDataList:(NSArray *)dataList{
    
    
    _dataList = dataList;
    
    self.posterCollectionView.dataList = _dataList;
    self.indexCollectionView.dataList = _dataList;
    
}

- (UIImageView *)headView{
    
    
    
    if (!_headView) {
        
        UIImageView *headView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -120, kScreenWidth, 150)];
        headView.image = [[UIImage imageNamed:@"indexBG_home"] stretchableImageWithLeftCapWidth:0 topCapHeight:5];
        headView.userInteractionEnabled = YES;
        
        _headView = headView;   
        [self addSubview:_headView];
        
        //创建按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(kScreenWidth/2 - 100/2, 120, 100, 30);
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
        //设置选中状态图片
        [btn setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
        btn.selected = NO;
        [headView addSubview:btn];

    }
    return _headView;
}

/**
 *  按钮监听
 */
- (void)btnAction:(UIButton *)btn{
    
    if (btn.selected == NO) {
        
        [UIView animateWithDuration:.5 animations:^{
            
            self.headView.transform = CGAffineTransformMakeTranslation(0, 120);
        }];
        
    } else {
        
        [UIView animateWithDuration:.5 animations:^{
            
            self.headView.transform = CGAffineTransformIdentity;//还原headerView
        }];
    }
    
    _mask.hidden = btn.selected;
    btn.selected = !btn.selected;
    
}

- (void)createLight{
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, 124, 240)];
    
    imageView.image = [UIImage imageNamed:@"light"];
    [self addSubview:imageView];
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth - 124, 10, 124, 240)];
    
    imageView2.image = [UIImage imageNamed:@"light"];
    [self addSubview:imageView2];
    
}

- (void)createMaskView{
    
    UIView *mask = [[UIView alloc] initWithFrame:self.bounds];
    mask.backgroundColor = [UIColor blackColor];
    mask.alpha = 0.5;
    mask.hidden = YES;
    
    _mask = mask;
    [self addSubview:_mask];
    
}

- (void)addObserver{
    
    [self.posterCollectionView addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
    [self.indexCollectionView addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"currentIndex"]) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[[change objectForKey:@"new"] integerValue] inSection:0];

        if ([object isKindOfClass:[PosterCollectionView class]]) {
            
            [self.indexCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            
        }
        
        if ([object isKindOfClass:[IndexCollectionView class]]) {
            
            [self.posterCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }
        
    }
    
}


@end
