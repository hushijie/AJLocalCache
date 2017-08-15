//
//  OWShippingAddressProvinceModel.m
//  Owhat_v4
//
//  Created by JasonHu on 2016/11/18.
//  Copyright © 2016年 Owhat. All rights reserved.
//

#import "OWShippingAddressProvinceModel.h"
#import "OWShippingAddressCityModel.h"

@implementation OWShippingAddressProvinceModel

+(id)provinceModelWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

-(id)initWithDict:(NSDictionary *)dict
{
    if (self=[super init]) {
        
        _citysArray=[[NSMutableArray alloc]init];
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.provinceID=[value longValue];
    }
    
    //城市数组转model
    if ([key isEqualToString:@"citys"]) {
        
        for (NSDictionary * cityDict in value) {
            
            OWShippingAddressCityModel * cityModel=[OWShippingAddressCityModel cityModelWithDict:cityDict];
            [_citysArray addObject:cityModel];
            
        }
    
    }
    
}

@end
