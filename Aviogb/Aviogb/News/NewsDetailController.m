//
//  NewsDetailController.m
//  Aviogb
//
//  Created by Алексей Мальков on 19.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import "NewsDetailController.h"

@interface NewsDetailController ()

@property (nonatomic) PhotoService *photoSerice;

@end

@implementation NewsDetailController

- (instancetype)initWithNews:(News *)news {
    self = [super init];

    _news = news;
    _photoSerice = [PhotoService instance];
        
    return self;
}

- (void)loadView {
    CGRect frame = [UIScreen mainScreen].bounds;
    self.view = [[NewsDetailView alloc] initWithFrame:frame];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _news.title;
    
    NewsDetailView *view = (NewsDetailView *)self.view;
    
    view.lblTitle.text = _news.title;;
    view.lblContent.text = _news.short_description;
    view.lblDate.text = _news.publisherAt;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_news.source attributes:nil];
    NSRange linkRange = NSMakeRange(0, [_news.source length]);
    NSDictionary *linkAttributes = @{NSForegroundColorAttributeName: [UIColor blueColor],
                                     NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)
    };
    
    [attributedString setAttributes:linkAttributes range:linkRange];
    view.lblSource.attributedText = attributedString;
    view.lblSource.userInteractionEnabled = YES;
    [view.lblSource addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openLinkInBrowser:)]];

    self.imgNews = view.imgNews;
            
    if (_news.imageURL != nil) {
        [_photoSerice getPhotoBy:_news.imageURL :^(UIImage * _Nonnull data) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imgNews.image = data;
            });
        }];
    }
}

- (void)openLinkInBrowser:(UITapGestureRecognizer *)tapGesture {
    if (_news.url != nil) {
        [[UIApplication sharedApplication] openURL:_news.url options:@{} completionHandler:nil];
    }
}

@end
