//
//  SegmentBUtton.m
//  EWorld
//
//  Created by mac on 15/4/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "SegmentBUtton.h"

#define BACKVIEW_COLOR [UIColor  colorWithRed:196.0/255.0 green:196.0/255.0 blue:196.0/255.0 alpha:1]
#define COMMIT_COLOR [UIColor colorWithRed:111.0/255.0 green:111.0/255.0 blue:111.0/255.0 alpha:1.0]

@implementation SegmentBUtton
@synthesize TJimageview;
@synthesize SQimageview;
@synthesize XDimageview;
@synthesize delegate;
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = BACKVIEW_COLOR;
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 90, 40);
        [button setTitle:@"推荐店铺" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickTJ:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        TJimageview = [[UIImageView alloc]initWithFrame:CGRectMake(85, 15, 20, 13)];
        [TJimageview setImage:[UIImage imageNamed:@"downimage.png"]];
        [button addSubview:TJimageview];
        
        
        UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        button1.frame = CGRectMake(100, 0, 90, 40);
        [button1 setTitle:@"个人小店" forState:UIControlStateNormal];
        [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button1 addTarget:self action:@selector(clickXD:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button1];
        
        XDimageview = [[UIImageView alloc]initWithFrame:CGRectMake(85, 15, 20, 13)];
        [XDimageview setImage:[UIImage imageNamed:@"top.png"]];
        [button1 addSubview:XDimageview];
        
        
        UIButton * button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        button2.frame = CGRectMake(210, 0, 90, 40);
        [button2 setTitle:@"附近商圈" forState:UIControlStateNormal];
        [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button2 addTarget:self action:@selector(clickSQ:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button2];
        SQimageview = [[UIImageView alloc]initWithFrame:CGRectMake(85, 15, 20, 13)];
        [SQimageview setImage:[UIImage imageNamed:@"top.png"]];
        [button2 addSubview:SQimageview];
        
    }
    return self;
}
#pragma mark  点击推荐店铺
-(void)clickTJ:(id)sender{
    NSLog(@"推荐店铺");
    [self.superview sendSubviewToBack:self];
    
    [XDimageview setImage:[UIImage imageNamed:@"top.png"]];
    
    [SQimageview setImage:[UIImage imageNamed:@"top.png"]];
    
    [TJimageview setImage:[UIImage imageNamed:@"downimage.png"]];
    
    if ([delegate respondsToSelector:@selector(selectTJbutton:)]) {
        [delegate selectTJbutton:self];
    }
}

#pragma mark 点击个人小店
-(void)clickXD:(id)sender{
    NSLog(@"个人小店");
    [self.superview sendSubviewToBack:self];
    
 
    [XDimageview setImage:[UIImage imageNamed:@"downimage.png"]];

    [SQimageview setImage:[UIImage imageNamed:@"top.png"]];
    
    [TJimageview setImage:[UIImage imageNamed:@"top.png"]];
    
    if ([delegate respondsToSelector:@selector(selectXDbutton:)]) {
        [delegate selectXDbutton:self];
    }
}
#pragma mark 点击附近商圈
-(void)clickSQ:(id)aSender
{
    [XDimageview setImage:[UIImage imageNamed:@"top.png"]];
    
    [SQimageview setImage:[UIImage imageNamed:@"downimage.png"]];
    
    [TJimageview setImage:[UIImage imageNamed:@"top.png"]];
    
    [self.superview sendSubviewToBack:self];
    if ([delegate respondsToSelector:@selector(selectSQbutton:)]) {
        [delegate selectSQbutton:self];
    }
}

@end
