//
//  OneCell.h
//  EWorld
//
//  Created by mac on 15/4/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol onecelldelegate <NSObject>

-(void)fironebtnclick:(id)sender;

-(void)firtwobtnclick:(id)sender;

@end

@interface OneCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *onename;
@property (weak, nonatomic) IBOutlet UILabel *twoname;
@property (weak, nonatomic) IBOutlet UIButton *btnone;
@property (weak, nonatomic) IBOutlet UIButton *btntwo;
@property (assign, nonatomic) id<onecelldelegate>delegate;
@end
