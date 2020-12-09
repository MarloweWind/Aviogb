//
//  PhotoService.h
//  Aviogb
//
//  Created by Алексей Мальков on 19.11.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import "PhotoService.h"

@implementation PhotoService

+ (instancetype)instance {
    static PhotoService *intance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        intance = [[PhotoService alloc] init];
    });
    
    return intance;
}

- (instancetype)init {
    NSURL *cacheDirUrlInUserDomain = [[[NSFileManager defaultManager] URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask] firstObject];

    _cacheDirURL = [cacheDirUrlInUserDomain URLByAppendingPathComponent:@"images" isDirectory:YES];

    if ([[NSFileManager defaultManager] fileExistsAtPath: _cacheDirURL.path] == NO) {
        @try {
            [[NSFileManager defaultManager] createDirectoryAtPath:_cacheDirURL.path withIntermediateDirectories:YES attributes:nil error:nil];
        } @catch(NSException *e) {
            _cacheDirURL = nil;
            NSLog(@"Can't create cachedDir");
        }
    }
    
    return self;
}

- (NSString *)getFileNameFrom:(NSURL *)url {
    NSString *lastComponent = [url lastPathComponent];

    if (![lastComponent isEqualToString: @""]) {
        return lastComponent;
    } else {
        NSString *lastString = [[lastComponent componentsSeparatedByString:@"/"] lastObject];
        
        if (![lastString isEqualToString:@""]) {
            return lastString;
        } else {
            return [NSString stringWithFormat:@"%f", [NSDate timeIntervalSinceReferenceDate]];
        }
    }
        
    return nil;
}

- (void)setPhotoToDiskFor:(NSURL *)urlString :(UIImage *)imageData {
    NSString *fileName = [self getFileNameFrom:urlString];
    NSURL *fullFileCachedPath = [_cacheDirURL URLByAppendingPathComponent:fileName];
    NSData *pngData = UIImagePNGRepresentation(imageData);
    
    @try {
        [pngData writeToURL:fullFileCachedPath atomically:YES];
    } @catch (NSException *e) {
        
    }
}

- (UIImage *)getPhotoFromDiskBy:(NSURL *)url {
    NSString *fileName = [self getFileNameFrom:url];
    NSURL *fullFileCachedPath = [_cacheDirURL URLByAppendingPathComponent:fileName];
    NSTimeInterval cacheTime = 60 * 60;
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:fullFileCachedPath.path]) {
        @try {
            NSDate *modificationTime = [[[NSFileManager defaultManager] attributesOfItemAtPath:fullFileCachedPath.path error:nil] fileModificationDate];
            NSTimeInterval cahedInterval = [[NSDate date] timeIntervalSinceDate:modificationTime];
            if (cahedInterval <= cacheTime) {
                UIImage *returnImage = [UIImage imageWithContentsOfFile:fullFileCachedPath.path];
                
                if (returnImage != nil) {
                    return returnImage;
                }
            }
            
        } @catch (NSException *e){
            return nil;
        }
    }
    
    
    return nil;
}
   

- (void)getPhotoBy:(NSURL *)url :(void(^)(UIImage *data))completion {
    UIImage *cachedImage = [self getPhotoFromDiskBy:url];

    if (cachedImage == nil) {
        [[NetworkService instance] getImageByImage:url :^(NSData * _Nonnull data) {
            UIImage *imageFromData = [UIImage imageWithData:data];

            [self setPhotoToDiskFor:url :imageFromData];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(imageFromData);
            });
        }];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(cachedImage);
        });
    }
}

@end
