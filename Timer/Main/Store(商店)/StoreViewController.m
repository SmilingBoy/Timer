//
//  StoreViewController.m
//  Timer
//
//  Created by lx on 16/5/13.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "StoreViewController.h"

@interface StoreViewController ()

@end

@implementation StoreViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.title = @"商店";
        [self.tabBarItem setImage:[UIImage imageNamed:@"store"]];
        [self.tabBarItem setSelectedImage:[UIImage imageNamed:@"store_on"]];
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
