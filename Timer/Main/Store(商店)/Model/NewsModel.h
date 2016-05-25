//
//  NewsModel.h
//  MTime
//
//  Created by 孙 峰 on 15/9/23.
//  Copyright (c) 2015年 SunFeng. All rights reserved.
//

#import "BaseModel.h"

@interface NewsModel : BaseModel

@property (nonatomic,copy)NSString *image,*title,*title2,*summary,*summaryInfo,*tag;

@property (nonatomic,copy)NSArray *images;

@property(nonatomic,retain)NSNumber *publishTime,*commentCount,*type;



@end
