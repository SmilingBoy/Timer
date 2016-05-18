//
//  SegmentView.h
//  Timer
//
//  Created by lx on 16/5/18.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SegmentBlock)(NSInteger index);
@interface SegmentView : UIView

@property (nonatomic, copy)SegmentBlock segmentBlock;

//标题数组
@property(nonatomic,strong)NSArray *titleArray;

//选中图片名字
@property (nonatomic,copy)NSString *selectedImage;

- (void)setSegmentBlock:(SegmentBlock)segmentBlock;

@end
