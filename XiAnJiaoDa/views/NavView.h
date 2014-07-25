//
//  NavView.h
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-25.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NavViewDelegate <NSObject>

-(void)back;

@end


@interface NavView : UIView

@property (nonatomic, strong)UILabel *navLabel;
@property (nonatomic, assign)id<NavViewDelegate>delegate;


@end
