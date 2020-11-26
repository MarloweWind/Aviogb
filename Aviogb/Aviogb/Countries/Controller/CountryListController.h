//
//  CountryListController.h
//  Aviogb
//
//  Created by Алексей Мальков on 12.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountryListView.h"
#import "SearchResultControllerTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CountryListController<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchResultsUpdating> : UIViewController

@property UITableView *tableView;
@property UISearchController *searchController;
@property NSMutableArray *countries;
@property (nonatomic, strong) SearchResultControllerTableViewController *resultViewController;

@end

NS_ASSUME_NONNULL_END
