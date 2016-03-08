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
        
        NSLog(@"%f\n\n", sqrt([myInput doubleValue]));
        
    } else if ([myInput isKindOfClass:[NSString class]]) {
        
        NSInteger length = [myInput length];
        NSMutableString * revStr = [[NSMutableString alloc] initWithCapacity:length];
        for (NSInteger i=length-1; i>=0; i--) {
            char charAtIndex = [myInput characterAtIndex:i];
            [revStr appendFormat:@"%c", charAtIndex];
        }
        NSLog(@"Original: %@", myInput);
        NSLog(@"Reversed: %@ \n\n", revStr);
        
    } else if ([myInput isKindOfClass:[NSArray class]]) {
        
        int numOfStrings = 0;
        int numOfInts = 0;
        
        for (id element in myInput) {
            if ([element isKindOfClass:[NSString class]]) {
                numOfStrings++;
            } else if ([element isKindOfClass:[NSNumber class]]) {
                numOfInts++;
            }
        }
        
        NSLog(@"The array has %d strings and %d intergers.\n\n", numOfStrings, numOfInts);
        
        //I couldn't figure out how to perform this for every single type without being a huge list of If-Else statements... so for now, I'm only checking if it is an Int or String.
        
    } else {
        NSLog(@"I'm not sure what to do with this type...\n\n");
    }
}

@end
