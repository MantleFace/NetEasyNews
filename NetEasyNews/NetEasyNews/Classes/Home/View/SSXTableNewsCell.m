//
//  SSXTableNewsCell.m
//  NetEasyNews
//
//  Created by Dragon on 2017/3/11.
//  Copyright © 2017年 BasicTest. All rights reserved.
//

#import "SSXTableNewsCell.h"
#import <UIImageView+WebCache.h>

@interface SSXTableNewsCell ()

/// 新闻图片
@property (weak, nonatomic) IBOutlet UIImageView *imgsrcImageView;

/// 新闻标题
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

/// 新闻来源
@property (weak, nonatomic) IBOutlet UILabel *lblSource;

/// 新闻回复数
@property (weak, nonatomic) IBOutlet UILabel *lblReplyCount;

@end

@implementation SSXTableNewsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    //设置图片按原始比例 会有图片超出情况
    self.imgsrcImageView.contentMode = UIViewContentModeScaleAspectFill;
    //剪切掉多余部分
    self.imgsrcImageView.clipsToBounds = YES;

}

- (void)setNewsModel:(SSXNewsModel *)newsModel{
    _newsModel = newsModel;
    
    //加载的是网络图片
    [self.imgsrcImageView sd_setImageWithURL:[NSURL URLWithString:newsModel.imgsrc] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    
    self.lblTitle.text = newsModel.title;
    
    self.lblSource.text = newsModel.source;
    
    self.lblReplyCount.text = [NSString stringWithFormat:@"%zd",newsModel.replyCount];
}


@end
