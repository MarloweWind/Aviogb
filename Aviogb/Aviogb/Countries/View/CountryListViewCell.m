//
//  CountryListViewCell.m
//  Aviogb
//
//  Created by Алексей Мальков on 12.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import "CountryListViewCell.h"

@implementation CountryListViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self != nil) {
        [self configureUI];
    }
    
    return self;
}

- (void)configureUI {
    self.countryName = [[UILabel alloc] init];
    self.countryCode = [[UILabel alloc] init];
    
    [self addSubview:self.countryName];
    [self addSubview:self.countryCode];
    
    self.countryName.translatesAutoresizingMaskIntoConstraints = false;
    self.countryName.font = [UIFont systemFontOfSize:17];
    self.countryName.textColor = [UIColor blueColor];
    
    self.countryCode.translatesAutoresizingMaskIntoConstraints = false;
    self.countryCode.font = [UIFont systemFontOfSize:11];
    self.countryCode.textColor = [UIColor grayColor];

    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.safeAreaLayoutGuide attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];

    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.safeAreaLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    NSLayoutConstraint *topCountryNameConstraint = [NSLayoutConstraint constraintWithItem:self.countryName attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.0 constant:10];
    NSLayoutConstraint *leftCountryNameConstraint = [NSLayoutConstraint constraintWithItem:self.countryName attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.safeAreaLayoutGuide attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10];
    NSLayoutConstraint *rightCountryNameConstraint = [NSLayoutConstraint constraintWithItem:self.countryName attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.safeAreaLayoutGuide attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10];

    NSLayoutConstraint *topCountryCodeConstraint = [NSLayoutConstraint constraintWithItem:self.countryCode attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.countryName attribute:NSLayoutAttributeBottom multiplier:1.0 constant:5];
    NSLayoutConstraint *leftCountryCodeConstraint = [NSLayoutConstraint constraintWithItem:self.countryCode attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.countryName attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    NSLayoutConstraint *rightCountryCodeConstraint = [NSLayoutConstraint constraintWithItem:self.countryCode attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.countryName attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    NSLayoutConstraint *bottomCountryCodeConstraint = [NSLayoutConstraint constraintWithItem:self.countryCode attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.safeAreaLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-10];

    NSArray *constraints = [NSArray arrayWithObjects:topConstraint, leftConstraint, bottomConstraint, topCountryNameConstraint, leftCountryNameConstraint, rightCountryNameConstraint, bottomCountryCodeConstraint, topCountryCodeConstraint, leftCountryCodeConstraint, rightCountryCodeConstraint, nil];

    [NSLayoutConstraint activateConstraints:constraints];
}

- (void)configureWith:(Country *)country {
    self.countryName.text = country.name;
    self.countryCode.text = country.code;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.countryName.text = @"";
    self.countryCode.text = @"";
}

@end
