//
//  ChartsModel.h
//  MTime
//
//  Created by 孙 峰 on 15/9/23.
//  Copyright (c) 2015年 SunFeng. All rights reserved.
//

#import "BaseModel.h"

@interface ChartsModel : BaseModel


/*
 {
 "id": 1295,
 "topListNameCn": "美媒评2014/2015年度最佳25部剧集",
 "topListNameEn": "",
 "type": 1,
 "summary": "美国网站indiewire评选出年度最佳25部电视剧作品，为9月将举行的艾美奖预热。"
 }
 */

@property(nonatomic,copy)NSString *topListNameCn,*topListNameEn,*summary;

@property(nonatomic,assign)NSNumber *type;

@end
