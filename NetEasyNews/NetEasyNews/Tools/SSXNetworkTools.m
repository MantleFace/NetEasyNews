//
//  SSXNetworkTools.m
//  NetEasyNews
//
//  Created by Dragon on 2017/3/10.
//  Copyright © 2017年 BasicTest. All rights reserved.
//

#import "SSXNetworkTools.h"

@implementation SSXNetworkTools

+ (instancetype)sharedTools{
    
    static SSXNetworkTools *tools;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *baseUrl = @"http://c.m.163.com/nc/article/list/";
        tools = [[SSXNetworkTools alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
    });
    return tools;
    
}

- (void)requestWithRequestType:(RequestType)requestType andUrlStr:(NSString *)urlStr andParams:(id)params andSuccess:(void (^)(id))successBlock andFailure:(void (^)(NSError *))failureBlock{
    
    if (requestType == GET) {
        
        [self GET:urlStr parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            successBlock(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failureBlock(error);
        }];
        
    }else{
        
        [self POST:urlStr parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            successBlock(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failureBlock(error);
        }];
        
    }
}


@end
