//
//  AppointViewController.m
//  EWorld
//
//  Created by mac on 15/4/22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AppointViewController.h"
#import "AppointViewCell.h"
#import "DetailViewController.h"
#import "AlldistrictViewCell.h"
@interface AppointViewController ()
@end

@implementation AppointViewController
@synthesize segbutton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBar.hidden = YES;
    // Do any additional setup after loading the view from its nib.
    navBar = [[JRNavgationBar alloc]initWithFrame:CGRectMake(0,0, SCREENWIDTH, NAVHEIGHT) Option:JRNAVGATIONDEFAULTBAR];
    navBar.isroot = YES;
    navBar.delegate = self;
    navBar.setbtn.hidden = YES;
    navBar.homebtn.hidden =YES;
    navBar.titleLabel.text = @"预约";
    navBar.backbtn.hidden = YES;
    [self.view addSubview:navBar];
    [self createsearch];
    [self createSegment];
    mytableview = [[TableView alloc] initWithFrame:CGRectMake(0,NAVHEIGHT+80, SCREENWIDTH,SCREENHEIGHT-193) style:UITableViewStylePlain];
    mytableview.dataSource = self;
    mytableview.delegate = self;
    mytableview.pullDelegate = self;
    mytableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:mytableview];
    
    
    sqtableview = [[UITableView alloc] initWithFrame:CGRectMake(0,NAVHEIGHT+80, SCREENWIDTH/2-1,SCREENHEIGHT-193) style:UITableViewStylePlain];
    sqtableview.dataSource = self;
    sqtableview.delegate = self;
    sqtableview.hidden=YES;
    sqtableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:sqtableview];
    
    cttableview = [[UITableView alloc] initWithFrame:CGRectMake(SCREENWIDTH/2+1,NAVHEIGHT+80, SCREENWIDTH/2-1,SCREENHEIGHT-193) style:UITableViewStylePlain];
    cttableview.dataSource = self;
    cttableview.delegate = self;
    cttableview.hidden=YES;
    cttableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:cttableview];
    selectclass = @"1";
    
    cityarray = [NSMutableArray arrayWithObjects:@"全部",@"朝阳其他",@"三里屯",@"望京",@"建外大街",@"朝外大街",@"国贸",@"双井",@"劲松",@"朝阳公园",@"天通苑",nil];
}
-(void)createsearch
{
    
    textfiled = [[UITextField alloc]initWithFrame:CGRectMake(5, NAVHEIGHT, 200, 38)];
    textfiled.placeholder = @"   搜索店铺";
    textfiled.delegate = self;
    [self.view addSubview:textfiled];
    
    UIImageView * imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"search.png"]];
    imageview.frame = CGRectMake(290, NAVHEIGHT+10, 20, 20);
    [self.view addSubview:imageview];
}
-(void)createSegment
{
    segbutton = [[SegmentBUtton alloc]initWithFrame:CGRectMake(0, NAVHEIGHT+40, SCREENWIDTH, 40)];
    segbutton.delegate = self;
    [self.view addSubview:segbutton];
}
-(void)selectSQbutton:(id)sender
{
    mytableview.hidden = YES;
    sqtableview.hidden = NO;
    selectclass = @"3";
    [sqtableview reloadData];
    [cttableview reloadData];
    NSLog(@"选择附近商圈");
}
-(void)selectXDbutton:(id)sender
{
    mytableview.hidden = NO;
    sqtableview.hidden = YES;
    cttableview.hidden=YES;
    selectclass = @"2";
    [mytableview reloadData];
     NSLog(@"选择个人小店");
}
-(void)selectTJbutton:(id)sender
{
    mytableview.hidden = NO;
    sqtableview.hidden = YES;
    cttableview.hidden=YES;
    selectclass = @"1";
    [mytableview reloadData];
     NSLog(@"选择选择推荐店铺");
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
    
        AppointViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"appcell"];
        if(cell==nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"AppointViewCell" owner:nil options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
    
      if ([selectclass isEqualToString:@"3"])
        {
        AlldistrictViewCell *citycell = [tableView dequeueReusableCellWithIdentifier:@"allcell"];
        if(citycell==nil)
        {
            citycell = [[[NSBundle mainBundle]loadNibNamed:@"AlldistrictViewCell" owner:nil options:nil]lastObject];
            citycell.selectionStyle = UITableViewCellSelectionStyleNone;
          

        }
            citycell.citylable.text = @"石景山"; //[cityarray objectAtIndex:indexPath.row ];
//            citycell.;
            NSLog(@"%@",citycell.citylable.text);
            return citycell;
        }
       else if ([selectclass isEqualToString:@"4"]) {
        if (cityarray.count ==0) {
                
                return nil;
            }
            else
            {
                AlldistrictViewCell *city = [tableView dequeueReusableCellWithIdentifier:@"allcell"];
                if(city==nil)
                {
                    city = [[[NSBundle mainBundle]loadNibNamed:@"AlldistrictViewCell" owner:nil options:nil]lastObject];
                    city.selectionStyle = UITableViewCellSelectionStyleNone;
                }
                NSLog(@"%@",cityarray);
                city.citylable.text = [cityarray objectAtIndex:indexPath.row ];
                  NSLog(@"%@",city.citylable.text);
                return city;
            }
    }
    else
    {
        if ([selectclass isEqualToString:@"1"]) {
            NSLog(@"输出推荐店铺");
        }
        else
        {
         NSLog(@"输出个人小店");
        }
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([selectclass isEqualToString:@"3"]) {
        return 50;
    }
    else if ([selectclass isEqualToString:@"4"]) {
        return 50;
    }
    else
    {
    return 83;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([selectclass isEqualToString:@"3"]) {
        NSLog(@"选择商圈 城市");
        selectclass = @"4";
        cttableview.hidden= NO;
        [cttableview reloadData];
    }
    else
    {
    DetailViewController *detail = [[DetailViewController alloc]initWithNibName:@"DetailViewController" bundle:nil];
    [self.navigationController pushViewController:detail animated:YES];
    }
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
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [textfiled resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
