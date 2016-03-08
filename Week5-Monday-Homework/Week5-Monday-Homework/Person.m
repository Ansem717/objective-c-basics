//
//  Person.m
//  Week5-Monday-Homework
//
//  Created by Andy Malik on 3/7/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import "Person.h"

@implementation Person

/* Custom Init */
- (instancetype)initWithFullName:(NSString *)firstName lastName:(NSString *)lastName {
    self = [super init];
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
    }
    return self;
}

/* Setters */
- (void)setFirstName:(NSString *)firstName {_firstName = firstName;}
- (void)setLastName:(NSString *)lastName {_lastName = lastName;}

/* Getters */
- (NSString *)firstName{return _firstName;}
- (NSString *)lastName {return _lastName;}

@end
