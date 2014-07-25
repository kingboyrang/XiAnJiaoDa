//
//  BtnCell.h
//  XiAnJiaoDa
//
//  Created by liuqin on 14-7-22.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BtnCellDegate <NSObject>

-(void)ThreebtnDelegate:(int)tag;

@end

@interface BtnCell : UITableViewCell

@property (nonatomic, strong)id<BtnCellDegate>delegate;



@end
