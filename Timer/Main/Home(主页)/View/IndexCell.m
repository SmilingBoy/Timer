//
//  IndexCell.m
//  Timer
//
//  Created by lx on 16/5/16.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "IndexCell.h"

@interface IndexCell ()

@property (nonatomic, weak)UIImageView *imageView;


@end

@implementation IndexCell

- (UIImageView *)imageView{
    
    if (!_imageView) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.contentView.bounds];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView = imageView;
        
        [self.contentView addSubview:_imageView];
        
    }
    return _imageView;
}

- (void)setModel:(HomeModel *)model{
    
    _model = model;
    
    [self.imageView setImageWithURL:[NSURL URLWithString:_model.img]];
    
}


@end
