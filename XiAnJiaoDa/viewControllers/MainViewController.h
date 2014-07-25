//
//  MainViewController.h
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-24.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MyCell.h"
#import "MJRefresh.h"
#import "TableViewController.h"
#import "ServiceRequestManager.h"
#import "DataModel.h"

#import "StatisticsAssignmentsClass.h"


@interface MainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,MJRefreshBaseViewDelegate>


@property (nonatomic, strong)UITableView *myTableView;
@property (nonatomic, strong)UIView *headView;
@property (nonatomic, strong)StatisticsAssignmentsClass *staAssClass;
@property (nonatomic, strong)NSMutableArray *classArray;
@property (nonatomic, strong)NSMutableArray *messageArray;

@end
