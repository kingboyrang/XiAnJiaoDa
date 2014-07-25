//
//  NavView.m
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-25.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "NavView.h"

@implementation NavView
@synthesize navLabel;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:self.bounds];
        [bgImageView setImage:[UIImage imageNamed:@"NavCellBg"]];
        [self addSubview:bgImageView];
        self.navLabel = [[UILabel alloc]initWithFrame:bgImageView.frame];
        self.navLabel.font = [UIFont systemFontOfSize:18];
        self.navLabel.textAlignment = NSTextAlignmentCenter;
        self.navLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        [self addSubview:self.navLabel];
        UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 5, 40, 40)];
        [backBtn setImage:[UIImage imageNamed:@"backBtn"] forState:UIControlStateNormal];
         [backBtn addTarget:self action:@selector(backViewController) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:backBtn];
       
        
    }
    return self;
}
-(void)backViewController{
    [self.delegate back];
}


@end
