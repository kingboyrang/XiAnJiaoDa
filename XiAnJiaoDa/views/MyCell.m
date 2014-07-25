//
//  MyCell.m
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-24.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.btn1 = [[MyBtn alloc]initWithFrame:CGRectMake(10, 10, 80, 90)];
        self.btn1.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.btn1];
        self.dian1 = [[DianView alloc]initWithFrame:CGRectMake(55, 5, 15, 15)];
        [self.btn1 addSubview:self.dian1];
        
        self.btn2 = [[MyBtn alloc]initWithFrame:CGRectMake(105, 10, 80, 90)];
        self.btn2.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.btn2];
        self.dian2 = [[DianView alloc]initWithFrame:CGRectMake(55, 5, 15, 15)];
        [self.btn2 addSubview:self.dian2];

        
        self.btn3 = [[MyBtn alloc]initWithFrame:CGRectMake(200, 10, 80, 90)];
        self.btn3.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.btn3];
        self.dian3 = [[DianView alloc]initWithFrame:CGRectMake(55, 5, 15, 15)];
        [self.btn3 addSubview:self.dian3];
        
        self.dian1.hidden = YES;
        self.dian2.hidden = YES;
        self.dian3.hidden = YES;


        
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier{
    return [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
}


@end
