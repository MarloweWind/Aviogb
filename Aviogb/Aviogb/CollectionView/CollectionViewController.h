//
//  CollectionViewController.h
//  Aviogb
//
//  Created by Алексей Мальков on 26.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewController : UICollectionViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong) NSMutableArray *images;
@end

NS_ASSUME_NONNULL_END
