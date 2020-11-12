//
//  CityListCell.h
//  Aviogb
//
//  Created by Алексей Мальков on 12.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

NS_ASSUME_NONNULL_BEGIN

@interface CityListCell : UITableViewCell

@property UILabel *cityName;
@property UILabel *cityCode;

- (void)configureUI;
- (void)configureWith:(City *)city;

@end

NS_ASSUME_NONNULL_END
