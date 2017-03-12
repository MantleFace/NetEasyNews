//
//  SSXTableNewsCell.m
//  NetEasyNews
//
//  Created by Dragon on 2017/3/11.
//  Copyright © 2017年 BasicTest. All rights reserved.
//

#import "SSXTableNewsCell.h"
#import <UIImageView+WebCache.h>
#import "SSXPicInfo.h"

@interface SSXTableNewsCell ()

/// 新闻图片
@property (weak, nonatomic) IBOutlet UIImageView *imgsrcImageView;

/// 新闻标题
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

/// 新闻来源
@property (weak, nonatomic) IBOutlet UILabel *lblSource;

/// 新闻回复数
@property (weak, nonatomic) IBOutlet UILabel *lblReplyCount;

/// 多图
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *mutiImage;

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
    
    //多图 遍历图片集合
    for (int i = 0; i<self.mutiImage.count; i++) {
//        //获取对应图片字典
//        NSDictionary *dic = newsModel.imgextra[i];
//        
//        //通过key获取图片的地址
//        NSString *imgSrc = [dic objectForKey:@"imgsrc"];
//        
//        //获取对应的imageView
//        UIImageView *imageView = self.mutiImage[i];
//        
//        //给多图imageView设置网络图片
//        [imageView sd_setImageWithURL:[NSURL URLWithString:imgSrc] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];

        //获取多图模型
        SSXPicInfo *picModel = newsModel.imgextra[i];
        //多图imageView
        UIImageView *imageView = self.mutiImage[i];
        
        //使用YYModel方式
        [imageView sd_setImageWithURL:[NSURL URLWithString:picModel.imgsrc] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    }
    
    
}


@end
