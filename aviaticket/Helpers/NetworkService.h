//
//  NetworkService.h
//  Aviogb
//
//  Created by Алексей Мальков on 19.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsData.h"
#import "News.h"

#define NEWS_API_TOKEN @"ff292dac9c5d40ba91c214edf8b86aa1"
#define NEWS_API_URL @"https://newsapi.org/v2/top-headlines"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkService : NSObject

@property (nonatomic, readonly, strong) NSURLSession *session;
@property (nonatomic, strong) NSURLSessionConfiguration *configuration;
@property (nonatomic, strong) NSURLSessionDataTask *dataTask;
@property (nonatomic, strong) NSURLSessionUploadTask *uploadTask;


+ (instancetype)instance;
- (instancetype)init;

- (void)getNewsList:(void(^)(NSMutableArray *newsListArray))completion;
- (void)getImageByImage:(NSURL *)url :(void(^)(NSData *data))completion;

@end

NS_ASSUME_NONNULL_END
