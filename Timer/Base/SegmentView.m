//
//  SegmentView.m
//  Timer
//
//  Created by lx on 16/5/18.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "SegmentView.h"

#define kButtonWidth self.frame.size.width/self.titleArray.count

@interface SegmentView ()

@property (nonatomic, weak)UIButton *selButton;
@property (nonatomic, weak)UIImageView *selImageView;



@end

@implementation SegmentView

- (void)setTitleArray:(NSArray *)titleArray{
    
    _titleArray = titleArray;
    
    for (int i = 0; i < titleArray.count; i++) {
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(i * kButtonWidth , 0, kButtonWidth, self.frame.size.height)];
        
        button.tag = i + 100;
        
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:20];
        
        [button addTarget:self action:@selector(setButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 0) {
            
            button.selected = YES;
            _selButton = button;
            button.titleLabel.font = [UIFont systemFontOfSize:25];
            
        }
        
        [self addSubview:button];
        
    }
}

- (void)setButtonClick:(UIButton *)sender{
    
    self.segmentBlock(sender.tag - 100);
    
    if (sender == _selButton) {
        return;
    }
    
    sender.titleLabel.font = [UIFont systemFontOfSize:25];
    sender.selected = YES;
    
    _selButton.titleLabel.font = [UIFont systemFontOfSize:20];
    _selButton.selected = NO;
    
    _selButton = sender;
    
    
    [UIView animateWithDuration:.3 animations:^{
        _selImageView.frame = CGRectMake((sender.tag - 100) * kButtonWidth, self.frame.size.height - 2, self.frame.size.width/self.titleArray.count, 2);
    }];
    

    
}

- (void)setSelectedImage:(NSString *)selectedImage{
    
    UIImageView * selImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-2, self.frame.size.width/self.titleArray.count, 2)];
    
    selImageView.image = [UIImage imageNamed:selectedImage];
    
    _selImageView = selImageView;
    
    [self addSubview:_selImageView];
    
}

@end
