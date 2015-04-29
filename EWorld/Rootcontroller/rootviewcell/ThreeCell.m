//
//  ThreeCell.m
//  EWorld
//
//  Created by mac on 15/4/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ThreeCell.h"

@implementation ThreeCell
@synthesize delegate;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)thbtnclick:(id)sender {
    [self.superview sendSubviewToBack:self];
    if ([delegate respondsToSelector:@selector(thtwobtnclick:)]) {
        [delegate thtwobtnclick:self];
    }
}
- (IBAction)thbtnclicktwo:(id)sender {
    [self.superview sendSubviewToBack:self];
    if ([delegate respondsToSelector:@selector(thtwobtnclick:)]) {
        [delegate thtwobtnclick:self];
    }
}

@end
