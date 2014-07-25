//
//  CompanyCell.h
//  XiAnJiaoDa
//
//  Created by liuqin on 14-7-22.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetWaiMaoGongSi.h"

@interface CompanyCell : UITableViewCell

@property (weak, nonatomic)  GetWaiMaoGongSi *entity;

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *Image;

- (IBAction)myAction:(id)sender;

@end
