//
//  NSString+NSStringCategory.m
//  Week5-Monday-Homework
//
//  Created by Andy Malik on 3/7/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import "NSString+wordsInString.h"

@implementation NSString (NSStringCategory)

- (NSArray *)wordsInString {
    NSArray *words = [self componentsSeparatedByString:@" "];
    return words;
}

@end
