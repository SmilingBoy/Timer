//
//  CitiesCell.m
//  Timer
//
//  Created by lx on 16/5/16.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "CitiesCell.h"

@implementation CitiesCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _cityLabel = [[UILabel alloc]initWithFrame:self.bounds];
        _cityLabel.textAlignment = NSTextAlignmentCenter;
        _cityLabel.layer.cornerRadius = 10.0;
        _cityLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _cityLabel.layer.borderWidth = 2;
        [self addSubview:_cityLabel];

    }
    return self;
}

@end
