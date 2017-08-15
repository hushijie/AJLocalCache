//
//  AJLocalCacheTool.m
//  AJLocalCache
//
//  Created by JasonHu on 2017/8/15.
//  Copyright © 2017年 AJ. All rights reserved.
//

#import "AJLocalCacheTool.h"
#import "FMDB.h"

#import "OWShippingAddressProvinceModel.h"
#import "OWServiceOrderDownloadModel.h"

@implementation AJLocalCacheTool

static FMDatabaseQueue *_queue;


#pragma mark - 初始化

/**
 对象初始化的时候，只调用一次
 */
+ (void)initialize
{
    // 0.获得沙盒中的数据库文件名
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"OwhatV4.sqlite"];
    
    // 1.创建队列
    _queue = [FMDatabaseQueue databaseQueueWithPath:path];
    
    // 2.创表
    [_queue inDatabase:^(FMDatabase *db) {
        
        /*
         获取省市区所有信息：TableName_FindAllArea
         注：不区分用户！（不需要 access_token 参数）
         */
        [db executeUpdate:@"create table if not exists TableName_FindAllArea (id integer primary key autoincrement, idstr text, dictORmodel blob);"];
        
        
        /*
         服务单下载列表:TableName_ServiceOrderDownloadList
         */
        [db executeUpdate:@"create table if not exists TableName_ServiceOrderDownloadList (id integer primary key autoincrement, access_token text, idstr text,urlstr text, dictORmodel blob);"];
        
    }];
    
}



#pragma mark - 增加缓存

/*
 增加N条缓存
 */

//dict
//+ (void)addDictArray:(NSArray *)dictArray withTableName:(TableName)tableName
//{
//    for (NSDictionary * dict in dictArray) {
//
//        //不为空的时候才添加到表中
//        if (dict) {
//            [self addDict:dict withTableName:tableName];
//        }
//
//    }
//}

//model
+ (void)addModelArray:(NSArray *)modelArray withTableName:(TableName)tableName
{
    for (id model in modelArray) {
        
        //不为空的时候才添加到表中
        if (model) {
            [self addModel:model withTableName:tableName];
        }
        
    }
}




/*
 增加1条缓存
 */

////dict
//+(void)addDict:(NSDictionary *)dict withTableName:(TableName)tableName
//{
//
//    [_queue inDatabase:^(FMDatabase *db) {
//
//        //为了区分是哪个用户（方便多账号管理）
//        NSString *accessToken = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"UserID"]];
//        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:dict];
//
//        if (tableName==tableOwhatSuperStarsAllStars) {
//
//            NSString *idstr = [NSString stringWithFormat:@"%@",dict[@"id"]];
//
//            [db executeUpdate:@"insert into table_OwhatSuperStarAllStars (access_token, idstr, dictORmodel) values(?, ? , ?)", accessToken, idstr, data];
//
//        }
//
//
//    }];
//
//}


//model
+(void)addModel:(id)model withTableName:(TableName)tableName
{
    
    [_queue inDatabase:^(FMDatabase *db) {
        
        //为了区分是哪个用户（方便多账号管理）
        NSString *accessToken = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"Owhat_v4_UserID"]];
        
        /*
         注：这个model必须遵守了NSCoding协议 才能编解码
         */
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:model];
        
        
        /*
         获取省市区全部信息
         注：不区分用户！
         */
        if(tableName==TableName_FindAllArea){
            
            OWShippingAddressProvinceModel * provinceModel=(OWShippingAddressProvinceModel *)model;
            
            NSString *idstr = [NSString stringWithFormat:@"%ld",provinceModel.provinceID];
            
            [db executeUpdate:@"insert into TableName_FindAllArea (idstr, dictORmodel) values(? , ?)", idstr, data];
            
        }
        
        /*
         服务单下载列表
         */
        if(tableName==TableName_ServiceOrderDownloadList){
            
            OWServiceOrderDownloadModel * downloadModel=(OWServiceOrderDownloadModel *)model;
            
            NSString *idstr = [NSString stringWithFormat:@"%ld",downloadModel.orderID];
            
            NSString *urlstr = downloadModel.url;
            
            [db executeUpdate:@"insert into TableName_ServiceOrderDownloadList (access_token, idstr, urlstr, dictORmodel) values(?, ?, ?, ?)", accessToken, idstr, urlstr, data];
            
        }
        
        
    }];
    
}


#pragma mark - 删除缓存

//model
+(void)deleteModel:(id)model withTableName:(TableName)tableName
{
    
    [_queue inDatabase:^(FMDatabase *db) {
        
        //为了区分是哪个用户（方便多账号管理）
        NSString *accessToken = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"Owhat_v4_UserID"]];
        
        /*
         注：这个model必须遵守了NSCoding协议 才能编解码
         */
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:model];
        
        
        /*
         服务单下载列表
         */
        if(tableName==TableName_ServiceOrderDownloadList){
            
            OWServiceOrderDownloadModel * downloadModel=(OWServiceOrderDownloadModel *)model;
            
            NSString *idstr = [NSString stringWithFormat:@"%ld",downloadModel.orderID];
            
            NSString *urlstr = downloadModel.url;
            
            [db executeUpdate:@"delete from TableName_ServiceOrderDownloadList where access_token=? and idstr=? and urlstr=?", accessToken, idstr,urlstr];
            
        }
        
    }];
    
}



