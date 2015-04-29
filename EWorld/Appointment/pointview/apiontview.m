//
//  apiontview.m
//  EWorld
//
//  Created by mac on 15/4/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "apiontview.h"

@implementation apiontview
@synthesize delegate;

#pragma mark  点击上门服务
- (IBAction)shbuttonclick:(id)sender {
    NSLog(@"上门服务");
    [self.superview sendSubviewToBack:self];
    if ([delegate respondsToSelector:@selector(clickSMbutton:)]) {
        [delegate clickSMbutton:self];
    }
}
#pragma mark 点击到店服务
- (IBAction)yybuttonclick:(id)sender {
    NSLog(@"到店服务");
    [self.superview sendSubviewToBack:self];
    if ([delegate respondsToSelector:@selector(clickYYbutton:)]) {
        [delegate clickYYbutton:self];
    }
}

@end
