 //
//  TableViewCell.h
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-25.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "searchDaiShenHeXiangMu.h"
@interface TableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@property (weak, nonatomic) IBOutlet UIImageView *line;
@property (strong, nonatomic)NSObject *entity;

@end
