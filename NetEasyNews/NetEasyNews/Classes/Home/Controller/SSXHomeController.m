//
//  SSXHomeController.m
//  NetEasyNews
//
//  Created by Dragon on 2017/3/10.
//  Copyright © 2017年 BasicTest. All rights reserved.
//

#import "SSXHomeController.h"
#import "SSXChannelModel.h"
#import "SSXChannelLabel.h"
#import "SSXNewsCell.h"

@interface SSXHomeController ()<UICollectionViewDataSource>

//频道视图
@property (weak, nonatomic) IBOutlet UIScrollView *channelScrollView;
//新闻视图
@property (weak, nonatomic) IBOutlet UICollectionView *newsCollectionView;
//布局对象
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

//频道数据源数组
@property(nonatomic,strong) NSArray *channelModelArray;

@end

@implementation SSXHomeController
static NSString *news_id=@"news_id";

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //iOS7后, 如果导航栏有显示的滚动视图(UITextView,UITableView,UICollectionView,UIScrollView),内容会向下偏移64,设置NO不让其偏移
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    [self setupChannelScrollView];
    
    [self setupNewsCollectionView];
    
    //iOS10后 collectionView会新增一个预加载 提高collectionView性能 ,提前准备好下一个cell 默认就是开启的
    //self.newsCollectionView.prefetchingEnabled = YES;

}

- (void)setupNewsCollectionView{
    //设置数据源
    self.newsCollectionView.dataSource = self;
    
    //设置每个itemSize的大小
    self.flowLayout.itemSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height - 64 - 44);
    
    //垂直间距
    self.flowLayout.minimumLineSpacing = 0;
    
    //水平间距
    self.flowLayout.minimumInteritemSpacing = 0;
    
    //滚动方向
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //开启分页
    self.newsCollectionView.pagingEnabled = YES;
    
    //取消弹簧效果
    self.newsCollectionView.bounces = NO;
    
    //取消水平垂直指示器
    self.newsCollectionView.showsHorizontalScrollIndicator = NO;
    self.newsCollectionView.showsVerticalScrollIndicator = NO;
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.channelModelArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SSXNewsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:news_id forIndexPath:indexPath];
    
    SSXChannelModel *model = self.channelModelArray[indexPath.item];
    
    //频道id
    NSString *tid = model.tid;
    
    //频道url
    NSString *urlStr = [NSString stringWithFormat:@"%@/0-20.html",tid];
    
    cell.urlStr = urlStr;
    
    return cell;
}

/**
 请求频道数据
 */
- (void)setupChannelScrollView{
    
    self.channelModelArray = [SSXChannelModel getChannelArray];

    //遍历模型数组 创建频道对应的Label
    CGFloat W = 80;
    CGFloat H = 44;
    for (int i = 0; i <self.channelModelArray.count; i++) {
        
        //创建label
        SSXChannelLabel *channelLabel = [[SSXChannelLabel alloc] initWithFrame:CGRectMake(W * i, 0, W, H)];
        
        //获取model
        SSXChannelModel *model = self.channelModelArray[i];
        
        //设置显示内容
        channelLabel.text = model.tname;
        
        //设置字体大小
        channelLabel.font = [UIFont systemFontOfSize:14];
        
        channelLabel.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
        
        //设置对齐
        channelLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.channelScrollView addSubview:channelLabel];
        
        //开启用户交互
        channelLabel.userInteractionEnabled = YES;
        
        //给Label添加手势 实现点击滚动到中间
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        
        //添加手势
        [channelLabel addGestureRecognizer:tap];
        
        
    }
    
    self.channelScrollView.contentSize = CGSizeMake(W * self.channelModelArray.count, H);
    //取消水平和垂直方向指示器
    self.channelScrollView.showsVerticalScrollIndicator = NO;
    self.channelScrollView.showsHorizontalScrollIndicator = NO;
    
}

//手势Action
- (void)tapAction:(UITapGestureRecognizer *)gesture{
    
    //获取手势点击的channel
    SSXChannelLabel *channel = (SSXChannelLabel *)gesture.view;
    
    //计算channel的中心
    CGFloat channelCenterX = channel.center.x;
    
    //计算滚动的距离
    CGFloat contentOffSet = channelCenterX - self.view.frame.size.width * .5;
    
//    NSLog(@"channelCenterX:%f-contentOffSet:%f",channelCenterX,contentOffSet);
    
    //srollView滚动的最小范围
    CGFloat minOffSet = 0;
    
    //scrollView滚动的最大范围
    CGFloat maxOffSet = self.channelScrollView.contentSize.width - self.view.bounds.size.width;
    
    
    if(contentOffSet < minOffSet){
        
        contentOffSet = minOffSet;
    }
    
    if(contentOffSet > maxOffSet){
        contentOffSet = maxOffSet;
    }
    
    //让频道scrollView滚动到指定的位置
    [self.channelScrollView setContentOffset:CGPointMake(contentOffSet, 0) animated:YES];
    
    
}


@end
