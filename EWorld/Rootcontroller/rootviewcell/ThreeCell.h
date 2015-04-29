//
//  ThreeCell.h
//  EWorld
//
//  Created by mac on 15/4/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol threecelldelegate <NSObject>

-(void)thonebtnclick:(id)sender;
-(void)thtwobtnclick:(id)sender;

@end
@interface ThreeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *thlableone;
@property (weak, nonatomic) IBOutlet UILabel *thlabletwo;
@property (assign, nonatomic) id<threecelldelegate>delegate;
@end
