//
//  BoHuiViewController.m
//  XiAnJiaoDa
//
//  Created by liuqin on 14-7-23.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "BoHuiViewController.h"
#import "NSString+TPCategory.h"
@interface BoHuiViewController ()

@end

@implementation BoHuiViewController

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
    
    self.navView.navLabel.text = @"驳回";
    
    UITableView *myTable = [[UITableView alloc]initWithFrame:CGRectMake(10, 70, 300, self.view.bounds.size.height-60-TABBARHEIGT-20)];
    myTable.delegate = self;
    myTable.dataSource = self;
    myTable.backgroundColor = [UIColor whiteColor];
    myTable.layer.borderColor = [[UIColor grayColor]CGColor];
    myTable.layer.borderWidth = 0.7f;
    myTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:myTable];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.messArr.count + 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row >= self.messArr.count) {
        return 110;
    }else{
        NSDictionary *dic = [self.messArr objectAtIndex:indexPath.row];
        NSArray *arr = [dic allKeys];
        NSString *str = (NSString *)[dic objectForKey:[arr objectAtIndex:0]];
        CGSize size = [[NSString stringWithFormat:@"%@",str] textSize:[UIFont systemFontOfSize:12.0f] withWidth:215];
        return size.height+5;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifier";
   if (indexPath.row >=self.messArr.count) {//表示最后一项
            textcell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (textcell==nil) {
                textcell=[[CVTextViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
                textcell.selectionStyle = UITableViewCellSelectionStyleNone;
                textcell.textView.placeholder=@"请输入文字...";
                textcell.delegate = self;
                [textcell.btn1 setTitle:@"驳回" forState:UIControlStateNormal];
                [textcell.btn2 setTitle:@"取消" forState:UIControlStateNormal];
            }
            return textcell;
   }
    else{
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
        NSDictionary *dic = [self.messArr objectAtIndex:indexPath.row];
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
}
-(void)btnAction:(int)btnTag{
    NSLog(@"%d",btnTag);
    if (btnTag == 100) {  //驳回
        
        NSString *str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",\"WMRW_ID\":\"%@\",\"SHENHEYIJIAN\":\"%@\"}",self.WMRW_IDStr,textcell.textView.text];
        NSMutableArray *params=[NSMutableArray array];
        [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
        ServiceArgs *args=[[ServiceArgs alloc] init];
        args.serviceURL=@"http://223.4.216.54:8888/xajdcg_webservice/waimaorenwuweituo";
        args.methodName=@"updateWaiMaoRenWuZT";//要调用的webservice方法
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
            UIAlertView *alterView = [[UIAlertView alloc]initWithTitle:nil message:[dic objectForKey:@"STATEMSG"] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alterView show];
  
        }];
        [manager startSynchronous];//开始同步
        
        
        
    }else{   //取消
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}


@end
