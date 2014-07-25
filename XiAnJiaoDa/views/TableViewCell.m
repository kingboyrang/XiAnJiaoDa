//
//  TableViewCell.m
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-25.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "TableViewCell.h"
#import "NSString+TPCategory.h"


@implementation TableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    self.myLabel.numberOfLines=0;
    self.myLabel.lineBreakMode=NSLineBreakByWordWrapping;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect r = self.myLabel.frame;
    CGSize size = [self.myLabel.text textSize:self.myLabel.font withWidth:r.size.width];
    r.size.height = size.height;
    self.myLabel.frame = r;
    
    r = self.line.frame;
    r.origin.y = self.myLabel.frame.origin.y + self.myLabel.frame.size.height + 8;
    self.line.frame = r;

}
@end
