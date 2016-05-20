//
//  HotMovieCell.m
//  MTime
//
//  Created by 孙 峰 on 15/9/21.
//  Copyright (c) 2015年 SunFeng. All rights reserved.
//

#import "HotMovieCell.h"

@implementation HotMovieCell

- (void)awakeFromNib {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

-(void)setModel:(HotModel *)model{
    
    _model = model;
    
    [_image setImageWithURL:[NSURL URLWithString:model.img]];
    
    _title.text = model.t;
    
    //[_title sizeToFit];
    /*
     字符串显示的多样化
     */
    NSMutableAttributedString *mstr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%.1f",[model.r floatValue]]];
    
    //在此model中  评分不为0的时候  x.x
    if (mstr.length == 3) {
        [mstr addAttribute:NSFontAttributeName
                     value:[UIFont systemFontOfSize:12]
                     range:NSMakeRange(1, 2)];
        _rating.attributedText = mstr;
        
    }else{
        //评分属性为 0 <0 或者其他
        if ([model.r floatValue] <= 0) {
            
            //将model中的评分属性设置为0
            model.r = 0;
        }
        //给评分label赋值
        _rating.text = [NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%.f",[model.r floatValue]]];
    }
    
    if ([model.commonSpecial isEqualToString:@""]) {
        
        NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@人在期待上映",model.wantedCount]];
        
        [attString addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, [NSString stringWithFormat:@"%@",model.wantedCount].length)];
        
        _comment.attributedText = attString;
        
    }else{
        
        _comment.text = model.commonSpecial;
    }
    
    /*
     设置时间格式
     */
    //数据中给的rd是NSNumber类型，先转化为字符串
    NSString *origins = [NSString stringWithFormat:@"%@",model.rd]; //20140903
    //通过NSDate这个类转化日期格式
    NSDateFormatter *fomate = [[NSDateFormatter alloc] init];
    [fomate setDateFormat:@"yyyyMMdd"];
    NSDate *date = [fomate dateFromString:origins];
    //转化为只有月和日的，不需要年份
    [fomate setDateFormat:@"MM月dd日"];
    NSString *news =  [fomate stringFromDate:date];
    _time.text = [NSString stringWithFormat:@"%@上映",news];
    
    _count.text = [NSString stringWithFormat:@"今日%@家影院 %@场",model.NearestCinemaCount,model.NearestShowtimeCount];
    
    //关于下面的图片设置
    /*
     
     如果model中，有3D类型，则第一张设置为3D，否则设置为IMAX图片
     如果model中，3D和isIMAX都为true，则设置为IMAX
     如果model中，isDMAX和is3D和isIMAX都为true，那么设置图片为DMAX，否则，只设置两个图片
     
     */
    
    UIImage *image1 = [UIImage imageNamed:@"icon_hot_show_IMAX3D"];
    UIImage *image2 = [UIImage imageNamed:@"icon_hot_show_IMAX"];
    UIImage *image3 = [UIImage imageNamed:@"icon_hot_show_DMAX"];
    
    if ([model.is3D intValue] == 1) {
        _image1.image = image1;
    }else {
        _image1.image = image2;
    }
    
    if ([model.isIMAX intValue] == 1 && [model.is3D intValue] == 1) {
        _image2.image = image2;
    }else {
        _image2.image = image3;
    }
    
    if ([model.isDMAX intValue] == 1 && [model.is3D intValue] == 1 && [model.isIMAX intValue] == 1) {
        _image3.image = image3;
    }else {
        _image3.hidden = YES;
    }
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
