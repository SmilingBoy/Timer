//
//  NewsModel.h
//  Timer
//
//  Created by lx on 16/5/21.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "BaseModel.h"

@interface NewsModel : BaseModel

@property (nonatomic,copy)NSString *image,*title,*title2,*summary,*summaryInfo,*tag;

@property (nonatomic,copy)NSArray *images;

@property(nonatomic,retain)NSNumber *publishTime,*commentCount,*type;


@end
