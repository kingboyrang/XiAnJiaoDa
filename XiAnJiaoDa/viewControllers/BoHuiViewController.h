//
//  BoHuiViewController.h
//  XiAnJiaoDa
//
//  Created by liuqin on 14-7-23.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "BaseViewController.h"
#import "CVTextViewCell.h"
#import "CompanyLastCell.h"
@interface BoHuiViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,CVTextViewCellDelegate,CompanyLastCellDelegate>
{
    CVTextViewCell *textcell;
    CompanyLastCell *lastCell;
}
@property (nonatomic, strong)NSMutableArray *messArr;
@property (nonatomic, strong)NSString *WMRW_IDStr;
@end
