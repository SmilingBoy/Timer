//
//  ChartsView.m
//  MTime
//
//  Created by 孙 峰 on 15/9/23.
//  Copyright (c) 2015年 SunFeng. All rights reserved.
//

#import "ChartsView.h"
#import "ChartsModel.h"
#import "ChartsHeaderView.h"

@implementation ChartsView
{
    UITableView *_tableView;

}
-(id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self creatTableView];
    }
    
    return self;
}

-(void)setDataList:(NSMutableArray *)dataList{

    _dataList = dataList;
    
    [_tableView reloadData];

}

-(void)creatTableView{

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64-49)];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_top_movie_background_cover"]];
    [self addSubview:_tableView];

    ChartsHeaderView *view = [[[NSBundle mainBundle] loadNibNamed:@"ChartsHeaderView" owner:nil options:nil] lastObject];
    
    _tableView.tableHeaderView = view;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    //辅助图标
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.backgroundColor = [UIColor clearColor];
    ChartsModel *model = _dataList[indexPath.row];
    
    cell.textLabel.text = model.topListNameCn;

    return cell;
}

@end
