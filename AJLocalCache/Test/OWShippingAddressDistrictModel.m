//
//  OWShippingAddressDistrictModel.m
//  Owhat_v4
//
//  Created by JasonHu on 2016/11/18.
//  Copyright © 2016年 Owhat. All rights reserved.
//

#import "OWShippingAddressDistrictModel.h"

@implementation OWShippingAddressDistrictModel

+(id)districtModelWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

-(id)initWithDict:(NSDictionary *)dict
{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.districtID=[value longValue];
    }
}

@end
