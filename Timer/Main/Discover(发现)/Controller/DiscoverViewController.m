//
//  DiscoverViewController.m
//  Timer
//
//  Created by lx on 16/5/13.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "DiscoverViewController.h"
#import "SegmentView.h"
#import "HotModel.h"
#import "HotMovieCell.h"

@interface DiscoverViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak)UITableView *tableView1;
@property (nonatomic, weak)UITableView *tableView2;

@property (nonatomic, strong)NSMutableArray *dataList1;
@property (nonatomic, strong)NSMutableArray *dataList2;



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
    
    [self createSegmentView];
    
    [self loadData];
    
    [self createTableView];
    
}

- (void)createSegmentView{
    SegmentView *segmentView = [[SegmentView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
    
    //给segmentView设置标题数组
    
    segmentView.titleArray = @[@"正在热映",@"即将上映"];
    segmentView.selectedImage = @"color_line";
    
    [self.view addSubview:segmentView];
    
    [segmentView setSegmentBlock:^(NSInteger index) {
        
        [self tableViewMoveAction:index];
        
    }];
}

- (void)loadData{
    
    _dataList1 = [[NSMutableArray alloc] init];
    _dataList2 = [[NSMutableArray alloc] init];
    
    
    NSDictionary *nowDic = [CoreDataFromJson jsonObjectFromFileName:@"buy_now"];
    
    NSArray *msArray = [nowDic objectForKey:@"ms"];
    
    for (NSDictionary *dic in msArray) {
        
        HotModel *hotModel = [[HotModel alloc] initWithDic:dic];
        
        [_dataList1 addObject:hotModel];
    }
    
}

- (void)createTableView{
    
    UITableView *tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, kScreenWidth, kScreenHeight - 50-64-49)];
    tableView1.backgroundColor = [UIColor blueColor];
    tableView1.dataSource = self;
    tableView1.delegate = self;
    
    _tableView1 = tableView1;
    [self.view addSubview:_tableView1];
    
    UITableView *tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(kScreenWidth, 50, kScreenWidth, kScreenHeight - 50)];
    tableView2.backgroundColor = [UIColor purpleColor];
    tableView2.dataSource = self;
    tableView2.delegate = self;
    
    _tableView2 = tableView2;
    [self.view addSubview:_tableView2];
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView == _tableView1) {
        return _dataList1.count;
    }
    return 0;
}

- (void)tableViewMoveAction:(NSInteger) index{
    
    [UIView animateWithDuration:.5 animations:^{
        //改变两个表视图的frame
        _tableView1.frame = CGRectMake(-kScreenWidth * index, 50, kScreenWidth, kScreenHeight - 50);
        _tableView2.frame = CGRectMake(_tableView1.frame.origin.x + _tableView1.frame.size.width, 50, kScreenWidth, kScreenHeight-50);
        
        
    }];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HotMovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HotMovieCell" owner:nil options:nil] lastObject];
    }
    
    HotModel *hotModel = _dataList1[indexPath.row];
    
    cell.model = hotModel;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
@end
