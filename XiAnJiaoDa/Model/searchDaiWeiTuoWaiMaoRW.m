//
//  searchDaiWeiTuoWaiMaoRW.m
//  XiAnJiaoDa
//
//  Created by liuqin on 14-7-1.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "searchDaiWeiTuoWaiMaoRW.h"
#import "NSString+TPCategory.h"

@implementation searchDaiWeiTuoWaiMaoRW
- (CGFloat)cellHeight{
    CGFloat h=5;
    CGSize size = [self.MESSAGE textSize:[UIFont systemFontOfSize:12] withWidth:320];
    h+=size.height;
    return h;
}
@end
