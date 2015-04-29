//
//  DetailViewController.h
//  EWorld
//
//  Created by mac on 15/4/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseViewController.h"
#import "JRNavgationBar.h"
#import "const.h"
#import "apiontview.h"
@interface DetailViewController : BaseViewController<JRNavDelegate,clickButtonDelegate>
{
    JRNavgationBar * navBar;
    apiontview * apview;
    UIView * backview;
}

@end
