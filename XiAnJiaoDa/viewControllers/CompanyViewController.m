//
//  CompanyViewController.m
//  XiAnJiaoDa
//
//  Created by liuqin on 14-7-22.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "CompanyViewController.h"
#import "NSString+TPCategory.h"
@interface CompanyViewController ()

@end


@implementation CompanyViewController

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
    self.navView.navLabel.text = @"委托公司";
    self.view.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
    self.messArr = [[NSMutableArray alloc]init];
    self.myTable = [[UITableView alloc]initWithFrame:CGRectMake(10, 70, 300, self.view.frame.size.height - 70 - 60)];
    self.myTable.backgroundColor = [UIColor whiteColor];
    self.myTable.layer.borderColor = [[UIColor grayColor]CGColor];
    self.myTable.layer.borderWidth = 0.7f;
    [self.view addSubview:self.myTable];
    self.myTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.myTable.delegate = self;
    self.myTable.dataSource = self;
    
    [self sendMessage];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == self.messArr.count) {
        return  50;
    }
    else{
        GetWaiMaoGongSi *entity = [[GetWaiMaoGongSi alloc]init];
        entity = [self.messArr objectAtIndex:indexPath.row];
        CGSize size = [entity.MESSAGE textSize:[UIFont systemFontOfSize:12.0f] withWidth:230];
        return size.height+10;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messArr.count+1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifier";
    if (indexPath.row == self.messArr.count) {
        lastCell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (lastCell == nil) {
            lastCell = [[CompanyLastCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            lastCell.selectionStyle = UITableViewCellSelectionStyleNone;
            lastCell.delegate = self;
        }
        return lastCell;
    }else{
        CompanyCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"CompanyCell" owner:nil options:nil]objectAtIndex:0];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.entity = [self.messArr objectAtIndex:indexPath.row];
        cell.label.text = cell.entity.MESSAGE;
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int newRow = [indexPath row];
    int oldRow = [lastIndexPath row];
    
    if(newRow != oldRow)
    {
        CompanyCell *cell = (CompanyCell *)[tableView cellForRowAtIndexPath:indexPath];
        cell.button.selected = YES;
        CompanyCell *lastcell = (CompanyCell *)[tableView cellForRowAtIndexPath:lastIndexPath];
        lastcell.button.selected = NO;
    }
    if(lastIndexPath == nil)
    {
        CompanyCell *cell = (CompanyCell *)[tableView cellForRowAtIndexPath:indexPath];
        cell.button.selected = YES;
    }
    lastIndexPath = indexPath;
    
}


-(void)sendMessage{
    
    NSString *str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",\"WMGS_MINGCHNEG\":\"\",\"PAGESIZE\":\"20\",\"PAGENO\":\"0\"}"];
    NSMutableArray *params=[NSMutableArray array];
    [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
    ServiceArgs *args=[[ServiceArgs alloc] init];
    args.serviceURL=@"http://223.4.216.54:8888/xajdcg_webservice/waimaorenwuweituo";
    args.methodName=@"GetWaiMaoGongSi";//要调用的webservice方法
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
        NSArray *arry = [dic objectForKey:@"CONTENTLIST"];
        for ( NSDictionary *dic in arry) {
            GetWaiMaoGongSi *entity = [[GetWaiMaoGongSi alloc]init];
            entity.WMGS_ID = [dic objectForKey:@"WMGS_ID"];
            entity.MESSAGE = [dic objectForKey:@"MESSAGE"];
            [self.messArr addObject:entity];
        }
        [self.myTable reloadData];
        
    }];
    [manager startSynchronous];//开始同步
    
    
    
    
    
}

-(void)BtnDelegate:(int)tag{
    if (tag == 100) {  //确认委托
        WeiTuoViewController *vc = [[WeiTuoViewController alloc]init];
        vc.weituoIdStr = self.WMRW_IDStr;
        GetWaiMaoGongSi *entity = [self.messArr objectAtIndex:lastIndexPath.row];
         vc.waimaoCompanyStr = entity.WMGS_ID;
        vc.messArray = self.arry;
        [self.navigationController pushViewController:vc animated:YES];
        
        
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
 
}

@end
