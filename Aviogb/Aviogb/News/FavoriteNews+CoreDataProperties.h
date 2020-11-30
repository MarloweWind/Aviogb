//
//  FavoriteNews+CoreDataProperties.h
//  Aviogb
//
//  Created by Алексей Мальков on 30.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import "FavoriteNews+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface FavoriteNews (CoreDataProperties)

+ (NSFetchRequest<FavoriteNews *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *id;
@property (nullable, nonatomic, copy) NSString *imageURL;
@property (nullable, nonatomic, copy) NSString *publiched_at;
@property (nullable, nonatomic, copy) NSString *short_description;
@property (nullable, nonatomic, copy) NSString *source;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *url;
@property (nullable, nonatomic, copy) NSDate *addDate;

@end

NS_ASSUME_NONNULL_END
