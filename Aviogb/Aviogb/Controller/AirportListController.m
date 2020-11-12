//
//  AirportListController.m
//  Aviogb
//
//  Created by Алексей Мальков on 12.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import "AirportListController.h"
#import "AirportListView.h"
#import "AirportCell.h"

@interface AirportListController<UITableViewDelegate,UITableViewDataSource> ()

@end

@implementation AirportListController

- (instancetype) initWithCity:(City *)city AndCountry:(Country *)country {
    self = [super init];
    
    self.selectedCountry = country;
    self.selectedCity = city;
    self.airports = [NSMutableArray array];
    
    return self;
}

- (void)loadView {
    CGRect frame = [UIScreen mainScreen].bounds;
    self.view = [[AirportListView alloc] initWithFrame:frame];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.selectedCity.name;
    
    AirportListView *view = (AirportListView *) self.view;
    self.tableView = view.tableView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:AirportCell.self forCellReuseIdentifier:@"AirportCell"];
    
    [self loadAirportByCountry:self.selectedCountry AndCity:self.selectedCity];
    
}

- (void)loadAirportByCountry:(Country *)country AndCity:(City *)city {
    NSArray *dataAirports = [DataManager sharedInstance].airports;
    
    for (NSUInteger i = 0; i < [dataAirports count]; i++) {
        Airport *testAirport = [dataAirports objectAtIndex:i];
        
        if (testAirport.countryCode == country.code && testAirport.cityCode == city.code) {
            [self.airports addObject:testAirport];
        }
    }
}

// MARK: TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.airports count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AirportCell *cell = (AirportCell *) [self.tableView dequeueReusableCellWithIdentifier:@"AirportCell"];

    Airport *airport = [self.airports objectAtIndex:indexPath.row];

    [cell configureWith:airport];

    return cell;
}

// MARK: TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Airport *airport = [self.airports objectAtIndex:indexPath.row];
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Аэропорт" message:airport.name preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    [alertVC addAction:okAction];
    [self presentViewController:alertVC animated:true completion:nil];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:true];
}

@end
