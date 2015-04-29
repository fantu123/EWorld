//
//  AppointViewController.h
//  EWorld
//
//  Created by mac on 15/4/22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseViewController.h"
#import "JRNavgationBar.h"
#import "const.h"
#import "SegmentBUtton.h"
#import "TableView.h"

@interface AppointViewController : BaseViewController<JRNavDelegate,clickButtonViewDelegate,TableViewDelegate,UITextFieldDelegate>
{
    JRNavgationBar * navBar;
    TableView * mytableview;
    NSString * selectclass;
    UITableView * sqtableview;
    UITableView * cttableview;
    UITextField * textfiled;
    NSMutableArray * cityarray;
}
@property (retain, nonatomic) SegmentBUtton * segbutton;

@end
