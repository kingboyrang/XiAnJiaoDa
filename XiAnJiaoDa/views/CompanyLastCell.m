//
//  CompanyLastCell.m
//  XiAnJiaoDa
//
//  Created by liuqin on 14-7-23.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "CompanyLastCell.h"

@implementation CompanyLastCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self._btn1 = [[UIButton alloc]initWithFrame:CGRectMake(90, 5, 60, 25)];
        [self._btn1 setBackgroundImage:[UIImage imageNamed:@"btnNor"] forState:UIControlStateNormal];
        [self._btn1 setBackgroundImage:[UIImage imageNamed:@"btnSele"] forState:UIControlStateHighlighted];
        [self._btn1 setTitle:@"确认" forState:UIControlStateNormal];
        [self._btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [self._btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self._btn1.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        
        self._btn2 = [[UIButton alloc]initWithFrame:CGRectMake(160, 5, 60, 25)];
        [self._btn2 setBackgroundImage:[UIImage imageNamed:@"btnNor"] forState:UIControlStateNormal];
        [self._btn2 setBackgroundImage:[UIImage imageNamed:@"btnSele"] forState:UIControlStateHighlighted];
        [self._btn2 setTitle:@"取消" forState:UIControlStateNormal];
        [self._btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [self._btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self._btn2.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        
        self._btn1.tag = 100;
        self._btn2.tag = 200;
        
        [self._btn1 addTarget:self action:@selector(myAction:) forControlEvents:UIControlEventTouchUpInside];
        [self._btn2 addTarget:self action:@selector(myAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:self._btn1];
        [self.contentView addSubview:self._btn2];
        
        self.backgroundColor=[UIColor clearColor];
    }
    return self;
}


- (void)myAction:(id)sender {
    UIButton *btn = (UIButton *)sender;
    [self.delegate BtnDelegate:btn.tag];
}

@end
