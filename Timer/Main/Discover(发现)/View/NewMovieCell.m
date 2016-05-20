//
//  NewMovieCell.m
//  Timer
//
//  Created by lx on 16/5/18.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "NewMovieCell.h"
#import "NewModel.h"

@interface NewMovieCell ()

@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *directorLabel;

@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation NewMovieCell

- (void)awakeFromNib{
    
    self.backgroundColor = [UIColor clearColor];
    
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

- (void)setModel:(NewModel *)model{
    
    _model = model;
    
    _dayLabel.text = [NSString stringWithFormat:@"%@日",[model.rDay stringValue]];
    _titleLable.text = model.title;
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@人正在关注",[model.wantedCount stringValue]]];
    
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, [[model.wantedCount stringValue] length])];
    
    _countLabel.attributedText = str;
    
    _typeLabel.text = model.type;
    _directorLabel.text = model.director;
    
    [_image setImageWithURL:[NSURL URLWithString:model.image]];
}

@end
