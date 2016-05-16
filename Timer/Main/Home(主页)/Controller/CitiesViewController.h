//
//  CitiesViewController.h
//  Timer
//
//  Created by lx on 16/5/16.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BlockType)(NSString *);

@interface CitiesViewController : UIViewController

@property (nonatomic, copy)BlockType selectCity;

- (void)setSelectCity:(BlockType)selectCity;

@end
