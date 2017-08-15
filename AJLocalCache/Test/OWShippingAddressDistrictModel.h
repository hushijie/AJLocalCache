//
//  OWShippingAddressDistrictModel.h
//  Owhat_v4
//
//  Created by JasonHu on 2016/11/18.
//  Copyright © 2016年 Owhat. All rights reserved.
//

/*
 地址详情页-获取到省市区全部信息- 区model
 */

#import "AJLocalCacheBaseModel.h"

@interface OWShippingAddressDistrictModel : AJLocalCacheBaseModel

/**
 区名
 */
@property (nonatomic ,copy)NSString * name;


/**
 区ID
 */
@property (nonatomic ,assign)long districtID;


/**
 父ID
 */
@property (nonatomic ,assign)long pid;





+(id)districtModelWithDict:(NSDictionary *)dict;

@end
