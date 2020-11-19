//
//  CountryListView.h
//  Aviogb
//
//  Created by Алексей Мальков on 12.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CountryListView : UIView

@property (nonatomic, strong, nonnull) UITableView *tableView;
@property (nonatomic, strong) UISearchController *searchController;

- (void) configureUI;

@end

NS_ASSUME_NONNULL_END
