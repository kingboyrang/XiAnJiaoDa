//
//  TableViewController.m
//  XiAnJiaoDa
//
//  Created by liuqin on 14-6-25.
//  Copyright (c) 2014年 com.gwzd. All rights reserved.
//

#import "TableViewController.h"

#import "searchDaiShenHeXiangMu.h"
#import "searchDaiShenHeHeTong.h"
#import "searchDaiWeiTuoWaiMaoRW.h"
#import "searchDaiLiXieYi.h"
#import "searchYanShouJieGuo.h"
#import "searchShiGongHeTong.h"

@interface TableViewController ()

@end

@implementation TableViewController

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
    self.view.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
    UITableView *mytableView = [[UITableView alloc]initWithFrame:CGRectMake(10, 70, 300, self.view.frame.size.height - 70 - 60)];
    mytableView.backgroundColor = [UIColor whiteColor];
    mytableView.layer.borderColor = [[UIColor grayColor]CGColor];
    mytableView.layer.borderWidth = 0.7f;
    [self.view addSubview:mytableView];
    mytableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    mytableView.delegate = self;
    mytableView.dataSource = self;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.type == 1) {
        searchDaiShenHeXiangMu *entity = (searchDaiShenHeXiangMu *)[self.tableArr objectAtIndex:indexPath.row];
        CGSize size = [entity.MESSAGE textSize:[UIFont systemFontOfSize:12] withWidth:270];
       return size.height+20;
    }else if (self.type ==2){
        searchDaiShenHeHeTong *entity = (searchDaiShenHeHeTong *)[self.tableArr objectAtIndex:indexPath.row];
        CGSize size = [entity.MESSAGE textSize:[UIFont systemFontOfSize:12] withWidth:270];
        return size.height+20;
    }else if (self.type ==3){
        searchDaiWeiTuoWaiMaoRW *entity = (searchDaiWeiTuoWaiMaoRW *)[self.tableArr objectAtIndex:indexPath.row];
        CGSize size = [entity.MESSAGE textSize:[UIFont systemFontOfSize:12] withWidth:270];
        return size.height+20;
    }else if (self.type ==4){
        searchDaiLiXieYi *entity = (searchDaiLiXieYi *)[self.tableArr objectAtIndex:indexPath.row];
        CGSize size = [entity.MESSAGE textSize:[UIFont systemFontOfSize:12] withWidth:270];
        return size.height+20;
    }else if (self.type ==5){
        searchYanShouJieGuo *entity = (searchYanShouJieGuo *)[self.tableArr objectAtIndex:indexPath.row];
        CGSize size = [entity.MESSAGE textSize:[UIFont systemFontOfSize:12] withWidth:270];
        return size.height+20;
    }
    else if (self.type == 6){
        searchDaiShenHeXiangMu *entity = (searchDaiShenHeXiangMu *)[self.tableArr objectAtIndex:indexPath.row];
        CGSize size = [entity.MESSAGE textSize:[UIFont systemFontOfSize:12] withWidth:270];
        return size.height+20;

    }else if (self.type == 7){
        searchShiGongHeTong *entity = (searchShiGongHeTong *)[self.tableArr objectAtIndex:indexPath.row];
        CGSize size = [entity.MESSAGE textSize:[UIFont systemFontOfSize:12] withWidth:270];
        return size.height+20;
    }
    else if (self.type ==8){
        searchYanShouJieGuo *entity = (searchYanShouJieGuo *)[self.tableArr objectAtIndex:indexPath.row];
        CGSize size = [entity.MESSAGE textSize:[UIFont systemFontOfSize:12] withWidth:270];
        return size.height+20;
    }
    return 0;
    
  }
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifier";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:nil options:nil]objectAtIndex:0];
    }
    cell.entity = [self.tableArr objectAtIndex:indexPath.row];
    cell.myLabel.text = [self.tableMess objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = (TableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    ContentViewController *vc = [[ContentViewController alloc]init];
    vc.myclass = cell.entity;
    vc.type = self.type;
    [self.navigationController pushViewController:vc animated:YES];
} 
@end
