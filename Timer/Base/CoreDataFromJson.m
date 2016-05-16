//
//  CoreDataFromJson.m
//  Timer
//
//  Created by lx on 16/5/16.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "CoreDataFromJson.h"

@implementation CoreDataFromJson

+ (id)jsonObjectFromFileName:(NSString *)fileName{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:fileName ofType:@"json"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
}

@end
