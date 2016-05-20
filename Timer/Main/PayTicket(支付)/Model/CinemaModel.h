//
//  CinemaModel.h
//  Timer
//
//  Created by lx on 16/5/20.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "BaseModel.h"

@interface CinemaModel : BaseModel

//影院名 ，地址
@property (nonatomic ,copy)NSString *cinameName,*address;


//评分，经度，纬度，最低价格
@property (nonatomic, copy)NSNumber *ratingFinal,*longitude,*latitude,*minPrice;

//影院服务项
@property (nonatomic, copy)NSDictionary *feature;



@end
