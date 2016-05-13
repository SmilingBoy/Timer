//
//  HomeViewController.m
//  Timer
//
//  Created by lx on 16/5/13.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTabbleViewCell.h"
#import "HomeModel.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSMutableArray *dataList;

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
    
    [self createNavBarItem];
    
    [self createTableView];
    
}

/**
 *  创建tableView
 */
- (void)createTableView{
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
}

#pragma mark -tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *reuserIndetiFier = @"cell";
    
    HomeTabbleViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserIndetiFier];
    if (!cell) {
        
        cell = [[NSBundle mainBundle] loadNibNamed:@"HomeTabbleViewCell" owner:self options:nil].lastObject;
        cell.backgroundColor = [UIColor clearColor];
    }
    
    HomeModel *model = _dataList[indexPath.row];
    cell.model = model;
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 140;
}

/**
 *  存储json内容到HomeModel.
 *
 *  @return _dataList
 */
- (NSMutableArray *)dataList{
    
    if (!_dataList) {
        _dataList = [NSMutableArray array];
        
        //读取json文件
        NSString *path = [[NSBundle mainBundle] pathForResource:@"home_header" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *array = [dic objectForKey:@"movies"];
        
        for (NSDictionary *d in array) {
            
            HomeModel *model = [[HomeModel alloc]init];
            
            model.titleCn = [d objectForKey:@"titleCn"];
            model.img = [d objectForKey:@"img"];
            model.titleEn = [d objectForKey:@"titleEn"];
            model.ratingFinal = [d objectForKey:@"ratingFinal"];
            model.rYear = [d objectForKey:@"rYear"];
            model.commonSpecial = [d objectForKey:@"commonSpecial"];
            
            
            [_dataList addObject:model];
        }
        
    }
    return _dataList;
}


/**
 *  设置导航栏按钮
 */
- (void)createNavBarItem{
    //左侧按钮
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setTitle:@"北京" forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(0, 0, 60, 30);
    [leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    
    //右侧按钮
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    rightButton.frame = CGRectMake(0, 0, 49, 25);
    [rightButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateSelected];
    [rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];

}

/**
 *  左侧按钮点击事件
 */
- (void)leftButtonClick:(UIButton *)sender{
    
}

/**
 *  右侧按钮点击事件
 */
- (void)rightButtonClick:(UIButton *)sender{
    
    sender.selected = !sender.selected;
    
    self.navigationController.navigationBar.alpha = sender.selected ? 0.7 : 1;
    
    [self flipWithView:sender isLeft:sender.selected];
    
}

/**
 *  翻转动画
 */
- (void)flipWithView:(UIView *)supView isLeft:(BOOL)left{
    
    [UIView animateWithDuration:0.5 animations:^{
       
        [UIView setAnimationTransition:left? UIViewAnimationTransitionFlipFromLeft:UIViewAnimationTransitionFlipFromRight forView:supView cache:YES];
        
    }];
    
}










@end
