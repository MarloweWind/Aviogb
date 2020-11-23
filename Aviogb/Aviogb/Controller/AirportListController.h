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
#import "AirportListView.h"
#import "AirportCell.h"
#import "MapController.h"

NS_ASSUME_NONNULL_BEGIN

@interface AirportListController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong, nonnull) UITableView *tableView;
@property (nonatomic, strong) Country *selectedCountry;
@property (nonatomic, strong) City *selectedCity;
@property (nonatomic, strong) NSMutableArray *airports;

- (instancetype) initWithCity:(City *) city AndCountry:(Country *)country;

@end

NS_ASSUME_NONNULL_END
