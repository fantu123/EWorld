//
//  MyaddressViewController.m
//  EWorld
//
//  Created by mac on 15/4/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "MyaddressViewController.h"

@interface MyaddressViewController ()

@end

@implementation MyaddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    navBar = [[JRNavgationBar alloc]initWithFrame:CGRectMake(0,0, SCREENWIDTH, NAVHEIGHT) Option:JRNAVGATIONDEFAULTBAR];
    navBar.isroot = YES;
    navBar.delegate = self;
    navBar.setbtn.hidden = YES;
    navBar.homebtn.hidden =YES;
    navBar.titleLabel.text = @"上门服务";
    [self.view addSubview:navBar];
    self.maptextview.delegate= self;
    self.maptextview.returnKeyType = UIReturnKeyNext;
}
- (IBAction)clickbtnclick:(id)sender {
    
    [[NSUserDefaults standardUserDefaults]setObject:self.maptextview.text forKey:@"maptext"];
    [self.navigationController popViewControllerAnimated:YES];
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (self.maptextview.text.length==0){//textview长度为0
        if ([text isEqualToString:@""]) {//判断是否为删除键
            self.mapimageview.hidden=NO;
            self.lablepload.hidden=NO;//隐藏文字
        }else{
            self.mapimageview.hidden=YES;
            self.lablepload.hidden=YES;
        }
    }else{//textview长度不为0
        if (self.maptextview.text.length==1){//textview长度为1时候
            if ([text isEqualToString:@""]) {//判断是否为删除键
                self.mapimageview.hidden=NO;
                self.lablepload.hidden=NO;
            }else{//不是删除
                self.mapimageview.hidden=YES;
                self.lablepload.hidden=YES;
            }
        }else{//长度不为1时候
            self.mapimageview.hidden=YES;
            self.lablepload.hidden=YES;
        }
    }
    return YES;
}
#pragma mark - UITextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    
    if (textView.text.length==0){//textview长度为0
        //        if ([text isEqualToString:@""]) {//判断是否为删除键
        self.mapimageview.hidden=NO;
        self.lablepload.hidden=NO;//隐藏文字
    }else{
        self.mapimageview.hidden=YES;
        self.lablepload.hidden=YES;
    }
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.maptextview resignFirstResponder];
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
