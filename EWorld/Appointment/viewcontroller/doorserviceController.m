//
//  doorserviceController.m
//  EWorld
//
//  Created by mac on 15/4/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "doorserviceController.h"
#import "MyaddressViewController.h"

@interface doorserviceController ()

@end

@implementation doorserviceController
-(void)viewWillAppear:(BOOL)animated
{
    self.maptext.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"maptext"];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"maptext"];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.alpha=1;
    navBar = [[JRNavgationBar alloc]initWithFrame:CGRectMake(0,0, SCREENWIDTH, NAVHEIGHT) Option:JRNAVGATIONDEFAULTBAR];
    navBar.isroot = YES;
    navBar.delegate = self;
    navBar.setbtn.hidden = YES;
    navBar.homebtn.hidden =YES;
    navBar.titleLabel.text = @"到店服务";
    [self.view addSubview:navBar];
    
    self.phonetext.keyboardType =UIKeyboardTypePhonePad;
    self.timetext.tag=1002;
    self.maptext.tag =1003;
    
    self.phonetext.delegate=self;
    self.timetext.delegate =self;
    self.maptext.delegate=self;
    
    self.determinbtn.hidden= YES;
    self.cancelbtn.hidden=YES;
    self.doorbackview.hidden =YES;
    self.doordatepicker.hidden=YES;
    
}
-(void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)determinclick:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterFullStyle];
    dateFormatter.dateFormat = @"yyyy-MM-dd EEEE";
    NSString* dateString = [dateFormatter stringFromDate:self.doordatepicker.date];
    NSString* strLanguage = [[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] objectAtIndex:0];
    NSLocale *gbLocale = [[NSLocale alloc]initWithLocaleIdentifier:strLanguage];
    [dateFormatter setLocale:gbLocale];
    self.timetext.text = [NSString stringWithFormat:@"%@",dateString];
    
    self.doordatepicker.hidden=YES;
    self.doorbackview.hidden =YES;
    self.determinbtn.hidden= YES;
    self.cancelbtn.hidden=YES;
}
- (IBAction)cancelclickbtn:(id)sender {
    
    self.doorbackview.hidden =YES;
    self.doordatepicker.hidden=YES;
    self.determinbtn.hidden= YES;
    self.cancelbtn.hidden=YES;
}
#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    //如果当前要显示的键盘，那么把UIDatePicker（如果在视图中）隐藏
    if (textField.tag == 1002) {
        self.determinbtn.hidden= NO;
        self.cancelbtn.hidden=NO;
        self.doorbackview.hidden =NO;
        self.doordatepicker.hidden=NO;
        return NO;
    }
    else if(textField.tag == 1003)
    {
        NSLog(@"跳转到选择地址界面");
        MyaddressViewController * myaddress = [[MyaddressViewController alloc]initWithNibName:@"MyaddressViewController" bundle:nil];
        [self.navigationController pushViewController:myaddress animated:YES];
        return NO;
    }
    else
    {
       self.doordatepicker.hidden=YES;
        return YES;
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.phonetext resignFirstResponder];
    self.determinbtn.hidden= YES;
    self.cancelbtn.hidden=YES;
    self.doorbackview.hidden =YES;
    self.doordatepicker.hidden=YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
