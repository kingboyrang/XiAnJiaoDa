//
//  DianView.m
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-26.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "DianView.h"

@implementation DianView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        [imageView setImage:[UIImage imageNamed:@"circle"]];
        [self addSubview:imageView];
        self.label = [[UILabel alloc]initWithFrame:self.bounds];
        self.label.backgroundColor = [UIColor clearColor];
        self.label.textColor = [UIColor whiteColor];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont systemFontOfSize:11.0f];
        [self addSubview:self.label];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
