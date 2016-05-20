//
//  SiftView.m
//  Timer
//
//  Created by lx on 16/5/20.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "SiftView.h"
#import "SegmentView.h"
#import "ZQCoverView.h"

@interface SiftView ()

@end

@implementation SiftView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpSegmentView];
        
    }
    return self;
}

- (void)setUpSegmentView{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 50)];
    
    view.backgroundColor = [UIColor cyanColor];
    
    SegmentView *segmentView = [[SegmentView alloc] initWithFrame:CGRectMake(0, 0, self.width - 100, 50)];
    
    segmentView.centerX = view.centerX;
    
    segmentView.titleArray = @[@"特色",@"商圈",@"地区",@"地铁"];
    
    [segmentView setSegmentBlock:^(NSInteger index) {
        
    }];
    
    [view addSubview:segmentView];
    
    UIButton *closeButton = [[UIButton alloc] initWithFrame:CGRectMake(segmentView.right, 0, 50, 50)];
    
    [closeButton setImage:[UIImage imageNamed:@"pic_ico_wrong"] forState:UIControlStateNormal];
    
    [closeButton addTarget:self action:@selector(closeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:closeButton];
    
    [self addSubview:view];
    
}

- (void)showSiftView{
    
    [ZQCoverView showCoverBlowView:self];
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.bottom = self.top;
        
    }];
    
}

- (void)closeButtonClick:(UIButton *)sender{
    
    [UIView animateWithDuration:0.5 animations:^{
        self.top = self.bottom;
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];
    
    [ZQCoverView hide];

}

@end
