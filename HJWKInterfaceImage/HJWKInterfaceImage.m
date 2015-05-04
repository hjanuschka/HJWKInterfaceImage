//
//  HJWKInterfaceImage.m
//  Sample
//
//  Created by Helmut W. Januschka on 04.05.15.
//  Copyright (c) 2015 hjanuschka. All rights reserved.
//

#import "HJWKInterfaceImage.h"



@implementation HJWKInterfaceImage


+ (void) loadFromURL:  (nonnull NSURL  *   ) url  identifier: (nonnull NSString*) identifier enableCache:(BOOL) enableCache  doneBlock:(nullable HJWKInterfaceImageDone)doneBlock {
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session             = [NSURLSession sessionWithConfiguration:config];
    
    
    if([[self class] cacheContainsImageName:identifier]) {
        
        doneBlock(nil, identifier);
        return;
    }
    
    NSURLSessionDownloadTask *imageDownloadTask3 = [session downloadTaskWithURL:url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        
        UIImage *downloadedImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
        if(enableCache == YES) {
            [[self class] addImageToCache:downloadedImage imageName:identifier];
            doneBlock(nil, identifier);
        } else {
            doneBlock(downloadedImage, nil);
        }

    }];
    [imageDownloadTask3 resume];
    
    
}

+ (void)addImageToCache:(UIImage *)image
              imageName:(NSString *)name
{
    WKInterfaceDevice *device = [WKInterfaceDevice currentDevice];
    while ([device addCachedImage:image name:name] == NO) {
        BOOL success = [[self class] removeRandomImageFromCache];
        if (success) {
            [device removeAllCachedImages];
            [device addCachedImage:image name:name];
            break;
        }
    }
}

+ (BOOL)cacheContainsImageName:(NSString *)imageName
{
    return [[[WKInterfaceDevice currentDevice] cachedImages].allKeys containsObject:imageName];
}

+ (BOOL)removeRandomImageFromCache
{
    NSArray *cachedImageNames = [[WKInterfaceDevice currentDevice] cachedImages].allKeys;
    NSString *randomImageName = cachedImageNames.firstObject;
    if (randomImageName) {
        [[WKInterfaceDevice currentDevice] removeCachedImageWithName:randomImageName];
        return YES;
    }
    return NO;
}


@end
