//
//  HJWKInterfaceImage.h
//  Sample
//
//  Created by Helmut W. Januschka on 04.05.15.
//  Copyright (c) 2015 hjanuschka. All rights reserved.
//

#import <WatchKit/WatchKit.h>

typedef void (^HJWKInterfaceImageDone) (UIImage * __nullable img, NSString *  __nullable identifier);


@interface HJWKInterfaceImage : NSObject


+ (void)addImageToCache:(nonnull UIImage *)image
              imageName:(nonnull NSString *)name;

+ (BOOL)cacheContainsImageName:( nonnull NSString * )imageName;

+ (void) loadFromURL:  (nonnull NSURL  *   ) url  identifier: (nonnull NSString*) identifier enableCache:(BOOL) enableCache  doneBlock:(nullable HJWKInterfaceImageDone)doneBlock;
@end
