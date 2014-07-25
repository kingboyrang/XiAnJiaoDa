//
//  MyTabbar.m
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-24.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "MyTabbar.h"

@implementation MyTabbar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:self.bounds];
        [bgImageView setImage:[UIImage imageNamed:@"tabbarBg"]];
        [self addSubview:bgImageView];
        self.DBSYBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 160, self.frame.size.height)];
        [self.DBSYBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        [self.DBSYBtn setTitle:@"待办事宜" forState:UIControlStateNormal];
        [self.DBSYBtn setTitleEdgeInsets:UIEdgeInsetsMake(10, 40, 10, 10)];
          UIImage * DBnorImage =[self scalimagename:[UIImage imageNamed:@"DBSYNor"] scalindex:2.50f] ;
        [self.DBSYBtn setImage:DBnorImage forState:UIControlStateNormal];
        [self.DBSYBtn setTitleColor:[UIColor colorWithRed:68/255.0 green:68/255.0 blue:68/255.0 alpha:1] forState:UIControlStateNormal];
        
        
        
        UIImage * DBseleImage =[self scalimagename:[UIImage imageNamed:@"DBSYSele"] scalindex:2.50f] ;
        [self.DBSYBtn setImage:DBseleImage forState:UIControlStateSelected];
        [self.DBSYBtn setTitleColor:[UIColor colorWithRed:12/255.0 green:85/255.0 blue:173/255.0 alpha:1] forState:UIControlStateSelected];
        self.DBSYBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        
        
        
        [self addSubview:self.DBSYBtn];
        self.DBSYBtn.selected = YES;
        
        
        
        
        
        
        self.TJHZBtn = [[UIButton alloc]initWithFrame:CGRectMake(160, 0, 160, self.frame.size.height)];
        [self.TJHZBtn setTitle:@"统计汇总" forState:UIControlStateNormal];
        [self.TJHZBtn setTitleEdgeInsets:UIEdgeInsetsMake(10, 40, 10, 10)];
        [self.TJHZBtn setTitleColor:[UIColor colorWithRed:68/255.0 green:68/255.0 blue:68/255.0 alpha:1] forState:UIControlStateNormal];
        [self.TJHZBtn setTitleColor:[UIColor colorWithRed:12/255.0 green:85/255.0 blue:173/255.0 alpha:1] forState:UIControlStateSelected];
        
        UIImage *TJHZNorImage =[self scalimagename:[UIImage imageNamed:@"TJHZNor"] scalindex:2.50f];
        [self.TJHZBtn setImage:TJHZNorImage forState:UIControlStateNormal];
        UIImage *TJHZseleImage =[self scalimagename:[UIImage imageNamed:@"TJHZSele"] scalindex:2.50f];
        [self.TJHZBtn setImage:TJHZseleImage forState:UIControlStateSelected];
        
        
        
        
        self.TJHZBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:self.TJHZBtn];

        self.DBSYBtn.tag = 100;
        self.TJHZBtn.tag = 111;
        
        [self.DBSYBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.TJHZBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}
-(void)btnAction:(UIButton *)btn{
    btn.selected = YES;
    int tag = btn.tag;
    if (tag == 100) {
        if (self.DBSYBtn.selected) {
            self.TJHZBtn.selected = NO;
        }
       
    }else{
        if (self.TJHZBtn.selected) {
            self.DBSYBtn.selected = NO;
        }
    }
     [self.delegate MyTabbarDelegate:tag];
}
-(UIImage *)scalimagename:(UIImage *)image scalindex:(CGFloat)index
{

    UIImage *scaleimage = [UIImage imageWithCGImage:image.CGImage scale:index orientation:UIImageOrientationUp];
    return scaleimage;
}
@end
