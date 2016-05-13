//
//  HomeTabbleViewCell.m
//  Timer
//
//  Created by lx on 16/5/13.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "HomeTabbleViewCell.h"
#import "UIImageView+WebCache.h"
#import "RatingImageView.h"

@interface HomeTabbleViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView1;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet RatingImageView *ratingImageView;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

@end

@implementation HomeTabbleViewCell


- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setModel:(HomeModel *)model{
    
    _model = model;
    
    [_imageView1 setImageWithURL:[NSURL URLWithString:model.img]];
    
    if ([_model.ratingFinal floatValue]<=0) {
        
        _model.ratingFinal = @0;
        self.ratingLabel.text = @"0";
        
        _ratingImageView.rating = 0;
        
    } else {
        self.ratingLabel.text = [NSString stringWithFormat:@"%@",_model.ratingFinal];
        
        _ratingImageView.rating = [_model.ratingFinal floatValue];
        
    }

}

@end
