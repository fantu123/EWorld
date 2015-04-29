//
//  doorserviceController.h
//  EWorld
//
//  Created by mac on 15/4/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseViewController.h"
#import "JRNavgationBar.h"
#import "const.h"
@interface doorserviceController : BaseViewController<JRNavDelegate,UITextFieldDelegate,UIPickerViewDelegate>
{
    JRNavgationBar* navBar;
}
@property (weak, nonatomic) IBOutlet UITextField *timetext;
@property (weak, nonatomic) IBOutlet UITextField *maptext;
@property (weak, nonatomic) IBOutlet UITextField *phonetext;
@property (weak, nonatomic) IBOutlet UIView *doorbackview;
@property (weak, nonatomic) IBOutlet UIDatePicker *doordatepicker;
@property (weak, nonatomic) IBOutlet UIButton *determinbtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelbtn;

@end
