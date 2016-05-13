//
//  DiscoverViewController.m
//  Timer
//
//  Created by lx on 16/5/13.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "DiscoverViewController.h"

@interface DiscoverViewController ()

@end

@implementation DiscoverViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"发现";
        [self.tabBarItem setImage:[UIImage imageNamed:@"discover"]];
        [self.tabBarItem setSelectedImage:[UIImage imageNamed:@"discover_on"]];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
