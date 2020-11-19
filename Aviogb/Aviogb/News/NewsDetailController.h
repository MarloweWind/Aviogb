//
//  NewsDetailController.h
//  Aviogb
//
//  Created by Алексей Мальков on 19.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"
#import "PhotoService.h"
#import "NewsDetailView.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsDetailController : UIViewController

- (instancetype)initWithNews:(News *)news;
- (void)openLinkInBrowser:(UITapGestureRecognizer *)tapGesture;

@property (nonatomic, strong) UIImageView *imgNews;
@property (nonatomic, nonnull, strong) News *news;

@end

NS_ASSUME_NONNULL_END
