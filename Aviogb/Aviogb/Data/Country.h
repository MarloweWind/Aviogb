//
//  Country.h
//  Aviogb
//
//  Created by Алексей Мальков on 12.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Country : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *currency;
@property (nonatomic, strong) NSDictionary *translations;
@property (nonatomic, strong) NSString *code;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
