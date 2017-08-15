//
//  OWShippingAddressProvinceModel.h
//  Owhat_v4
//
//  Created by JasonHu on 2016/11/18.
//  Copyright © 2016年 Owhat. All rights reserved.
//

/*
 地址详情页-获取到省市区全部信息- 省model
 */

#import "AJLocalCacheBaseModel.h"

@interface OWShippingAddressProvinceModel : AJLocalCacheBaseModel


/**
 省名
 */
@property (nonatomic ,copy)NSString * name;


/**
 省ID
 */
@property (nonatomic ,assign)long provinceID;


/**
 城市数组
 */
@property (nonatomic ,retain)NSMutableArray * citysArray;



+(id)provinceModelWithDict:(NSDictionary *)dict;



@end
