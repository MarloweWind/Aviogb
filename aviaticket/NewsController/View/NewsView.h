//
//  NewsListController.h
//  Aviogb
//
//  Created by Алексей Мальков on 19.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsView : UIView

@property (nonatomic, strong, nonnull) UITableView *tableView;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;

- (void)configureUI;

@end

NS_ASSUME_NONNULL_END
