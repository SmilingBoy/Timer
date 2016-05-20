//
//  CinemaCell.m
//  Timer
//
//  Created by lx on 16/5/20.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "CinemaCell.h"

@interface CinemaCell ()

@property (weak, nonatomic) IBOutlet UILabel *cinemaNameLabe;

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIView *movieTypeView;

@end

@implementation CinemaCell

- (void)awakeFromNib{
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

- (void)setModel:(CinemaModel *)model{
    
    _model = model;
    
    _cinemaNameLabe.text = model.cinameName;
    
    _addressLabel.text = model.address;
    
    CGFloat price = [model.minPrice floatValue];
    
    _priceLabel.text = [NSString stringWithFormat:@"¥%0.1f",price / 100.0];
    
    NSMutableArray *array = [NSMutableArray array];
    
    if ([[model.feature objectForKey:@"has3D"] isEqual:@1]) {
        [array addObject:[UIImage imageNamed:@"v10_18_Feature3D"]];
    }
    
    if ([[model.feature objectForKey:@"hasIMAX"] isEqual:@1]) {
        [array addObject:[UIImage imageNamed:@"v10_18_FeatureIMAX"]];
    }
    
    if ([[model.feature objectForKey:@"hasVIP"] isEqual:@1]) {
        [array addObject:[UIImage imageNamed:@"v10_18_VIP"]];
    }
    
    if ([[model.feature objectForKey:@"hasPark"] isEqual:@1]) {
        [array addObject:[UIImage imageNamed:@"icon_Parking"]];
    }
    
    if ([[model.feature objectForKey:@"hasServiceTicket"] isEqual:@1]) {
        [array addObject:[UIImage imageNamed:@"v10_18_serviceTicket"]];
    }
    
    if ([[model.feature objectForKey:@"hasWifi"] isEqual:@1]) {
        [array addObject:[UIImage imageNamed:@"v10_18_wifi"]];
    }
    
    for (int i = 0; i < array.count; i++) {
                
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * 40, 0, 40, 40)];
        imageView.image = array[i];
        
        [_movieTypeView addSubview:imageView];
        
    }
    
    
}

@end
