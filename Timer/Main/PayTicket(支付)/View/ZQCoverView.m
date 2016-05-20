//
//  ZQCoverView.m
//  彩票01
//
//  Created by lx on 16/5/11.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "ZQCoverView.h"

@implementation ZQCoverView

+ (instancetype)showCover{
    
    ZQCoverView *coverView = [[ZQCoverView alloc]initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
    
    coverView.backgroundColor = [UIColor blackColor];
    coverView.alpha = 0.5;
    
    [[UIApplication sharedApplication].keyWindow addSubview:coverView];
    
    return coverView;
}

+ (instancetype)showCoverBlowView:(UIView *)view{
    
    ZQCoverView *coverView = [[ZQCoverView alloc]initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
    
    coverView.backgroundColor = [UIColor blackColor];
    coverView.alpha = 0.5;
    
    [[UIApplication sharedApplication].keyWindow addSubview:coverView];
    [[UIApplication sharedApplication].keyWindow insertSubview:view aboveSubview:coverView];
    
    return coverView;
    
}


+ (void)hide{
    
    for (UIView *view in [UIApplication sharedApplication].keyWindow.subviews) {
        
        if ([view isKindOfClass:self]) {
            [view removeFromSuperview];
        }
    }
    
}

@end
