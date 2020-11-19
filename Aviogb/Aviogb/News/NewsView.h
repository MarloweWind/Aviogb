//
//  NewsView.h
//  Aviogb
//
//  Created by Алексей Мальков on 19.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsView : UIView

@property (nonatomic, strong, nonnull) UITableView *tableView;

- (void)configureUI;

@end

NS_ASSUME_NONNULL_END
