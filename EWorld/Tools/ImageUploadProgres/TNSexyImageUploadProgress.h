//
//  SelecthelperViewController.m
//  sky
//
//  Created by RDHS on 15/3/28.
//  Copyright (c) 2015年 RD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

extern NSString * const IMAGE_UPLOAD_COMPLETED;

@interface TNSexyImageUploadProgress : UIView

@property (nonatomic) float progress;
@property (nonatomic) NSUInteger radius;
@property (nonatomic) NSUInteger progressBorderThickness;

@property (nonatomic, strong) UIImage *imageToUpload;

@property (nonatomic, strong) UIColor *trackColor;
@property (nonatomic, strong) UIColor *progressColor;

@property (nonatomic) BOOL showOverlay;

- (void)show;

@end
