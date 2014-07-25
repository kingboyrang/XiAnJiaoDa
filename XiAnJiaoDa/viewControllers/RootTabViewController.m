//
//  RootTabViewController.m
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-24.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "RootTabViewController.h"

@interface RootTabViewController ()

@property (nonatomic, strong) UINavigationController *nc_fristVC;
@property (nonatomic, strong) UINavigationController *nc_secVC;



@end

@implementation RootTabViewController

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
    
    
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0) {
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    }
    // Do any additional setup after loading the view.
    
    self.navView.hidden = YES;
    nvcDict = [[NSMutableDictionary alloc]init];
    self.tabbar = [[MyTabbar alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height-TABBARHEIGT , 320, TABBARHEIGT)];
    [self.view addSubview:self.tabbar];
    self.tabbar.delegate = self;
    
    MainViewController *mainVC = [[MainViewController alloc]init];
    self.nc_fristVC= [[UINavigationController alloc]initWithRootViewController:mainVC];
    self.nc_fristVC.navigationBarHidden = YES;
    [self.view insertSubview:self.nc_fristVC.view belowSubview:self.tabbar];
    

    
}
-(void)MyTabbarDelegate:(int)tag{
    UINavigationController *nvc = nil;
//    CGRect screenBounds =  [[UIScreen mainScreen]applicationFrame];
    
    //    NSMutableArray *keyArr = [NSMutableArray arrayWithCapacity:0];
    //注意forin循环中不要修改集合中的值
   
    
    switch (tag) {
        case 100:
            if (!nvc) {
                MainViewController *mainVC = [[MainViewController alloc]init];
                self.nc_fristVC= [[UINavigationController alloc]initWithRootViewController:mainVC];
                self.nc_fristVC.navigationBarHidden = YES;
                [self.view insertSubview:self.nc_fristVC.view belowSubview:self.tabbar];
                     
             }
            break;
        case 111:
            if (!nvc) {
                if (!nvc) {
                    SecViewController *secVC = [[SecViewController alloc]init];
                    self.nc_secVC = [[UINavigationController alloc]initWithRootViewController:secVC];
                    self.nc_secVC.navigationBarHidden = YES;
                    [self.view insertSubview:self.nc_secVC.view belowSubview:self.tabbar];
                }
                
            }
            break;
         }
    
    
}

@end
