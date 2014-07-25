//
//  CompanyCell.m
//  XiAnJiaoDa
//
//  Created by liuqin on 14-7-22.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "CompanyCell.h"
#import "NSString+TPCategory.h"
@implementation CompanyCell

- (void)awakeFromNib
{
    // Initialization code
    self.label.numberOfLines = 0;
    self.label.lineBreakMode = NSLineBreakByWordWrapping;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)myAction:(id)sender {
    
//    UIButton *btn = (UIButton *)sender;
//    btn.selected = !btn.selected;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGRect r = self.label.frame;
    CGSize s = [self.label.text textSize:self.label.font withWidth:r.size.width];
    r.size.height = s.height;
    self.label.frame = r;
    
    r = self.Image.frame;
    r.origin.y = self.label.frame.origin.y + self.label.frame.size.height + 4;
    self.Image.frame = r;
    
    
    
    
    
    
    
    
    
}
@end
