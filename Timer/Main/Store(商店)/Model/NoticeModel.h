//
//  NoticeModel.h
//  MTime
//
//  Created by 孙 峰 on 15/9/23.
//  Copyright (c) 2015年 SunFeng. All rights reserved.
//

#import "BaseModel.h"

@interface NoticeModel : BaseModel
/*
 {
 "id": 54989,
 "movieName": "《蚁人》国际版终极预告",
 "coverImg": "http://img31.mtime.cn/mg/2015/07/04/110239.56696980.jpg",
 "movieId": 57903,
 "url": "http://vfx.mtime.cn/Video/2015/07/04/mp4/150704102229172451_480.mp4",
 "videoTitle": "蚁人 终极版国际预告片",
 "videoLength": 89,
 "rating": -1,
 "type": [
 "动作",
 "科幻"
 ],
 "summary": "蚁人要打电话叫复联来帮忙"
 }
 */

@property(nonatomic,copy)NSString *movieName,*coverImg,*url,*videoTitle,*summary;

@property(nonatomic,copy)NSArray *type;

@property(nonatomic,assign)NSNumber *rating,*videoLength;



@end
