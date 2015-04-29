//
//  alterviewView.h
//  EWorld
//
//  Created by mac on 15/4/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol clickalterDelegate <NSObject>

- (void)clickokbutton:(id)sender;

@end

@interface alterviewView : UIView
@property (weak, nonatomic) IBOutlet UILabel *labletitle;
@property (weak, nonatomic) IBOutlet UIButton *clickokbtn;
@property (assign, nonatomic) id<clickalterDelegate>delegate;

@end
