//
//  StoreViewController.m
//  Timer
//
//  Created by lx on 16/5/13.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "StoreViewController.h"
#import "SegmentView.h"
#import "NewsModel.h"
#import "NewsView.h"

@interface StoreViewController ()

@property (nonatomic, strong)NSMutableArray *dataList;
@property (nonatomic, weak)NewsView *newsView;


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
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"home_top_movie_background_cover"]]];
    
    [self setUpSegmentView];
    
    [self setUpNewsView];
    
}

- (void)setUpSegmentView{
 
    SegmentView *segmentView = [[SegmentView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
    
    segmentView.titleArray = @[@"新闻",@"预告片",@"排行榜",@"影评"];
    
    [segmentView setSegmentBlock:^(NSInteger index) {
        
    }];
    
    self.navigationItem.titleView = segmentView;
    
}

- (NSMutableArray *)dataList{
    
    if (!_dataList) {
        
        _dataList = [NSMutableArray array];
        
        NSDictionary *dic = [CoreDataFromJson jsonObjectFromFileName:@"find_news"];
        
        NSArray *array = [dic objectForKey:@"newsList"];
        
        for (NSDictionary *d in array) {
            
            NewsModel *model = [[NewsModel alloc] initWithDic:d];
            
            [_dataList addObject:model];
        }
        
    }
    return _dataList;
}

- (void)setUpNewsView{
    
    NewsView *newsView = [[NewsView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    newsView.datalist = self.dataList;
    
    _newsView = newsView;
    
    [self.view addSubview:_newsView];
    
}


@end
