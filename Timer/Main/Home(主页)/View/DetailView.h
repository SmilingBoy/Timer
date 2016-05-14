//
//  DetailView.h
//  BeverTimer60
//
//  Created by sunfeng on 16/5/14.
//  Copyright © 2016年 SunFeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingImageView.h"
#import "HomeModel.h"
@interface DetailView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *movieImage;
@property (weak, nonatomic) IBOutlet UILabel *titleCN;
@property (weak, nonatomic) IBOutlet UILabel *titleEN;
@property (weak, nonatomic) IBOutlet UILabel *year;

@property (weak, nonatomic) IBOutlet RatingImageView *ratingView;
@property (weak, nonatomic) IBOutlet UILabel *ratingLable;

@property(nonatomic,strong)HomeModel *model;

@end
