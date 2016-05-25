//
//  FirstViewController.m
//  BeverTimer60
//
//  Created by sunfeng on 16/5/25.
//  Copyright © 2016年 SunFeng. All rights reserved.
//

#import "FirstViewController.h"
#import "MainViewController.h"

@interface FirstViewController ()<UIScrollViewDelegate>

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _button.hidden = YES;
    
    [self loadViews];
    
}

- (void)loadViews{
    _scrollView.contentSize = CGSizeMake(kScreenWidth * 3, kScreenHeight);
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    
    //在scrollView上创建图片
    for (int i = 0; i < 3; i ++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenHeight * i, 0, kScreenWidth, kScreenHeight)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"wizard%d_920.jpg",i+1]];
        
        [_scrollView addSubview:imageView];
        
    }
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    //通过偏移量计算当前第几页
    NSInteger currentPage = scrollView.contentOffset.x/kScreenWidth;
    if (currentPage == 2) {
        _button.hidden = NO;
    } else {
        _button.hidden = YES;
    }
    
    
}

- (IBAction)btnAction:(UIButton *)sender {
    
    [MainViewController createViewControllers];
}

@end
