//
//  AirportListView.h
//  Aviogb
//
//  Created by Алексей Мальков on 12.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Country.h"

NS_ASSUME_NONNULL_BEGIN

@interface CountryListViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *countryName;
@property (nonatomic, strong) UILabel *countryCode;

-(void)configureUI;
-(void)configureWith:(Country *)country;

@end

NS_ASSUME_NONNULL_END
