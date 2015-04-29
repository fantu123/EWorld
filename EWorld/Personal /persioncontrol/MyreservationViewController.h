//
//  MyreservationViewController.h
//  EWorld
//
//  Created by mac on 15/4/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseViewController.h"
#import "JRNavgationBar.h"
#import "const.h"
#import "MyreservationViewCell.h"
#import "Selectview.h"
#import "TableView.h"
@interface MyreservationViewController : BaseViewController<JRNavDelegate,clickBtnViewDelegate,TableViewDelegate>
{
    JRNavgationBar * navBar;
    TableView * mytableview;
    Selectview * isselectview;
}

@end
