//
//  BaseModel.m
//  Timer
//
//  Created by lx on 16/5/17.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel


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

@end
