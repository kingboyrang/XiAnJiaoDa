//
//  StatisticsAssignmentsClass.h
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-26.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StatisticsAssignmentsClass : NSObject


@property (nonatomic, strong)NSString * HW_XIANGMUSP;   //货物类项目审批
@property (nonatomic, strong)NSString * HW_HETONGSP;    //货物类合同审批
@property (nonatomic, strong)NSString * HW_WAIMAOWT;    //货物外贸任务委托
@property (nonatomic, strong)NSString * HW_WAIMAOXYSQ;  //货物外贸协议审签
@property (nonatomic, strong)NSString * HW_YANSHOUJGSP; //货物类验收结果审批

@property (nonatomic, strong)NSString * ZH_XIANGMUSP;   //综合类项目审批,
@property (nonatomic, strong)NSString * ZH_HETONGSP;    //综合类合同审批
@property (nonatomic, strong)NSString * ZH_YANSHOUJGSP; //综合类验收结果审批



@end
