//
//  TwoCell.h
//  EWorld
//
//  Created by mac on 15/4/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol twocelldelegate <NSObject>

-(void)seonebtnclick:(id)sender;
-(void)setwobtnclick:(id)sender;

@end
@interface TwoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *teonebtn;
@property (weak, nonatomic) IBOutlet UIButton *twtwbtn;
@property (weak, nonatomic) IBOutlet UILabel *nameone;
@property (weak, nonatomic) IBOutlet UILabel *nametwo;
@property (assign, nonatomic) id<twocelldelegate>delegate;
@end
