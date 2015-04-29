//
//  RootViewController.h
//  EWorld
//
//  Created by mac on 15/4/22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseViewController.h"
#import "JRNavgationBar.h"
#import "const.h"
#import "Widecell.h"
#import "OneCell.h"
#import "TwoCell.h"
#import "ThreeCell.h"
#import "RootallViewController.h"
#import "UItabBarViewController.h"

@interface RootViewController : BaseViewController<JRNavDelegate,widecelldelegate,onecelldelegate,threecelldelegate,twocelldelegate>
{
    JRNavgationBar * navBar;
    UITableView * mytableview;
    NSMutableArray * arraydata;
}

@end
