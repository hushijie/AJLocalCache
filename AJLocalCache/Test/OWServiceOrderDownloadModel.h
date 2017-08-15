//
//  OWServiceOrderDownloadModel.h
//  Owhat_v4
//
//  Created by JasonHu on 2017/5/19.
//  Copyright © 2017年 Owhat. All rights reserved.
//

/*
 资源下载model
 */

typedef enum {
    OWDownloadState_Start = 0,     /** 下载中 */
    OWDownloadState_Suspended,     /** 下载暂停 */
    OWDownloadState_Completed,     /** 下载完成 */
    OWDownloadState_Failed        /** 下载失败 */
}OWDownloadState;

typedef enum {
    OWDownloadMediaType_Image,     /** 图片 */
    OWDownloadMediaType_Video      /** 视频 */
}OWDownloadMediaType;


#import "AJLocalCacheBaseModel.h"

@interface OWServiceOrderDownloadModel : AJLocalCacheBaseModel

//服务单id
@property (nonatomic ,assign)long orderID;

//需要下载的url数组(为了获取已下载列表中的第一张图片)
@property (nonatomic ,strong)NSArray * urlArray;

//封面图
@property (nonatomic ,copy)NSString * coverImgUrlString;

//标题
@property (nonatomic ,copy)NSString * titleString;

//summary
@property (nonatomic ,copy)NSString * summaryString;

//约拍的明星名字
@property (nonatomic ,copy)NSString * targetStarName;

//下载状态记录
@property (nonatomic ,assign)OWDownloadState downloadState;


#pragma mark - 

@property (nonatomic ,copy)NSString * url;


#pragma mark - 

/**
 媒体类型-图片或视频
 */
@property (nonatomic ,assign)OWDownloadMediaType mediaType;



@end
