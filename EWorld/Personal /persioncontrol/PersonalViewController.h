//
//  PersonalViewController.h
//  EWorld
//
//  Created by mac on 15/4/22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseViewController.h"
#import "JRNavgationBar.h"
#import "const.h"
#import "alterviewView.h"
@interface PersonalViewController : BaseViewController<JRNavDelegate,clickalterDelegate>
{
    JRNavgationBar * navBar;
    UITableView * mytableview;
    UIView * backviewalpa;
    alterviewView * alterview;
}

@end
