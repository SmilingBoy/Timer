//
//  PayTicketViewController.m
//  Timer
//
//  Created by lx on 16/5/13.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "PayTicketViewController.h"

@interface PayTicketViewController ()

@end

@implementation PayTicketViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.title = @"购票";
        [self.tabBarItem setImage:[UIImage imageNamed:@"payticket"]];
        [self.tabBarItem setSelectedImage:[UIImage imageNamed:@"payticket_on"]];
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
