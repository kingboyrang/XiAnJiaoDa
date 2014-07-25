//
//  TableViewController.h
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-25.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "BaseViewController.h"
#import "TableViewCell.h"
#import "ContentViewController.h"
#import "NSString+TPCategory.h"
#import "searchDaiShenHeXiangMu.h"
@interface TableViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)NSArray *tableArr;
@property (nonatomic, strong)NSArray *tableMess;
@property (nonatomic, assign)int type;

@end
