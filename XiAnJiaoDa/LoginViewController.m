//
//  LoginViewController.m
//  XiAnJiaoDa
//
//  Created by liuqin on 14-7-10.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   
    self.view.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(70, 70, 173, 48)];
    [imageView setImage:[UIImage imageNamed:@"logo"]];
    [self.view addSubview:imageView];
    
    self.netIdClass  = [[LableAndTextField alloc]initWithFrame:CGRectMake(60 , imageView.frame.origin.y + imageView.frame.size.height + 20, 240, 60)];
    [self.view addSubview:self.netIdClass];
    self.netIdClass.title_label.text = @"NetID";
    
    self.pwClass  = [[LableAndTextField alloc]initWithFrame:CGRectMake(60 , self.netIdClass.frame.origin.y + self.netIdClass.frame.size.height + 5, 240, 60)];
    [self.view addSubview:self.pwClass];
    self.pwClass.title_label.text = @"密 码";

    self.messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, self.pwClass.frame.origin.y + self.pwClass.frame.size.height + 10, 200, 20)];
    self.messageLabel.font = [UIFont systemFontOfSize:12.f];
    self.messageLabel.textColor = [UIColor grayColor];
    self.messageLabel.text = @"不能登录？请联系管理员!";
    [self.view addSubview:self.messageLabel];
    
    
    self.loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(60, self.messageLabel.frame.origin.y + self.messageLabel.frame.size.height + 5,220, 30)];
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    self.loginBtn.backgroundColor = [UIColor colorWithRed:0/255.0 green:128/255.0 blue:255/255.0 alpha:1];
    self.loginBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14.0f];
    [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.loginBtn];
    [self.loginBtn addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    
 
}
-(void)loginAction{
    
    NSString *str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\"}"];
//    NSString *str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"%@\",\"LOGINPWD\":\"%@\"}",self.netIdClass.textField.text,self.pwClass.textField.text];
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
        if ([[dic objectForKey:@"RESTYPE"]isEqualToString:@"0"]) {
            self.messageLabel.text =@"用户不存在" ;
        }else if ([[dic objectForKey:@"RESTYPE"]isEqualToString:@"1"]){
            self.messageLabel.text =@"用户密码错误" ;
        }else if ([[dic objectForKey:@"RESTYPE"]isEqualToString:@"2"]){
            self.messageLabel.text =@"用户已锁定";
        }else if ([[dic objectForKey:@"RESTYPE"]isEqualToString:@"3"]){
            self.rootTabbarVC = [[RootTabViewController alloc]init];
            [self.navigationController pushViewController:self.rootTabbarVC animated:YES ];
         
            
        }
        
        
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setObject:[dic objectForKey:@"RY_DLM"] forKey:USERNAME];
        //        [userDefault setObject:[dic objectForKey:@"RY_XM"] forKey:PASSWORD];
        [userDefault setObject:[dic objectForKey:@"ZZRY_ID"] forKey:ZZRYID];
        [userDefault synchronize];
    }];
    [manager startSynchronous];//开始同步
    
  }

@end
