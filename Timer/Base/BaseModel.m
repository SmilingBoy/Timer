//
//  BaseModel.m
//  Timer
//
//  Created by lx on 16/5/17.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (id)initWithDic:(NSDictionary *)jsonDic{
    
    self = [super init];
    
    if (self) {
        //code...
        [self setAttributes:jsonDic];
        
    }
    
    return self;
}

//映射关系
- (void)setAttributes:(NSDictionary *)jsonDic{
    
    //重新建立属性与key的对应字典
    NSDictionary *mapDic = [self attributesDic:jsonDic];
    
    for (NSString *jsonKey in mapDic) {
        
        NSString *modelAttr = [mapDic objectForKey:jsonKey];
        
        //set方法
        SEL selector = [self stringToSel:modelAttr];
        
        //判断self是否能够调用selector方法
        if ([self respondsToSelector:selector]) {
            
            //取出json字典中的value
            id value = [jsonDic objectForKey:jsonKey];
            
            //容错处理(如果取出的是空)
            if ([value isKindOfClass:[NSNull class]]) {
                value = @"";
            }
            
            [self performSelector:selector withObject:value];
            
        }
        
    }
    
}

//生成set方法  name-->setName:
- (SEL)stringToSel:(NSString *)attName{
    //截取首字母,变成大写
    NSString *first = [[attName substringToIndex:1] uppercaseString];
    
    //获取剩下的字符串
    NSString *end = [attName substringFromIndex:1];
    
    //拼接方法名
    NSString *methodName = [NSString stringWithFormat:@"set%@%@:",first,end];
    
    //把某个字符串转化为方法
    return NSSelectorFromString(methodName);
    
}


//重新建立属性与key的对应字典
-(NSDictionary *)attributesDic:(NSDictionary *)jsonDic{
    
    NSMutableDictionary *mapDic = [[NSMutableDictionary alloc] init];
    
    for (id key in jsonDic) {
        
        [mapDic setObject:key forKey:key];
        
    }
    
    return mapDic;
    
}

/*

- (id)initWithDictionary:(NSDictionary *)dic{
    
    self = [super init];
    
    if (self) {
        
        [self setAttributes:dic];
        
    }
    
    return nil;
    
}

- (void)setAttributes:(NSDictionary *)jsonDic{
    
    NSDictionary *mapDic = [self attributesDic:jsonDic];
    
    for (NSString *jsonKey in mapDic) {
        
        NSString *modelAttr = [mapDic objectForKey:jsonKey];
        
        SEL selector = [self stringToSel:modelAttr];
        
        if ([self respondsToSelector:selector]) {
            
            id value = [jsonDic objectForKey:jsonKey];
            
            if ([value isKindOfClass:[NSNull class]]) {
                value = @"";
            }
            
            [self performSelector:selector withObject:value];
            
        }
        
    }
    
}

- (SEL)stringToSel:(NSString *)attName{
    
    NSString *first = [attName substringToIndex:1];
    NSString *end = [attName substringFromIndex:1];
    
    NSString *methodName = [NSString stringWithFormat:@"set%@%@",first,end];
    
    return NSSelectorFromString(methodName);
    
}

- (NSDictionary *)attributesDic:(NSDictionary *)dic{
    
    NSMutableDictionary *mapDic = [NSMutableDictionary dictionary];
    
    for (NSString *key in dic) {
        
        [mapDic setObject:key forKey:key];
        
    }
    return mapDic;
}
*/
@end
