//
//  CityListView.h
//  Aviogb
//
//  Created by Алексей Мальков on 12.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CityListView : UIView

@property UITableView *tableView;

- (void)configureUI;

@end

NS_ASSUME_NONNULL_END
