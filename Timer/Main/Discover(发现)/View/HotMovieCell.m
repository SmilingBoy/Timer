//
//  DiscoverViewController.h
//  Timer
//
//  Created by lx on 16/5/13.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "HotMovieCell.h"

@implementation HotMovieCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(HotModel *)model{
    
    _model = model;
    
    //评分
//    _rating.text = @"";
    
    //NSAttributedString使用它的子类
    //NSString --> NSMutableString
    NSMutableAttributedString *mstr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%.1f",[model.r floatValue]]];
    //设置文本多样化显示
//    [mstr setAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:25]} range:NSMakeRange(0, 1)];
    [mstr setAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10]} range:NSMakeRange(1, 2)];
    
    [mstr addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, 3)];
    
    
    
    
    _rating.attributedText = mstr;
    
    _time.text = model.rd;
    _count.text = [model.wantedCount stringValue];
    [_image setImageWithURL:[NSURL URLWithString:model.img]];
    
    if ([model.commonSpecial isEqual: @""]) {
        
    }
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
