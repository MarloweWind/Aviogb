//
//  NetworkService.m
//  Aviogb
//
//  Created by Алексей Мальков on 19.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import "NetworkService.h"

@implementation NetworkService

+ (instancetype)instance {
    static NetworkService *intance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        intance = [[NetworkService alloc] init];
    });
    
    return intance;
}

- (instancetype)init {
    if (self.configuration == nil) {
        _configuration = NSURLSessionConfiguration.defaultSessionConfiguration;
    }
    
    _session = [NSURLSession sessionWithConfiguration:self.configuration];
    
    return self;
}

- (void)getImageByImage:(NSURL *)url :(void(^)(NSData *data))completion {
    NSURLSessionDataTask *dTask = [_session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(data);
            });
        }
    }];
    
    [dTask resume];
}

- (void)getNewsList:(void(^)(NSMutableArray *newsListArray))completion {

    NSMutableArray *newsList = [[NSMutableArray alloc] init];
    
    if (self.session != nil) {
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@?country=ru&category=technology&apiKey=%@", NEWS_API_URL, NEWS_API_TOKEN]];

        _dataTask = [_session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError *_Nullable error) {

            NSHTTPURLResponse *resp = (NSHTTPURLResponse *) response;
            

            if (resp.statusCode == 200 && data != nil) {

                NSError *parseError = nil;
                

                NewsData *nwData = [NewsData fromData:data error:&parseError];

                if (nwData != nil && [nwData.status isEqualToString:@"ok"]) {
                    for (NewsArticle *article in nwData.articles) {
                        News *addNews;

                        if (article.title != nil && article.theDescription != nil) {
                            addNews = [[News alloc] initWithNewsArticle:article];
                            [newsList addObject:addNews];
                        }
                    }
                }
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(newsList);
            });
        }];
        [_dataTask resume];
    }
}

@end
