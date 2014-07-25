//
//  BaseViewController.m
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-25.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

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
    // Do any additional setup after loading the view.
    
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0) {
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    }

    
    self.navigationController.navigationBarHidden = YES;
    self.navView = [[NavView alloc]initWithFrame:CGRectMake(0, 20, 320, 44)];
    self.navView.navLabel.text = self.titleStr;
    self.navView.delegate = self;
    [self.view addSubview:self.navView];
    
}


-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
