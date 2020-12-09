//
//  MapController.h
//  Aviogb
//
//  Created by Алексей Мальков on 23.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"
#import "Airport.h"
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MapController : UIViewController
@property (nonatomic, strong) City *city;
@property (nonatomic, strong) NSMutableArray *airports;
@property (nonatomic, strong) UILabel *lblCountryName;
@property (nonatomic, strong) UILabel *lblCityName;
@property (nonatomic, strong) MKMapView *mkMapView;
@end

NS_ASSUME_NONNULL_END
