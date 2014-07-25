//
//  WeiTuoViewController.m
//  XiAnJiaoDa
//
//  Created by liuqin on 14-7-22.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "WeiTuoViewController.h"
#import "NSString+TPCategory.h"

@interface WeiTuoViewController ()

@end

@implementation WeiTuoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@     %@",self.weituoIdStr,self.waimaoCompanyStr);
    
    
     UITableView *myTable = [[UITableView alloc]initWithFrame:CGRectMake(10, 70, 300, self.view.bounds.size.height-60-TABBARHEIGT-120)];
    myTable.delegate = self;
    myTable.dataSource = self;
    myTable.backgroundColor = [UIColor whiteColor];
    myTable.layer.borderColor = [[UIColor grayColor]CGColor];
    myTable.layer.borderWidth = 0.7f;
    myTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:myTable];
    
    
    
    
    
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, myTable.frame.origin.y + myTable.frame.size.height + 5, 100, 30)];
    label.text = @"委托截止日期";
    label.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:label];
    
    timeBtn = [[UIButton alloc]initWithFrame:CGRectMake(label.frame.origin.x + label.frame.size.width + 5, label.frame.origin.y, 180, 40)];
    [timeBtn setTitle:@"请选择时间" forState:UIControlStateNormal];
    timeBtn.backgroundColor = [UIColor blueColor];
    timeBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [self.view addSubview:timeBtn];
    [timeBtn addTarget:self action:@selector(timeAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIButton *submitBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, label.frame.origin.y + label.frame.size.height +20, 80, 25)];
    [submitBtn setTitle:@"确认委托" forState:UIControlStateNormal];
    
  
    [submitBtn setBackgroundImage:[UIImage imageNamed:@"btnNor"] forState:UIControlStateNormal];
    [submitBtn setBackgroundImage:[UIImage imageNamed:@"btnSele"] forState:UIControlStateHighlighted];
    [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [submitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    submitBtn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    [submitBtn addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitBtn];
    
    
    UIButton *cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(200, label.frame.origin.y + label.frame.size.height +20, 80, 25)];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setBackgroundImage:[UIImage imageNamed:@"btnNor"] forState:UIControlStateNormal];
    [cancelBtn setBackgroundImage:[UIImage imageNamed:@"btnSele"] forState:UIControlStateHighlighted];
    [cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    [cancelBtn addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelBtn];
    submitBtn.tag = 100;
    cancelBtn.tag = 200;
    
}
#pragma mark UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.messArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
       NSDictionary *dic = [self.messArray objectAtIndex:indexPath.row];
    NSArray *arr = [dic allKeys];
    NSString *str = (NSString *)[dic objectForKey:[arr objectAtIndex:0]];
    CGSize size = [[NSString stringWithFormat:@"%@",str] textSize:[UIFont systemFontOfSize:12.0f] withWidth:215];
    return size.height+5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 18)];
        label1.textColor = [UIColor blackColor];
        label1.font = [UIFont systemFontOfSize:12.0f];
        label1.backgroundColor = [UIColor clearColor];
        label1.textAlignment = NSTextAlignmentRight;
        label1.tag = 100;
        [cell.contentView addSubview:label1];
        
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectZero];
        label2.textColor = [UIColor blackColor];
        label2.numberOfLines = 0;
        label2.lineBreakMode = NSLineBreakByCharWrapping;
        label2.font = [UIFont systemFontOfSize:12.0f];
        label2.backgroundColor = [UIColor clearColor];
        label2.textAlignment = NSTextAlignmentLeft;
        label2.tag = 111;
        [cell.contentView addSubview:label2];
    }
    NSDictionary *dic = [self.messArray objectAtIndex:indexPath.row];
    NSArray *array = [dic allKeys];
    NSString *key = [array objectAtIndex:0];
    UILabel *label1 = (UILabel *)[cell.contentView viewWithTag:100];
    label1.text = [NSString stringWithFormat:@"%@",key];
    UILabel *label2 = (UILabel *)[cell.contentView viewWithTag:111];
    label2.text = [NSString stringWithFormat:@"%@",[dic objectForKey:key]];
    CGSize size = [[NSString stringWithFormat:@"%@",label2.text] textSize:[UIFont systemFontOfSize:12.0f] withWidth:210];
    label2.frame = CGRectMake(120, 0,180, size.height);
    return cell;
    
}



#pragma mark日期
-(void)timeAction:(UIButton *)btn{
    if (!picker) {
        picker = [[UIDatePicker alloc]init];
        picker.backgroundColor = [UIColor whiteColor];
        picker.frame = CGRectMake(10, 100, 300, 100);
        picker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        picker.datePickerMode = UIDatePickerModeDate;
        [picker addTarget:self action:@selector(oneDatePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
        
        [self.view addSubview:picker];
    }

}
-(void)oneDatePickerValueChanged:(UIDatePicker *)sender{
    NSDate *select = [sender date]; // 获取被选中的时间
    
    NSDateFormatter *selectDateFormatter = [[NSDateFormatter alloc] init];
    
    selectDateFormatter.dateFormat = @"yyyy-MM-dd"; // 设置时间和日期的格式
    
    NSString *dateAndTime = [selectDateFormatter stringFromDate:select]; // 把date类型转为设置好格式的string类型
    timeStr = [NSString stringWithFormat:@"%@",dateAndTime];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"时间提示" message:dateAndTime delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    [alertView show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%d",buttonIndex);
    
    if (buttonIndex == 1) {
        [timeBtn setTitle:timeStr forState:UIControlStateNormal];
        [picker removeFromSuperview];
        picker = nil;
    }
}
#pragma mark委托事件
-(void)submitAction:(UIButton *)btn{
    if (timeStr.length == 0) {
        UIAlertView *alterView = [[UIAlertView alloc]initWithTitle:nil message:@"请选择委托截至日期" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alterView show];
        
        return;
    }
    
    if (btn.tag == 200) {
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
    NSString *str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",\"WMRW_ID\":\"%@\",\"WMGS_ID\":\"%@\",\"WTRW_ENDDATE\":\"%@\"}",self.weituoIdStr,self.waimaoCompanyStr,timeStr];
    NSMutableArray *params=[NSMutableArray array];
    [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
    ServiceArgs *args=[[ServiceArgs alloc] init];
    args.serviceURL=@"http://223.4.216.54:8888/xajdcg_webservice/waimaorenwuweituo";
    args.methodName=@"saveWaiMaoRenWuWeiTuo";//要调用的webservice方法
    args.soapParams=params;//传递方法参数
    args.httpWay=ServiceHttpSoap1;
    ServiceRequestManager *manager=[ServiceRequestManager requestWithArgs:args];
    
    [manager setSuccessBlock:^() {
        if (manager.error) {
            NSLog(@"同步请求失败，失败原因=%@",manager.error.description);
            return;
        }
        NSLog(@"登录请求成功，请求结果为=\n%@",manager.responseString);
        ServiceResult *result = [ServiceResult serviceWithArgs:args responseText:manager.responseString];
        NSDictionary *dic=[result json];
        UIAlertView *alterView = [[UIAlertView alloc]initWithTitle:nil message:[dic objectForKey:@"STATEMSG"] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alterView show];
    }];
    [manager startSynchronous];//开始同步
    
    
    
}
@end
