//
//  MyInfoViewController.m
//  Timer
//
//  Created by lx on 16/5/13.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "MyInfoViewController.h"

@interface MyInfoViewController ()

@end

@implementation MyInfoViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.title = @"个人";
        [self.tabBarItem setImage:[UIImage imageNamed:@"myinfo"]];
        [self.tabBarItem setSelectedImage:[UIImage imageNamed:@"myinfo_on"]];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
