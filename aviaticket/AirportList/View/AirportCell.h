//
//  AirportListView.h
//  Aviogb
//
//  Created by Алексей Мальков on 12.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Airport.h"

NS_ASSUME_NONNULL_BEGIN

@interface AirportCell : UITableViewCell

@property (nonatomic, strong) UILabel *airportName;
@property (nonatomic, strong) UILabel *airportCode;

- (void)configureUI;
- (void)configureWith:(Airport *)airport;

@end

NS_ASSUME_NONNULL_END
