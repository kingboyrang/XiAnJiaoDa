//
//  XJCGShengqing.h
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-30.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJCGShengqing : NSObject

@property (nonatomic, strong)NSString *DEPNAME;             //项目单位
@property (nonatomic, strong)NSString *CGSQ_XMMINGCHENG;    //项目名称
@property (nonatomic, strong)NSString *CGSQ_CGBXMYZJH;      //项目员证件号
@property (nonatomic, strong)NSString *CGSQ_SQSJ;           //申请时间
@property (nonatomic, strong)NSString *CGSQ_CGBXMY;         //项目员
@property (nonatomic, strong)NSString *SQJB_MINGCHENG;      //申请级别名称
@property (nonatomic, strong)NSString *CGSQ_BIANHAO;        //申请编号
@property (nonatomic, strong)NSString *CGSQ_NEIWAIMAOMC;    //内/外贸名称
@property (nonatomic, strong)NSString *CGSQ_TJSJ;           //添加时间
@property (nonatomic, strong)NSString *CGSQ_ID;             //采购申请ID
@property (nonatomic, strong)NSString *CGSQ_CGZENGE;        //采购总额
@property (nonatomic, strong)NSString *CGFS_MINGCHENG;      //采购方式名称
@property (nonatomic, strong)NSString *STATETYPE;           //操做状态（固定常量0:操作失败1:成功）
@property (nonatomic, strong)NSString *STATEMSG;            //操作失败返回消息



@end
