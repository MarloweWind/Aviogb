//
//  FavoriteNews+CoreDataProperties.h
//  Aviogb
//
//  Created by Алексей Мальков on 30.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import "FavoriteNews+CoreDataProperties.h"

@implementation FavoriteNews (CoreDataProperties)

+ (NSFetchRequest<FavoriteNews *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"FavoriteNews"];
}

@dynamic id;
@dynamic imageURL;
@dynamic publiched_at;
@dynamic short_description;
@dynamic source;
@dynamic title;
@dynamic url;
@dynamic addDate;

@end
