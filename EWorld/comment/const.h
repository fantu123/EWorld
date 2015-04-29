//
//  const.h
//  sky
//
//  Created by RDHS on 15/1/14.
//  Copyright (c) 2015年 RD. All rights reserved.
//
//宏定义

//#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)


#define SCREENWIDTH  CGRectGetWidth([[UIScreen mainScreen] bounds])
//屏幕高度
#define SCREENHEIGHT CGRectGetHeight([[UIScreen mainScreen] bounds])


//#define SCREENWIDTH      CGRectGetWidth([UIScreen mainScreen].bounds)
//#define SCREENHEIGHT      CGRectGetHeight([UIScreen mainScreen].bounds)

#define DELE [[UIApplication sharedApplication] delegate]
#define IOS7 [[[[UIDevice currentDevice] systemVersion] substringToIndex:1] intValue]>=7

#define NSLogFrame(v) NSLog(@"%f,%f,%f,%f",v.frame.origin.x,v.frame.origin.y,v.frame.size.width,v.frame.size.height);

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define IOS7 [[[[UIDevice currentDevice] systemVersion] substringToIndex:1] intValue]>=7
#define NAVHEIGHT (IOS7?64:44)


#ifndef __IPHONE_5_0
#warning "This project uses features only available in iOS SDK 5.0 and later."
#endif

#ifdef __OBJC__
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#endif


#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


//http://182.92.189.166:8080/index.php?r=user/register

//#define KEY_USER_NAME  @"user_name"
//
//#define REGISTER_URL  @"http://182.92.189.166:8080/index.php?r=user/register"
////
//#define LOGIN_URL @"http://182.92.189.166:8080/index.php?r=user/login"
////
//#define SERVER_URL  @"http://182.92.189.166:8080/index.php?r="
//
//#define REMOTE_HOST_NAME  @"www.4helper.com"
//

#define RET_SUCCESS  @"0"
#define RET_NOT_POST_REQUEST  @"1"
#define RET_BAD_REQUEST_PARAM  @"2"
#define RET_BAD_SIGNATURE  @"3"
#define RET_INVALID_USER  @"4"
#define RET_INVALID_ACCESS_TOKEN  @"5"
#define RET_UNKNOWN_ERR  @"6"
#define RET_TARGET_ERR_START  @"1000"
#define RET_HELPER_ERR_START  @"2000"

const int HELPER_STATUS_NORMAL = 0;
const int SUCCESS = 1;
const int FAILED = 0;
const int LIST_COUNT = 100;
const int BATCH_INSERT_COUNT = 1000;

//将null 转换为nil
#define NULL_TO_NIL(obj) ({ __typeof__ (obj) __obj = (obj); __obj == [NSNull null] ? nil : obj; })



#define BackGround_Color UIColorFromRGB(0xf0f1f1)
//头文件
#import <UIKit/UIKit.h>


//Base/Tools
#import "UIImageView+AFNetworking.h"
//#import "UIImage+Expland.h"
#import "Tools.h"
//#import "UItabBarViewController.h"
#import "NSString+URLEncoding.h"
#import "Reachability.h"
#import "AFNetworking.h"
//#import "RDHttpRequestOperation.h"
#import "NSString+URLEncoding.h"
//#import "JRNavgationBar.h"
#import "TYDotIndicatorView.h"



