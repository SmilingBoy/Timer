//
//  CommentCell.m
//  MTime
//
//  Created by 孙 峰 on 15/9/23.
//  Copyright (c) 2015年 SunFeng. All rights reserved.
//

#import "CommentCell.h"


@implementation CommentCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(CriticismModel *)model{

    _model = model;

    [self loadData];
}

-(void)loadData{

    _title.text = _model.title;
    _comment.text = _model.summary;
    [_userimage setImageWithURL:[NSURL URLWithString:_model.userImage]];
    
    _username.text = [NSString stringWithFormat:@"%@ -评",_model.nickname];
    
    _movietitle.text = [_model.relatedObj objectForKey:@"title"];
    
    _rating.text = _model.rating;
    
    [_movieimage setImageWithURL:[NSURL URLWithString:[_model.relatedObj objectForKey:@"image"]]];
    
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
