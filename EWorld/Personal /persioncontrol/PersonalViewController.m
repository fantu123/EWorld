//
//  PersonalViewController.m
//  EWorld
//
//  Created by mac on 15/4/22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "PersonalViewController.h"
#import "MyreservationViewController.h"
#import "AboutViewController.h"
@interface PersonalViewController ()

@end

@implementation PersonalViewController

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
    navBar.backbtn.hidden = YES;
    navBar.titleLabel.text = @"个人中心";
    [self.view addSubview:navBar];
    
//    mytableview = [[UITableView alloc] initWithFrame:CGRectMake(0,NAVHEIGHT, SCREENWIDTH,SCREENHEIGHT-110) style:UITableViewStylePlain];
//    mytableview.dataSource = self;
//    mytableview.delegate = self;
//    mytableview.separatorStyle = UITableViewCellSeparatorStyleNone;
//    [self.view addSubview:mytableview];
//    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)Informationbtn:(id)sender {
}
- (IBAction)mypoint:(id)sender {
    MyreservationViewController * myreser = [[MyreservationViewController alloc]initWithNibName:@"MyreservationViewController" bundle:nil];
    myreser.hidesBottomBarWhenPushed= YES;
    [self.navigationController pushViewController:myreser animated:YES];
}
- (IBAction)clearcache:(id)sender {
    
    backviewalpa = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    backviewalpa.backgroundColor =[UIColor blackColor];
    backviewalpa.alpha = 0.5;
    [self.view addSubview:backviewalpa];
    
    alterview = [[[NSBundle mainBundle]loadNibNamed:@"alterviewView" owner:nil options:nil]lastObject];
    alterview.frame =CGRectMake(25, 200, 270, 70);
    alterview.delegate = self;
    [self.view addSubview:alterview];

}
- (IBAction)about:(id)sender {
    AboutViewController * aboutuser = [[AboutViewController alloc]initWithNibName:@"AboutViewController" bundle:nil];
    [self.navigationController pushViewController:aboutuser animated:YES];
}
- (IBAction)Versionupdate:(id)sender {
    
    
}
- (IBAction)phonebutton:(id)sender {
    
    
}
- (IBAction)uploadphoto:(id)sender {
    
}
-(void)clickokbutton:(id)sender
{
    [backviewalpa removeFromSuperview];
    [alterview removeFromSuperview];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [backviewalpa removeFromSuperview];
    [alterview removeFromSuperview];
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
