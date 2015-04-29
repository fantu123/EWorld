

//
//  RDHttpRequestOperation.m
//  ruideRequest
//
//  Created by ruide on 14-5-22.
//  Copyright (c) 2014年 ruide. All rights reserved.
//

#import "FTHttpRequestOperation.h"
//#import "Utils.h"

@implementation FTHttpRequestOperation
+ (instancetype)sharedClient {
    static FTHttpRequestOperation *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [FTHttpRequestOperation manager];
        [_sharedClient setResponseSerializer:[AFJSONResponseSerializer serializer]];
        [[_sharedClient responseSerializer] setAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
        
    });
    return _sharedClient;
}
//-(void)downurl:(NSString*)url dict:(NSMutableDictionary*)data NSNotification:(NSString*)note
//{
//    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
//      //对上传的变量进行json封装在data变量下
////    
////    if ([note isEqualToString:@"memberurl"]) {
////        [parameters setObject:[data objectForKey:@"target_id"] forKey:@"target_id"];
////    }
////    else
////    {
//        NSError *error;
//        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:&error];
//        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//        [parameters setValue:jsonString forKey:@"data"];
////    }
//    //对 apptoken timestamp access_token  进行加密成signature的变量
//    NSDate * nowdata = [NSDate date];
//    NSTimeInterval  record_timeInterval = [nowdata timeIntervalSince1970];
//    NSString * accetoken=nil;
//    [parameters setValue:[NSString stringWithFormat:@"%.0lf",record_timeInterval]forKey:@"timestamp"]; //now date
//    if ([note isEqualToString:@"register"]) {//注册
//        accetoken= @"default_token";
//        [parameters setValue:@"default_token" forKey:@"access_token"];//default_token
//    }
//    else if ([note isEqualToString:@"loginnav"])//登陆
//    {
//        accetoken= @"default_token";
//        [parameters setValue:accetoken forKey:@"access_token"];
//        
//    }
//    else{//其他
//       [parameters setValue:[[NSUserDefaults standardUserDefaults]objectForKey:@"userid"]forKey:@"user_id"];
//        accetoken= [[NSUserDefaults standardUserDefaults]objectForKey:@"isaccesstoken"];
//        [parameters setValue:accetoken forKey:@"access_token"];
//    }
//    
//    NSString * timer = [NSString stringWithFormat:@"%.0lf",record_timeInterval];
//    NSArray *arrays =   [NSArray arrayWithObjects:accetoken, timer, @"readyGo1408.app_token@bj-china",nil];
//    NSArray *array2 = [arrays sortedArrayUsingSelector:@selector(compare:)];
//    NSString * isgnature = [NSString stringWithFormat:@"%@%@%@",[array2 objectAtIndex:0],[array2 objectAtIndex:1],[array2 objectAtIndex:2]];
//    
//    const char *cstr = [isgnature cStringUsingEncoding:NSUTF8StringEncoding];
//    NSData * datasgtrue = [NSData dataWithBytes:cstr length:isgnature.length];
//    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
//    CC_SHA1(datasgtrue.bytes,
//            (int)datasgtrue.length, digest);
//    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
//    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
//        [output appendFormat:@"%02x", digest[i]];
//    [parameters setValue:output forKey:@"signature"];
//
//    //对 apptoken timestamp access_token  进行加密成signature的变量
//    
//    AFHTTPRequestOperationManager *httpRequestOperationManager=[AFHTTPRequestOperationManager manager];
//    [httpRequestOperationManager POST:url parameters:parameters
//     
//                              success:^(AFHTTPRequestOperation *operation, id responseObject){
//                              NSMutableDictionary * datadic = (NSMutableDictionary*)responseObject;
//                                  NSString * str = [NSString stringWithFormat:@"%@",[datadic objectForKey:@"result"]];
//                                  if ([str isEqualToString:RET_SUCCESS]) {
//                                       [self NSNotificationCenter:datadic NSNotification:note];
//                                  }
//                                  else if ([str isEqualToString:RET_BAD_REQUEST_PARAM])
//                                  {
//                                      NSLog(@"请求的数据错误");
//                                  }
//                                 else if ([str isEqualToString:RET_INVALID_ACCESS_TOKEN]) {
//                                      NSLog(@"RET_INVALID_ACCESS_TOKEN");
//                                  }
//                                  
//                              }failure:^(AFHTTPRequestOperation *operation, NSError *error){
//                                  [Utils alertTitle:@"提示" message:@"请求失败" delegate:self cancelBtn:@"确定" otherBtnName:nil];
//                                  NSLog(@"AFHTTP请求失败");
//                              }];
//}
//-(void)NSNotificationCenter:(NSMutableDictionary*)datadict NSNotification:(NSString*)notecenter
//{
//    if (datadict==nil) {
//        NSLog(@"lihui");
//    }
//    else
//    {
//        NSLog(@"noti%@",datadict);
//        NSNotificationCenter * nc = [NSNotificationCenter defaultCenter];
//        //将内容封装到广播中 给ios系统发送广播
//        [nc postNotificationName:notecenter object:self userInfo:datadict];
//    }
//}
//
//-(void)downurl:(NSString*)url dict:(NSMutableDictionary*)data NSNotification:(NSString*)note filedata:(NSData *)filedatas imageupdow:(UIImage*)selectimage
//{
//    
//    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
//    //对上传的变量进行json封装在data变量下
//    //对 apptoken timestamp access_token  进行加密成signature的变量
//    NSDate * nowdata = [NSDate date];
//    NSTimeInterval  record_timeInterval = [nowdata timeIntervalSince1970];
//    NSString * accetoken=nil;
//    [parameters setValue:[NSString stringWithFormat:@"%.0lf",record_timeInterval]forKey:@"timestamp"]; //now date
//
//    [parameters setValue:[[NSUserDefaults standardUserDefaults]objectForKey:@"userid"]forKey:@"user_id"];
//    accetoken= [[NSUserDefaults standardUserDefaults]objectForKey:@"isaccesstoken"];
//    [parameters setValue:accetoken forKey:@"access_token"];
//    
//    NSString * timer = [NSString stringWithFormat:@"%.0lf",record_timeInterval];
//    NSArray *arrays =   [NSArray arrayWithObjects:accetoken, timer, @"readyGo1408.app_token@bj-china",nil];
//    NSArray *array2 = [arrays sortedArrayUsingSelector:@selector(compare:)];
//    NSString * isgnature = [NSString stringWithFormat:@"%@%@%@",[array2 objectAtIndex:0],[array2 objectAtIndex:1],[array2 objectAtIndex:2]];
//    
//    const char *cstr = [isgnature cStringUsingEncoding:NSUTF8StringEncoding];
//    NSData * datasgtrue = [NSData dataWithBytes:cstr length:isgnature.length];
//    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
//    CC_SHA1(datasgtrue.bytes,
//            (int)datasgtrue.length, digest);
//    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
//    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
//        [output appendFormat:@"%02x", digest[i]];
//    [parameters setValue:output forKey:@"signature"];
//   
//    //对 apptoken timestamp access_token  进行加密成signature的变量
//     [parameters setValue:@"0" forKey:@"file_type"];
//    
//    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        [formData appendPartWithFileData:filedatas name:@"file_content" fileName:@"headImage.png" mimeType:@"image/png"];
//    } error:nil];
//    
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//    NSProgress *progress = nil;
//    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithStreamedRequest:request progress:&progress completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
//        [progress removeObserver:self forKeyPath:@"fractionCompleted"];
//        if (error) {
//            NSLog(@"失败%@",[NSString stringWithFormat:@"Error : %@!", error.debugDescription]);
////            [self.view updateWithMessage:[NSString stringWithFormat:@"Error : %@!", error.debugDescription]];
//        } else {
//            NSMutableDictionary * datadic = (NSMutableDictionary*)responseObject;
//            NSString * str = [NSString stringWithFormat:@"%@",[datadic objectForKey:@"result"]];
//            if ([str isEqualToString:RET_SUCCESS]) {
//                
//                [self NSNotificationfile:datadic NSNotification:note];
//            }
//            else if ([str isEqualToString:RET_BAD_REQUEST_PARAM])
//            {
//                NSLog(@"请求的数据错误");
//            }
//            else if ([str isEqualToString:RET_INVALID_ACCESS_TOKEN]) {
//                NSLog(@"RET_INVALID_ACCESS_TOKEN");
//            }
//            NSLog(@"成功");
////            [self.view updateWithMessage:@"Great success!"];
//        }
//    }];
//    
//    [progress addObserver:self forKeyPath:@"fractionCompleted" options:NSKeyValueObservingOptionNew context:NULL];
////
//    [uploadTask resume];
////
//    self.imageUploadProgress = [[TNSexyImageUploadProgress alloc] init];
//    self.imageUploadProgress.radius = 34;
//    self.imageUploadProgress.progressBorderThickness = -10;
//    self.imageUploadProgress.trackColor = [UIColor blackColor];
//    self.imageUploadProgress.progressColor = [UIColor whiteColor];
//    self.imageUploadProgress.imageToUpload = selectimage;
//    [self.imageUploadProgress show];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(imageUploadCompleted:) name:IMAGE_UPLOAD_COMPLETED object:self.imageUploadProgress];
//
//}
//- (void)imageUploadCompleted:(NSNotification *)notification {
//    NSLog(@"[MainVC] Image upload completed");
//}
//-(void)NSNotificationfile:(NSMutableDictionary*)datadict NSNotification:(NSString*)notecenterfile
//{
//    if (datadict==nil) {
//        NSLog(@"lihui");
//    }
//    else
//    {
//        NSLog(@"noti%@",datadict);
//        NSNotificationCenter * nc = [NSNotificationCenter defaultCenter];
//        //将内容封装到广播中 给ios系统发送广播
//        [nc postNotificationName:notecenterfile object:self userInfo:datadict];
//        
//    }
//}
//
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
//    
//    if ([keyPath isEqualToString:@"fractionCompleted"] && [object isKindOfClass:[NSProgress class]]) {
//        NSProgress *progress = (NSProgress *)object;
//        NSLog(@"[MainVC] Uploading photo fraction = %f, completed unit count = %lld, total unit count = %lld", progress.fractionCompleted, progress.completedUnitCount, progress.totalUnitCount);
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.imageUploadProgress.progress = progress.fractionCompleted;
//        });
//        
//    }
//}
//
//-(NSString*)Encryptionimage
//{
//    NSMutableDictionary * parameters =[[NSMutableDictionary alloc]init];
//    //对 apptoken timestamp access_token  进行加密成signature的变量
//    NSDate * nowdata = [NSDate date];
//    NSTimeInterval  record_timeInterval = [nowdata timeIntervalSince1970];
//    NSString * accetoken=nil;
//    [parameters setValue:[NSString stringWithFormat:@"%.0lf",record_timeInterval]forKey:@"timestamp"];   [parameters setValue:[[NSUserDefaults standardUserDefaults]objectForKey:@"userid"]forKey:@"user_id"];
//    accetoken= [[NSUserDefaults standardUserDefaults]objectForKey:@"isaccesstoken"];
//    [parameters setValue:accetoken forKey:@"access_token"];
//    
//    NSString * timer = [NSString stringWithFormat:@"%.0lf",record_timeInterval];
//    NSArray *arrays =   [NSArray arrayWithObjects:accetoken, timer, @"readyGo1408.app_token@bj-china",nil];
//    NSArray *array2 = [arrays sortedArrayUsingSelector:@selector(compare:)];
//    NSString * isgnature = [NSString stringWithFormat:@"%@%@%@",[array2 objectAtIndex:0],[array2 objectAtIndex:1],[array2 objectAtIndex:2]];
//    
//    const char *cstr = [isgnature cStringUsingEncoding:NSUTF8StringEncoding];
//    NSData * datasgtrue = [NSData dataWithBytes:cstr length:isgnature.length];
//    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
//    CC_SHA1(datasgtrue.bytes,
//            (int)datasgtrue.length, digest);
//    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
//    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
//        [output appendFormat:@"%02x", digest[i]];
//    //isgnature
//    NSString * Encryptionimageurl =[NSString stringWithFormat:@"timestamp=%@&user_id=%@&signature=%@&access_token=%@",[NSString stringWithFormat:@"%.0lf",record_timeInterval],[[NSUserDefaults standardUserDefaults]objectForKey:@"userid"],output,accetoken];
//    return Encryptionimageurl;
//}
@end
