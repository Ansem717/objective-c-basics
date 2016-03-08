//
//  Person.h
//  Week5-Monday-Homework
//
//  Created by Andy Malik on 3/7/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    NSString* _firstName;
    NSString* _lastName;
}

/* Custom Init */
- (instancetype)initWithFullName:(NSString *)firstName lastName:(NSString *)lastName;

/* Setters */
- (void)setFirstName:(NSString *)firstName;
- (void)setLastName:(NSString *)lastName;

/* Getters */
- (NSString *)firstName;
- (NSString *)lastName;

@end
