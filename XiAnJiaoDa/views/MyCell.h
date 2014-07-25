//
//  MyCell.h
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-24.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyBtn.h"
#import "DianView.h"
@interface MyCell : UITableViewCell

@property (nonatomic, strong)MyBtn *btn1;
@property (nonatomic, strong)MyBtn *btn2;
@property (nonatomic, strong)MyBtn *btn3;


@property (nonatomic, strong)DianView *dian1;
@property (nonatomic, strong)DianView *dian2;
@property (nonatomic, strong)DianView *dian3;


@end
