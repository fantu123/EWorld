//
//  MainViewCell.h
//  EWorld
//
//  Created by mac on 15/4/22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MaincellDelegate <NSObject>


-(void)didCellClickedeplbutton:(id)aSender;
-(void)didCellClickedgongyibutton:(id)aSender;

-(void)didCellClickededubutton:(id)aSender;
-(void)didCellClickedotherbutton:(id)aSender;

@end


@interface MainViewCell : UITableViewCell

@property (nonatomic,assign) id<MaincellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIButton *eplbutton;
@property (weak, nonatomic) IBOutlet UIButton *gongyibutton;
@property (weak, nonatomic) IBOutlet UIButton *edubutton;
@property (weak, nonatomic) IBOutlet UIButton *otherbutton;

@end
