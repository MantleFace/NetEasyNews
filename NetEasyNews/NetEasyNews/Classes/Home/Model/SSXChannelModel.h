//
//  SSXChannelModel.h
//  NetEasyNews
//
//  Created by Dragon on 2017/3/10.
//  Copyright © 2017年 BasicTest. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSXChannelModel : NSObject

//频道id
@property(nonatomic,copy) NSString *tid;

//频道名称
@property(nonatomic,copy) NSString *tname;

//获取频道数组数据 分离controller中代码
+ (NSArray *)getChannelArray;

@end
