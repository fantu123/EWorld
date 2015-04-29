//
//  TYDotIndicatorView.h
//  TYDotIndicatorView
//
//  Created by RD on 15-03-25.
//  Copyright (c) 2015年 RD. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TYDotIndicatorViewStyle)
{
    TYDotIndicatorViewStyleSquare,
    TYDotIndicatorViewStyleRound,
    TYDotIndicatorViewStyleCircle
};

@interface TYDotIndicatorView : UIView

- (id)initWithFrame:(CGRect)frame
           dotStyle:(TYDotIndicatorViewStyle)style
           dotColor:(UIColor *)dotColor
            dotSize:(CGSize)dotSize;

- (void)startAnimating;
- (void)stopAnimating;
- (BOOL)isAnimating;


@end
