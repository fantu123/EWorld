//
//  TwoCell.m
//  EWorld
//
//  Created by mac on 15/4/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "TwoCell.h"

@implementation TwoCell
@synthesize delegate;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)twbtnone:(id)sender {
    [self.superview sendSubviewToBack:self];
    if ([delegate respondsToSelector:@selector(seonebtnclick:)]) {
        [delegate seonebtnclick:self];
    }
    
}
- (IBAction)twbtntwo:(id)sender {
    [self.superview sendSubviewToBack:self];
    if ([delegate respondsToSelector:@selector(setwobtnclick:)]) {
        [delegate setwobtnclick:self];
    }
}

@end
