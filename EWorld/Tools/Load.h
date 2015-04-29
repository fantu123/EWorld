//
//  Load.h
//  ReadyGooo
//
//  Created by apple on 14-9-15.
//  Copyright (c) 2014年 4helper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonHMAC.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <netdb.h>
#import <arpa/inet.h>

@interface Load : NSObject

-(BOOL) connectedToNetwork;
-(NSString*) uuid;
@end
