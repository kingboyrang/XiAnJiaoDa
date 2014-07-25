//
//  CompanyLastCell.h
//  XiAnJiaoDa
//
//  Created by liuqin on 14-7-23.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol CompanyLastCellDelegate <NSObject>

-(void)BtnDelegate:(int)tag;

@end

@interface CompanyLastCell : UITableViewCell

@property (nonatomic, strong)UIButton *_btn1;
@property (nonatomic, strong)UIButton *_btn2;

@property (nonatomic, strong)id<CompanyLastCellDelegate>delegate;

@end
