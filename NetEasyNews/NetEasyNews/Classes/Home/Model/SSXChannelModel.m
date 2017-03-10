//
//  SSXChannelModel.m
//  NetEasyNews
//
//  Created by Dragon on 2017/3/10.
//  Copyright © 2017年 BasicTest. All rights reserved.
//

#import "SSXChannelModel.h"
#import <YYModel.h>

@implementation SSXChannelModel

- (NSString *)description{
    return [NSString stringWithFormat:@"%@ - %@",self.tid,self.tname];
}

//获取频道数组数据 分离controller中代码
+ (NSArray *)getChannelArray{
    
    //json文件路径
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
    
    //获取json二进制数据
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    
    //反序列化
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    
    //获取字典数组
    NSArray *channelDicArray = [dic objectForKey:@"tList"];
    
    //使用YYModel完成字典转模型
    NSArray *modelArray = [NSArray yy_modelArrayWithClass:[SSXChannelModel class] json:channelDicArray];
    
    //升序排列
    modelArray = [modelArray sortedArrayUsingComparator:^NSComparisonResult(SSXChannelModel *obj1, SSXChannelModel *obj2) {
        
        return [obj1.tid compare:obj2.tid];
        
    }];
    
    return modelArray;
}
@end
