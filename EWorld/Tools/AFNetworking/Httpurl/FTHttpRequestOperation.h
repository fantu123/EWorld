//
//  RDHttpRequestOperation.h
//  RdRequest
//
//  Created by elongtian on 14-5-22.
//  Copyright (c) 2014年 ruide. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "TNSexyImageUploadProgress.h"


@interface FTHttpRequestOperation : AFHTTPRequestOperationManager


@property (nonatomic, strong) TNSexyImageUploadProgress *imageUploadProgress;


+ (instancetype)sharedClient;
//-(void)downurl:(NSString*)url dict:(NSDictionary*)dic NSNotification:(NSString*)note;
//-(void)NSNotificationCenter:(NSMutableDictionary*)datadict NSNotification:(NSString*)notecenter;

//上传文件
//-(void)downurl:(NSString*)url dict:(NSMutableDictionary*)data NSNotification:(NSString*)note filedata:(NSData *)filedatas imageupdow:(UIImage*)selectimage;
//-(void)NSNotificationfile:(NSMutableDictionary*)datadict NSNotification:(NSString*)notecenterfile;
//-(NSString*)Encryptionimage;
@end
