//
//  InterfaceController.m
//  Sample WatchKit Extension
//
//  Created by Helmut W. Januschka on 04.05.15.
//  Copyright (c) 2015 hjanuschka. All rights reserved.
//

#import "InterfaceController.h"
#import "HJWKInterfaceImage.h"

@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    
    [HJWKInterfaceImage loadFromURL:[NSURL URLWithString:@"http://placehold.it/140/ff0000/000000"] identifier:@"12346" enableCache:YES doneBlock:^(UIImage * img, NSString * identifier)  {
            dispatch_async(dispatch_get_main_queue(), ^{
                //IF img is null use identfiert (happens on cached request)
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
    
    
    [HJWKInterfaceImage loadFromURL:[NSURL URLWithString:@"http://placehold.it/140/000000/ffffff"] identifier:@"123457" enableCache:NO doneBlock:^(UIImage * img, NSString * identifier)  {
        dispatch_async(dispatch_get_main_queue(), ^{
            //IF img is null use identfiert (happens on cached request)
            //IF img is not null - came from an uncached request
            if(img == nil) {
                [self.image_test2 setImageNamed:identifier];
                NSLog(@"SETTING CACHED");
            } else {
                [self.image_test2 setImage:img];
                NSLog(@"SETTING UNCACHED");
            }
            
        });
    }];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



