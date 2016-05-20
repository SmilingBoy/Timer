//
//  AttentMovieCell.m
//  Timer
//
//  Created by lx on 16/5/19.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "AttentMovieCell.h"

#import "NewModel.h"

@interface AttentMovieCell ()

@property (weak, nonatomic) IBOutlet UILabel *dayLabel;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *attendCount;
@property (weak, nonatomic) IBOutlet UILabel *directorLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *actorLabel;

@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation AttentMovieCell

- (void)awakeFromNib {
    self.backgroundColor = [UIColor clearColor];
}

- (void)setModel:(NewModel *)model{
    
    _model = model;
    
    _titleLabel.text = model.title;
    _dayLabel.text = model.releaseDate;
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@人正在关注",[model.wantedCount stringValue]]];
    
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, [[model.wantedCount stringValue] length])];
    
    _attendCount.attributedText = str;
    
    _directorLabel.text = model.director;
    _typeLabel.text = model.type;
    _actorLabel.text = [NSString stringWithFormat:@"主演: %@,%@",model.actor1,model.actor2];
    
    [_image setImageWithURL:[NSURL URLWithString:model.image]];
    
}

@end
