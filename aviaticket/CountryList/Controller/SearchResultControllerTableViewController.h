//
//  SearchResultControllerTableViewController.h
//  Aviogb
//
//  Created by Алексей Мальков on 26.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Country.h"
#import "CityListController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchResultControllerTableViewController : UITableViewController
@property (nonatomic, strong) NSArray *results;
- (void)update;
@end

NS_ASSUME_NONNULL_END
