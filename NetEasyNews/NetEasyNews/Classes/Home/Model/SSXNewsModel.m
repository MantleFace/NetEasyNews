//
//  SSXNewsModel.m
//  NetEasyNews
//
//  Created by Dragon on 2017/3/11.
//  Copyright © 2017年 BasicTest. All rights reserved.
//

#import "SSXNewsModel.h"
#import "SSXNetworkTools.h"
#import <YYModel.h>
#import "SSXPicInfo.h"

@implementation SSXNewsModel

//利用容器属性(NSArray ,NSSet )指定对应的模型
+ (NSDictionary *)modelContainerPropertyGenericClass {

    return @{@"imgextra" : [SSXPicInfo class]};
}


+ (void)requestNewsModelArrayWithUrlStr:(NSString *)urlStr andCompletionBlock:(void(^)(NSArray *newsModelArray))completionBlock{

    [[SSXNetworkTools sharedTools] requestWithRequestType:GET andUrlStr:urlStr andParams:nil andSuccess:^(id responseObject) {
        
        NSDictionary *dict = (NSDictionary *)responseObject;
        
        //因为字典中只有一个key ,获取字典中这个key
        NSString *key = dict.allKeys.firstObject;
        
        NSArray *dicArray = [dict objectForKey:key];
        
        NSArray *modelArray = [NSArray yy_modelArrayWithClass:[SSXNewsModel class] json:dicArray];
        
        completionBlock(modelArray);
        
    } andFailure:^(NSError *error) {
        
        NSLog(@"%@",error);
        
        
    }];
    
}


@end
