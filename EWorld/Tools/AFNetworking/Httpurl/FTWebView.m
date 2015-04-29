//
//  RDWebView.m
//  SevenStars
//
//  Created by elongtian on 14-7-1.
//  Copyright (c) 2014年 lihui. All rights reserved.
//

#import "FTWebView.h"

@implementation FTWebView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _indicatorView = [[ActivityIndicator alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) LabelText:nil withdelegate:nil withType:ActivityIndicatorDefault andAction:nil];
        [self addSubview:_indicatorView];
        [_indicatorView startAnimatingActivit];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
