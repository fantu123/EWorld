//
//  ActivityIndicator.h
//  Si Gema
//
//  Created by 瑞德 on 13-7-17.
//  Copyright (c) 2013年 瑞德. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import"ReSponSeImageV.h"
typedef enum {
    
    ActivityIndicatorDefault,//默认，
    
    ActivityIndicatorLogin//登录，注册，订单提交，背景透明
    
    
    
}ActivityIndicatorType;

@interface ActivityIndicator : UIView{
    
    UIActivityIndicatorView *refreshSpinner;
    UILabel * _refeshSpLabel;
    UIButton * Imageview_;
    UIView * bgView;
    UIView * view;
}
@property (nonatomic,retain) UIView * bgView;
@property (nonatomic,retain) UILabel * _refeshSpLabel;
@property (nonatomic,retain) UIActivityIndicatorView * refreshSpinner;
@property (nonatomic,retain) UIButton * Imageview_;
@property (nonatomic,retain) id delegate;
@property (nonatomic,retain) UIView * view;
- (id)initWithFrame:(CGRect)frame LabelText:(NSString *)Ltext withdelegate:(id)dele withType:(ActivityIndicatorType)type andAction:(SEL)action;
- (void)startAnimatingActivit;
- (void)stopAnimationgActivit;
-(void)addImage:(UIImage *)image;
-(void)LoadSuccess;
-(void)LoadFailed;
- (void)changeBgFrame:(CGRect)rect;
- (void)NoResults;
- (void)activityHidden;
@end
