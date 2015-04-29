//
//  SegmentBUtton.h
//  EWorld
//
//  Created by mac on 15/4/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol clickButtonViewDelegate <NSObject>

- (void)selectTJbutton:(id)sender;
- (void)selectXDbutton:(id)sender;
- (void)selectSQbutton:(id)sender;

@end

@interface SegmentBUtton : UIView

@property (retain,nonatomic) UIImageView * TJimageview;
@property (retain,nonatomic) UIImageView * XDimageview;
@property (assign, nonatomic) id<clickButtonViewDelegate>delegate;
@property (retain, nonatomic) UIImageView * SQimageview;

@end
