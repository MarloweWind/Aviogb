//
//  CountryListController.m
//  Aviogb
//
//  Created by Алексей Мальков on 12.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import "CityListController.h"
#import "CountryListController.h"
#import "CountryListView.h"
#import "CountryListViewCell.h"
#import "DataManager.h"

@interface CountryListController ()

@end

@implementation CountryListController

- (void)loadView {
    CGRect frame = [UIScreen mainScreen].bounds;
    self.view = [[CountryListView alloc] initWithFrame:frame];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Страны";
    
    CountryListView *view = (CountryListView *)self.view;
    
    self.tableView = view.tableView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.searchController = view.searchController;
    self.searchController.searchBar.delegate = self;
    self.definesPresentationContext = YES;

    [self.tableView registerClass:CountryListViewCell.self forCellReuseIdentifier:@"countryViewCell"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadDataComplete:) name:kDataManagerLoadDataDidComplete object:nil];
    [[DataManager sharedInstance] loadData];
    
}

- (void)loadDataComplete:(NSNotification *)notification {
    self.view.backgroundColor = [UIColor greenColor];
    self.countries = [NSMutableArray arrayWithArray:[DataManager sharedInstance].countries];
    [self.tableView reloadData];
}

// MARK: TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.countries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CountryListViewCell *cell = (CountryListViewCell *) [self.tableView dequeueReusableCellWithIdentifier:@"countryViewCell"];
    
    Country *country = [self.countries objectAtIndex:indexPath.row];
    
    [cell configureWith:country];
    
    return cell;
}

// MARK: TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Country *selCountry = [self.countries objectAtIndex:indexPath.row];
    
    if (selCountry != nil) {
        UIViewController *cityController = (CityListController *) [[CityListController alloc] initWithCountry:selCountry];
        [self.searchController.searchBar becomeFirstResponder];
        [self.navigationController pushViewController:cityController animated:true];
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:true];
}

- (void)doSearch:(NSString *)query {
    if ([query length] > 0) {
        NSArray *testCountries = [DataManager sharedInstance].countries;
        [self.countries removeAllObjects];
        
        for (NSUInteger i = 0; i < [testCountries count]; i++) {
            Country *testCountry = [testCountries objectAtIndex:i];
            
            if ([testCountry.code rangeOfString:query].location != NSNotFound
                 ||
                [testCountry.name rangeOfString:query].location != NSNotFound)
            {
                [self.countries addObject:testCountry];
            }
        }
    } else {
        self.countries = [NSMutableArray arrayWithArray:[DataManager sharedInstance].countries];
    }
    
    [self.tableView reloadData];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self doSearch:searchText];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.countries = [NSMutableArray arrayWithArray:[DataManager sharedInstance].countries];
    [self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if (searchBar) {
        [self doSearch:searchBar.text];
    }
}

@end
