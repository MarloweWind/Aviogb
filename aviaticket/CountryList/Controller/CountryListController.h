//
//  AirportListView.h
//  Aviogb
//
//  Created by Алексей Мальков on 12.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CloudKit/CloudKit.h>
#import "CountryListView.h"
#import "CoreDataStack.h"
#import "News.h"
#import "SearchResultControllerTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CountryListController: UIViewController<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchResultsUpdating>

@property UITableView *tableView;
@property UISearchController *searchController;
@property (nonatomic, strong) SearchResultControllerTableViewController *resultViewController;
@property NSMutableArray *countries;

- (void)doSearch:(NSString *)query;

@end

NS_ASSUME_NONNULL_END
