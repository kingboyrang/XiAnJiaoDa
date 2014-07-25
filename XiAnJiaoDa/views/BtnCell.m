//
//  BtnCell.m
//  XiAnJiaoDa
//
//  Created by liuqin on 14-7-22.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "BtnCell.h"

@implementation BtnCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(!(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])) return nil;
    
   UIButton *_btn1 = [[UIButton alloc]initWithFrame:CGRectMake(90, 5, 60, 25)];
    
    [_btn1 setBackgroundImage:[UIImage imageNamed:@"btnNor"] forState:UIControlStateNormal];
    [_btn1 setBackgroundImage:[UIImage imageNamed:@"btnSele"] forState:UIControlStateHighlighted];
    [_btn1 setTitle:@"委托" forState:UIControlStateNormal];
    [_btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _btn1.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    
    UIButton *_btn2 = [[UIButton alloc]initWithFrame:CGRectMake(160, 5, 60, 25)];

    
    [_btn2 setBackgroundImage:[UIImage imageNamed:@"btnNor"] forState:UIControlStateNormal];
    [_btn2 setBackgroundImage:[UIImage imageNamed:@"btnSele"] forState:UIControlStateHighlighted];
    [_btn2 setTitle:@"驳回" forState:UIControlStateNormal];
    [_btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [_btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _btn2.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    
    
    
    UIButton *_btn3 = [[UIButton alloc]initWithFrame:CGRectMake(230, 5, 60, 25)];
    
    
    [_btn3 setBackgroundImage:[UIImage imageNamed:@"btnNor"] forState:UIControlStateNormal];
    [_btn3 setBackgroundImage:[UIImage imageNamed:@"btnSele"] forState:UIControlStateHighlighted];
    [_btn3 setTitle:@"取消" forState:UIControlStateNormal];
    [_btn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [_btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _btn3.titleLabel.font = [UIFont systemFontOfSize:12.0f];

    
    
    
    
    _btn1.tag = 100;
    _btn2.tag = 200;
    _btn3.tag = 300;
    
    [_btn1 addTarget:self action:@selector(myAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btn2 addTarget:self action:@selector(myAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btn3 addTarget:self action:@selector(myAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
 
    
    [self.contentView addSubview:_btn1];
    [self.contentView addSubview:_btn2];
    [self.contentView addSubview:_btn3];
    
    self.backgroundColor=[UIColor clearColor];
    
    return self;
}


- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)myAction:(id)sender {
    UIButton *btn = (UIButton *)sender;
    [self.delegate ThreebtnDelegate:btn.tag];
    
    
}
@end
