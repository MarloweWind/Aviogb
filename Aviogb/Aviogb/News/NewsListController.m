//
//  NewsListController.m
//  Aviogb
//
//  Created by Алексей Мальков on 19.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import "NewsListController.h"

@interface NewsListController ()

@end

@implementation NewsListController

- (void)loadView {
    CGRect frame = [UIScreen mainScreen].bounds;
    self.view = [[NewsView alloc] initWithFrame:frame];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Новости";
    
    NewsView *view = (NewsView *)self.view;
    
    self.tableView = view.tableView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.tableView registerClass:NewsListTableCell.self forCellReuseIdentifier:@"newsTableCell"];
    
    self.service = [NetworkService instance];
    
    [self.service getNewsList:^(NSMutableArray * _Nonnull newsListArray) {
        self.newsList = newsListArray;
        [self.tableView reloadData];
    }];
    
}

// MARK: TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.newsList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsListTableCell *cell = (NewsListTableCell *) [self.tableView dequeueReusableCellWithIdentifier:@"newsTableCell"];
    
    News *news = [_newsList objectAtIndex:indexPath.row];
    [cell configureWithNews:news];
    
    return cell;
}

// MARK: TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    News *news = [_newsList objectAtIndex:indexPath.row];
    
    UIViewController *newsDetail = (NewsDetailController *)[[NewsDetailController alloc] initWithNews:news];

    [self.navigationController pushViewController:newsDetail animated:YES];

    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
