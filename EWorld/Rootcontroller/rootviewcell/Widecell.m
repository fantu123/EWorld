//
//  Widecell.m
//  EWorld
//
//  Created by mac on 15/4/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "Widecell.h"

@implementation Widecell
@synthesize delegate;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)btnclictbtn:(id)sender {
    [self.superview sendSubviewToBack:self];
    if ([delegate respondsToSelector:@selector(whonebtnclick:)]) {
        [delegate whonebtnclick:self];
    }
}

@end
