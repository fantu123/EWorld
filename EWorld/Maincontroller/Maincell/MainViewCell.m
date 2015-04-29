//
//  MainViewCell.m
//  EWorld
//
//  Created by mac on 15/4/22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "MainViewCell.h"

@implementation MainViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)clickbeutybutton:(id)sender {
    NSLog(@"点击E美丽");
    [self.superview sendSubviewToBack:self];
    if ([_delegate respondsToSelector:@selector(didCellClickedeplbutton:)]) {
        [_delegate didCellClickedeplbutton:self];
    }
}
- (IBAction)clickgongyibutton:(id)sender {
    NSLog(@"点击公益服务");
    [self.superview sendSubviewToBack:self];
    if ([_delegate respondsToSelector:@selector(didCellClickedeplbutton:)]) {
        [_delegate didCellClickedgongyibutton:self];
    }
}
- (IBAction)clickotherbutton:(id)sender {
    NSLog(@"点击其他");
    [self.superview sendSubviewToBack:self];
    if ([_delegate respondsToSelector:@selector(didCellClickedeplbutton:)]) {
        [_delegate didCellClickedotherbutton:self];
    }
}
- (IBAction)clickedubutton:(id)sender {
    NSLog(@"点击教育");
    [self.superview sendSubviewToBack:self];
    if ([_delegate respondsToSelector:@selector(didCellClickedeplbutton:)]) {
        [_delegate didCellClickededubutton:self];
    }
}

@end
