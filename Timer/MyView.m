//
//  MyView.m
//  BeverTimer60
//
//  Created by sunfeng on 16/5/25.
//  Copyright © 2016年 SunFeng. All rights reserved.
//

#import "MyView.h"

@implementation MyView{
    UIButton *_cancleButton;
}

-(void)show{
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    [window addSubview:self];
    
    self.transform = CGAffineTransformMakeScale(0.7, 0.7);
    
    [UIView animateWithDuration:.2 animations:^{
        self.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        self.transform = CGAffineTransformIdentity;
    }];
    
    [self bringSubviewToFront:_cancleButton];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setSelfBounds];
        [self createView];
        
    }
    return self;
}

- (void)setSelfBounds{
    
    
    
    //设置圆角
    self.layer.cornerRadius = 10;
    self.layer.borderWidth = 3;
    self.layer.borderColor = [UIColor grayColor].CGColor;
    
}

-(void)setCancleButtonImage:(NSString *)cancleButtonImage{
    _cancleButtonImage = cancleButtonImage;
    
    [_cancleButton setImage:[UIImage imageNamed:_cancleButtonImage] forState:UIControlStateNormal];
    
}

- (void)createView{
    
    _cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _cancleButton.frame = CGRectMake(self.frame.size.width - 40, 0, 40, 40);
    
    [_cancleButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_cancleButton];
    
    
}

- (void)buttonAction:(UIButton *)btn{
    
    [UIView animateWithDuration:.5 animations:^{
        self.transform = CGAffineTransformMakeScale(5, 5);
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


@end
