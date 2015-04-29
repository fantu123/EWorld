//
//  apiontview.h
//  EWorld
//
//  Created by mac on 15/4/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol clickButtonDelegate <NSObject>

- (void)clickSMbutton:(id)sender;
- (void)clickYYbutton:(id)sender;

@end

@interface apiontview : UIView
@property (assign, nonatomic) id<clickButtonDelegate>delegate;


@end
