//
//  WeiTuoViewController.h
//  XiAnJiaoDa
//
//  Created by liuqin on 14-7-22.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "BaseViewController.h"

@interface WeiTuoViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{
    UIDatePicker *picker;
    UIButton *timeBtn;
    NSString *timeStr;
}
@property (nonatomic, strong)NSString *weituoIdStr;
@property (nonatomic, strong)NSString *waimaoCompanyStr;
@property (nonatomic, strong)NSMutableArray *messArray;
@end
