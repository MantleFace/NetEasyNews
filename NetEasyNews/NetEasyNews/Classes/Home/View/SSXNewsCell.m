//
//  SSXNewsCell.m
//  NetEasyNews
//
//  Created by Dragon on 2017/3/10.
//  Copyright © 2017年 BasicTest. All rights reserved.
//

#import "SSXNewsCell.h"
#import "SSXTableViewController.h"

@interface SSXNewsCell ()

@property(nonatomic,strong) SSXTableViewController *tableVc;

@end

@implementation SSXNewsCell

- (void)awakeFromNib{
    [super awakeFromNib];
    
    //每个collectionViewCell都包含一个TableViewController
    self.tableVc = [[SSXTableViewController alloc] init];

    //添加到contentView上
    [self.contentView addSubview:self.tableVc.view];
    
    //设置tableView的大小
    self.tableVc.view.frame = self.contentView.bounds;
    
    //设置tableView背景颜色
    self.tableVc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
    
}

- (void)setUrlStr:(NSString *)urlStr{
    _urlStr = urlStr;
    
    //将cell的请求地址传递给tableView
    self.tableVc.urlStr = urlStr;
}

@end
