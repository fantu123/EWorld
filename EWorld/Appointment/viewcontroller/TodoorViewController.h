//
//  TodoorViewController.h
//  EWorld
//
//  Created by mac on 15/4/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseViewController.h"
#import "JRNavgationBar.h"
#import "const.h"

@interface TodoorViewController : BaseViewController<JRNavDelegate,UITextFieldDelegate,UIPickerViewDelegate>
{
    JRNavgationBar *navBar;
}
@property (weak, nonatomic) IBOutlet UITextField *textphone;
@property (weak, nonatomic) IBOutlet UITextField *texttime;
@property (weak, nonatomic) IBOutlet UIView *backview;

@property (weak, nonatomic) IBOutlet UIDatePicker *datepick;
@property (weak, nonatomic) IBOutlet UIButton *determinebutton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@end
