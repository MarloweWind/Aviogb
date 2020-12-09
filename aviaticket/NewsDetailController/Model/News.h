//
//  CoreDataStack.h
//  Aviogb
//
//  Created by Алексей Мальков on 30.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoriteNews+CoreDataClass.h"
#import "NewsData.h"

NS_ASSUME_NONNULL_BEGIN

@interface News : NSObject

@property (nonatomic, nonnull, strong) NSString *title;
@property (nonatomic, nonnull, strong) NSString *short_description;
@property (nonatomic, nullable, strong) NSURL *url;
@property (nonatomic, nullable, strong) NSURL *imageURL;
@property (nonatomic, nullable, strong) NSString *source;
@property (nonatomic, nullable, strong) NSString *publisherAt;
@property (nonatomic, nullable, strong) NSString *newsId;

- (instancetype)initWithTitle:(NSString *)title ShortDescription:(NSString *)short_description Source:(NSString *)source;
- (instancetype)initWithTitle:(NSString *)title ShortDescription:(NSString *)short_description Url:(NSString *)url Source:(NSString *)source Image:(NSString *)image Date:(NSString *)dateString;
- (instancetype)initWithNewsArticle:(NewsArticle *)Data;
- (instancetype)initWithFavorite:(FavoriteNews *)favorite;

@end

NS_ASSUME_NONNULL_END
