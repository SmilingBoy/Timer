//
//  HotModel.h
//  Timer
//
//  Created by lx on 16/5/18.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "BaseModel.h"

@interface HotModel : BaseModel
//图片  标题  评价  上映时间
@property(nonatomic,copy)NSString *img,*t,*commonSpecial,*rd;

//评分  影院  场次  等待
@property(nonatomic,retain)NSNumber *r,*NearestCinemaCount,*NearestShowtimeCount,*is3D,*isIMAX,*isIMAX3D,*isDMAX,*wantedCount;
@end
