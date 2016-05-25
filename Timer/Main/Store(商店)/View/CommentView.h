//
//  CommentView.h
//  MTime
//
//  Created by 孙 峰 on 15/9/23.
//  Copyright (c) 2015年 SunFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentView : UIView<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,copy)NSMutableArray *dataList;

@end
