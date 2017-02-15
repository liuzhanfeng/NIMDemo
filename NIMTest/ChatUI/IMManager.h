//
//  IMManager.h
//  NIMTest
//
//  Created by LZF on 2017/2/15.
//  Copyright © 2017年 zf.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NIMSDK.h"
/* 即时通讯 管理类*/

@interface IMManager : NSObject
+(instancetype)share;
-(void)manualLogin:(NSString *)userID token:(NSString *)password;
+(void)sendMessage:(NSString *)messageText userID:(NSString *)toUserID;
+(void)sendImageMessageWithImage:(UIImage *)image toUserID:(NSString *)toUserID;
-(NSArray <NIMMessage *>*)getHistoryMessageRecordWithSessionID;
@end
