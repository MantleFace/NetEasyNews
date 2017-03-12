//
//  SSXNewsModel.h
//  NetEasyNews
//
//  Created by Dragon on 2017/3/11.
//  Copyright © 2017年 BasicTest. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSXNewsModel : NSObject

//新闻标题
@property(nonatomic,copy) NSString *title;

/// 新闻图标
@property(nonatomic,copy) NSString *imgsrc;

/// 新闻来源
@property(nonatomic,copy) NSString *source;

/// 新闻回复数
@property(nonatomic,assign) NSInteger replyCount;

/// 多张配图  使用YYModel把数组属性转化成模型数组 替代原始写法
@property(nonatomic,strong) NSArray *imgextra;

/// 是否大图
@property(nonatomic,assign) BOOL imgType;

/// 根据请求地址获取新闻数据
+ (void)requestNewsModelArrayWithUrlStr:(NSString *)urlStr andCompletionBlock:(void(^)(NSArray *newsModelArray))completionBlock;

@end
