//
//  DataModel.m
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-26.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel
@synthesize delegate;
#pragma mark 登录
+(void)Login{
    NSString *str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\"}"];
    NSMutableArray *params=[NSMutableArray array];
    [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
    ServiceArgs *args=[[ServiceArgs alloc] init];
    args.serviceURL=@"http://223.4.216.54:8888/xajdcg_webservice/userLogin";
    args.methodName=@"getLoginUserByLoginName";//要调用的webservice方法
    args.soapParams=params;//传递方法参数
    args.httpWay=ServiceHttpSoap1;
    ServiceRequestManager *manager=[ServiceRequestManager requestWithArgs:args];
    
    [manager setSuccessBlock:^() {
        if (manager.error) {
            NSLog(@"同步请求失败，失败原因=%@",manager.error.description);
            return;
        }
        NSLog(@"登录请求成功，请求结果为=\n%@",manager.responseString);
        ServiceResult *result = [ServiceResult serviceWithArgs:args responseText:manager.responseString];
        NSDictionary *dic=[result json];
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setObject:[dic objectForKey:@"RY_DLM"] forKey:USERNAME];
//        [userDefault setObject:[dic objectForKey:@"RY_XM"] forKey:PASSWORD];
        [userDefault setObject:[dic objectForKey:@"ZZRY_ID"] forKey:ZZRYID];
        [userDefault synchronize];

        
    }];
    [manager startSynchronous];//开始同步
}



@end
