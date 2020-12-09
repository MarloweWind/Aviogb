//
//  PhotoService.h
//  Aviogb
//
//  Created by Алексей Мальков on 19.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NetworkService.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotoService : NSObject

@property (nonatomic, readonly, strong) NSURL *cacheDirURL;

+ (instancetype)instance;
- (instancetype)init;
- (NSString *)getFileNameFrom:(NSURL *)url;
- (void)getPhotoBy:(NSURL *)url :(void(^)(UIImage *data))completion;

@end

NS_ASSUME_NONNULL_END
