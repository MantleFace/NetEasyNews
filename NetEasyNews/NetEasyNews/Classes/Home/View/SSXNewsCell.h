//
//  SSXNewsCell.h
//  NetEasyNews
//
//  Created by Dragon on 2017/3/10.
//  Copyright © 2017年 BasicTest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSXNewsCell : UICollectionViewCell

//请求地址  负责传递给tableView
@property(nonatomic,copy) NSString *urlStr;

@end
