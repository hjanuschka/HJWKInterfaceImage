//
//  InterfaceController.h
//  Sample WatchKit Extension
//
//  Created by Helmut W. Januschka on 04.05.15.
//  Copyright (c) 2015 hjanuschka. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController
@property (weak, nonatomic) IBOutlet WKInterfaceImage *image_test;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *image_test2;

@end
