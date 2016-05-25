//
//  CriticismModel.h
//  MTime
//
//  Created by 孙 峰 on 15/9/23.
//  Copyright (c) 2015年 SunFeng. All rights reserved.
//

#import "BaseModel.h"

@interface CriticismModel : BaseModel

/*
 {
 "id": 7904524,
 "nickname": "MrJustin",
 "userImage": "http://img22.mtime.cn/up/2012/05/09/140415.88169279_128X128.jpg",
 "rating": "9.0",
 "title": "令人目眩神迷的\"疯狂\"还魂",
 "summary": "在超级英雄和太空歌剧大行其道的当下，除了乔治·米勒，没人认为这是重启废土电影的好时代。《疯狂的麦克斯1》当了20多年的投资回报性价比之冠，做为澳洲新浪潮电影的代表征服了美国市场，《疯狂的麦克斯2》被卡梅隆、芬奇奉为心头好，米勒和梅尔·吉普森用枪支弹药皮衣飞车开启了漫天黄沙的废土末世。三分之一个世纪过去了，当曾经的辉煌变成黄粱一梦，米勒凭借指挥企鹅跳舞的动画电影走上奥斯卡领奖台，30多年的废土情怀对...",
 "relatedObj": {
 "type": 1,
 "id": 24138,
 "title": "疯狂的麦克斯：狂暴之路",
 "rating": "8.2",
 "image": "http://img31.mtime.cn/mt/2015/05/10/103443.83432757_1280X720X2.jpg"
 }
 }
 */

@property(nonatomic,copy)NSString *nickname,*userImage,*rating,*title,*summary;

@property(nonatomic,strong)NSDictionary *relatedObj;





@end
