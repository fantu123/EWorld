//
//  RootallViewController.h
//  EWorld
//
//  Created by mac on 15/4/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseViewController.h"
#import "JRNavgationBar.h"
#import "TableView.h"
#import "const.h"

@interface RootallViewController : BaseViewController<JRNavDelegate,TableViewDelegate>
{
    JRNavgationBar * navBar;
    TableView * mytableview;
    NSMutableArray * arraydata;
}
@property(retain,nonatomic)NSString * navtitie;
@property(retain,nonatomic)NSString * isselect;

@end
