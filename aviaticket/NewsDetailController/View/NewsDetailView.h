//
//  NewsDetailController.h
//  Aviogb
//
//  Created by Алексей Мальков on 19.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsDetailView : UIView

@property (nonatomic, strong) UILabel *lblTitle;
@property (nonatomic, strong) UILabel *lblSource;
@property (nonatomic, strong) UILabel *lblSourceTitle;
@property (nonatomic, strong) UILabel *lblDate;
@property (nonatomic, strong) UILabel *lblDateTitle;
@property (nonatomic, strong) UIImageView *imgNews;
@property (nonatomic, strong) UILabel *lblContent;

- (void)configureUI;

@end

NS_ASSUME_NONNULL_END
