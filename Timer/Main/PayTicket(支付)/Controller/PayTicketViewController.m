//
//  PayTicketViewController.m
//  Timer
//
//  Created by lx on 16/5/13.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "PayTicketViewController.h"
#import "SegmentView.h"
#import "CinemaModel.h"
#import "CinemaCell.h"
#import "SiftView.h"

@interface PayTicketViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak)UITableView *tableView;

@property (nonatomic, weak)SiftView *siftView;

@property (nonatomic, strong)NSMutableArray *datalist;


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
   
    [self setUpSegmentView];
    [self setUpTableView];
    
}

- (NSMutableArray *)datalist{
    
    if (!_datalist) {
        
        _datalist = [NSMutableArray array];
        
        NSArray *array = [CoreDataFromJson jsonObjectFromFileName:@"cinema"];
        
        for (NSMutableDictionary *dic in array) {
            
            CinemaModel *model = [[CinemaModel alloc] initWithDic:dic];
            
            [_datalist addObject:model];
            
        }
        
    }
    return _datalist;
}


- (void)setUpSegmentView{
    
    SegmentView *segmentView = [[SegmentView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
    segmentView.titleArray = @[@"全部",@"附近",@"价格",@"筛选"];
    segmentView.selectedImage = @"icon_slider_min@2x";
    
    segmentView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:segmentView];
    
    [segmentView setSegmentBlock:^(NSInteger index) {
        
        [self changeView:index];
        
    }];
}

- (SiftView *)siftView{
    
    if (!_siftView) {
        
        SiftView *siftView = [[SiftView alloc] initWithFrame:CGRectMake(0, self.tabBarController.tabBar.top, kScreenWidth, kScreenHeight - 200)];
        
        siftView.backgroundColor = [UIColor whiteColor];
        
        _siftView = siftView;
        
        [self.view addSubview:_siftView];
        
    }
    
    return _siftView;
    
}

- (void)changeView:(NSInteger)index{
    
    //根据index的值，确定根据价格还是附近顺序排序
    switch (index) {
        case 0:
            
            [self reloadDataAll];
            break;
            
        case 1:
            
            [self reloadDataByLocation];
            break;
            
        case 2:
            
            [self reloadDataByprice];
            break;
            
        case 3:
            
            [self showSiftView];
            break;
            
        default:
            break;
    }
    
    
    
}

- (void)reloadDataAll{
    
    _datalist = [NSMutableArray array];
    
    NSArray *array = [CoreDataFromJson jsonObjectFromFileName:@"cinema"];
    
    for (NSMutableDictionary *dic in array) {
        
        CinemaModel *model = [[CinemaModel alloc] initWithDic:dic];
        
        [_datalist addObject:model];
        
    }
    
    [_tableView reloadData];
    
}

- (void)reloadDataByprice{
    
    for(int i = 0; i < _datalist.count; i++){
        
        for (int j = i + 1; j < _datalist.count; j++) {
            
            CinemaModel *model1 = _datalist[i];
            CinemaModel *model2 = _datalist[j];
            
            float price1 = [model1.minPrice floatValue];
            float price2 = [model2.minPrice floatValue];
            
            if (price1 > price2) {
                [_datalist exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
            
        }
        
    }
    
    [_tableView reloadData];
    
}

- (void)reloadDataByLocation{
    
    CGFloat baiduLongitude = 116.00;
    CGFloat baiduLatitude  = 36;
    
    for(int i = 0; i < _datalist.count; i++){
        
        for (int j = i + 1; j < _datalist.count; j++) {
            
            CinemaModel *model1 = _datalist[i];
            CinemaModel *model2 = _datalist[j];
            
            CGFloat longitude1 = [model1.longitude floatValue];
            CGFloat latitude1 = [model1.latitude floatValue];
            
            CGFloat longitude2 = [model2.longitude floatValue];
            CGFloat latitude2 = [model2.latitude floatValue];
            
            CGFloat length1 = (longitude1 - baiduLongitude) * (longitude1 - baiduLongitude) + (latitude1 - baiduLatitude) * (latitude1 - baiduLatitude);
            
            CGFloat length2 = (longitude2 - baiduLongitude) * (longitude2 - baiduLongitude) + (latitude2 - baiduLatitude) * (latitude2 - baiduLatitude);
            
            if (length1 > length2) {
                
                [_datalist exchangeObjectAtIndex:i withObjectAtIndex:j];
                
            }
        
        }
        
    }
    
    [_tableView reloadData];
    
}

- (void)showSiftView{
    
    [self.siftView showSiftView];
}

- (void)setUpTableView{
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, kScreenWidth, kScreenHeight - 50 - 60)];
    tableview.backgroundColor = [UIColor clearColor];
    tableview.delegate = self;
    tableview.dataSource = self;
    
    _tableView = tableview;
    [self.view addSubview:_tableView];
    
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.datalist.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *reuserIndentifier = @"cell";
    
    CinemaCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserIndentifier];
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CinemaCell" owner:self options:nil] lastObject];
        
        cell.backgroundColor = [UIColor clearColor];
    }
    
    CinemaModel *model = self.datalist[indexPath.row];
    
    cell.model = model;
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 120;
    
}

@end
