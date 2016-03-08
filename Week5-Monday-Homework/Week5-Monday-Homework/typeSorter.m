//
//  typeSorter.m
//  Week5-Monday-Homework
//
//  Created by Andy Malik on 3/7/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import "typeSorter.h"

@implementation typeSorter

+ (void)determineAndDoAction:(id)myInput {
    if ([myInput isKindOfClass:[NSNumber class]]) {
        
        NSLog(@"%f", sqrt([myInput doubleValue]));
        
    } else if ([myInput isKindOfClass:[NSString class]]) {
        
        NSInteger length = [myInput length];
        NSMutableString * revStr = [[NSMutableString alloc] initWithCapacity:length];
        for (NSInteger i=length-1; i>=0; i--) {
            char charAtIndex = [myInput characterAtIndex:i];
            [revStr appendFormat:@"%c", charAtIndex];
        }
        NSLog(@"Original: %@", myInput);
        NSLog(@"Reversed: %@", revStr);
        
    } else if ([myInput isKindOfClass:[NSArray class]]) {
        //Enumerate the number of types within the array... Interesting.
    } else {
        NSLog(@"I'm not sure what to do with this type...");
    }
}

@end
