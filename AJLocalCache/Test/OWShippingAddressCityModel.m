//
//  OWShippingAddressCityModel.m
//  Owhat_v4
//
//  Created by JasonHu on 2016/11/18.
//  Copyright © 2016年 Owhat. All rights reserved.
//

#import "OWShippingAddressCityModel.h"
#import "OWShippingAddressDistrictModel.h"

@implementation OWShippingAddressCityModel

+(id)cityModelWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

-(id)initWithDict:(NSDictionary *)dict
{
    if (self=[super init]) {
        
        _districtsArray=[[NSMutableArray alloc]init];
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.cityID=[value longValue];
    }
    
    if ([key isEqualToString:@"districts"]) {
        
        for (NSDictionary * districtDict in value) {
            
            OWShippingAddressDistrictModel * districtModel=[OWShippingAddressDistrictModel districtModelWithDict:districtDict];
            [_districtsArray addObject:districtModel];
            
        }
        
    }
}

@end
