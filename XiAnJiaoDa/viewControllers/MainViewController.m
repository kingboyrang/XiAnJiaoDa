//
//  MainViewController.m
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-24.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "MainViewController.h"
#import "ServiceResult.h"
#import "searchDaiShenHeXiangMu.h"
#import "searchDaiShenHeHeTong.h"
#import "searchDaiWeiTuoWaiMaoRW.h"
#import "searchDaiLiXieYi.h"
#import "searchYanShouJieGuo.h"
#import "searchShiGongHeTong.h"
@interface MainViewController ()
{
    MJRefreshHeaderView *_headerView;
    MJRefreshFooterView *_footerVier;
    UILabel *Headlabel;
    UIActivityIndicatorView *activityView;
}
@property (nonatomic, strong)NSArray *group1Array;
@property (nonatomic, strong)NSArray *group1Array_sele;
@property (nonatomic, strong)NSArray *group2Array;
@property (nonatomic, strong)NSArray *group2Array_sele;
@property (nonatomic, strong)NSArray *group1TitleArr;
@property (nonatomic, strong)NSArray *group2TitleArr;
@end

@implementation MainViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    #pragma mark 登录
  
     self.staAssClass = [[StatisticsAssignmentsClass alloc]init];
    [self sendMessage];
    self.group1TitleArr = @[@"项目审批",@"内贸合同审批",@"外贸任务委托",@"外贸协议审签",@"验收结果审批"];
    self.group2TitleArr = @[@"项目审批",@"合同审批",@"验收结果审批"];
    self.group1Array = @[@"tb_001",@"tb_002",@"tb_003",@"tb_004",@"tb_005"];
    self.group1Array_sele =@[@"tb_001_2",@"tb_002_2",@"tb_003_2",@"tb_004_2",@"tb_005_2"];
        self.group2Array = @[@"tb_001",@"tb_006",@"tb_005"];
    self.group2Array_sele = @[@"tb_001_2",@"tb_006_2",@"tb_005_2"];
    self.view.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
    self.navigationController.navigationBarHidden = YES;
    self.headView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 320, 20)];
    Headlabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0, 320, 20)];
    Headlabel.text = @"下拉刷新";
    Headlabel.textColor = [UIColor grayColor];
    Headlabel.font = [UIFont systemFontOfSize:12.0];
    Headlabel.textAlignment = NSTextAlignmentCenter;
    [self.headView addSubview:Headlabel];
    [self.view addSubview:self.headView];
    Headlabel.hidden = NO;
    activityView = [[UIActivityIndicatorView alloc]initWithFrame:Headlabel.frame];
    activityView.activityIndicatorViewStyle= UIActivityIndicatorViewStyleGray;
    activityView.center = Headlabel.center;
    [self.headView addSubview:activityView];
    activityView.hidden = YES;
    self.myTableView =[[UITableView alloc] initWithFrame:CGRectMake(20, 40, 280, 480) style:UITableViewStyleGrouped];
    self.myTableView.backgroundColor = [UIColor clearColor];
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.view addSubview:self.myTableView];
    _headerView = [[MJRefreshHeaderView alloc]init];
    _headerView.delegate = self;
    _headerView.scrollView = self.myTableView;
    _footerVier = [[MJRefreshFooterView alloc]init];
    _footerVier.delegate = self;
    _footerVier.scrollView = self.myTableView;
}
#pragma mark 刷新数据
-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView{
    if (refreshView == _headerView) {
        Headlabel.hidden = YES;
        activityView.hidden = NO;
        [activityView startAnimating];
        [self sendMessage];
    }
    [self performSelector:@selector(endFefrshing) withObject:nil afterDelay:0];
}
-(void)endFefrshing{
    [self.myTableView reloadData];
     Headlabel.hidden = NO;
    activityView.hidden = YES;
    [activityView stopAnimating];

    [_headerView endRefreshing];
    [_footerVier endRefreshing];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        UILabel *labe = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 320, 20)];
        labe.text = @"待办货物";
        labe.font = [UIFont boldSystemFontOfSize:15.0];
        return labe;
    }else{
        UILabel *labe = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 20)];
        labe.text = @"待办综合";
        labe.font = [UIFont boldSystemFontOfSize:15.0];
        return labe;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
           return 20;
 }
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return  2;
    }else{
        return 1;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifier";
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell = [[MyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.section == 0) {
         if (indexPath.row ==0) {
            
            [cell.btn1 myinit:[self.group1TitleArr objectAtIndex:0] norImage:[UIImage imageNamed:[self.group1Array objectAtIndex:0]] seleImage:[UIImage imageNamed:[self.group1Array_sele objectAtIndex:0]]];
            if (self.staAssClass.HW_XIANGMUSP.length >0 && [self.staAssClass.HW_XIANGMUSP intValue]>0) {
                cell.dian1.hidden = NO;
                cell.dian1.label.text =self.staAssClass.HW_XIANGMUSP;
            }
            cell.btn1.tag = indexPath.section+indexPath.row + 1;
            
            [cell.btn2 myinit:[self.group1TitleArr objectAtIndex:1] norImage:[UIImage imageNamed:[self.group1Array objectAtIndex:1]] seleImage:[UIImage imageNamed:[self.group1Array_sele objectAtIndex:1]]];
            if (self.staAssClass.HW_HETONGSP.length >0 && [self.staAssClass.HW_HETONGSP intValue]>0) {
                cell.dian2.hidden = NO;
                cell.dian2.label.text = self.staAssClass.HW_HETONGSP;
            }
            cell.btn2.tag = indexPath.section+indexPath.row + 2;
             
            [cell.btn3 myinit:[self.group1TitleArr objectAtIndex:2] norImage:[UIImage imageNamed:[self.group1Array objectAtIndex:2]] seleImage:[UIImage imageNamed:[self.group1Array_sele objectAtIndex:2]]];
            if (self.staAssClass.HW_WAIMAOWT.length >0 && [self.staAssClass.HW_WAIMAOWT intValue]>0) {
                cell.dian3.hidden = NO;
                cell.dian3.label.text = self.staAssClass.HW_WAIMAOWT;
            }
            cell.btn3.tag = indexPath.section+indexPath.row + 3;
              [cell.btn1 addTarget:self action:@selector(gotoNextVC:) forControlEvents:UIControlEventTouchUpInside];
            [cell.btn2 addTarget:self action:@selector(gotoNextVC:) forControlEvents:UIControlEventTouchUpInside];
            [cell.btn3 addTarget:self action:@selector(gotoNextVC:) forControlEvents:UIControlEventTouchUpInside];
            
        }else{
             [cell.btn1 myinit:[self.group1TitleArr objectAtIndex:3] norImage:[UIImage imageNamed:[self.group1Array objectAtIndex:3]] seleImage:[UIImage imageNamed:[self.group1Array_sele objectAtIndex:3]]];
            if (self.staAssClass.HW_WAIMAOXYSQ.length >0 && [self.staAssClass.HW_WAIMAOXYSQ intValue]>0) {
                cell.dian1.hidden = NO;
                cell.dian1.label.text = self.staAssClass.HW_WAIMAOXYSQ;
            }
            cell.btn1.tag = indexPath.section+indexPath.row + 3;
               [cell.btn2 myinit:[self.group1TitleArr objectAtIndex:4] norImage:[UIImage imageNamed:[self.group1Array objectAtIndex:4]] seleImage:[UIImage imageNamed:[self.group1Array_sele objectAtIndex:4]]];
    
        if (self.staAssClass.HW_YANSHOUJGSP.length >0 && [self.staAssClass.HW_YANSHOUJGSP intValue]>0) {
            cell.dian2.hidden = NO;
            cell.dian2.label.text = self.staAssClass.HW_YANSHOUJGSP;
        }
        cell.btn2.tag = indexPath.section+indexPath.row + 4;
          [cell.btn1 addTarget:self action:@selector(gotoNextVC:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btn2 addTarget:self action:@selector(gotoNextVC:) forControlEvents:UIControlEventTouchUpInside];
    }
    }else{
        [cell.btn1 myinit:[self.group2TitleArr objectAtIndex:0] norImage:[UIImage imageNamed:[self.group2Array objectAtIndex:0]] seleImage:[UIImage imageNamed:[self.group2Array_sele objectAtIndex:0]]];
        if (self.staAssClass.ZH_XIANGMUSP.length >0 && [self.staAssClass.ZH_XIANGMUSP intValue]>0) {
            cell.dian1.hidden = NO;
            cell.dian1.label.text = self.staAssClass.ZH_XIANGMUSP;
        }
        cell.btn1.tag = indexPath.section+indexPath.row + 5;
          [cell.btn2 myinit:[self.group2TitleArr objectAtIndex:1] norImage:[UIImage imageNamed:[self.group2Array objectAtIndex:1]] seleImage:[UIImage imageNamed:[self.group2Array_sele objectAtIndex:1]]];
        if (self.staAssClass.ZH_HETONGSP.length >0 && [self.staAssClass.ZH_HETONGSP intValue]>0) {
            cell.dian2.hidden = NO;
            cell.dian2.label.text = self.staAssClass.ZH_HETONGSP;
        }
        cell.btn2.tag = indexPath.section+indexPath.row + 6;
        
        [cell.btn3 myinit:[self.group2TitleArr objectAtIndex:2] norImage:[UIImage imageNamed:[self.group2Array objectAtIndex:2]] seleImage:[UIImage imageNamed:[self.group2Array_sele objectAtIndex:2]]];
        if (self.staAssClass.ZH_YANSHOUJGSP.length >0 && [self.staAssClass.ZH_YANSHOUJGSP intValue]>0) {
            cell.dian3.hidden = NO;
            cell.dian3.label.text = self.staAssClass.ZH_YANSHOUJGSP;
        }
        cell.btn3.tag = indexPath.section+indexPath.row + 7;
        
        
        [cell.btn1 addTarget:self action:@selector(gotoNextVC:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btn2 addTarget:self action:@selector(gotoNextVC:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btn3 addTarget:self action:@selector(gotoNextVC:) forControlEvents:UIControlEventTouchUpInside];
    }
    return cell;
}
#pragma mark请求数据
-(void)sendMessage{
    NSUserDefaults *userDefault = [ NSUserDefaults standardUserDefaults];
    NSString *userName = [userDefault objectForKey:USERNAME];
    NSString *zzyid = [userDefault objectForKey:ZZRYID];
    NSString *str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"%@\",\"LOGINPWD\":\"19880618\",ZZRYID:\"%@\"}",userName,zzyid];
    NSMutableArray *params=[NSMutableArray array];
    [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
    ServiceArgs *args=[[ServiceArgs alloc] init];
    args.serviceURL=@"http://223.4.216.54:8888/xajdcg_webservice/gongzuoliangtongji";
    args.serviceNameSpace=@"http://intf.gzltj.service.gwzd.com";
    args.methodName=@"getRenYuanWorkTasks";//要调用的webservice方法
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
        self.staAssClass.HW_HETONGSP = [NSString stringWithFormat:@"%@",[dic objectForKey:@"HW_HETONGSP"]];
        self.staAssClass.HW_WAIMAOWT = [NSString stringWithFormat:@"%@",[dic objectForKey:@"HW_WAIMAOWT"]];
        self.staAssClass.HW_WAIMAOXYSQ = [NSString stringWithFormat:@"%@",[dic objectForKey:@"HW_WAIMAOXYSQ"]];
        self.staAssClass.HW_XIANGMUSP = [NSString stringWithFormat:@"%@",[dic objectForKey:@"HW_XIANGMUSP"]];
        self.staAssClass.HW_YANSHOUJGSP =[NSString stringWithFormat:@"%@",[dic objectForKey:@"HW_YANSHOUJGSP"]];
        self.staAssClass.ZH_HETONGSP = [NSString stringWithFormat:@"%@",[dic objectForKey:@"ZH_HETONGSP"]];
        self.staAssClass.ZH_XIANGMUSP = [NSString stringWithFormat:@"%@",[dic objectForKey:@"ZH_XIANGMUSP"]];
        self.staAssClass.ZH_YANSHOUJGSP = [NSString stringWithFormat:@"%@",[dic objectForKey:@"ZH_YANSHOUJGSP"]];
        [self.myTableView reloadData];
    }];
    [manager startSynchronous];//开始同步

}
#pragma mark 跳转页面
-(void)gotoNextVC:(MyBtn *)btn{
    
    NSLog(@"%d",btn.tag);
    int i = 0;
    if (btn.tag == 1) {
        [self searchDaiShenHeXiangMu];
        i = 1;
    }else if (btn.tag == 2){
        [self searchDaiShenHeHeTong];
        i = 2;
    }else if (btn.tag == 3){
        [self searchDaiWeiTuoWaiMaoRW];
        i = 3;
    }else if (btn.tag == 4){
        [self searchDaiLiXieYi];
        i = 4;
    }else if (btn.tag == 5){
        [self searchYanShouJieGuo];
        i = 5;
    }else if (btn.tag ==6){
        [self searchGongChengXiangMu];
        i = 6;
    }
    else if (btn.tag ==7){
        [self searchShiGongHeTong];
        i = 7;
    }else if (btn.tag ==8){
        [self searchYanShouJieGuo2];
        i = 8;
    }
    TableViewController *tableVC = [[TableViewController alloc]init];
    tableVC.titleStr = btn.currentTitle;
    tableVC.tableArr = self.classArray;
    tableVC.tableMess = self.messageArray ;
    tableVC.type = i;
    [self.navigationController pushViewController:tableVC animated:YES];
}
//项目审批
-(void)searchDaiShenHeXiangMu{
    ServiceArgs *args=[[ServiceArgs alloc] init];
    NSMutableArray *params=[NSMutableArray array];
    NSString *str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",SELECTZT:\"1\",PAGESIZE:\"20\",PAGENO:\"0\"}"];
    [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
    args.serviceURL=@"http://223.4.216.54:8888/xajdcg_webservice/huowuxiangmushenhe";
    args.serviceNameSpace = @"http://intf.sbxmsh.service.gwzd.com";
    args.methodName=@"searchDaiShenHeXiangMu";//要调用的webservice方法
    
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
        NSDictionary *resultdic=[result json];
        self.classArray = [[NSMutableArray alloc]init];
        self.messageArray = [[NSMutableArray alloc]init];
        NSArray *array = [resultdic objectForKey:@"CONTENTLIST"];
        for (NSDictionary *dic in array) {
            searchDaiShenHeXiangMu *entiey = [[searchDaiShenHeXiangMu alloc]init];
            entiey.CGSQ_ID = [dic objectForKey:@"CGSQ_ID"];
            entiey.SQJB_ID = [dic objectForKey:@"SQJB_ID"];
            entiey.MESSAGE = [dic objectForKey:@"MESSAGE"];
            [self.classArray addObject:entiey];
            [self.messageArray addObject:entiey.MESSAGE];
        }
    }];
    [manager startSynchronous];//开始同步
}
//合同审批
-(void)searchDaiShenHeHeTong{
    ServiceArgs *args=[[ServiceArgs alloc] init];
    NSMutableArray *params=[NSMutableArray array];
    NSString *str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",PAGESIZE:\"20\",PAGENO:\"0\"}"];
    [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
    args.serviceURL=@"http://223.4.216.54:8888/xajdcg_webservice/neimaohetongshenhe";
    args.serviceNameSpace = @"http://intf.nmhtsh.service.gwzd.com";
    args.methodName=@"searchDaiShenHeHeTong";//要调用的webservice方法
    
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
        NSDictionary *resultdic=[result json];
        self.classArray = [[NSMutableArray alloc]init];
         self.messageArray = [[NSMutableArray alloc]init];
        NSArray *array = [resultdic objectForKey:@"CONTENTLIST"];
        for (NSDictionary *dic in array) {
            searchDaiShenHeHeTong *entiey = [[searchDaiShenHeHeTong alloc]init];
            entiey.NMHT_ID = [dic objectForKey:@"NMHT_ID"];
            entiey.MESSAGE = [dic objectForKey:@"MESSAGE"];
            [self.classArray addObject:entiey];
            [self.messageArray addObject:entiey.MESSAGE];
        }
    }];
    [manager startSynchronous];//开始同步
}
/////////////////////任务委托
-(void)searchDaiWeiTuoWaiMaoRW{
    ServiceArgs *args=[[ServiceArgs alloc] init];
    NSMutableArray *params=[NSMutableArray array];
    NSString *str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",\"PAGESIZE\":\"20\",PAGENO:\"0\"}"];
    [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
    args.serviceURL=@"http://223.4.216.54:8888/xajdcg_webservice/waimaorenwuweituo";
    args.serviceNameSpace = @"http://intf.wmrwwt.service.gwzd.com";
    args.methodName=@"searchDaiWeiTuoWaiMaoRW";//要调用的webservice方法
    
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
        NSDictionary *resultdic=[result json];
        self.classArray = [[NSMutableArray alloc]init];
        self.messageArray = [[NSMutableArray alloc]init];
        NSArray *array = [resultdic objectForKey:@"CONTENTLIST"];
        for (NSDictionary *dic in array) {
            searchDaiWeiTuoWaiMaoRW *entiey = [[searchDaiWeiTuoWaiMaoRW alloc]init];
            entiey.WMRW_ID = [dic objectForKey:@"WMRW_ID"];
            entiey.MESSAGE = [dic objectForKey:@"MESSAGE"];
            [self.classArray addObject:entiey];
            [self.messageArray addObject:entiey.MESSAGE];
        }
    }];
    [manager startSynchronous];//开始同步
    
    
}
//外贸协议
-(void)searchDaiLiXieYi{
    ServiceArgs *args=[[ServiceArgs alloc] init];
    NSMutableArray *params=[NSMutableArray array];
    NSString *str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",PAGESIZE:\"3\",PAGENO:\"0\"}"];
    [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
    args.serviceURL=@"http://223.4.216.54:8888/xajdcg_webservice/dailixieyishenhe";
    args.serviceNameSpace = @"http://intf.wmdlxy.service.gwzd.com";
    args.methodName=@"searchDaiLiXieYi";//要调用的webservice方法
    
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
        NSDictionary *resultdic=[result json];
        self.classArray = [[NSMutableArray alloc]init];
        self.messageArray = [[NSMutableArray alloc]init];
        NSArray *array = [resultdic objectForKey:@"CONTENTLIST"];
        for (NSDictionary *dic in array) {
            searchDaiLiXieYi *entiey = [[searchDaiLiXieYi alloc]init];
            entiey.DLXY_ID = [dic objectForKey:@"DLXY_ID"];
            entiey.MESSAGE = [dic objectForKey:@"MESSAGE"];
            [self.classArray addObject:entiey];
            [self.messageArray addObject:entiey.MESSAGE];
        }
    }];
    [manager startSynchronous];//开始同步
    
    
}
//验收
-(void)searchYanShouJieGuo{
    ServiceArgs *args=[[ServiceArgs alloc] init];
    NSMutableArray *params=[NSMutableArray array];
    NSString *str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",PAGESIZE:\"3\",PAGENO:\"0\"}"];
    [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
    args.serviceURL=@"http://223.4.216.54:8888/xajdcg_webservice/yanshoujieguoshenhe";
    args.serviceNameSpace = @"http://intf.sbysjg.service.gwzd.com";
    args.methodName=@"searchYanShouJieGuo";//要调用的webservice方法
    
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
        NSDictionary *resultdic=[result json];
        self.classArray = [[NSMutableArray alloc]init];
        self.messageArray = [[NSMutableArray alloc]init];
        NSArray *array = [resultdic objectForKey:@"CONTENTLIST"];
        for (NSDictionary *dic in array) {
            searchYanShouJieGuo *entiey = [[searchYanShouJieGuo alloc]init];
            entiey.YSJG_ID = [dic objectForKey:@"YSJG_ID"];
            entiey.MESSAGE = [dic objectForKey:@"MESSAGE"];
            [self.classArray addObject:entiey];
            [self.messageArray addObject:entiey.MESSAGE];
        }
    }];
    [manager startSynchronous];//开始同步
    
}
//统计项目审批
-(void)searchGongChengXiangMu{
    ServiceArgs *args=[[ServiceArgs alloc] init];
    NSMutableArray *params=[NSMutableArray array];
    NSString *str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",PAGESIZE:\"3\",PAGENO:\"0\"}"];
    [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
    args.serviceURL=@"http://223.4.216.54:8888/xajdcg_webservice/gongchengxiangmushenhe";
    args.serviceNameSpace = @"http://intf.gcxmsh.service.gwzd.com";
    args.methodName=@"searchGongChengXiangMu";//要调用的webservice方法
    
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
        NSDictionary *resultdic=[result json];
        self.classArray = [[NSMutableArray alloc]init];
        self.messageArray = [[NSMutableArray alloc]init];
        NSArray *array = [resultdic objectForKey:@"CONTENTLIST"];
        for (NSDictionary *dic in array) {
            searchDaiShenHeXiangMu *entiey = [[searchDaiShenHeXiangMu alloc]init];
            entiey.CGSQ_ID = [dic objectForKey:@"CGSQ_ID"];
            entiey.MESSAGE = [dic objectForKey:@"MESSAGE"];
            [self.classArray addObject:entiey];
            [self.messageArray addObject:entiey.MESSAGE];
        }
    }];
    [manager startSynchronous];//开始同步
    
}
//统计合同审批
-(void)searchShiGongHeTong{
    ServiceArgs *args=[[ServiceArgs alloc] init];
    NSMutableArray *params=[NSMutableArray array];
    NSString *str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",PAGESIZE:\"3\",PAGENO:\"0\"}"];
    [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
    args.serviceURL=@"http://223.4.216.54:8888/xajdcg_webservice/gongchenghetongshenhe";
    args.serviceNameSpace = @"http://intf.gccght.service.gwzd.com";
    args.methodName=@"searchShiGongHeTong";//要调用的webservice方法
    
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
        NSDictionary *resultdic=[result json];
        self.classArray = [[NSMutableArray alloc]init];
        self.messageArray = [[NSMutableArray alloc]init];
        NSArray *array = [resultdic objectForKey:@"CONTENTLIST"];
        for (NSDictionary *dic in array) {
            searchShiGongHeTong *entiey = [[searchShiGongHeTong alloc]init];
            entiey.ZHHT_ID = [dic objectForKey:@"ZHHT_ID"];  //////////////////////////////////////////////////
            entiey.MESSAGE = [dic objectForKey:@"MESSAGE"];
            [self.classArray addObject:entiey];
            [self.messageArray addObject:entiey.MESSAGE];
        }
    }];
    [manager startSynchronous];//开始同步
    
}
//统计验收结果审批
-(void)searchYanShouJieGuo2{
    ServiceArgs *args=[[ServiceArgs alloc] init];
    NSMutableArray *params=[NSMutableArray array];
    NSString *str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",PAGESIZE:\"3\",PAGENO:\"0\"}"];
    [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
    args.serviceURL=@"http://223.4.216.54:8888/xajdcg_webservice/gcyanshoujieguoshenhe";
    args.serviceNameSpace = @"http://intf.gcysjg.service.gwzd.com";
    args.methodName=@"searchYanShouJieGuo";//要调用的webservice方法
    
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
        NSDictionary *resultdic=[result json];
        self.classArray = [[NSMutableArray alloc]init];
        self.messageArray = [[NSMutableArray alloc]init];
        NSArray *array = [resultdic objectForKey:@"CONTENTLIST"];
        for (NSDictionary *dic in array) {
            searchYanShouJieGuo *entiey = [[searchYanShouJieGuo alloc]init];
            entiey.YSJG_ID = [dic objectForKey:@"YSJG_ID"];
            entiey.MESSAGE = [dic objectForKey:@"MESSAGE"];
            [self.classArray addObject:entiey];
            [self.messageArray addObject:entiey.MESSAGE];
        }
    }];
    [manager startSynchronous];//开始同步
    
}
@end
