//
//  NoticeCell.h
//  MTime
//
//  Created by 孙 峰 on 15/9/23.
//  Copyright (c) 2015年 SunFeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoticeModel.h"

@interface NoticeCell : UITableViewCell

@property(nonatomic,strong)NoticeModel *model;

@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@property (weak, nonatomic) IBOutlet UIButton *play;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *comment;

@end
