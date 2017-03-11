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

static NSString *cell_id = @"cell_id";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    [self setupUI];
}

- (void)setupUI{
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"BaseCell" bundle:nil] forCellReuseIdentifier:cell_id];
    
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
    
    SSXTableNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id forIndexPath:indexPath];
    
    cell.newsModel = model;
    
    return cell;
    
}

//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

@end
