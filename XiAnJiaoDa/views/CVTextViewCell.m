//
//  CVTextViewCell.m
//  WS
//
//  Created by liuqin on 14-6-6.
//  Copyright (c) 2014年 刘琴. All rights reserved.
//

#import "CVTextViewCell.h"
#import <QuartzCore/QuartzCore.h>
@implementation CVTextViewCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(!(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])) return nil;
    _textView = [[GCPlaceholderTextView alloc] initWithFrame:CGRectZero];
    _textView.font = [UIFont systemFontOfSize:12.0f];
    _textView.delegate = self;
    _textView.returnKeyType = UIReturnKeyDone;
    _textView.layer.borderColor=[UIColor blackColor].CGColor;
    _textView.layer.borderWidth=0.7;
    _textView.layer.cornerRadius=5.0;
    _textView.layer.masksToBounds=YES;
    
    _btn1 = [[UIButton alloc]initWithFrame:CGRectZero];
   
    [_btn1 setBackgroundImage:[UIImage imageNamed:@"btnNor"] forState:UIControlStateNormal];
    [_btn1 setBackgroundImage:[UIImage imageNamed:@"btnSele"] forState:UIControlStateHighlighted];
    [_btn1 setTitle:@"审核通过" forState:UIControlStateNormal];
    [_btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _btn1.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    
    _btn2 = [[UIButton alloc]initWithFrame:CGRectZero];
    
    [_btn2 setBackgroundImage:[UIImage imageNamed:@"btnNor"] forState:UIControlStateNormal];
    [_btn2 setBackgroundImage:[UIImage imageNamed:@"btnSele"] forState:UIControlStateHighlighted];
    [_btn2 setTitle:@"驳回" forState:UIControlStateNormal];
    [_btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [_btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _btn2.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    
    _btn1.tag = 100;
    _btn2.tag = 200;
    
    [_btn1 addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
    [_btn2 addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
   
    
    [self.contentView addSubview:_btn1];
    [self.contentView addSubview:_btn2];
	[self.contentView addSubview:_textView];

   self.backgroundColor=[UIColor clearColor];
    
    return self;
}
-(void)btn:(UIButton *)btn{
    [self.delegate btnAction:btn.tag];
}
- (id) initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
	self = [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
	return self;
}
- (void) layoutSubviews {
    [super layoutSubviews];
       _textView.frame=CGRectMake(10, 0, self.frame.size.width-20, self.frame.size.height-40);
    self.btn1.frame = CGRectMake(130, _textView.frame.origin.y+_textView.frame.size.height+10,60, 25);
     self.btn2.frame = CGRectMake(205, _textView.frame.origin.y+_textView.frame.size.height+10,40, 25);
}
#pragma mark textView
-(void)textViewDidBeginEditing:(UITextView *)textView{
    id v=[self superview];
    do{
        v=[v superview];
    }while(![v isKindOfClass:[UITableView class]]);
    UITableView *table = (UITableView *)v;
    table.frame = CGRectMake(0, -100, 320, 448);
 }
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
        
        id v=[self superview];
        do{
            v=[v superview];
        }while(![v isKindOfClass:[UITableView class]]);
        UITableView *table = (UITableView *)v;
        table.frame = CGRectMake(0, 60, 320, 448);
        return NO;
    }
    return YES;
    
}
- (void)textViewDidChange:(UITextView *)textView {
    NSInteger number = [textView.text length];
     if (number > 1000) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"字符个数不能大于1000" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        textView.text = [textView.text substringToIndex:128];
        number = 1000;
    }
}

@end
