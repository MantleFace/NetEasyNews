//
//  SSXNetworkTools.h
//  NetEasyNews
//
//  Created by Dragon on 2017/3/10.
//  Copyright © 2017年 BasicTest. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

//请求类型枚举
typedef enum : NSUInteger {
    GET,
    POST,
} RequestType;

@interface SSXNetworkTools :AFHTTPSessionManager

//单例全局访问点
+ (instancetype)sharedTools;

//封装AFN
- (void)requestWithRequestType:(RequestType)requestType andUrlStr:(NSString *)urlStr andParams:(id)params andSuccess:(void(^)(id responseObject))successBlock andFailure:(void(^)(NSError *error))failureBlock;

@end
