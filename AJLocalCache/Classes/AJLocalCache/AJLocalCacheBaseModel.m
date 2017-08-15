//
//  AJLocalCacheBaseModel.m
//  AJLocalCache
//
//  Created by JasonHu on 2017/8/15.
//  Copyright © 2017年 AJ. All rights reserved.
//

#import "AJLocalCacheBaseModel.h"
#import "MJExtension.h"

@implementation AJLocalCacheBaseModel

/**
 为了防止没有重写,导致的抛出异常问题！
 */
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

/*
 因为只有遵守了NSCoding协议的类才能归档，并且重写了归档和解档的方法 才能归解档 所以添加这个宏
 */
MJCodingImplementation

@end
