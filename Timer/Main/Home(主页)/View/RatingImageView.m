//
//  RatingImageView.m
//  Timer
//
//  Created by lx on 16/5/13.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "RatingImageView.h"

@interface RatingImageView ()

@property (nonatomic, weak)UIView *yellowView;


@end

@implementation RatingImageView

- (void)awakeFromNib{
    
    [self loadSubviews];
    
}

- (void)loadSubviews{
    
    UIImage *grayImage = [UIImage imageNamed:@"gray"];
    UIImage *yellowImage = [UIImage imageNamed:@"yellow"];
    
    CGFloat width = grayImage.size.width * 5;
    CGFloat height = grayImage.size.height;
    
    UIView *grayView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    UIView *yellowView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    _yellowView = yellowView;
    
    [grayView setBackgroundColor:[UIColor colorWithPatternImage:grayImage]];
    [self addSubview:grayView];
    [yellowView setBackgroundColor:[UIColor colorWithPatternImage:yellowImage]];
    [self addSubview:yellowView];
    
    CGFloat scaleX = self.frame.size.width/width;
    CGFloat scaleY = self.frame.size.height/height;
    
    grayView.transform = CGAffineTransformMakeScale(scaleX, scaleY);
    yellowView.transform = CGAffineTransformMakeScale(scaleX, scaleY);
    
    grayView.center = CGPointMake(self.width/2, self.height/2);
    yellowView.center = CGPointMake(self.width/2, self.height/2);

}
- (void)setRating:(CGFloat)rating{
    
    _rating = rating;
    //重新设置黄色视图的frame
    _yellowView.frame = CGRectMake(0, 0, self.frame.size.width*rating/10, self.frame.size.height);
    
}

@end
