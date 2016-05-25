//
//  NoticeView.m
//  Timer
//
//  Created by lx on 16/5/23.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "NoticeView.h"
#import "NoticeModel.h"
#import "NoticeCell.h"

#import "UIView+ViewController.h"
#import "VideoViewController.h"

@interface NoticeView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak)UITableView *tableView;

@property (nonatomic, strong)UIImageView *headerView;


@end

@implementation NoticeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpTableView];
        
    }
    return self;
}

- (void)setUpTableView{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_top_movie_background_cover"]];
    
    _tableView = tableView;
    [self addSubview:tableView];
    
}

- (void)setDatalist:(NSMutableArray *)datalist{
    
    _datalist = datalist;
    
    [_tableView reloadData];
    
    [self creatHeaderView];
    
}

-(void)creatHeaderView{
    
    NoticeModel *model = _datalist[0];
    
    _headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    
    [_headerView setImageWithURL:[NSURL URLWithString:model.coverImg]];
    
    [_tableView addSubview:_headerView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0, kScreenWidth, 44)];
    label.text = model.movieName;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:20];
    label.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    label.textAlignment = NSTextAlignmentCenter;
    label.bottom = _headerView.bottom;
    [_tableView addSubview:label];
    
    if (_datalist.count > 0) {
        
        [_datalist removeObjectAtIndex:0];
        
    }
    
    UIView *view = [[UIView alloc] initWithFrame:_headerView.bounds];
    
    _tableView.tableHeaderView = view;
    
}


#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _datalist.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NoticeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"NoticeCell" owner:nil options:nil] lastObject];
        
    }
    
    cell.model = _datalist[indexPath.row];
    
    return cell;
}

//滑动时调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //放大多少，根据y的偏移量
    CGFloat offSet = scrollView.contentOffset.y;
    //NSLog(@"%f",offSet);
    if (offSet < 0) {//向下滑动
        //设置新的高度
        CGFloat newHeight = 200 + ABS(offSet);//ABS求绝对值
        _headerView.height = newHeight;
        
        //设置新的宽度
        CGFloat newWidth = kScreenWidth * (newHeight/200);//宽度放大多少倍是根据高度放大多少倍来的
        _headerView.width = newWidth;
        
        _headerView.left = - (newWidth - kScreenWidth)/2;
        _headerView.top = offSet;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 110;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    VideoViewController *video = [[VideoViewController alloc] init];
    
    NoticeModel *model = _datalist[indexPath.row];
    
    video.url = model.url;
    
    video.hidesBottomBarWhenPushed = YES;
    
    [self.viewController.navigationController pushViewController:video animated:YES];
    
}

@end
