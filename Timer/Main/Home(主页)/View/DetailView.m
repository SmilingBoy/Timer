//
//  DetailView.m
//  BeverTimer60
//
//  Created by sunfeng on 16/5/14.
//  Copyright © 2016年 SunFeng. All rights reserved.
//

#import "DetailView.h"

@implementation DetailView

-(void)setModel:(HomeModel *)model{
    _model = model;
    
    //给视图的子控件赋值
    //赋值电影图片
    [_movieImage setImageWithURL:[NSURL URLWithString:_model.img]];
    
    //中文名  英文名
    _titleCN.text = _model.titleCn;
    _titleEN.text = _model.titleEn;
    _year.text = [_model.rYear stringValue];
    _ratingLable.text = [_model.ratingFinal stringValue];

    
}

@end
