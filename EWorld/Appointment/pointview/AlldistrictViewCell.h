//
//  AlldistrictViewCell.h
//  EWorld
//
//  Created by mac on 15/4/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlldistrictViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *citylable;
@property (weak, nonatomic) IBOutlet UIButton *selectbtn;

@property (weak, nonatomic) IBOutlet UIButton *selectnextbtn;
@property (weak, nonatomic) IBOutlet UILabel *citynextlable;
@end
