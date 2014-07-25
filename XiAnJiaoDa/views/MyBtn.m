//
//  MyBtn.m
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-24.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "MyBtn.h"

@implementation MyBtn

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void) setImage:(UIImage *)image withTitle:(NSString *)title forState:(UIControlState)stateType {
    UIFont *font=[UIFont boldSystemFontOfSize:12.0f];
//    [self.imageView setContentMode:UIViewContentModeCenter];
    [self setImage:image forState:stateType];
    
    [self.titleLabel setContentMode:UIViewContentModeCenter];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self.titleLabel setFont:font];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(50.0,
                                              -image.size.width,
                                              0.0,
                                              0.0)];
    [self setTitle:title forState:stateType];
    [self setTitleColor:[UIColor blackColor] forState:stateType];
}
-(void)myinit:(NSString *)btnTitle norImage:(UIImage *)norimage seleImage:(UIImage *)seleImage{
    [self setImage:norimage withTitle:btnTitle forState:UIControlStateNormal];
    [self setImage:seleImage withTitle:btnTitle forState:UIControlStateHighlighted];
}

@end
