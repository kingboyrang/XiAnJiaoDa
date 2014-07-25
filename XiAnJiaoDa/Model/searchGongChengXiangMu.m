//
//  searchGongChengXiangMu.m
//  XiAnJiaoDa
//
//  Created by liuqin on 14-7-9.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "searchGongChengXiangMu.h"
#import "NSString+TPCategory.h"
@implementation searchGongChengXiangMu

- (CGFloat)cellHeight{
    CGFloat h=5;
    CGSize size = [self.MESSAGE textSize:[UIFont systemFontOfSize:12] withWidth:320];
    h+=size.height;
    return h;
}


@end
