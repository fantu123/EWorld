//
//  MyaddressViewController.h
//  EWorld
//
//  Created by mac on 15/4/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseViewController.h"
#import "JRNavgationBar.h"
#import "const.h"

@interface MyaddressViewController : BaseViewController<JRNavDelegate,UITextViewDelegate>
{
    JRNavgationBar * navBar;
}
@property (weak, nonatomic) IBOutlet UIImageView *mapimageview;
@property (weak, nonatomic) IBOutlet UILabel *lablepload;
@property (weak, nonatomic) IBOutlet UITextView *maptextview;

@end
