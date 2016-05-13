//
//  AppDelegate.m
//  Timer
//
//  Created by lx on 16/5/13.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarController.h"
#import "BaseNavViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    NSArray *viewControllerArray = @[@"Home",@"Discover",@"PayTicket",@"Store",@"MyInfo"];
    
    NSMutableArray *viewControllers = [NSMutableArray array];
    for (NSString *str in viewControllerArray) {
        
        NSString *viewControllerName = [NSString stringWithFormat:@"%@ViewController",str];
        
        UIViewController *viewController = [[NSClassFromString(viewControllerName) alloc]init];
        
        BaseNavViewController *baseNC = [[BaseNavViewController alloc]initWithRootViewController:viewController];
        
        [viewControllers addObject:baseNC];
    }

    BaseTabBarController *tabBar = [[BaseTabBarController alloc]init];
    tabBar.viewControllers = viewControllers;
    self.window.rootViewController = tabBar;
    
    return YES;
}



@end
