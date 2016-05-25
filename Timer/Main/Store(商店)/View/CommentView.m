//
//  CommentView.m
//  MTime
//
//  Created by 孙 峰 on 15/9/23.
//  Copyright (c) 2015年 SunFeng. All rights reserved.
//

#import "CommentView.h"
#import "CommentCell.h"
#import "CriticismModel.h"


@implementation CommentView
{
    UITableView *_tableView;
    
    NSIndexPath *_indexPath;//记录点击位置

}
-(id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self creatTableView];

    }
    
    return self;
}

-(void)setDataList:(NSMutableArray *)dataList{

    _dataList = dataList;

}

-(void)creatTableView{

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight -64-49)];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_top_movie_background_cover"]];
    [self addSubview:_tableView];
    
}


#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CommentCell" owner:nil options:nil] lastObject];
        
    }
    
    cell.model = _dataList[indexPath.row];
    
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if ([indexPath isEqual:_indexPath]) {
        
        //单元格高度
        //要显示的文本
        NSString *str = [_dataList[indexPath.row] summary];
        
        CGRect frame = [str boundingRectWithSize:CGSizeMake(200, 9999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
        return frame.size.height;
    }
    
    
    
    return 130;
}

//单元格点击的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([_indexPath isEqual:indexPath]) {
        return;
    }
    
    //当单元格点击的时候，记录点击的单元格
    _indexPath = indexPath;
    
    //可以指定某些单元格进行刷新
    [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    
}

@end
