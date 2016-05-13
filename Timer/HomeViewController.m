//
//  HomeViewController.m
//  Timer
//
//  Created by lx on 16/5/13.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.title = @"主页";
        [self.tabBarItem setImage:[UIImage imageNamed:@"home"]];
        [self.tabBarItem setSelectedImage:[UIImage imageNamed:@"home_on"]];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
