//
//  alterviewView.m
//  EWorld
//
//  Created by mac on 15/4/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "alterviewView.h"

@implementation alterviewView
@synthesize delegate;
- (IBAction)clickbtnok:(id)sender {
    
    [self.superview sendSubviewToBack:self];
    if ([delegate respondsToSelector:@selector(clickokbutton:)]) {
        [delegate clickokbutton:self];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
