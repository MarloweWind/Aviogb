//
//  MapController.m
//  Aviogb
//
//  Created by Алексей Мальков on 23.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MapView : UIView

@property (nonatomic, strong, nonnull) UILabel *lblCountryName;
@property (nonatomic, strong, nonnull) MKMapView *mapView;
@property (nonatomic, strong, nonnull) UILabel *lblCityName;

@end


NS_ASSUME_NONNULL_END
