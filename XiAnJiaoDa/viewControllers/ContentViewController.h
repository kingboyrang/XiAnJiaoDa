//
//  ContentViewController.h
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-25.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "BaseViewController.h"

#import "XJCGShengqing.h"
#import "CVTextViewCell.h"
#import "CompanyViewController.h"
#import "BtnCell.h"

@interface ContentViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,CVTextViewCellDelegate,BtnCellDegate>
{
    CVTextViewCell *textcell;
    BtnCell *threebtnCell;
}
@property (nonatomic, strong)NSString *selfTitileStr;
@property (nonatomic, strong)NSObject *myclass;
@property (nonatomic, strong)NSMutableArray *tableArray;
@property (nonatomic, strong)UITableView *myTable;
@property (nonatomic, assign)int type;

@end
