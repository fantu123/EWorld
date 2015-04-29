//
//  TNChannelItem.h
//  EnterAppTs
//
//  Created by LH on 13-9-24.
//  Copyright (c) 2013年 LH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TagItem : NSObject
@property (retain, nonatomic) NSString * auto_id;
@property (retain, nonatomic) NSString * auto_code;
@property (retain, nonatomic) NSString * option_id;
@property (retain, nonatomic) NSString * modules_img;
@property (retain, nonatomic) NSString * modules_name;
@property (assign, nonatomic) NSInteger more;
@property (assign, nonatomic) BOOL did_taped;
@property (retain, nonatomic) NSString * modules_ctype;
@end 
