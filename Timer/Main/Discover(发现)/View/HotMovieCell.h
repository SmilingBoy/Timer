//
//  HotMovieCell.h
//  MTime
//
//  Created by 孙 峰 on 15/9/21.
//  Copyright (c) 2015年 SunFeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotModel.h"

@interface HotMovieCell : UITableViewCell

@property (nonatomic ,strong)HotModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UIImageView *image1;

@property (weak, nonatomic) IBOutlet UIImageView *image2;

@property (weak, nonatomic) IBOutlet UIImageView *image3;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *comment;

@property (weak, nonatomic) IBOutlet UILabel *time;

@property (weak, nonatomic) IBOutlet UILabel *count;

@property (weak, nonatomic) IBOutlet UILabel *rating;





@end