#pragma mark - 更新缓存

//model
+(void)updateModel:(id)model withTableName:(TableName)tableName
{
    
    [_queue inDatabase:^(FMDatabase *db) {
        
        //为了区分是哪个用户（方便多账号管理）
        NSString *accessToken = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"Owhat_v4_UserID"]];
        
        /*
         注：这个model必须遵守了NSCoding协议 才能编解码
         */
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:model];
        
        
        /*
         服务单下载列表
         */
        if(tableName==TableName_ServiceOrderDownloadList){
            
            OWServiceOrderDownloadModel * downloadModel=(OWServiceOrderDownloadModel *)model;
            
            NSString *idstr = [NSString stringWithFormat:@"%ld",downloadModel.orderID];
            
            NSString *urlstr = downloadModel.url;
            
            [db executeUpdate:@"update TableName_ServiceOrderDownloadList set dictORmodel=? where access_token=? and idstr=? and urlstr=?", data, accessToken, idstr, urlstr];
            
        }
        
    }];
    
}







#pragma mark - 遍历表中数据


/*
 遍历表中 access_token 的所有数据
 */

//dict
//+ (NSArray *)selectDictArrayWithTableName:(TableName)tableName
//{
//    // 1.定义数组
//    __block NSMutableArray *dictArray = nil;
//
//    // 2.使用数据库
//    [_queue inDatabase:^(FMDatabase *db) {
//        // 创建数组
//        dictArray = [NSMutableArray array];
//
//        // accessToken
//        NSString *accessToken = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"UserID"]];
//
//        FMResultSet *rs = nil;
//
//        if (tableName==tableOwhatSuperStarsAllStars) {
//
//            rs = [db executeQuery:@"select * from table_OwhatSuperStarAllStars where access_token = ? ;", accessToken];
//
//        }
//
//
//        while (rs.next) {
//            NSData *data = [rs dataForColumn:@"dictORmodel"];
//            NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:data];
//            [dictArray addObject:dict];
//        }
//    }];
//
//    // 3.返回数据
//    return dictArray;
//}



//model
+ (NSArray *)selectModelArrayWithTableName:(TableName)tableName
{
    // 1.定义数组
    __block NSMutableArray *modelArray = nil;
    
    // 2.使用数据库
    [_queue inDatabase:^(FMDatabase *db) {
        // 创建数组
        modelArray = [NSMutableArray array];
        
        // accessToken
        NSString *accessToken = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"Owhat_v4_UserID"]];
        
        FMResultSet *rs = nil;
        
        
        /*
         获取省市区所有信息
         注：不区分用户！
         */
        if (tableName==TableName_FindAllArea) {
            
            rs = [db executeQuery:@"select * from TableName_FindAllArea ;"];
            
        }
        
        
        /*
         服务单下载列表
         */
        if (tableName==TableName_ServiceOrderDownloadList) {
            
            rs = [db executeQuery:@"select * from TableName_ServiceOrderDownloadList where access_token = ? ;", accessToken];
            
        }
        
        
        while (rs.next) {
            NSData *data = [rs dataForColumn:@"dictORmodel"];
            id model = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            [modelArray addObject:model];
        }
    }];
    
    // 3.返回数据
    return modelArray;
}





#pragma mark - 删除表


/*
 清理表中access_token的所有数据，不会删除表
 */
+(void)dropTableWithTableName:(TableName)tableName
{
    [_queue inDatabase:^(FMDatabase *db) {
        
        // accessToken
        NSString *accessToken = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"UserID"]];
        
        
        /*
         获取省市区的所有信息
         注：不需要区分用户
         */
        if (tableName==TableName_FindAllArea) {
            
            //删除表中 的所有数据
            [db executeUpdate:@"delete from TableName_FindAllArea ;"];
            
        }
        
        /*
         服务单下载列表
         */
        if (tableName==TableName_ServiceOrderDownloadList) {
            
            //删除表中 的所有数据
            [db executeUpdate:@"delete from TableName_ServiceOrderDownloadList where access_token = ? ;",accessToken];
            
        }
        
    }];
}



//#pragma mark - 删除数据库
//不知道为什么下面的操作不能有效
//+(void)dropDataBaseWithDataBaseName:(DabaBaseName)DBName
//{
//    [_queue inDatabase:^(FMDatabase *db) {
//
//        if (DBName==DBOwhatV3) {
//
//            [db executeUpdate:@"drop database if exists OwhatV3.sqlite;"];
//
//        }
//
//    }];
//}




#pragma mark - 刷新指定表中的数据

/*
 刷新指定表中的数据
 */

////dict
//+(void)refreshTable:(TableName)tableName withDictArray:(NSArray *)dictArray
//{
//    //先删除缓存
//    [self dropTableWithTableName:tableName];
//    //后新增缓存
//    [self addDictArray:dictArray withTableName:tableName];
//}


//model
+(void)refreshTable:(TableName)tableName withModelArray:(NSArray *)modelArray
{
    //先删除缓存
    [self dropTableWithTableName:tableName];
    //后新增缓存
    [self addModelArray:modelArray withTableName:tableName];
}

@end
