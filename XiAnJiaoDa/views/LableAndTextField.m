//
//  LableAndTextField.m
//  XiAnJiaoDa
//
//  Created by liuqin on 14-7-15.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "LableAndTextField.h"

@implementation LableAndTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.title_label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
        self.title_label.backgroundColor = [UIColor clearColor];
        self.title_label.textColor = [UIColor blackColor];
        self.title_label.font = [UIFont systemFontOfSize:12.f];
        self.title_label.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.title_label];
        
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.title_label.frame.size.height + 5, frame.size.width - 20, 30)];
        [imageView setImage:[UIImage imageNamed:@"login_textfield_bottom"]];
        imageView.contentMode = UIViewContentModeScaleToFill;
//        [self addSubview:imageView];
        
        
        self.textField = [[UITextField alloc]initWithFrame:CGRectMake(0, self.title_label.frame.size.height + 5, frame.size.width - 20, 30)];
        self.textField.layer.borderColor = [[UIColor grayColor]CGColor];
        self.textField.layer.borderWidth = 0.4f;
        self.textField.borderStyle = UITextBorderStyleLine;
        self.textField.backgroundColor = [UIColor whiteColor];
        self.textField.returnKeyType = UIReturnKeyDone;
        self.textField.delegate = self;
        [self addSubview:self.textField];
    
    }
    return self;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return  YES;
    
}

@end
