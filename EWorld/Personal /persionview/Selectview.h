//
//  Selectview.h
//  EWorld
//
//  Created by mac on 15/4/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol clickBtnViewDelegate <NSObject>

- (void)selectALbutton:(id)sender;
- (void)selectSCbutton:(id)sender;
- (void)selectFWbutton:(id)sender;

@end

@interface Selectview : UIView
{
    UIButton * button;
    UIButton * button1;
    UIButton * button2;
}

@property (assign, nonatomic) id<clickBtnViewDelegate>delegate;



@end
