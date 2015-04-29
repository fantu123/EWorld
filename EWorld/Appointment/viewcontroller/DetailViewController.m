//
//  DetailViewController.m
//  EWorld
//
//  Created by mac on 15/4/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "DetailViewController.h"
#import "doorserviceController.h"
#import "TodoorViewController.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    navBar = [[JRNavgationBar alloc]initWithFrame:CGRectMake(0,0, SCREENWIDTH, NAVHEIGHT) Option:JRNAVGATIONDEFAULTBAR];
    navBar.isroot = YES;
    navBar.delegate = self;
    navBar.setbtn.hidden = YES;
    navBar.homebtn.hidden =YES;
    navBar.titleLabel.text = @"店铺名字";
    [self.view addSubview:navBar];
    
}
-(void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)appointmentclick:(id)sender {
    backview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    backview.backgroundColor = [UIColor blackColor];
    backview.alpha = 0.5;
    [self.view addSubview:backview];

    apview = [[[NSBundle mainBundle]loadNibNamed:@"apiontview" owner:nil options:nil] lastObject];
    apview.frame = CGRectMake(25, 180, 270, 158);
    apview.backgroundColor = [UIColor whiteColor];
    apview.delegate = self;
    [self.view addSubview:apview];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [apview removeFromSuperview];
    [backview removeFromSuperview];
}
-(void)clickSMbutton:(id)sender
{
    [apview removeFromSuperview];
    [backview removeFromSuperview];
    doorserviceController *door = [[doorserviceController alloc]initWithNibName:@"doorserviceController" bundle:nil];
    door.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:door animated:YES];
}
-(void)clickYYbutton:(id)sender
{
    [apview removeFromSuperview];
    [backview removeFromSuperview];
    TodoorViewController *todoor = [[TodoorViewController alloc]initWithNibName:@"TodoorViewController" bundle:nil];
    todoor.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:todoor animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
