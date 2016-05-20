//
//  NewModel.h
//  Timer
//
//  Created by lx on 16/5/18.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "BaseModel.h"

@interface NewModel : BaseModel

@property (nonatomic, strong)NSString *title, *image , *releaseDate, *type, *director, *actor1, *actor2, *locationName;

@property (nonatomic, strong)NSNumber *Id, *rYear, *rMonth, *rDay, *wantedCount, *videoCount, *isTicket;

@end
/*
 "id": 206789,
 "title": "道士下山",
 "image": "http://img31.mtime.cn/mt/2015/06/24/105023.54733580_1280X720X2.jpg",
 "releaseDate": "7月3日上映",
 "rYear": 2015,
 "rMonth": 7,
 "rDay": 3,
 "type": "动作 | 剧情",
 "director": "陈凯歌",
 "actor1": "王宝强",
 "actor2": "郭富城",
 "locationName": "中国",
 "isTicket": true,
 "wantedCount": 3608,
 "videoCount": 3,
 "videos":
 */