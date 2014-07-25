//
//  BaseViewController.h
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-25.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
#import "NavView.h"


@interface BaseViewController : UIViewController <NavViewDelegate>

@property (nonatomic,strong)NavView *navView;
@property (nonatomic, strong)NSString *titleStr;


@end



