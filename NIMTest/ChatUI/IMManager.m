//
//  IMManager.m
//  NIMTest
//
//  Created by LZF on 2017/2/15.
//  Copyright © 2017年 zf.com. All rights reserved.
//

#import "IMManager.h"
#import "NSString+NTES.h"

@interface IMManager ()
@end

@implementation IMManager

+(instancetype)share{
    static dispatch_once_t onceToken;
    static IMManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[IMManager alloc] init];
    });
    return instance;
}


-(void)manualLogin:(NSString *)userID token:(NSString *)password{
    if (!userID.length || !password.length) {
        return;
    }
    [[[NIMSDK sharedSDK] loginManager] login:userID
                                       token:[password MD5String]
                                  completion:^(NSError *error) {
                                      if (error == nil) {
                                          NSLog(@"登录成功");
                                      }else{
                                          NSLog(@"登录失败");
                                      }
                                  }];
}


+(void)registerUserID:(NSString *)usrID passwork:(NSString *)password{
    
}

+(NSString *)getLogoinID{
    NSString *userID = [NIMSDK sharedSDK].loginManager.currentAccount;
    return userID;
}

+(void)loginout{
    [[[NIMSDK sharedSDK] loginManager] logout:^(NSError *error){}];
}

+(void)sendMessage:(NSString *)messageText userID:(NSString *)toUserID{
    if (!messageText.length || !toUserID.length) {
        return;
    }
    //构造消息
    NIMMessage *message = [[NIMMessage alloc] init];
    message.text = messageText;
    
    //构造会话
    NIMSession *session = [NIMSession session:toUserID type:NIMSessionTypeP2P];
    
    //发送消息
    [[NIMSDK sharedSDK].chatManager sendMessage:message toSession:session error:nil];
}

+(void)sendImageMessageWithImage:(UIImage *)image toUserID:(NSString *)toUserID{
    //构造消息
    NIMImageObject * imageObject = [[NIMImageObject alloc] initWithImage:image];
    NIMMessage *message          = [[NIMMessage alloc] init];
    message.messageObject        = imageObject;
    //构造会话
    NIMSession *session = [NIMSession session:toUserID type:NIMSessionTypeP2P];
    //发送消息
    [[NIMSDK sharedSDK].chatManager sendMessage:message toSession:session error:nil];
}

-(NSArray <NIMMessage *>*)getHistoryMessageRecordWithSessionID{
    NIMSession *session = [NIMSession session:@"此处填写客服的ID" type:NIMSessionTypeP2P];
    NSArray *messageArray = [[NIMSDK sharedSDK].conversationManager messagesInSession:session message:nil limit:100];
    return messageArray;
    
}

@end
