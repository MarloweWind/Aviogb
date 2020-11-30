//
//  NewsListController.m
//  Aviogb
//
//  Created by Алексей Мальков on 19.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import "NewsListController.h"
#import "CoreDataStack.h"

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
    
    self.segmentedControl = view.segmentedControl;

    self.tableView = view.tableView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.tableView registerClass:NewsListTableCell.self forCellReuseIdentifier:@"newsTableCell"];
    self.service = [NetworkService instance];
    [self.segmentedControl addTarget:self action:@selector(loadNewsFromNetOrFavorite) forControlEvents:UIControlEventValueChanged];
    [self loadNewsFromNetOrFavorite];
    
}

- (void)loadNewsFromNetOrFavorite
{
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        [self.service getNewsList:^(NSMutableArray * _Nonnull newsListArray) {
            self.newsList = newsListArray;
            [self.tableView reloadData];
        }];
    } else {
        [self.newsList removeAllObjects];
        NSArray *favorites = [[CoreDataStack shared] favorites];
        
        for (FavoriteNews *favorite in favorites) {
            [self.newsList addObject:[[News alloc] initWithFavorite:favorite]];
        }
        
        [self.tableView reloadData];
    }
}

// MARK: TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.newsList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsListTableCell *cell = (NewsListTableCell *) [self.tableView dequeueReusableCellWithIdentifier:@"newsTableCell"];
    
    News *news = [_newsList objectAtIndex:indexPath.row];
    [cell configureWith:news indexPath:indexPath];
    
    cell.btnClickedDelegate = ^(NewsListTableCell *sender) {
        News *news = self.newsList[sender.indexPath.row];

        if (news) {
            FavoriteNews *favorite = [[CoreDataStack shared] favoriteFromNews:news];
            
            if (!favorite) {
                [[CoreDataStack shared] addToFavorite:news];

                [sender.btnAddToFavorite setImage:[UIImage systemImageNamed:@"star.fill"] forState:UIControlStateNormal];
            } else {
                [[CoreDataStack shared] removeFromFavorite:news];
                
                [sender.btnAddToFavorite setImage:[UIImage systemImageNamed:@"star"] forState:UIControlStateNormal];
            }
        }
    };
    
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
