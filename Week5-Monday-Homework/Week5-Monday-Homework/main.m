//
//  main.m
//  Week5-Monday-Homework
//
//  Created by Andy Malik on 3/7/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+wordsInString.h"
#import "Child.h"
#import "typeSorter.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Create a category method on NSString that takes in itself and returns an array of words
        //   NSString+wordsInString
        
        NSString *stringWithWords = @"Lorem Ipsum Dolor Sit Amet.";
        NSLog(@"StringWithWords: %@", stringWithWords);
        NSArray *wordsInString = [stringWithWords wordsInString];
        NSLog(@"WordsInString: %@", wordsInString);
        
        // Declare a simple protocol with optional and required methods. Name it whatever you like
        //   requiredOptionalProtocol.h
        // The homework didn't say we have to do anything with it, just as long as we declare it.
        
        // Declare a class called Person:  Person.h  and  Person.m
        // Extend (indirectly - subclass) this class. Add appropriate behavior to your subclass (Person -> Employee)
        //  I went with Child.h and Child.m
        
        Child* youngBoy = [[Child alloc]initWithFirstName:@"Kimba" andLastName:@"King" andAge:[NSNumber numberWithInt:5] andIsLoud:(BOOL *)YES];
        NSLog(@"The young boy's name is %@ %@. He is %@ years old.", youngBoy.firstName, youngBoy.lastName, youngBoy.age);
        if (youngBoy.isLoud) {
            NSLog(@"%@ is also very loud!", youngBoy.firstName);
        } else {
            NSLog(@"%@ is a quiet one.", youngBoy.firstName);
        }
        
        // Write a method that takes in id type, checks if its NSNumber, NSString, NSArray and performs the following:
        //      if number, calculate the square root
        //      if string, reverses it
        //      if array, checks for object type and calculates how many time specific type is mentioned (if array contains 3 strings, NSLog = contains 3 strings)
        
        NSNumber* myNumber = [NSNumber numberWithInt:9];
        NSArray* myArray = @[@"a string", @"another string", @3, @6, @10];
        
        [typeSorter determineAndDoAction:stringWithWords];
        
        
        
    }
    return 0;
}
