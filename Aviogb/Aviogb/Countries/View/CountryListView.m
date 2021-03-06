//
//  CountryListView.m
//  Aviogb
//
//  Created by Алексей Мальков on 12.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import "CountryListView.h"

@implementation CountryListView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self configureUI];
    }
    
    return self;
}

- (void)configureUI {
    
    self.backgroundColor = [UIColor whiteColor];

    self.tableView = [[UITableView alloc] initWithFrame:self.frame];
    self.tableView.translatesAutoresizingMaskIntoConstraints = false;
    self.tableView.userInteractionEnabled = true;
    [self addSubview:self.tableView];
    
    self.searchController = [[UISearchController alloc] init];
    self.searchController.definesPresentationContext = false;
    self.searchController.obscuresBackgroundDuringPresentation = false;
    self.searchController.hidesNavigationBarDuringPresentation = false;
    self.searchController.hidesNavigationBarDuringPresentation = false;

    self.tableView.tableHeaderView = self.searchController.searchBar;

    NSLayoutConstraint *topTableViewConstraint = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    NSLayoutConstraint *bottomTableViewConstraint = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.safeAreaLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    NSLayoutConstraint *leftTableViewConstraint = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.safeAreaLayoutGuide attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    NSLayoutConstraint *rightTableViewConstraint = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.safeAreaLayoutGuide attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];

    NSArray *constaints = [NSArray arrayWithObjects:topTableViewConstraint, bottomTableViewConstraint, leftTableViewConstraint, rightTableViewConstraint, nil];
    [NSLayoutConstraint activateConstraints:constaints];
}

@end
