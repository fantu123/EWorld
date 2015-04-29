//
//  TodoorViewController.m
//  EWorld
//
//  Created by mac on 15/4/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "TodoorViewController.h"

@interface TodoorViewController ()

@end

@implementation TodoorViewController

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
    self.textphone.delegate =self;
    self.texttime.delegate =self;
    
    self.texttime.tag = 1001;
    
    self.textphone.keyboardType = UIKeyboardTypePhonePad;
    self.backview.hidden = YES;
    self.datepick.hidden = YES;
    self.determinebutton.hidden= YES;
    self.cancelButton.hidden=YES;
    
}
-(void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)determinclick:(id)sender {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterFullStyle];
    dateFormatter.dateFormat = @"yyyy-MM-dd EEEE";
    NSString* dateString = [dateFormatter stringFromDate:self.datepick.date];
    NSString* strLanguage = [[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] objectAtIndex:0];
    NSLocale *gbLocale = [[NSLocale alloc]initWithLocaleIdentifier:strLanguage];
    [dateFormatter setLocale:gbLocale];
    self.texttime.text = [NSString stringWithFormat:@"%@",dateString];
    
    self.datepick.hidden=YES;
    self.backview.hidden =YES;
    self.determinebutton.hidden= YES;
    self.cancelButton.hidden=YES;
}
- (IBAction)cancleclick:(id)sender {
    
    self.backview.hidden =YES;
    self.datepick.hidden=YES;
    self.determinebutton.hidden= YES;
    self.cancelButton.hidden= YES;
}
#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    //如果当前要显示的键盘，那么把UIDatePicker（如果在视图中）隐藏
    if (textField.tag != 1001) {
       
        self.datepick.hidden=YES;
        return YES;
    }
    else{
        self.determinebutton.hidden= NO;
        self.cancelButton.hidden=NO;
        self.backview.hidden =NO;
        self.datepick.hidden=NO;
        return NO;
    }
//      return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.textphone resignFirstResponder];
    self.backview.hidden = YES;
    self.datepick.hidden= YES;
    self.determinebutton.hidden= YES;
    self.cancelButton.hidden=YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
