//
//  NoticeCell.m
//  MTime
//
//  Created by 孙 峰 on 15/9/23.
//  Copyright (c) 2015年 SunFeng. All rights reserved.
//

#import "NoticeCell.h"

@implementation NoticeCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(NoticeModel *)model{

    _model = model;
    
    [self setNeedsDisplay];
}

-(void)setNeedsDisplay{


    [_imageV setImageWithURL:[NSURL URLWithString:_model.coverImg]];
    
    _title.text = _model.movieName;
    _comment.text = _model.summary;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
