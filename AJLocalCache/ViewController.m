//
//  ViewController.m
//  AJLocalCache
//
//  Created by JasonHu on 2017/8/9.
//  Copyright © 2017年 AJ. All rights reserved.
//

#import "ViewController.h"
#import "AJLocalCacheTool.h"
#import "OWShippingAddressProvinceModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    /*
     1.获取数据源（舍弃网络获取数据流程，直接加载本地 plist 文件）
     */
    
    NSMutableArray * provinceAry=[NSMutableArray array];
    //读取plist文件中的数据
    NSString * plistPath=[[NSBundle mainBundle] pathForResource:@"FindAllArea" ofType:@"plist"];
    NSDictionary * findAllAreaDict=[NSDictionary dictionaryWithContentsOfFile:plistPath];
    //字典转模型
    for (NSDictionary * dict in (NSArray *)[findAllAreaDict valueForKey:@"list"]) {
        OWShippingAddressProvinceModel * provinceModel=[OWShippingAddressProvinceModel provinceModelWithDict:dict];
        [provinceAry addObject:provinceModel];
    }
    
    
    /*
     2.将数据源保存到本地缓存数据库
     */
    
    //刷新数据库中 TableName_FindAllArea 的数据（如果没有该表，会创建表并保存数据）
    [AJLocalCacheTool refreshTable:TableName_FindAllArea withModelArray:provinceAry];
    
    
    
    /*
     3.判断是否保存成功
     */
    
    if ([AJLocalCacheTool selectModelArrayWithTableName:TableName_FindAllArea].count>0) {
        self.view.backgroundColor=[UIColor purpleColor];
    }
    else{
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
