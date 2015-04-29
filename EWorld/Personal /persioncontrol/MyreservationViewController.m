//
//  MyreservationViewController.m
//  EWorld
//
//  Created by mac on 15/4/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "MyreservationViewController.h"

@interface MyreservationViewController ()

@end

@implementation MyreservationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    navBar = [[JRNavgationBar alloc]initWithFrame:CGRectMake(0,0, SCREENWIDTH, NAVHEIGHT) Option:JRNAVGATIONDEFAULTBAR];
    navBar.isroot = YES;
    navBar.delegate = self;
    navBar.setbtn.hidden = YES;
    navBar.homebtn.hidden =YES;
    navBar.backbtn.hidden = YES;
    navBar.titleLabel.text = @"我的预约";
    [self.view addSubview:navBar];
    [self createSegment];
    
    mytableview = [[TableView alloc] initWithFrame:CGRectMake(0,NAVHEIGHT+40, SCREENWIDTH,SCREENHEIGHT-110) style:UITableViewStylePlain];
    mytableview.dataSource = self;
    mytableview.delegate = self;
    mytableview.pullDelegate=self;
    mytableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:mytableview];
    
}
-(void)createSegment
{
    isselectview = [[Selectview alloc]initWithFrame:CGRectMake(0, NAVHEIGHT, SCREENWIDTH, 40)];
    isselectview.delegate = self;
    [self.view addSubview:isselectview];
}

#pragma ---tableVIew dataSource delegate------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
        MyreservationViewCell * cancelcell = [tableView dequeueReusableCellWithIdentifier:@"qxcell"];
        if (cancelcell==nil) {
            cancelcell = [[[NSBundle mainBundle]loadNibNamed:@"MyreservationViewCell" owner:self options:nil]lastObject];
            cancelcell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cancelcell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 83;
}
#pragma mark - TableViewdelegate
- (void)pullTableViewDidTriggerLoadMore:(TableView*)pullTableView
{
    [self performSelector:@selector(loadMoreDataToTable) withObject:nil afterDelay:1.0f];
}

- (void)pullTableViewDidTriggerRefresh:(TableView *)pullTableView
{
    [self performSelector:@selector(refresh:) withObject:nil afterDelay:1.0f];
}
- (void)loadMoreDataToTable
{
    //    more ++;
    //    isrefresh = NO;
    //    NSString * url = [NSString stringWithFormat:@"%@&app_com=com_bookBusiness&task=booklist&type=meals&per=1&row=10&page=%d&data=1&content_data=%@",HTTP,more,[self returnYear_Month_Daystr:self.destine_date]];
    //    NSLog(@"%@",url);
    //    [self download:url];
    mytableview.pullTableIsLoadingMore = NO;
}

-(void)refresh:(id)sender
{
    //    more = 1;
    //    NSString * url = [NSString stringWithFormat:@"%@&app_com=com_bookBusiness&task=booklist&type=meals&per=1&row=10&page=%d&data=1&content_data=%@&content_form=%@",HTTP,more,[self returnYear_Month_Daystr:self.destine_date],[[conditions objectAtIndex:self.selectedIndexPath_2.row] objectForKey:@"value"]];
    //    //NSString * url = [NSString stringWithFormat:@"%@&app_com=com_bookBusiness&task=booklist&type=meals&per=1&row=10&page=%d&data=1&content_data=%@",HTTP,more,[self returnYear_Month_Daystr:self.destine_date]];
    //    NSLog(@"%@",url);
    //    [indicator startAnimatingActivit];
    //    [self download:url];
    mytableview.pullTableIsRefreshing = NO;
}
-(void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
