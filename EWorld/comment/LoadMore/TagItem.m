//
//  TNChannelItem.m
//  EnterAppTs
//
//  Created by LH on 13-9-24.
//  Copyright (c) 2013年 LH. All rights reserved.
//

#import "TagItem.h"

@implementation TagItem
@synthesize auto_id;
@synthesize modules_img;
@synthesize modules_name;
@synthesize option_id;
@synthesize auto_code;
@synthesize more;
@synthesize did_taped;
@synthesize modules_ctype;
- (void)dealloc
{
    self.modules_ctype = nil;
    self.auto_id = nil;
    self.modules_img = nil;
    self.modules_name = nil;
    self.option_id = nil;
    self.auto_code = nil;
    [super dealloc];
    
}
@end
