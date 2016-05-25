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
#import "NoticeModel.h"
#import "ChartsModel.h"
#import "CriticismModel.h"

#import "NewsView.h"
#import "NoticeView.h"
#import "ChartsView.h"
#import "CommentView.h"


@interface StoreViewController ()


@property (nonatomic, weak)SegmentView *segmentView;


@property (nonatomic, weak)NewsView *newsView;
@property (nonatomic, weak)NoticeView *noticeView;
@property (nonatomic, weak)ChartsView *chartsView;
@property (nonatomic, weak)CommentView *commentView;




@property (nonatomic, strong)NSMutableArray *dataList;
@property (nonatomic, strong)NSMutableArray *datalist2;
@property (nonatomic, strong)NSMutableArray *datalist3;
@property (nonatomic, strong)NSMutableArray *datalist4;

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
    
    [self setUpView];
    
}

- (void)setUpSegmentView{
 
    SegmentView *segmentView = [[SegmentView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
    
    segmentView.titleArray = @[@"新闻",@"预告片",@"排行榜",@"影评"];
    
    [segmentView setSegmentBlock:^(NSInteger index) {
        
        [self pushAction:index];
        
    }];
    
    _segmentView = segmentView;
    
    self.navigationItem.titleView = segmentView;
    
}

- (void)pushAction:(NSInteger)index{
    
    switch (index) {
        case 0:
            
            [self.view bringSubviewToFront:_newsView];
            
            break;
        case 1:
            
            [self.view bringSubviewToFront:_noticeView];
            
            break;
        case 2:
            
            [self.view bringSubviewToFront:_chartsView];
            
            break;
        case 3:
            
            [self.view bringSubviewToFront:_commentView];
            
            break;
            
        default:
            break;
    }
    
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

- (NSMutableArray *)datalist2{
    
    if (!_datalist2) {
        
        _datalist2 = [NSMutableArray array];
        
        NSDictionary *dic = [CoreDataFromJson jsonObjectFromFileName:@"预告"];
        
        NSArray *array = [dic objectForKey:@"trailers"];
        
        for (NSDictionary *d in array) {
            
            NoticeModel *model = [[NoticeModel alloc] initWithDic:d];
            
            [_datalist2 addObject:model];
        }
        
    }
    return _datalist2;
    
}

- (NSMutableArray *)datalist3{
    
    if (!_datalist3) {
        
        _datalist3 = [NSMutableArray array];
        
        NSDictionary *dic = [CoreDataFromJson jsonObjectFromFileName:@"rank2"];
        
        NSArray *array = [dic objectForKey:@"topLists"];
        
        for (NSDictionary *d in array) {
            
            ChartsModel *model = [[ChartsModel alloc] initWithDic:d];
            
            [_datalist3 addObject:model];
        }
        
    }
    return _datalist3;

}

- (NSMutableArray *)datalist4{
    
    
    if (!_datalist4) {
        
        _datalist4 = [NSMutableArray array];
        
        NSArray *array = [CoreDataFromJson jsonObjectFromFileName:@"criticism"];
        
        for (NSDictionary *d in array) {
            
            CriticismModel *model = [[CriticismModel alloc] initWithDic:d];
            
            [_datalist4 addObject:model];
        }
        
    }
    return _datalist4;
    
}

- (void)setUpView{
    
    NewsView *newsView = [[NewsView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    newsView.datalist = self.dataList;
    
    _newsView = newsView;
    
    [self.view addSubview:_newsView];
    
    
    NoticeView *noticeView = [[NoticeView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    noticeView.datalist = self.datalist2;
    
    _noticeView = noticeView;
    
    [self.view addSubview:_noticeView];

    ChartsView *chartsView = [[ChartsView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    chartsView.dataList = self.datalist3;
    
    _chartsView = chartsView;
    
    [self.view addSubview:_chartsView];

    CommentView *commentView = [[CommentView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    commentView.dataList = self.datalist4;
    
    _commentView = commentView;
    
    [self.view addSubview:_commentView];


    [self.view bringSubviewToFront:_newsView];
    
}



@end
