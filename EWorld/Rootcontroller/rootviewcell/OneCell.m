//
//  OneCell.m
//  EWorld
//
//  Created by mac on 15/4/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "OneCell.h"

@implementation OneCell
@synthesize delegate;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)clicktwobtn:(id)sender {
    
    [self.superview sendSubviewToBack:self];
    if ([delegate respondsToSelector:@selector(firtwobtnclick:)]) {
        [delegate firtwobtnclick:self];
    }
    
}
- (IBAction)clickonebtn:(id)sender {
    [self.superview sendSubviewToBack:self];
    if ([delegate respondsToSelector:@selector(fironebtnclick:)]) {
        [delegate fironebtnclick:self];
    }

    
}

@end
