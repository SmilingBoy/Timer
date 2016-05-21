//
//  NewsCell.m
//  Timer
//
//  Created by lx on 16/5/21.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "NewsCell.h"

@interface NewsCell ()

//cell1
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel1;
@property (weak, nonatomic) IBOutlet UILabel *summaryInfoLabel1;
@property (weak, nonatomic) IBOutlet UILabel *publishTimeLabel1;

@property (weak, nonatomic) IBOutlet UILabel *commentCountLabel1;

//cell2

@property (weak, nonatomic) IBOutlet UILabel *titleLabel2;
@property (weak, nonatomic) IBOutlet UIImageView *image2_1;
@property (weak, nonatomic) IBOutlet UIImageView *image2_2;
@property (weak, nonatomic) IBOutlet UIImageView *image2_3;
@property (weak, nonatomic) IBOutlet UILabel *publishTimeLabel2;

@property (weak, nonatomic) IBOutlet UILabel *commentCountLabel2;


@end

@implementation NewsCell


- (void)awakeFromNib {
    
    self.backgroundColor = [UIColor clearColor];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}



- (void)setModel:(NewsModel *)model{
    
    _model = model;
    
    if ([model.type intValue] == 1) {
        [self loadData1];
    }else{
        [self loadData2];
    }

    
}

- (void)loadData2{
    
    [_image setImageWithURL:[NSURL URLWithString:_model.image]];
    
    _summaryLabel1.text = _model.summary;
    _summaryInfoLabel1.text = _model.summaryInfo;
    
    _publishTimeLabel1.text = [self stringWithDate:[_model.publishTime doubleValue]];
    
    _commentCountLabel1.text = [NSString stringWithFormat:@"%@条评论",[_model.commentCount stringValue]];
    
}

- (void)loadData1{
    
    _titleLabel2.text = _model.title;
    
    [_image2_1 setImageWithURL:[NSURL URLWithString:[_model.images[0] objectForKey:@"url1"]]];
    [_image2_2 setImageWithURL:[NSURL URLWithString:[_model.images[1] objectForKey:@"url1"]]];
    [_image2_3 setImageWithURL:[NSURL URLWithString:[_model.images[2] objectForKey:@"url1"]]];
    
    _publishTimeLabel2.text = [self stringWithDate:[_model.publishTime doubleValue]];
    
    _commentCountLabel2.text = [NSString stringWithFormat:@"%@条评论",[_model.commentCount stringValue]];
    
}

- (NSString *)stringWithDate:(NSTimeInterval)time{
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    
    NSDateFormatter *dateForMatter = [[NSDateFormatter alloc] init];
    
    [dateForMatter setDateFormat:@"yyyy-MM-dd"];
    
    return [dateForMatter stringFromDate:date];
}

@end
