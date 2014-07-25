//
//  MyBtn.h
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-24.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyBtn : UIButton


@property (nonatomic, assign)int btnTag;

-(void)myinit:(NSString *) btnTitle  norImage:(UIImage *)norimage  seleImage:(UIImage *)seleImage;

@end
