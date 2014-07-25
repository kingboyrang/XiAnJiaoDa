//
//  searchDaiShenHeXiangMu.m
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-27.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "searchDaiShenHeXiangMu.h"
#import "NSString+TPCategory.h"
@implementation searchDaiShenHeXiangMu

@synthesize CGSQ_ID,SQJB_ID,MESSAGE;

- (CGFloat)cellHeight{
    CGFloat h=5;
    CGSize size = [self.MESSAGE textSize:[UIFont systemFontOfSize:12] withWidth:270];
    h+=size.height;
    return h;
}

@end
