//
//  SSXTableNewsCell.h
//  NetEasyNews
//
//  Created by Dragon on 2017/3/11.
//  Copyright © 2017年 BasicTest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSXNewsModel.h"

@interface SSXTableNewsCell : UITableViewCell

/// 新闻模型数组
@property(nonatomic,strong) SSXNewsModel *newsModel;

@end
