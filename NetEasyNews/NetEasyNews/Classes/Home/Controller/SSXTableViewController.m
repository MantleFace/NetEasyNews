//
//  SSXTableViewController.m
//  NetEasyNews
//
//  Created by Dragon on 2017/3/10.
//  Copyright © 2017年 BasicTest. All rights reserved.
//

#import "SSXTableViewController.h"
#import "SSXNetworkTools.h"
#import "SSXNewsModel.h"
#import "SSXTableNewsCell.h"

@interface SSXTableViewController ()

//新闻列表数据源
@property(nonatomic,strong) NSArray *newsModelArray;

@end

@implementation SSXTableViewController

static NSString *baseCell = @"baseCell";
static NSString *largeCell = @"largeCell";
static NSString *mutiCell = @"mutiCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI{
    
    //普通cell
    [self.tableView registerNib:[UINib nibWithNibName:@"BaseCell" bundle:nil] forCellReuseIdentifier:baseCell];

    //大图cell
    [self.tableView registerNib:[UINib nibWithNibName:@"LargeImageCell" bundle:nil] forCellReuseIdentifier:largeCell];
    
    //多图cell
    [self.tableView registerNib:[UINib nibWithNibName:@"MutiCell" bundle:nil] forCellReuseIdentifier:mutiCell];

    
}

- (void)setUrlStr:(NSString *)urlStr{
    _urlStr = urlStr;
   
    [SSXNewsModel requestNewsModelArrayWithUrlStr:urlStr andCompletionBlock:^(NSArray *newsModelArray) {
        self.newsModelArray = newsModelArray;
        
        //刷新tableView数据
        [self.tableView reloadData];
        
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.newsModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //获取模型数据
    SSXNewsModel *model = self.newsModelArray[indexPath.row];
    
    SSXTableNewsCell *cell;
    
    if(model.imgType){
        
        //大图
        cell = [tableView dequeueReusableCellWithIdentifier:largeCell forIndexPath:indexPath];
        
    }else if(model.imgextra.count == 2){
        
        //多图cell
        cell = [tableView dequeueReusableCellWithIdentifier:mutiCell forIndexPath:indexPath];
    
    }else{
        
        //普通cell
        cell = [tableView dequeueReusableCellWithIdentifier:baseCell forIndexPath:indexPath];
        
    }
    
    cell.newsModel = model;
    
    return cell;
    
}

//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SSXNewsModel *model = self.newsModelArray[indexPath.row];
    if(model.imgType){
        //表示大图
        return 130;
    }else{
        //普通cell
        return 80;
    }
    
}

@end
