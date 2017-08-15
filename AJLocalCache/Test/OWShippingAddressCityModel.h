//
//  OWShippingAddressCityModel.h
//  Owhat_v4
//
//  Created by JasonHu on 2016/11/18.
//  Copyright © 2016年 Owhat. All rights reserved.
//

/*
 地址详情页-获取到省市区全部信息- 城市model
 */

#import "AJLocalCacheBaseModel.h"

@interface OWShippingAddressCityModel : AJLocalCacheBaseModel

/**
 城市名
 */
@property (nonatomic ,copy)NSString * name;


/**
 城市ID
 */
@property (nonatomic ,assign)long cityID;


/**
 父ID
 */
@property (nonatomic ,assign)long pid;


/**
 区数组
 */
@property (nonatomic ,retain)NSMutableArray * districtsArray;



+(id)cityModelWithDict:(NSDictionary *)dict;

@end
