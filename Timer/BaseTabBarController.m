//
//  BaseTabBarController.m
//  Timer
//
//  Created by lx on 16/5/13.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "BaseTabBarController.h"

#define kTabBarWidth self.tabBar.frame.size.width
#define kTabBarHeight self.tabBar.frame.size.height
#define kButtonWidth kTabBarWidth/self.viewControllers.count
#define angle2Radian(angle) ((angle)/180.0 * M_PI)

@interface BaseTabBarController ()

/*   选中图片控件    */
@property(nonatomic,strong)UIImageView *selectedImageView;

@property(nonatomic,strong)NSMutableArray *tabBarButtonArray;


@end

@implementation BaseTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tabBarButtonArray = [NSMutableArray array];
    self.tabBar.selectionIndicatorImage = [UIImage imageNamed:@"selectTabbar_bg_all"];

}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    /*   保存选中图片    */
    UIImage *selectImage = self.tabBar.selectionIndicatorImage;
    
    /*   图片存在就把图片设置到tabBar上对应位置    */
    if (selectImage) {
        
        _selectedImageView = [[UIImageView alloc]initWithImage:selectImage];
        
        _selectedImageView.frame = CGRectMake(self.selectedIndex * kButtonWidth, 0, kButtonWidth, kTabBarHeight);
        
        [self.tabBar insertSubview:_selectedImageView atIndex:0];
        
        UIButton *selectButton = _tabBarButtonArray[self.selectedIndex];
        selectButton.selected = YES;
        
        
    }
    
}


-(void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers{
    
    [super setViewControllers:viewControllers];
    
    /*   移除原有的按钮    */
    for (UIView *view in self.tabBar.subviews) {
        
        [view removeFromSuperview];
        
    }
    
    /*   添加自定义按钮    */
    for (int i = 0; i < self.viewControllers.count; i++) {
        
        VerticalButton *button = [[VerticalButton alloc]initWithFrame:CGRectMake(kButtonWidth * i, 0, kButtonWidth, kTabBarHeight)];
        
        button.tag = 100 + i;
        
        [button setImage:self.viewControllers[i].tabBarItem.image forState:UIControlStateNormal];
        
        [button setImage:self.viewControllers[i].tabBarItem.selectedImage forState:UIControlStateSelected];
        
        [button setTitle:self.viewControllers[i].tabBarItem.title forState:UIControlStateNormal];
        
        /*   添加到是否选中状态数组中    */
        [_tabBarButtonArray addObject:button];
        
        /*   点击事件    */
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.tabBar addSubview:button];
        
    }
    
}

/*   tabBar按钮点击事件处理    */
-(void)buttonAction:(VerticalButton *)sender{
    
    self.selectedIndex = sender.tag - 100;
    
    
    //按钮选中情况处理
    for (UIButton *button in _tabBarButtonArray) {
        button.selected = NO;
    }
    
    //选中处理
    sender.selected = YES;
    
    [UIView animateWithDuration:0.1 animations:^{
        
        _selectedImageView.frame = CGRectMake(self.selectedIndex * kButtonWidth, 0, kButtonWidth, kTabBarHeight);
        
    }];
    
}


@end

#pragma mark VerticalButton
@interface VerticalButton ()

@property(nonatomic,strong)UILabel *sublabel;

@property(nonatomic,strong)UIImageView *subImageView;

@property(nonatomic,strong)UIImage *selectImage;

@property(nonatomic,strong)UIImage *normalImage;

@end

@implementation VerticalButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        /*   label    */
        _sublabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height * 0.3)];
        
        [self addSubview:_sublabel];
        
        _sublabel.font = [UIFont systemFontOfSize:12];
        _sublabel.textColor = [UIColor whiteColor];
        _sublabel.textAlignment = NSTextAlignmentCenter;
        
        /*   imageView    */
        _subImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, _sublabel.frame.size.height, frame.size.width, frame.size.height - _sublabel.frame.size.height)];
        
        _subImageView.contentMode = UIViewContentModeCenter;
        
        [self addSubview:_subImageView];
        
    }
    return self;
}

-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    
    _sublabel.text = title;
    
}

-(void)setImage:(UIImage *)image forState:(UIControlState)state{
    
    if (state == UIControlStateNormal) {
        //保存默认图片
        _normalImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [_subImageView setImage:_normalImage];
        
    }else if (state == UIControlStateSelected){
        //保存选中图片
        _selectImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }
}

-(void)setSelected:(BOOL)selected{
    
    [super setSelected:selected];
    
    if (self.selected == YES) {
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        
        // 动画选项设定
        animation.duration = 0.2; // 动画持续时间
        animation.repeatCount = 1; // 重复次数
        animation.autoreverses = YES; // 动画结束时执行逆动画
        
        // 缩放倍数
        animation.fromValue = [NSNumber numberWithFloat:1.0]; // 开始时的倍率
        animation.toValue = [NSNumber numberWithFloat:0.5]; // 结束时的倍率
        
        // 添加动画
        
        [self.subImageView.layer addAnimation:animation forKey:nil];
        
        _subImageView.image = _selectImage;
    }else{
        _subImageView.image = _normalImage;
    }
    
}



@end
