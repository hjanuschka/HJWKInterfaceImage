# HJWKInterfaceImage


simple WatchKit Remote Image Caching/Loading Lib.

based on this gist: https://gist.github.com/AnYuan/1a5589aa2a6b41cd5282

Installation:
Just add the `HWInterfaceImage.h` and `HWInterfaceImage.m` to your watchkit extension

Loading an Remote Image - and put it into WK Cache - in the completion handler - you can set it by ID.
```
#import "HJWKInterfaceImage.h"
......
.....
 [HJWKInterfaceImage loadFromURL:[NSURL URLWithString:@"http://placehold.it/140/ff0000/000000"] identifier:@"12346" enableCache:YES doneBlock:^(UIImage * img, NSString * identifier)  {
            dispatch_async(dispatch_get_main_queue(), ^{
                //IF img is null use identfier (happens on cached request)
                //IF img is not null - came from an uncached request
                if(img == nil) {
                    [self.image_test setImageNamed:identifier];
                    NSLog(@"SETTING CACHED");
                } else {
                    [self.image_test setImage:img];
                    NSLog(@"SETTING UNCACHED");
                    }
                    
                });
            }];
```

