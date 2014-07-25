//
//  MyTabbar.h
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-24.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MyTabbarDelegate <NSObject>

-(void)MyTabbarDelegate:(int)tag;

@end


@interface MyTabbar : UIView

@property (nonatomic, strong)UIButton *DBSYBtn;
@property (nonatomic, strong)UIButton *TJHZBtn;
@property (nonatomic, strong)id<MyTabbarDelegate>delegate;
@end
