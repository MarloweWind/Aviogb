//
//  NewsListController.h
//  Aviogb
//
//  Created by Алексей Мальков on 19.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"
#import "NewsView.h"
#import "NetworkService.h"
#import "NewsListTableCell.h"
#import "NewsDetailController.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsListController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong, nonnull) UITableView *tableView;
@property (nonatomic, strong) NetworkService *service;
@property (nonatomic, strong) NSMutableArray *newsList;

@end

NS_ASSUME_NONNULL_END
