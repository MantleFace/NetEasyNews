//
//  SSXChannelLabel.m
//  NetEasyNews
//
//  Created by Dragon on 2017/3/10.
//  Copyright © 2017年 BasicTest. All rights reserved.
//

#import "SSXChannelLabel.h"

@implementation SSXChannelLabel

- (void)setScalePercent:(CGFloat)scalePercent{
    _scalePercent = scalePercent;
    
    CGFloat currentScale = 1 + scalePercent * .3;
    
    //颜色渐变
    self.textColor = [UIColor colorWithRed:scalePercent green:0 blue:0 alpha:1];
    
    //缩放大小
    self.transform = CGAffineTransformMakeScale(currentScale, currentScale);
}

@end
