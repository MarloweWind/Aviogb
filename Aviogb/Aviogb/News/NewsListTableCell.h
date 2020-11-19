//
//  NewsListTableCell.h
//  Aviogb
//
//  Created by Алексей Мальков on 19.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"
#import "PhotoService.h"
#import "NetworkService.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsListTableCell : UITableViewCell

@property (nonatomic, strong) UILabel *lblTitle;
@property (nonatomic, strong) UILabel *lblDescription;
@property (nonatomic, strong) UIImageView *imgNews;

- (void)configureUI;
- (void)configureWithNews:(News *)news;

@end

NS_ASSUME_NONNULL_END
