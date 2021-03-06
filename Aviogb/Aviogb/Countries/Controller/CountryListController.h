//
//  CountryListController.h
//  Aviogb
//
//  Created by Алексей Мальков on 12.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountryListView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CountryListController: UIViewController<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property UITableView *tableView;
@property UISearchController *searchController;
@property NSMutableArray *countries;

- (void)doSearch:(NSString *)query;

@end

NS_ASSUME_NONNULL_END
