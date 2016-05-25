//
//  NewsView.m
//  Timer
//
//  Created by lx on 16/5/21.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "NewsView.h"
#import "NewModel.h"
#import "NewsCell.h"

#import "UIView+ViewController.h"
#import "VideoViewController.h"
#import "NewsTableViewController.h"

@interface NewsView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak)UITableView *tableView;


@end

@implementation NewsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpTableView];
        
    }
    return self;
}

- (void)setDatalist:(NSArray *)datalist{
    
    _datalist = datalist;
    
    [_tableView reloadData];
    
}

- (void)setUpTableView{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    
    tableView.height -= 100;
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    tableView.backgroundColor = [UIColor whiteColor];
    
    _tableView = tableView;
    
    [self addSubview:_tableView];
    
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.datalist.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NewsCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    NewsCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
    NewsModel *model = _datalist[indexPath.row];
    
    if ([model.type intValue] == 1) {
        
        if (cell1 == nil) {
            //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            cell1 = [[[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:nil options:nil] firstObject];
            
        }
        cell1.model = model;
        return cell1;
        
    } else {
        if (cell2 == nil) {
            cell2 = [[[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:nil options:nil] lastObject];
            
        }
        cell2.model = model;
        return cell2;
        
    }
    

    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    VideoViewController *video = [[VideoViewController alloc] init];
    video.hidesBottomBarWhenPushed = YES;
    
    NewsTableViewController *news = [[NewsTableViewController alloc] init];
    
    NewsModel *model = _datalist[indexPath.row];
    
    if ([model.type intValue] == 2) {
        
        video.url = @"https://www.baidu.com/";
        
        [self.viewController.navigationController pushViewController:video animated:YES];
        
    }else{
        
        [self.viewController.navigationController pushViewController:news animated:YES];
        
    }
    
}


@end
