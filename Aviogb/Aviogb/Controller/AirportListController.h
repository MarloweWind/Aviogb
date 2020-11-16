//
//  AirportListController.h
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

NS_ASSUME_NONNULL_BEGIN

@interface AirportListController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property UITableView *tableView;
@property Country *selectedCountry;
@property City *selectedCity;
@property NSMutableArray *airports;

- (instancetype) initWithCity:(City *) city AndCountry:(Country *)country;

@end

NS_ASSUME_NONNULL_END
