//
//  CollectionViewCell.m
//  Aviogb
//
//  Created by Алексей Мальков on 26.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self != nil) {
        [self configrueView];
    }

    return self;
}

- (void)configrueView {
    CGRect rect = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    self.imgPhoto = [[UIImageView alloc] initWithFrame:rect];
    [self addSubview:self.imgPhoto];
}

- (void)prepareForReuse {
    self.imgPhoto.image = nil;
}

@end
