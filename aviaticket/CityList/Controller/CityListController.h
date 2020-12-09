//
//  AirportListView.h
//  Aviogb
//
//  Created by Алексей Мальков on 12.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Airport.h"
#import "Country.h"
#import "City.h"
#import "DataManager.h"
#import "AirportListController.h"
#import "CityListView.h"
#import "CityListCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface CityListController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) Country *selectedCountry;
@property (nonatomic, strong) NSMutableArray *cities;
@property (nonatomic, strong, nonnull) UITableView *tableView;

- (instancetype)initWithCountry:(Country *)country;

@end

NS_ASSUME_NONNULL_END
