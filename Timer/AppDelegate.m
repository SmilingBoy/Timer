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

#import "FirstViewController.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    BOOL mark = [userDefaults boolForKey:@"isFrist"];
    
    if (mark == NO) {
        
        [userDefaults setBool:YES forKey:@"isFrist"];
        
        self.window.rootViewController = [[FirstViewController alloc] init];
        
    }else{
        
        self.window.rootViewController = [[MainViewController alloc] init];
        
    }
    
    return YES;
}



@end
