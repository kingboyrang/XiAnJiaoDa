//
//  ContentViewController.m
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-25.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "ContentViewController.h"
#import "NSString+TPCategory.h"
#import "CVTextViewCell.h"
#import "searchDaiShenHeXiangMu.h"
#import "searchDaiShenHeHeTong.h"
#import "searchDaiWeiTuoWaiMaoRW.h"
#import "searchDaiLiXieYi.h"
#import "searchYanShouJieGuo.h"
#import "searchShiGongHeTong.h"
#import "searchGongChengXiangMu.h"
#import "BoHuiViewController.h"

@interface ContentViewController ()

@end

@implementation ContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    if (self.type ==1) {
         [self searchDaiShenHeXiangMu];
    }else if (self.type ==2){
        [ self searchDaiShenHeHeTong] ;
    }else if(self.type ==3){
        [self searchDaiWeiTuoWaiMaoRW];
    }else if(self.type ==4){
        [self searchDaiLiXieYi];
    }else if (self.type ==5){
        [self searchYanShouJieGuo];
    }else if (self.type == 6){
        [self GetHeTongXiangQing];
    }
    else if (self.type == 7){
        [self GetXiangMuXiangQing];
    }
    else if(self.type == 8){
        [self GetYanShouJieGuoXinXi];
    }
   
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navView.navLabel.text = self.selfTitileStr;
     self.view.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
    self.myTable = [[UITableView alloc]initWithFrame:CGRectMake(10, 70, 300, self.view.bounds.size.height-60-TABBARHEIGT-20)];
    self.myTable.delegate = self;
    self.myTable.dataSource = self;
    self.myTable.backgroundColor = [UIColor whiteColor];
    self.myTable.layer.borderColor = [[UIColor grayColor]CGColor];
    self.myTable.layer.borderWidth = 0.7f;
    self.myTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.myTable];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.myTable.frame.size.width, 30)];
    return v;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.tableArray.count+1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==self.tableArray.count) {
        if (self.type == 3) {
            return 50;
        }
        return 110.0f;
    }
    NSDictionary *dic = [self.tableArray objectAtIndex:indexPath.row];
    NSArray *arr = [dic allKeys];
    NSString *str = (NSString *)[dic objectForKey:[arr objectAtIndex:0]];
    CGSize size = [[NSString stringWithFormat:@"%@",str] textSize:[UIFont systemFontOfSize:12.0f] withWidth:215];
    return size.height+5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifier";
    if (indexPath.row==self.tableArray.count) {
        //表示最后一项
        //把那个控件弄在这里就行了
        
        if (self.type == 3) {
            threebtnCell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (threebtnCell == nil) {
                threebtnCell = [[BtnCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
                threebtnCell.selectionStyle = UITableViewCellSelectionStyleNone;
                threebtnCell.delegate = self;
            }
            return threebtnCell;
        }
        else{
            textcell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (textcell==nil) {
                textcell=[[CVTextViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
                textcell.selectionStyle = UITableViewCellSelectionStyleNone;
                textcell.textView.placeholder=@"请输入文字...";
                textcell.delegate = self;
            }
            return textcell;
        }
    }
   
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
    NSDictionary *dic = [self.tableArray objectAtIndex:indexPath.row];
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
-(void)ThreebtnDelegate:(int)tag{
    if (tag == 100) { //委托
        CompanyViewController *vc = [[CompanyViewController alloc]init];
        NSDictionary *dic =[self.tableArray objectAtIndex:0];
        NSArray *arr = [dic allKeys];
        NSString *keyStr = [arr objectAtIndex:0];
        vc.WMRW_IDStr = [dic objectForKey:keyStr];
        vc.arry = self.tableArray;
        [self.navigationController pushViewController:vc animated:YES];
        
        
        
    }else if (tag == 200){ //驳回
        
        BoHuiViewController *vc = [[BoHuiViewController alloc]init];
        NSDictionary *dic =[self.tableArray objectAtIndex:0];
        NSArray *arr = [dic allKeys];
        NSString *keyStr = [arr objectAtIndex:0];
        vc.WMRW_IDStr = [dic objectForKey:keyStr];
        vc.messArr = self.tableArray;
        [self.navigationController pushViewController:vc animated:YES];
    }else if (tag == 300){ //取消
        [self.navigationController popViewControllerAnimated:YES];
    }
}
-(void)btnAction:(int)btnTag{

    NSString *str;
    ServiceArgs *args=[[ServiceArgs alloc] init];

    if (self.type ==1) {
        NSString *state;
        if (btnTag == 100) {
            state = @"3";
        }else{
            state = @"9_2";
        }
        searchDaiShenHeXiangMu *object = (searchDaiShenHeXiangMu *)self.myclass;
       str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",CGSQID:\"%@\",\"SHZT\":\"%@\",\"SHENHEYIJIAN\":\"%@\"}",object.CGSQ_ID,state,textcell.textView.text];
        NSMutableArray *params=[NSMutableArray array];
        [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
        args.serviceURL= @"http://223.4.216.54:8888/xajdcg_webservice/huowuxiangmushenhe";
        args.serviceNameSpace = @"http://intf.sbxmsh.service.gwzd.com";
        args.methodName=@"updateXiaoJiXiangMuZT";//要调用的webservice方法
        args.soapParams=params;//传递方法参数
        args.httpWay=ServiceHttpSoap1;
    }
    else if (self.type == 2){
        NSString *state;
        if (btnTag == 100) {
            state = @"7";
        }else{
            state = @"6_2";
        }
        searchDaiShenHeHeTong *object = (searchDaiShenHeHeTong *)self.myclass;
        str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",NMHT_ID:\"%@\",\"SHZT\":\"%@\",\"SHENHEYIJIAN\":\"%@\"}",object.NMHT_ID,state,textcell.textView.text];
        NSMutableArray *params=[NSMutableArray array];
        [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
        args.serviceURL= @"http://223.4.216.54:8888/xajdcg_webservice/neimaohetongshenhe";
        args.serviceNameSpace = @"http://intf.nmhtsh.service.gwzd.com";
        args.methodName=@"updateNeiMaoHeTongZT";//要调用的webservice方法
        args.soapParams=params;//传递方法参数
        args.httpWay=ServiceHttpSoap1;

    }
    else if (self.type == 3){ ////////////
       /* 
        NSString *state;
        if (btnTag == 100) {
            state = @"7";
        }else{
            state = @"9_2";
        }
        searchDaiShenHeXiangMu *object = (searchDaiShenHeXiangMu *)self.myclass;
        str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",CGSQID:\"%@\",\"SHZT\":\"%@\",\"SHENHEYIJIAN\":\"%@\"}",object.CGSQ_ID,state,textcell.textView.text];
        NSMutableArray *params=[NSMutableArray array];
        [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
        args.serviceURL= @"http://223.4.216.54:8888/xajdcg_webservice/waimaorenwuweituo";
        args.serviceNameSpace = @"http://intf.wmrwwt.service.gwzd.com";
        args.methodName=@"updateNeiMaoHeTongZT";//要调用的webservice方法
        args.soapParams=params;//传递方法参数
        args.httpWay=ServiceHttpSoap1;
     */
        
        
        
    }
    else if (self.type == 4){
        
        NSString *state;
        if (btnTag == 100) {
            state = @"6";   //通过
        }else{
            state = @"5";
        }

        searchDaiLiXieYi *object = (searchDaiLiXieYi *)self.myclass;
        str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",DLXY_ID:\"%@\",\"SHZT\":\"%@\",\"SHENHEYIJIAN\":\"%@\"}",object.DLXY_ID,state,textcell.textView.text];
        
        NSMutableArray *params=[NSMutableArray array];
        [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
        args.serviceURL= @"http://223.4.216.54:8888/xajdcg_webservice/dailixieyishenhe";
        args.serviceNameSpace = @"http://intf.wmdlxy.service.gwzd.com";
        args.methodName=@"updateDaiLiXieYiZT";//要调用的webservice方法
        args.soapParams=params;//传递方法参数
        args.httpWay=ServiceHttpSoap1;
        
        
        
        
    }
    else if (self.type == 5){
        
        NSString *state;
        if (btnTag == 100) {
            state = @"6";   //通过
        }else{
            state = @"5-1";
        }

        searchYanShouJieGuo *object = (searchYanShouJieGuo *)self.myclass;
        str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",YSJG_ID:\"%@\",\"SHZT\":\"%@\",\"SHENHEYIJIAN\":\"%@\"}",object.YSJG_ID,state,textcell.textView.text];
        
        NSMutableArray *params=[NSMutableArray array];
        [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
        args.serviceURL= @"http://223.4.216.54:8888/xajdcg_webservice/yanshoujieguoshenhe";
        args.serviceNameSpace = @"http://intf.sbysjg.service.gwzd.com";
        args.methodName=@"updateYanShouJieGuoZT";//要调用的webservice方法
        args.soapParams=params;//传递方法参数
        args.httpWay=ServiceHttpSoap1;

    }
    else if (self.type == 6){
        
        NSString *state;
        if (btnTag == 100) {
            state = @"3";   //通过
        }else{
            state = @"9_2";
        }
        
        searchGongChengXiangMu *object = (searchGongChengXiangMu *)self.myclass;
        str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",CGSQID:\"%@\",\"SHZT\":\"%@\",\"SHENHEYIJIAN\":\"%@\"}",object.CGSQ_ID,state,textcell.textView.text];
        
        NSMutableArray *params=[NSMutableArray array];
        [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
        args.serviceURL= @"http://223.4.216.54:8888/xajdcg_webservice/gongchengxiangmushenhe";
        args.serviceNameSpace = @"http://intf.gcxmsh.service.gwzd.com";
        args.methodName=@"updateCaiGouShenQingZT";//要调用的webservice方法
        args.soapParams=params;//传递方法参数
        args.httpWay=ServiceHttpSoap1;
        
    }
    else if (self.type == 7){
        
        NSString *state;
        if (btnTag == 100) {
            state = @"6";   //通过
        }else{
            state = @"5-1";
        }
        
        searchShiGongHeTong *object = (searchShiGongHeTong *)self.myclass;
        str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",ZHHT_ID:\"%@\",\"SHZT\":\"%@\",\"SHENHEYIJIAN\":\"%@\"}",object.ZHHT_ID,state,textcell.textView.text];
        
        NSMutableArray *params=[NSMutableArray array];
        [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
        args.serviceURL= @"http://223.4.216.54:8888/xajdcg_webservice/gongchenghetongshenhe";
        args.serviceNameSpace = @"http://intf.gccght.service.gwzd.com";
        args.methodName=@"updateShiGongHeTongZT";//要调用的webservice方法
        args.soapParams=params;//传递方法参数
        args.httpWay=ServiceHttpSoap1;
        
    }
    else if (self.type == 8){
        
        NSString *state;
        if (btnTag == 100) {
            state = @"8";   //通过
        }else{
            state = @"7_2";
        }
        
        searchYanShouJieGuo *object = (searchYanShouJieGuo *)self.myclass;
        str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",YSJG_ID:\"%@\",\"SHZT\":\"%@\",\"SHENHEYIJIAN\":\"%@\"}",object.YSJG_ID,state,textcell.textView.text];
        
        NSMutableArray *params=[NSMutableArray array];
        [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
        args.serviceURL= @"http://223.4.216.54:8888/xajdcg_webservice/yanshoujieguoshenhe";
        args.serviceNameSpace = @"http://intf.sbysjg.service.gwzd.com";
        args.methodName=@"updateYanShouJieGuoZT";//要调用的webservice方法
        args.soapParams=params;//传递方法参数
        args.httpWay=ServiceHttpSoap1;

    }

    ServiceRequestManager *manager=[ServiceRequestManager requestWithArgs:args];
    [manager setSuccessBlock:^() {
        if (manager.error) {
            NSLog(@"同步请求失败，失败原因=%@",manager.error.description);
            return;
        }
        ServiceResult *result = [ServiceResult serviceWithArgs:args responseText:manager.responseString];
        NSDictionary *dic=[result json];
        
        UIAlertView *alterView = [[UIAlertView alloc]initWithTitle:nil message:[dic objectForKey:@"STATEMSG"] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alterView show];
        
    }];
    [manager startSynchronous];//开始同步
}
-(void)searchDaiShenHeXiangMu{

    searchDaiShenHeXiangMu *class = (searchDaiShenHeXiangMu *)self.myclass;
    NSString * str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",CGSQID:\"%@\"}",class.CGSQ_ID];
     NSMutableArray *params=[NSMutableArray array];
    [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
    ServiceArgs *args=[[ServiceArgs alloc] init];
    args.serviceURL= @"http://223.4.216.54:8888/xajdcg_webservice/huowuxiangmushenhe";
    args.serviceNameSpace = @"http://intf.sbxmsh.service.gwzd.com";
    args.methodName=@"GetXiaoJiCaiGouShengQing";//要调用的webservice方法
    args.soapParams=params;//传递方法参数
    args.httpWay=ServiceHttpSoap1;
    ServiceRequestManager *manager=[ServiceRequestManager requestWithArgs:args];
    [manager setSuccessBlock:^() {
        if (manager.error) {
            NSLog(@"同步请求失败，失败原因=%@",manager.error.description);
            return;
        }
        ServiceResult *result = [ServiceResult serviceWithArgs:args responseText:manager.responseString];
        NSDictionary *dic=[result json];
        self.tableArray = [[NSMutableArray alloc]init];
        if ([[dic objectForKey:@"STATETYPE"]isEqualToString:@"1"]) {
            NSDictionary *dic1 = @{@"申请编号:":[dic objectForKey:@"CGSQ_BIANHAO"]};
            self.navView.navLabel.text = [dic objectForKey:@"CGSQ_BIANHAO"];
            NSDictionary *dic2 = @{@"申请级别名称:": [dic objectForKey:@"SQJB_MINGCHENG"]};
            NSDictionary *dic3 = @{@"项目名称:": [dic objectForKey:@"CGSQ_XMMINGCHENG"]};
            NSDictionary *dic4 = @{@"采购申请ID:":[dic objectForKey:@"CGSQ_ID"]};
            NSDictionary *dic5 = @{@"采购总额:": [dic objectForKey:@"CGSQ_CGZENGE"]};
            NSDictionary *dic6 = @{@"采购方式名称:": [dic objectForKey:@"CGFS_MINGCHENG"]};
            NSDictionary *dic7 = @{@"项目单位:": [dic objectForKey:@"DEPNAME"]};
            NSDictionary *dic8 = @{@"项目员:": [dic objectForKey:@"CGSQ_CGBXMY"]};
            NSDictionary *dic9 = @{@"项目员证件号:": [dic objectForKey:@"CGSQ_CGBXMYZJH"]};
            NSDictionary *dic10 = @{@"申请时间:": [dic objectForKey:@"CGSQ_SQSJ"]};
            NSDictionary *dic11 = @{@"添加时间:":[dic objectForKey:@"CGSQ_TJSJ"]};
            NSDictionary *dic12 = @{@"内/外贸名称:":[dic objectForKey:@"CGSQ_NEIWAIMAOMC"]};

            [self.tableArray addObject:dic1];
            [self.tableArray addObject:dic2];
            [self.tableArray addObject:dic3];
            [self.tableArray addObject:dic4];
            [self.tableArray addObject:dic5];
            [self.tableArray addObject:dic6];
            [self.tableArray addObject:dic7];
            [self.tableArray addObject:dic8];
            [self.tableArray addObject:dic9];
            [self.tableArray addObject:dic10];
            [self.tableArray addObject:dic11];
            [self.tableArray addObject:dic12];
            for (NSDictionary *persondic in [dic objectForKey:@"SHEHEXINXI"]) {
                NSString *time = [persondic objectForKey:@"SHYJ_SHSHIJIAN"];
                NSString *name = [persondic objectForKey:@"SHYJ_SHREN"];
                NSString *canzuo = [persondic objectForKey:@"SHYJ_CAOZUO"];
                NSString *yijian = [persondic objectForKey:@"SHYJ_YIJIAN"];
                NSDictionary *perDic = @{name: [NSString stringWithFormat:@"%@,%@,%@",time,canzuo,yijian]};
                [self.tableArray addObject:perDic];
            }
        }
        [self.myTable reloadData];
    }];
    [manager startSynchronous];//开始同步
}
-(void)searchDaiShenHeHeTong{
    
    searchDaiShenHeHeTong *class = (searchDaiShenHeHeTong *)self.myclass;
    NSString * str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",NMHT_ID:\"%@\"}",class.NMHT_ID];
    NSMutableArray *params=[NSMutableArray array];
    [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
    ServiceArgs *args=[[ServiceArgs alloc] init];
    args.serviceURL= @"http://223.4.216.54:8888/xajdcg_webservice/neimaohetongshenhe";
    args.serviceNameSpace = @"http://intf.nmhtsh.service.gwzd.com";
    args.methodName=@"GetNeiMaoHeTong";//要调用的webservice方法
    args.soapParams=params;//传递方法参数
    args.httpWay=ServiceHttpSoap1;
    ServiceRequestManager *manager=[ServiceRequestManager requestWithArgs:args];
    [manager setSuccessBlock:^() {
        if (manager.error) {
            NSLog(@"同步请求失败，失败原因=%@",manager.error.description);
            return;
        }
        ServiceResult *result = [ServiceResult serviceWithArgs:args responseText:manager.responseString];
        NSDictionary *dic=[result json];
        self.tableArray = [[NSMutableArray alloc]init];
        if ([[dic objectForKey:@"STATETYPE"]isEqualToString:@"1"]) {
            NSDictionary *dic1 = @{@"内贸合同ID:":[dic objectForKey:@"NMHT_ID"]};
            NSDictionary *dic2 = @{@"项目申请编号:": [dic objectForKey:@"CGSQ_BIANHAO"]};
            self.navView.navLabel.text = [dic objectForKey:@"CGSQ_BIANHAO"];
            NSDictionary *dic3 = @{@"项目名称:": [dic objectForKey:@"CGSQ_XMMINGCHENG"]};
            NSDictionary *dic4 = @{@"计划金额:":[dic objectForKey:@"CGSQ_CGZENGE"]};
            NSDictionary *dic5 = @{@"采购方式ID:": [dic objectForKey:@"CGFS_ID"]};
            NSDictionary *dic6 = @{@"采购方式名称:": [dic objectForKey:@"CGFS_MINGCHENG"]};
            NSDictionary *dic7 = @{@"招标编号:": [dic objectForKey:@"ZBRW_BIANHAO"]};
            NSDictionary *dic8 = @{@"内贸合同编号:": [dic objectForKey:@"HT_BIANHAO"]};
            NSDictionary *dic9 = @{@"合同金额:": [dic objectForKey:@"HT_HETONGJINE"]};
            NSDictionary *dic10 = @{@"项目单位:": [dic objectForKey:@"DEPNAME"]};
            NSDictionary *dic11 = @{@"项目员:":[dic objectForKey:@"CGSQ_CGBXMY"]};
            NSDictionary *dic12 = @{@"乙方单位:": [dic objectForKey:@"HT_YIFANGDANWEI"]};
            NSDictionary *dic13= @{@"乙方签订人:": [dic objectForKey:@"HT_YFQDREN"]};
            NSDictionary *dic14= @{@"生效日期:": [dic objectForKey:@"HT_TJSJ"]};
            NSDictionary *dic15 = @{@"联系人:": [dic objectForKey:@"HT_LXREN"]};
            NSDictionary *dic16 = @{@"联系电话:":[dic objectForKey:@"HT_LXRDIANHUA"]};
            NSDictionary *dic17 = @{@"联系手机:":[dic objectForKey:@"HT_LXRSHOUJI"]};

            
            
            [self.tableArray addObject:dic1];
            [self.tableArray addObject:dic2];
            [self.tableArray addObject:dic3];
            [self.tableArray addObject:dic4];
            [self.tableArray addObject:dic5];
            [self.tableArray addObject:dic6];
            [self.tableArray addObject:dic7];
            [self.tableArray addObject:dic8];
            [self.tableArray addObject:dic9];
            [self.tableArray addObject:dic10];
            [self.tableArray addObject:dic11];
            [self.tableArray addObject:dic12];
            [self.tableArray addObject:dic13];
            [self.tableArray addObject:dic14];
            [self.tableArray addObject:dic15];
            [self.tableArray addObject:dic16];
            [self.tableArray addObject:dic17];
            for (NSDictionary *persondic in [dic objectForKey:@"SHEHEXINXI"]) {
                NSString *time = [persondic objectForKey:@"SHYJ_SHSHIJIAN"];
                NSString *name = [persondic objectForKey:@"SHYJ_SHREN"];
                NSString *canzuo = [persondic objectForKey:@"SHYJ_CAOZUO"];
                NSString *yijian = [persondic objectForKey:@"SHYJ_YIJIAN"];
                NSDictionary *perDic = @{name: [NSString stringWithFormat:@"%@,%@,%@",time,canzuo,yijian]};
                [self.tableArray addObject:perDic];
            }
        }
        [self.myTable reloadData];
    }];
    [manager startSynchronous];//开始同步
}
/////////////////////任务委托
-(void)searchDaiWeiTuoWaiMaoRW{
    
    searchDaiWeiTuoWaiMaoRW *class = (searchDaiWeiTuoWaiMaoRW *)self.myclass;
    NSString * str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",WMRW_ID:\"%@\"}",class.WMRW_ID];
    NSMutableArray *params=[NSMutableArray array];
    [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
    ServiceArgs *args=[[ServiceArgs alloc] init];
    args.serviceURL= @"http://223.4.216.54:8888/xajdcg_webservice/waimaorenwuweituo";
    args.serviceNameSpace = @"http://intf.wmrwwt.service.gwzd.com";
    args.methodName=@"GetWaiMaoRenWuXinXi";//要调用的webservice方法
    args.soapParams=params;//传递方法参数
    args.httpWay=ServiceHttpSoap1;
    ServiceRequestManager *manager=[ServiceRequestManager requestWithArgs:args];
    [manager setSuccessBlock:^() {
        if (manager.error) {
            NSLog(@"同步请求失败，失败原因=%@",manager.error.description);
            return;
        }
        ServiceResult *result = [ServiceResult serviceWithArgs:args responseText:manager.responseString];
        NSDictionary *dic=[result json];
        self.tableArray = [[NSMutableArray alloc]init];
        if ([[dic objectForKey:@"STATETYPE"]isEqualToString:@"1"]) {
            NSDictionary *dic1 = @{@"外贸任务ID:":[dic objectForKey:@"WMRW_ID"]};
            NSDictionary *dic2 = @{@"外贸任务编号:": [dic objectForKey:@"WMRW_BIANHAO"]};
             self.navView.navLabel.text = [dic objectForKey:@"WMRW_BIANHAO"];
            NSDictionary *dic3 = @{@"外贸任务名称:": [dic objectForKey:@"WMRW_MINGCHENG"]};
            NSDictionary *dic4 = @{@"外贸任务设备总金额:":[dic objectForKey:@"WMRW_SBJINE"]};
            NSDictionary *dic5 = @{@"外贸任务人民币金额:": [dic objectForKey:@"WMRW_RMBJINE"]};
            NSDictionary *dic6 = @{@"外贸管理员:": [dic objectForKey:@"WMRW_WMGLYUAN"]};
            NSDictionary *dic7 = @{@"项目员:": [dic objectForKey:@"WMRW_XMYUAN"]};
            NSDictionary *dic8 = @{@"委托货物信息:": [dic objectForKey:@"WMRW_WTHWXX"]};
         
            
            [self.tableArray addObject:dic1];
            [self.tableArray addObject:dic2];
            [self.tableArray addObject:dic3];
            [self.tableArray addObject:dic4];
            [self.tableArray addObject:dic5];
            [self.tableArray addObject:dic6];
            [self.tableArray addObject:dic7];
            [self.tableArray addObject:dic8];
         
            for (NSDictionary *persondic in [dic objectForKey:@"SHEHEXINXI"]) {
                NSString *time = [persondic objectForKey:@"SHYJ_SHSHIJIAN"];
                NSString *name = [NSString stringWithFormat:@"%@:",[persondic objectForKey:@"SHYJ_SHREN"]];
                NSString *canzuo = [persondic objectForKey:@"SHYJ_CAOZUO"];
                NSString *yijian = [persondic objectForKey:@"SHYJ_YIJIAN"];
                NSDictionary *perDic = @{name: [NSString stringWithFormat:@"%@,%@,%@",time,canzuo,yijian]};
                [self.tableArray addObject:perDic];
            }
        }
        [self.myTable reloadData];
    }];
    [manager startSynchronous];//开始同步

}
//外贸协议
-(void)searchDaiLiXieYi{
    searchDaiLiXieYi *class = (searchDaiLiXieYi *)self.myclass;
    NSString * str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",DLXY_ID:\"%@\"}",class.DLXY_ID];
    NSMutableArray *params=[NSMutableArray array];
    [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
    ServiceArgs *args=[[ServiceArgs alloc] init];
    args.serviceURL= @"http://223.4.216.54:8888/xajdcg_webservice/dailixieyishenhe";
    args.serviceNameSpace = @"http://intf.wmdlxy.service.gwzd.com";
    args.methodName=@"GetDaiLiXieYiXinXi";//要调用的webservice方法
    args.soapParams=params;//传递方法参数
    args.httpWay=ServiceHttpSoap1;
    ServiceRequestManager *manager=[ServiceRequestManager requestWithArgs:args];
    [manager setSuccessBlock:^() {
        if (manager.error) {
            NSLog(@"同步请求失败，失败原因=%@",manager.error.description);
            return;
        }
        ServiceResult *result = [ServiceResult serviceWithArgs:args responseText:manager.responseString];
        NSDictionary *dic=[result json];
        self.tableArray = [[NSMutableArray alloc]init];
        if ([[dic objectForKey:@"STATETYPE"]isEqualToString:@"1"]) {
            NSDictionary *dic1 = @{@"代理协议ID:":[dic objectForKey:@"DLXY_ID"]};
            NSDictionary *dic2 = @{@"外贸任务编号:": [dic objectForKey:@"WMRW_BIANHAO"]};
           self.navView.navLabel.text = [dic objectForKey:@"WMRW_BIANHAO"];

            NSDictionary *dic3 = @{@"外贸任务名称:": [dic objectForKey:@"WMRW_MINGCHENG"]};
            NSDictionary *dic4 = @{@"外贸任务金额:":[dic objectForKey:@"WMRW_JINE"]};
            NSDictionary *dic5 = @{@"外贸管理员:": [dic objectForKey:@"WMRW_WMGLYUAN"]};
            NSDictionary *dic6 = @{@"项目员:": [dic objectForKey:@"WMRW_XMYUAN"]};
            NSDictionary *dic7 = @{@"合同编号:": [dic objectForKey:@"WMHT_BIANHAO"]};
            NSDictionary *dic8 = @{@"合同人民币金额:": [dic objectForKey:@"WMHT_RMBJINE"]};
            NSDictionary *dic9 = @{@"外贸代理商名称:": [dic objectForKey:@"DLXY_DAILISHANG"]};
            NSDictionary *dic10 = @{@"代理费:": [dic objectForKey:@"DLXY_DAILIFEI"]};
            NSDictionary *dic11 = @{@"乙方法定代表人:": [dic objectForKey:@"DLXY_FAREN"]};
            NSDictionary *dic12 = @{@"乙方代理人:": [dic objectForKey:@"DLXY_DAILIREN"]};
            
            [self.tableArray addObject:dic1];
            [self.tableArray addObject:dic2];
            [self.tableArray addObject:dic3];
            [self.tableArray addObject:dic4];
            [self.tableArray addObject:dic5];
            [self.tableArray addObject:dic6];
            [self.tableArray addObject:dic7];
            [self.tableArray addObject:dic8];
            [self.tableArray addObject:dic9];
            [self.tableArray addObject:dic10];
            [self.tableArray addObject:dic11];
            [self.tableArray addObject:dic12];

            for (NSDictionary *persondic in [dic objectForKey:@"SHEHEXINXI"]) {
                NSString *time = [persondic objectForKey:@"SHYJ_SHSHIJIAN"];
                NSString *name = [persondic objectForKey:@"SHYJ_SHREN"];
                NSString *canzuo = [persondic objectForKey:@"SHYJ_CAOZUO"];
                NSString *yijian = [persondic objectForKey:@"SHYJ_YIJIAN"];
                NSDictionary *perDic = @{name: [NSString stringWithFormat:@"%@,%@,%@",time,canzuo,yijian]};
                [self.tableArray addObject:perDic];
            }
        }
        [self.myTable reloadData];
    }];
    [manager startSynchronous];//开始同步
}
//验收
-(void)searchYanShouJieGuo{
    searchYanShouJieGuo *class = (searchYanShouJieGuo *)self.myclass;
    NSString * str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",YSJG_ID:\"%@\"}",class.YSJG_ID];
    NSMutableArray *params=[NSMutableArray array];
    [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
    ServiceArgs *args=[[ServiceArgs alloc] init];
    args.serviceURL= @"http://223.4.216.54:8888/xajdcg_webservice/yanshoujieguoshenhe";
    args.serviceNameSpace = @"http://intf.sbysjg.service.gwzd.com";
    args.methodName=@"GetYanShouJieGuoXinXi";//要调用的webservice方法
    args.soapParams=params;//传递方法参数
    args.httpWay=ServiceHttpSoap1;
    ServiceRequestManager *manager=[ServiceRequestManager requestWithArgs:args];
    [manager setSuccessBlock:^() {
        if (manager.error) {
            NSLog(@"同步请求失败，失败原因=%@",manager.error.description);
            return;
        }
        ServiceResult *result = [ServiceResult serviceWithArgs:args responseText:manager.responseString];
        NSDictionary *dic=[result json];
        self.tableArray = [[NSMutableArray alloc]init];
        if ([[dic objectForKey:@"STATETYPE"]isEqualToString:@"1"]) {
            NSDictionary *dic1 = @{@"验收结果ID:":[dic objectForKey:@"YSJG_ID"]};
            NSDictionary *dic2 = @{@"验收结果:": [dic objectForKey:@"YSJG_JIEGUO"]};
            NSDictionary *dic3 = @{@"验收申请编号:": [dic objectForKey:@"YSSQ_SQBH"]};
           self.navView.navLabel.text = [dic objectForKey:@"YSSQ_SQBH"];

            NSDictionary *dic4 = @{@"采购名称:":[dic objectForKey:@"YSSQ_HTLYLEIXING"]};
            NSDictionary *dic5 = @{@"合同编号:": [dic objectForKey:@"YSSQ_HTBIANHAO"]};
            NSDictionary *dic6 = @{@"金额:": [dic objectForKey:@"YSSQ_HTJE"]};
            NSDictionary *dic7 = @{@"合同类型:": [dic objectForKey:@"YSSQ_HTLYLEIXING"]};
            NSDictionary *dic8 = @{@"项目单位:": [dic objectForKey:@"YSSQ_XMDW"]};
            NSDictionary *dic9 = @{@"项目员:": [dic objectForKey:@"YSSQ_CGBXMY"]};
            NSDictionary *dic10 = @{@"经办人:": [dic objectForKey:@"YSSQ_JINGBANREN"]};
            NSDictionary *dic11 = @{@"验收货物:":[dic objectForKey:@"YSSQ_HUOWU"]};
            
            [self.tableArray addObject:dic1];
            [self.tableArray addObject:dic2];
            [self.tableArray addObject:dic3];
            [self.tableArray addObject:dic4];
            [self.tableArray addObject:dic5];
            [self.tableArray addObject:dic6];
            [self.tableArray addObject:dic7];
            [self.tableArray addObject:dic8];
            [self.tableArray addObject:dic9];
            [self.tableArray addObject:dic10];
            [self.tableArray addObject:dic11];
            for (NSDictionary *persondic in [dic objectForKey:@"SHEHEXINXI"]) {
                NSString *time = [persondic objectForKey:@"SHYJ_SHSHIJIAN"];
                NSString *name = [persondic objectForKey:@"SHYJ_SHREN"];
                NSString *canzuo = [persondic objectForKey:@"SHYJ_CAOZUO"];
                NSString *yijian = [persondic objectForKey:@"SHYJ_YIJIAN"];
                NSDictionary *perDic = @{name: [NSString stringWithFormat:@"%@,%@,%@",time,canzuo,yijian]};
                [self.tableArray addObject:perDic];
            }
        }
        [self.myTable reloadData];
    }];
    [manager startSynchronous];//开始同步

    
}

//统计项目审批
-(void)GetHeTongXiangQing{
    searchGongChengXiangMu *class = (searchGongChengXiangMu *)self.myclass;
    NSString * str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",CGSQID:\"%@\"}",class.CGSQ_ID];
    NSMutableArray *params=[NSMutableArray array];
    [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
    ServiceArgs *args=[[ServiceArgs alloc] init];
    args.serviceURL= @"http://223.4.216.54:8888/xajdcg_webservice/gongchengxiangmushenhe";
    args.serviceNameSpace = @"http://intf.gcxmsh.service.gwzd.com";
    args.methodName=@"GetXiangMuXiangQing";//要调用的webservice方法
    args.soapParams=params;//传递方法参数
    args.httpWay=ServiceHttpSoap1;
    ServiceRequestManager *manager=[ServiceRequestManager requestWithArgs:args];
    [manager setSuccessBlock:^() {
        if (manager.error) {
            NSLog(@"同步请求失败，失败原因=%@",manager.error.description);
            return;
        }
        ServiceResult *result = [ServiceResult serviceWithArgs:args responseText:manager.responseString];
        NSDictionary *dic=[result json];
        self.tableArray = [[NSMutableArray alloc]init];
        if ([[dic objectForKey:@"STATETYPE"]isEqualToString:@"1"]) {
            NSDictionary *dic1 = @{@"预算信息:":[dic objectForKey:@"CGSQ_YSXX"]};
            NSDictionary *dic2 = @{@"采购申请ID:": [dic objectForKey:@"CGSQ_ID"]};
            NSDictionary *dic3 = @{@"申请编号:": [dic objectForKey:@"CGSQ_BIANHAO"]};
           self.navView.navLabel.text = [dic objectForKey:@"CGSQ_BIANHAO"];

            NSDictionary *dic4 = @{@"采购总额:":[dic objectForKey:@"CGSQ_CGZENGE"]};
            NSDictionary *dic5 = @{@"申请采购方式名称:": [dic objectForKey:@"CGFS_MINGCHENG"]};
            NSDictionary *dic6 = @{@"项目名称:": [dic objectForKey:@"CGSQ_XMMINGCHENG"]};
            NSDictionary *dic7 = @{@"项目单位:": [dic objectForKey:@"DEPNAME"]};
            NSDictionary *dic8 = @{@"工程内容:": [dic objectForKey:@"CGSQ_GCNR"]};
            NSDictionary *dic9 = @{@"申请时间:": [dic objectForKey:@"CGSQ_SQSJ"]};
            NSDictionary *dic10 = @{@"项目员:": [dic objectForKey:@"CGSQ_CGBXMY"]};
            NSDictionary *dic11 = @{@"添加时间:":[dic objectForKey:@"CGSQ_TJSJ"]};
      
            
            
            
            [self.tableArray addObject:dic1];
            [self.tableArray addObject:dic2];
            [self.tableArray addObject:dic3];
            [self.tableArray addObject:dic4];
            [self.tableArray addObject:dic5];
            [self.tableArray addObject:dic6];
            [self.tableArray addObject:dic7];
            [self.tableArray addObject:dic8];
            [self.tableArray addObject:dic9];
            [self.tableArray addObject:dic10];
            [self.tableArray addObject:dic11];
    

            for (NSDictionary *persondic in [dic objectForKey:@"SHEHEXINXI"]) {
                NSString *time = [persondic objectForKey:@"SHYJ_SHSHIJIAN"];
                NSString *name = [persondic objectForKey:@"SHYJ_SHREN"];
                NSString *canzuo = [persondic objectForKey:@"SHYJ_CAOZUO"];
                NSString *yijian = [persondic objectForKey:@"SHYJ_YIJIAN"];
                NSDictionary *perDic = @{name: [NSString stringWithFormat:@"%@,%@,%@",time,canzuo,yijian]};
                [self.tableArray addObject:perDic];
            }
        }
        [self.myTable reloadData];
    }];
    [manager startSynchronous];//开始同步
    
    
}
//统计合同
-(void)GetXiangMuXiangQing{
    searchShiGongHeTong *class = (searchShiGongHeTong *)self.myclass;
    NSString * str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",ZHHT_ID:\"%@\"}",class.ZHHT_ID];
    NSMutableArray *params=[NSMutableArray array];
    [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
    ServiceArgs *args=[[ServiceArgs alloc] init];
    args.serviceURL= @"http://223.4.216.54:8888/xajdcg_webservice/gongchenghetongshenhe";
    args.serviceNameSpace = @"http://intf.gccght.service.gwzd.com";
    args.methodName=@"GetHeTongXiangQing";//要调用的webservice方法
    args.soapParams=params;//传递方法参数
    args.httpWay=ServiceHttpSoap1;
    ServiceRequestManager *manager=[ServiceRequestManager requestWithArgs:args];
    [manager setSuccessBlock:^() {
        if (manager.error) {
            NSLog(@"同步请求失败，失败原因=%@",manager.error.description);
            return;
        }
        ServiceResult *result = [ServiceResult serviceWithArgs:args responseText:manager.responseString];
        NSDictionary *dic=[result json];
        self.tableArray = [[NSMutableArray alloc]init];
        if ([[dic objectForKey:@"STATETYPE"]isEqualToString:@"1"]) {
            NSDictionary *dic1 = @{@"合同ID:":[dic objectForKey:@"ZHHT_ID"]};
            NSDictionary *dic2 = @{@"采购申请编号:": [dic objectForKey:@"CGSQ_BIANHAO"]};
            NSDictionary *dic3 = @{@"合同编号:": [dic objectForKey:@"ZHHT_BIANHAO"]};
            self.navView.navLabel.text = [dic objectForKey:@"ZHHT_BIANHAO"];

            NSDictionary *dic4 = @{@"工程名称:":[dic objectForKey:@"ZHHT_GCMINGCHENG"]};
            NSDictionary *dic5 = @{@"合同金额:": [dic objectForKey:@"ZHHT_HTZONGJIA"]};
            NSDictionary *dic6 = @{@"采购方式ID:": [dic objectForKey:@"CGFS_ID"]};
            NSDictionary *dic7 = @{@"采购方式名称:": [dic objectForKey:@"CGFS_MINGCHENG"]};
            NSDictionary *dic8 = @{@"招标编号:": [dic objectForKey:@"ZBRW_BIANHAO"]};
            NSDictionary *dic9 = @{@"工程地点:": [dic objectForKey:@"ZHHT_GCDIDIANG"]};
            NSDictionary *dic10 = @{@"施工单位:": [dic objectForKey:@"ZHHT_SHIGONGDANWEI"]};
            NSDictionary *dic11 = @{@"建设单位:":[dic objectForKey:@"ZHHT_JIANSHEDANWEI"]};
            NSDictionary *dic12 = @{@"项目员:": [dic objectForKey:@"CGSQ_CGBXMY"]};
            NSDictionary *dic13= @{@"开工日期:": [dic objectForKey:@"ZHHT_KAIGONGRIQI"]};
            NSDictionary *dic14= @{@"竣工日期:": [dic objectForKey:@"ZHHT_JUNGONGRIQI"]};
            NSDictionary *dic15 = @{@"总工期:": [dic objectForKey:@"ZHHT_GONGQI"]};
            NSDictionary *dic16 = @{@"合同生效日期:":[dic objectForKey:@"ZHHT_SHENGXIAOQI"]};
            NSDictionary *dic17 = @{@"乙方项目经理:":[dic objectForKey:@"ZHHT_YIFANGXIANGMUJINGLI"]};
            
            
            
            [self.tableArray addObject:dic1];
            [self.tableArray addObject:dic2];
            [self.tableArray addObject:dic3];
            [self.tableArray addObject:dic4];
            [self.tableArray addObject:dic5];
            [self.tableArray addObject:dic6];
            [self.tableArray addObject:dic7];
            [self.tableArray addObject:dic8];
            [self.tableArray addObject:dic9];
            [self.tableArray addObject:dic10];
            [self.tableArray addObject:dic11];
            [self.tableArray addObject:dic12];
            [self.tableArray addObject:dic13];
            [self.tableArray addObject:dic14];
            [self.tableArray addObject:dic15];
            [self.tableArray addObject:dic16];
            [self.tableArray addObject:dic17];
            for (NSDictionary *persondic in [dic objectForKey:@"SHEHEXINXI"]) {
                NSString *time = [persondic objectForKey:@"SHYJ_SHSHIJIAN"];
                NSString *name = [persondic objectForKey:@"SHYJ_SHREN"];
                NSString *canzuo = [persondic objectForKey:@"SHYJ_CAOZUO"];
                NSString *yijian = [persondic objectForKey:@"SHYJ_YIJIAN"];
                NSDictionary *perDic = @{name: [NSString stringWithFormat:@"%@,%@,%@",time,canzuo,yijian]};
                [self.tableArray addObject:perDic];
            }
        }
        [self.myTable reloadData];
    }];
    [manager startSynchronous];//开始同步
    
    
}
//统计验收
-(void)GetYanShouJieGuoXinXi{
    searchYanShouJieGuo *class = (searchYanShouJieGuo *)self.myclass;
    NSString * str =[NSString stringWithFormat: @"{\"LOGINNAME\":\"han.yongjun\",\"LOGINPWD\":\"19880618\",YSJG_ID:\"%@\"}",class.YSJG_ID];
    NSMutableArray *params=[NSMutableArray array];
    [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:str,@"json", nil]];
    ServiceArgs *args=[[ServiceArgs alloc] init];
    args.serviceURL= @"http://223.4.216.54:8888/xajdcg_webservice/gcyanshoujieguoshenhe";
    args.serviceNameSpace = @"http://intf.gcysjg.service.gwzd.com";
    args.methodName=@"GetYanShouJieGuoXinXi";//要调用的webservice方法
    args.soapParams=params;//传递方法参数
    args.httpWay=ServiceHttpSoap1;
    ServiceRequestManager *manager=[ServiceRequestManager requestWithArgs:args];
    [manager setSuccessBlock:^() {
        if (manager.error) {
            NSLog(@"同步请求失败，失败原因=%@",manager.error.description);
            return;
        }
        ServiceResult *result = [ServiceResult serviceWithArgs:args responseText:manager.responseString];
        NSDictionary *dic=[result json];
        self.tableArray = [[NSMutableArray alloc]init];
        if ([[dic objectForKey:@"STATETYPE"]isEqualToString:@"1"]) {
            NSDictionary *dic1 = @{@"验收结果ID:":[dic objectForKey:@"YSJG_ID"]};
            NSDictionary *dic2 = @{@"验收结果:": [dic objectForKey:@"YSJG_JIEGUO"]};
            NSDictionary *dic3 = @{@"验收申请编号:": [dic objectForKey:@"ZHYSSQ_SQBH"]};
            self.navView.navLabel.text = [dic objectForKey:@"ZHYSSQ_SQBH"];

            NSDictionary *dic4 = @{@"项目名称:":[dic objectForKey:@"ZHYSSQ_XMMINGCHENG"]};
            NSDictionary *dic5 = @{@"合同编号:": [dic objectForKey:@"ZHYSSQ_HTBIANHAO"]};
            NSDictionary *dic6 = @{@"合同金额:": [dic objectForKey:@"ZHYSSQ_HTJE"]};
            NSDictionary *dic7 = @{@"最终审计总额:": [dic objectForKey:@"ZHYSSQ_ZZSJJINE"]};
            NSDictionary *dic8 = @{@"项目单位:": [dic objectForKey:@"ZHYSSQ_XMDW"]};
            NSDictionary *dic9 = @{@"项目员:": [dic objectForKey:@"ZHYSSQ_CGBXMY"]};
            NSDictionary *dic10 = @{@"经办人:": [dic objectForKey:@"ZHYSSQ_JINGBANREN"]};
            NSDictionary *dic11 = @{@"验收日期:":[dic objectForKey:@"ZHYSHY_APSHIJIAN"]};
            
            NSDictionary *dic12 = @{@"验收会编号:": [dic objectForKey:@"ZHYSHY_BIANHAO"]};
            NSDictionary *dic13 = @{@"施工单位:": [dic objectForKey:@"ZHYSSQ_GHDW"]};
            //NSDictionary *dic14 = @{@"验收专家:":[dic objectForKey:@"YSHYZJ_XINGMING"]};
            
            [self.tableArray addObject:dic1];
            [self.tableArray addObject:dic2];
            [self.tableArray addObject:dic3];
            [self.tableArray addObject:dic4];
            [self.tableArray addObject:dic5];
            [self.tableArray addObject:dic6];
            [self.tableArray addObject:dic7];
            [self.tableArray addObject:dic8];
            [self.tableArray addObject:dic9];
            [self.tableArray addObject:dic10];
            [self.tableArray addObject:dic11];
            [self.tableArray addObject:dic12];
            [self.tableArray addObject:dic13];
//            [self.tableArray addObject:dic14];
            for (NSDictionary *persondic in [dic objectForKey:@"SHEHEXINXI"]) {
                NSString *time = [persondic objectForKey:@"SHYJ_SHSHIJIAN"];
                NSString *name = [persondic objectForKey:@"SHYJ_SHREN"];
                NSString *canzuo = [persondic objectForKey:@"SHYJ_CAOZUO"];
                NSString *yijian = [persondic objectForKey:@"SHYJ_YIJIAN"];
                NSDictionary *perDic = @{name: [NSString stringWithFormat:@"%@,%@,%@",time,canzuo,yijian]};
                [self.tableArray addObject:perDic];
            }
        }
        [self.myTable reloadData];
    }];
    [manager startSynchronous];//开始同步
    
    
}

-(void)XiangMuBoHui{
    
}

@end
