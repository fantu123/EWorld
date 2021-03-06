//
//  RootViewController.m
//  EWorld
//
//  Created by mac on 15/4/22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "RootViewController.h"
#import "Widecell.h"
#import "OneCell.h"
#import "TwoCell.h"
#import "ThreeCell.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    arraydata = [[NSMutableArray alloc]init];
    arraydata = [NSMutableArray arrayWithObjects:
                             @"美发",@"化妆整形",@"医学整容",@"美容SPA",@"纹身纹绣",@"会展大赛",@"美甲美瞳",@"名家访谈",@"教育培训",@"足疗",@"中医保健",@"营养师",@"游泳教练",@"健身教练",@"瑜伽教练",@"大律师",@"家庭教师",@"书法大家",@"摄影师",nil];
    self.navigationController.navigationBar.hidden = YES;
    // Do any additional setup after loading the view from its nib.
    navBar = [[JRNavgationBar alloc]initWithFrame:CGRectMake(0,0, SCREENWIDTH, NAVHEIGHT) Option:JRNAVGATIONDEFAULTBAR];
    navBar.isroot = YES;
    navBar.delegate = self;
    navBar.setbtn.hidden = YES;
    navBar.homebtn.hidden =YES;
    navBar.titleLabel.text = @"E美丽";
    [self.view addSubview:navBar];
    
    NSLog(@"%f",SCREENWIDTH);
    mytableview = [[UITableView alloc] initWithFrame:CGRectMake(0,NAVHEIGHT, SCREENWIDTH,SCREENHEIGHT-110) style:UITableViewStylePlain];
    mytableview.dataSource = self;
    mytableview.delegate = self;
    mytableview.backgroundColor  = [UIColor redColor];
    mytableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:mytableview];
}
#pragma ---tableVIew dataSource delegate------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return 10;
    return  arraydata.count/2+1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if(cell==nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row==0) {
        Widecell * maincell = [tableView dequeueReusableCellWithIdentifier:@"widecell"];
        if (maincell==nil) {
            maincell = [[[NSBundle mainBundle]loadNibNamed:@"Widecell" owner:self options:nil]lastObject];
            maincell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        maincell.delegate = self;
        return maincell;
    }
    else if (indexPath.row%3==1)
    {
        OneCell * onecell = [tableView dequeueReusableCellWithIdentifier:@"onecell"];
        if (onecell==nil) {
            onecell = [[[NSBundle mainBundle]loadNibNamed:@"OneCell" owner:self options:nil]lastObject];
            onecell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        onecell.btnone.tag = indexPath.row+10000;
        onecell.btntwo.tag = indexPath.row+20000;
        onecell.delegate=self;
        onecell.onename.text = [arraydata objectAtIndex:indexPath.row*2-1];
        onecell.twoname.text = [arraydata objectAtIndex:indexPath.row*2];
        return onecell;
    }
    else if (indexPath.row%3==2)
    {
        TwoCell * Tcell = [tableView dequeueReusableCellWithIdentifier:@"twocell"];
        if (Tcell==nil) {
            Tcell = [[[NSBundle mainBundle]loadNibNamed:@"TwoCell" owner:self options:nil]lastObject];
            Tcell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        Tcell.teonebtn.tag = indexPath.row+10000;
        Tcell.twtwbtn.tag = indexPath.row+20000;
        Tcell.nameone.text = [arraydata objectAtIndex:indexPath.row*2-1];
         Tcell.nametwo .text = [arraydata objectAtIndex:indexPath.row*2];
        Tcell.delegate=self;
        return Tcell;
    }
    else if (indexPath.row%3==0)
    {
        ThreeCell * THcell = [tableView dequeueReusableCellWithIdentifier:@"threcell"];
        if (THcell==nil) {
            THcell = [[[NSBundle mainBundle]loadNibNamed:@"ThreeCell" owner:self options:nil]lastObject];
            THcell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        THcell.thonebtn.tag = indexPath.row+10000;
        THcell.thtwbtn.tag = indexPath.row+20000;
        THcell.delegate= self;
        THcell.thlableone.text = [arraydata objectAtIndex:indexPath.row*2-1];
        THcell.thlabletwo .text = [arraydata objectAtIndex:indexPath.row*2];
        return THcell;
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 154;
    }
    else
    return 134;
}
-(void)whonebtnclick:(id)sender
{
    RootallViewController * rootlist = [[RootallViewController alloc]initWithNibName:@"RootallViewController" bundle:nil];
    rootlist.navtitie = [arraydata objectAtIndex:0];
    [self.navigationController pushViewController:rootlist animated:YES];
}
-(void)fironebtnclick:(UIButton*)sender
{
     OneCell * onecell = (OneCell *)sender;
  
    NSLog(@"%ld",(long)onecell.btnone.tag);

    RootallViewController * rootlist = [[RootallViewController alloc]initWithNibName:@"RootallViewController" bundle:nil];
    rootlist.navtitie = [arraydata objectAtIndex:(onecell.btnone.tag-10000)*2-1 ];
    [self.navigationController pushViewController:rootlist animated:YES];
}
-(void)firtwobtnclick:(id)sender
{
    OneCell * onecell = (OneCell *)sender;
    
    NSLog(@"%ld",(long)onecell.btnone.tag);
    
    RootallViewController * rootlist = [[RootallViewController alloc]initWithNibName:@"RootallViewController" bundle:nil];
    rootlist.navtitie = [arraydata objectAtIndex:(onecell.btntwo.tag-20000)*2];
    [self.navigationController pushViewController:rootlist animated:YES];
}
-(void)seonebtnclick:(id)sender
{
    TwoCell * twocell = (TwoCell *)sender;
    
    NSLog(@"%ld",(long)twocell.teonebtn.tag);

    RootallViewController * rootlist = [[RootallViewController alloc]initWithNibName:@"RootallViewController" bundle:nil];
    rootlist.navtitie = [arraydata objectAtIndex:(twocell.teonebtn.tag-10000)*2-1];
    [self.navigationController pushViewController:rootlist animated:YES];
}
-(void)setwobtnclick:(id)sender
{
    TwoCell * twocell = (TwoCell *)sender;
    
    NSLog(@"%ld",(long)twocell.teonebtn.tag);
    
    RootallViewController * rootlist = [[RootallViewController alloc]initWithNibName:@"RootallViewController" bundle:nil];
    rootlist.navtitie = [arraydata objectAtIndex:(twocell.twtwbtn.tag-20000)*2];
    [self.navigationController pushViewController:rootlist animated:YES];
}
-(void)thonebtnclick:(id)sender
{
    ThreeCell * thcell = (ThreeCell *)sender;
    
    NSLog(@"%ld",(long)thcell.thonebtn.tag);
    
    RootallViewController * rootlist = [[RootallViewController alloc]initWithNibName:@"RootallViewController" bundle:nil];
    rootlist.navtitie = [arraydata objectAtIndex:(thcell.thonebtn.tag-10000)*2-1];
    [self.navigationController pushViewController:rootlist animated:YES];
}
-(void)thtwobtnclick:(id)sender
{
    
    ThreeCell * thcell = (ThreeCell *)sender;
    
    NSLog(@"%ld",(long)thcell.thonebtn.tag);
    RootallViewController * rootlist = [[RootallViewController alloc]initWithNibName:@"RootallViewController" bundle:nil];
    rootlist.navtitie = [arraydata objectAtIndex:(thcell.thtwbtn.tag-20000)*2];
    [self.navigationController pushViewController:rootlist animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)back:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];

}

@end
