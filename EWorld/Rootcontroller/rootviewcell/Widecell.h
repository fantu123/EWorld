//
//  Widecell.h
//  EWorld
//
//  Created by mac on 15/4/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol widecelldelegate <NSObject>

-(void)whonebtnclick:(id)sender;

@end
@interface Widecell : UITableViewCell
@property (assign, nonatomic) id<widecelldelegate>delegate;

@end
