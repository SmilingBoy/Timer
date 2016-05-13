//
//  HomeViewController.m
//  Timer
//
//  Created by lx on 16/5/13.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "HomeViewController.h"
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
//    [self createBarbutton];
    
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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserIndetiFier];
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuserIndetiFier];
        cell.backgroundColor = [UIColor lightGrayColor];
    }
    
    HomeModel *model = _dataList[indexPath.row];
    cell.textLabel.text = model.titleCn;
    
    return cell;
    
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
            model.titleEn = [d objectForKey:@"titleEn"];
            model.img = [d objectForKey:@"img"];
            
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
    UIButton *rightButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    rightButton1.tag = 1001;
    rightButton1.frame = CGRectMake(0, 0, 49, 25);
    [rightButton1 setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [rightButton1 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [rightButton1 addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rightButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton2.tag = 1002;
    rightButton2.frame = CGRectMake(0, 0, 49, 25);
    [rightButton2 setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    [rightButton2 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [rightButton2 addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    rightButton2.hidden = YES;
    
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, 49, 25);

    [view addSubview:rightButton1];
    [view addSubview:rightButton2];
    
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithCustomView:view];

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
    
    UIView *view = self.navigationItem.rightBarButtonItem.customView;
    
    sender.hidden = YES;
    
    if (sender.tag == 1001) {
        
        UIButton *btn2 = [view viewWithTag:1002];
        btn2.hidden = NO;
        self.navigationController.navigationBar.alpha = 0.7;
    }
        
    if (sender.tag == 1002) {
        
        UIButton *btn1 = [view viewWithTag:1001];
        btn1.hidden = NO;
        self.navigationController.navigationBar.alpha = 1;
    }
    
    [self flipWithView:view isLeft:sender.tag == 1001 ? YES : NO];
    
}

/**
 *  翻转动画
 */
- (void)flipWithView:(UIView *)supView isLeft:(BOOL)left{
    
    [UIView animateWithDuration:0.5 animations:^{
       
        [UIView setAnimationTransition:left? UIViewAnimationTransitionFlipFromLeft:UIViewAnimationTransitionFlipFromRight forView:supView cache:YES];
        
    }];
    
}

#pragma mark -法2

- (void)createBarbutton{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(0, 0, 49, 25);
    [button setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(mybuttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
}

- (void)mybuttonClick:(UIButton *)sender{
    
    sender.selected = !sender.selected;
    
    self.navigationController.navigationBar.alpha = sender.selected ? 0.7 : 1;
    
    [self flipWithView:sender isLeft:sender.selected];
    
}











@end
