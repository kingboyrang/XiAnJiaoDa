//
//  DataModel.h
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-26.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ServiceResult.h"
#import "ServiceRequestManager.h"



@protocol MyDelegate <NSObject>

-(void)login:(NSString *)user  password:(NSString *)password  ZZRYIDStr:(NSString *)ZZRYIDStr;

@end



@interface DataModel : NSObject

@property (nonatomic, assign)id<MyDelegate>delegate;

#pragma mark用户登录
+(void)Login;
#pragma mark任务量统计
+(void)getRenYuanWorkTasks;

@end
