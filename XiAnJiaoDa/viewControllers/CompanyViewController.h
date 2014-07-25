//
//  CompanyViewController.h
//  XiAnJiaoDa
//
//  Created by liuqin on 14-7-22.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "BaseViewController.h"

#import "CompanyCell.h"
#import "GetWaiMaoGongSi.h"
#import "WeiTuoViewController.h"
#import "CompanyLastCell.h"
@interface CompanyViewController :BaseViewController<UITableViewDataSource,UITableViewDelegate,CompanyLastCellDelegate>
{
    CompanyLastCell *lastCell;
    NSIndexPath *lastIndexPath;
}

@property (nonatomic, strong)UITableView *myTable;
@property (nonatomic, strong)NSMutableArray *messArr;  //公司数组
@property (nonatomic, strong)NSString *WMRW_IDStr;

@property (nonatomic, strong)NSMutableArray *arry; //传～～～

//删
@property (nonatomic, strong)NSString *companyId;
@end


@interface LastCell : UITableViewCell


@end
