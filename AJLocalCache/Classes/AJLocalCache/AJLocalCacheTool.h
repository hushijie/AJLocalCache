//
//  AJLocalCacheTool.h
//  AJLocalCache
//
//  Created by JasonHu on 2017/8/15.
//  Copyright © 2017年 AJ. All rights reserved.
//

/*
 本地缓存的工具类封装
 */

#import <Foundation/Foundation.h>


/*
 数据库名定义
 */
typedef enum{
    DBOwhatV3   //OwhatV3数据库
}DabaBaseName;


/*
 表名的定义
 */
typedef enum {
    
    TableName_FindAllArea,   //获取省市区全部信息
    
    TableName_ServiceOrderDownloadList   //服务单下载列表
    
}TableName;


@interface AJLocalCacheTool : NSObject


#pragma mark - 批量数据操作

/*
 清理表中 access_token 的所有数据，不会删除表
 */
+(void)dropTableWithTableName:(TableName)tableName;

/*
 遍历表中 access_token 所有数据
 */
+ (NSArray *)selectModelArrayWithTableName:(TableName)tableName;

/*
 刷新指定表中 access_token 的数据
 */
+(void)refreshTable:(TableName)tableName withModelArray:(NSArray *)modelArray;



#pragma mark - 单条数据操作（增删改）

+(void)addModel:(id)model withTableName:(TableName)tableName;

+(void)deleteModel:(id)model withTableName:(TableName)tableName;

+(void)updateModel:(id)model withTableName:(TableName)tableName;



@end
