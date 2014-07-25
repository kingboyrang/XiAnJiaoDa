//
//  LoginViewController.h
//  XiAnJiaoDa
//
//  Created by liuqin on 14-7-10.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LableAndTextField.h"
#import "MainViewController.h"
#import "RootTabViewController.h"
@interface LoginViewController : UIViewController

@property (nonatomic, strong)LableAndTextField *netIdClass;
@property (nonatomic, strong)LableAndTextField *pwClass;
@property (nonatomic, strong)UILabel *messageLabel;
@property (nonatomic, strong)UIButton *loginBtn;
@property (strong, nonatomic) RootTabViewController *rootTabbarVC;

@end
