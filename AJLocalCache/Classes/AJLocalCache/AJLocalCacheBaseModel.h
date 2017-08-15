//
//  AJLocalCacheBaseModel.h
//  AJLocalCache
//
//  Created by JasonHu on 2017/8/15.
//  Copyright © 2017年 AJ. All rights reserved.
//

/*
 缓存model需要继承的基类model
 功能：
 （1）重写方法 -(void)setValue:(id)value forUndefinedKey:(NSString *)key；
 （2）添加宏 MJCodingImplementation
 */

#import <Foundation/Foundation.h>

@interface AJLocalCacheBaseModel : NSObject

@end
