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
#import "NewModel.h"
#import "HotMovieCell.h"
#import "NewMovieCell.h"
#import "NewMovieHeadView.h"

@interface DiscoverViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak)UITableView *tableView1;
@property (nonatomic, weak)UITableView *tableView2;

@property (nonatomic, strong)NSMutableArray *dataList1;
@property (nonatomic, strong)NSMutableDictionary *dataList2;
@property (nonatomic, strong)NSArray *allkeyArray;
@property (nonatomic, strong)NSMutableArray *dataAttend;

@property (nonatomic, assign)NSInteger newMoviesCount;


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
     [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"home_top_movie_background_cover"]]];
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
    _dataList2 = [[NSMutableDictionary alloc] init];
    _dataAttend = [[NSMutableArray alloc] init];
    
    NSDictionary *nowDic = [CoreDataFromJson jsonObjectFromFileName:@"buy_now"];
    
    NSArray *msArray = [nowDic objectForKey:@"ms"];
    
    for (NSDictionary *dic in msArray) {
        
        HotModel *hotModel = [[HotModel alloc] initWithDic:dic];
        
        [_dataList1 addObject:hotModel];
    }
    
   //attention moviecomings
    NSDictionary *newDic = [CoreDataFromJson jsonObjectFromFileName:@"buy_new"];
    
    NSArray *attentionArray = [newDic objectForKey:@"attention"];
    NSArray *moviecomingsArray = [newDic objectForKey:@"moviecomings"];
    
    _newMoviesCount = moviecomingsArray.count;
    
    for (NSDictionary *dic in attentionArray) {
        
        NewModel *model = [[NewModel alloc] initWithDic:dic];
        
        [_dataAttend addObject:model];
        
    }
    
    for (NSDictionary *dic in moviecomingsArray) {
        
        NewModel *model = [[NewModel alloc] initWithDic:dic];
        
        if (![_dataList2 objectForKey:model.rMonth]) {
            
            NSMutableArray *newArray = [NSMutableArray array];
            
            [newArray addObject:model];
            
            [_dataList2 setObject:newArray forKey:model.rMonth];
            
        }else{
            
            NSMutableArray *newArray = [_dataList2 objectForKey:model.rMonth];
            
            [newArray addObject:model];
            
        }
        
    }
    
    _allkeyArray = [NSArray array];
    _allkeyArray = [[_dataList2 allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
}


- (void)tableViewMoveAction:(NSInteger) index{
    
    [UIView animateWithDuration:.5 animations:^{
        //改变两个表视图的frame
        _tableView1.frame = CGRectMake(-kScreenWidth * index, 50, kScreenWidth, kScreenHeight - 50);
        _tableView2.frame = CGRectMake(_tableView1.frame.origin.x + _tableView1.frame.size.width, 50, kScreenWidth, kScreenHeight-50);
        
        
    }];
    
}


- (void)createTableView{
    
    UITableView *tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, kScreenWidth, kScreenHeight - 50-64-49)];
    tableView1.backgroundColor = [UIColor clearColor];
    tableView1.dataSource = self;
    tableView1.delegate = self;
    
    _tableView1 = tableView1;
    [self.view addSubview:_tableView1];
    
    UITableView *tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(kScreenWidth, 50, kScreenWidth, kScreenHeight - 50) style:UITableViewStylePlain];
    
    tableView2.backgroundColor = [UIColor clearColor];
    tableView2.dataSource = self;
    tableView2.delegate = self;
    
    NewMovieHeadView *headView = [[NewMovieHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 250)];
    
    headView.dataList = _dataAttend;
    
    tableView2.tableHeaderView = headView;
    
    _tableView2 = tableView2;
    [self.view addSubview:_tableView2];
    
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    if (tableView == _tableView2) {
        return _allkeyArray.count;
    }
    
    if (tableView == _tableView1) {
        return 1;
    }
    
    return 0;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView == _tableView1) {
        return _dataList1.count;
    }
    
    if (tableView == _tableView2) {
        
        NSString *key = _allkeyArray[section];
        
        NSArray *array = [_dataList2 objectForKey:key];
        
        
        return array.count;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == _tableView1) {
        
        HotMovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"HotMovieCell" owner:nil options:nil] lastObject];
        }
        
        HotModel *hotModel = _dataList1[indexPath.row];
        
        cell.model = hotModel;
        
        return cell;
        
    }else{
        
        NewMovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewMoveCell"];
        
        if (!cell) {
            
            cell = [[[NSBundle mainBundle] loadNibNamed:@"NewMovieCell" owner:nil options:nil] lastObject];
            
            
            NSString *key = _allkeyArray[indexPath.section];
            
            NSArray *array = [_dataList2 objectForKey:key];
            
            NewModel *newModel = array[indexPath.row];
            
            cell.model = newModel;
            
        }
        
        return cell;
        
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (tableView == _tableView1) {
        return nil;
    }
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
    headView.backgroundColor = [UIColor lightGrayColor];
    
    NSString *key = _allkeyArray[section];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
    label.text = [NSString stringWithFormat:@"%@月",key];
    
    [headView addSubview:label];
    
    if (section == 0) {
        
        headView.frame = CGRectMake(0, 0, kScreenWidth, 60);
        
        UILabel *countLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
        countLabel.text = [NSString stringWithFormat:@"新上映了%ld部电影",_newMoviesCount];
        
        [headView addSubview:countLabel];
        
        label.frame = CGRectMake(0, 30, kScreenWidth, 30);
        
    }
    
    return headView;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (tableView == _tableView1) {
        return 0;
    }
    
    if (section == 0) {
        return 60;
    }
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
@end
