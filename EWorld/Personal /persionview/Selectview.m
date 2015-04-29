//
//  Selectview.m
//  EWorld
//
//  Created by mac on 15/4/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "Selectview.h"

#define BACKVIEW_COLOR [UIColor  colorWithRed:196.0/255.0 green:196.0/255.0 blue:196.0/255.0 alpha:1]
#define COMMIT_COLOR [UIColor colorWithRed:242.0/255.0 green:117.0/255.0 blue:89.0/255.0 alpha:1.0]

@implementation Selectview

@synthesize delegate;
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = BACKVIEW_COLOR;
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(10, 0, 90, 40);
        [button setTitle:@"全部" forState:UIControlStateNormal];
        [button setTitleColor:COMMIT_COLOR forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"xuanxiangbeijing.png"]forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickALL:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        button1.frame = CGRectMake(110, 0, 90, 40);
        [button1 setTitle:@"预约成功" forState:UIControlStateNormal];
        [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button1 addTarget:self action:@selector(clickSC:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button1];
        
        button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        button2.frame = CGRectMake(220, 0, 90, 40);
        [button2 setTitle:@"服务完成" forState:UIControlStateNormal];
        [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button2 addTarget:self action:@selector(clickFW:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button2];
        
    }
    return self;
}
#pragma mark  全部
-(void)clickALL:(id)sender{
    NSLog(@"全部");
     [button setTitleColor:COMMIT_COLOR forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"xuanxiangbeijing.png"]forState:UIControlStateNormal];
    [button2 setBackgroundImage:nil forState:UIControlStateNormal];
    [button1 setBackgroundImage:nil forState:UIControlStateNormal];
    
     [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
     [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.superview sendSubviewToBack:self];
    if ([delegate respondsToSelector:@selector(selectALbutton:)]) {
        [delegate selectALbutton:self];
    }
}

#pragma mark 点击预约成功
-(void)clickSC:(id)sender{
    NSLog(@"预约成功");
     [button1 setBackgroundImage:[UIImage imageNamed:@"xuanxiangbeijing.png"]forState:UIControlStateNormal];
    [button setBackgroundImage:nil forState:UIControlStateNormal];
    [button2 setBackgroundImage:nil forState:UIControlStateNormal];
    
    [button1 setTitleColor:COMMIT_COLOR forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.superview sendSubviewToBack:self];
    if ([delegate respondsToSelector:@selector(selectSCbutton:)]) {
        [delegate selectSCbutton:self];
    }
}
#pragma mark 点击服务完成
-(void)clickFW:(id)aSender
{
    NSLog(@"服务完成");
     [button2 setBackgroundImage:[UIImage imageNamed:@"xuanxiangbeijing.png"]forState:UIControlStateNormal];
    [button setBackgroundImage:nil forState:UIControlStateNormal];
    [button1 setBackgroundImage:nil forState:UIControlStateNormal];
    
    [button2 setTitleColor:COMMIT_COLOR forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.superview sendSubviewToBack:self];
    if ([delegate respondsToSelector:@selector(selectFWbutton:)]) {
        [delegate selectFWbutton:self];
    }
}


@end
