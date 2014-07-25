//
//  RootTabViewController.h
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-24.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "BaseViewController.h"
#import "MyTabbar.h"

#import "MainViewController.h"
#import "SecViewController.h"

@interface RootTabViewController : BaseViewController<MyTabbarDelegate>
{
    
    NSMutableDictionary* nvcDict;
}

@property (nonatomic, strong)UIWindow *w;

@property (nonatomic, strong)MyTabbar *tabbar;

@end
