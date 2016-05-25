//
//  MainViewController.m
//  Timer
//
//  Created by lx on 16/5/25.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "MainViewController.h"
#import "BaseNavViewController.h"
#import "BaseTabBarController.h"
#import "HomeViewController.h"
#import "MyView.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


+ (void)createViewControllers{
    NSArray *viewControllers = @[@"HomeViewController",@"StoreViewController",@"PayTicketViewController",@"DiscoverViewController",@"MyInfoViewController"];
    NSMutableArray *navs = [[NSMutableArray alloc] init];
    
    for (NSString *str in viewControllers) {
        
        //创建视图控制器（三级控制器）
        UIViewController *vc = [[NSClassFromString(str) alloc] init];
        //创建导航控制器（二级控制器）
        BaseNavViewController *nav = [[BaseNavViewController alloc] initWithRootViewController:vc];
        [navs addObject:nav];
        
    }
    BaseTabBarController *tabbarVC = [[BaseTabBarController alloc] init];
    tabbarVC.viewControllers = navs;
    
    //    self.window.rootViewController = tabbarVC;
    
    [[UIApplication sharedApplication].delegate window].rootViewController = tabbarVC;;
    
    HomeViewController *home = tabbarVC.viewControllers[0];
    
    home.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
    
    [UIView animateWithDuration:1 animations:^{
        home.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        MyView *view = [[MyView alloc] initWithFrame:CGRectMake((kScreenWidth - 250)/2, (kScreenHeight - 360)/2, 250, 360)];
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:view.bounds];
        
        [view addSubview:scrollView];
        
        
        for (int i = 0; i < 4; i++) {
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(250 * i, 0, 250, 360)];
            imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"wizard%d_568@2x.jpg",i+1]];
            [scrollView addSubview:imageView];
            
        }
        
        scrollView.contentSize = CGSizeMake(250*4, 360);
        scrollView.pagingEnabled = YES;
        scrollView.scrollEnabled = YES;
        
        view.cancleButtonImage = @"pic_ico_wrong";
        
        [view show];
    }];
    
    
}
@end
