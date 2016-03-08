//
//  Child.m
//  Week5-Monday-Homework
//
//  Created by Andy Malik on 3/7/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import "Child.h"

@implementation Child 

/* Custom Init */
- (instancetype)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andAge:(NSNumber *)age andIsLoud:(BOOL *)isLoud {
    self = [super init];
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
        _age = age;
        _isLoud = isLoud;
    }
    return self;
}

/* Setters */
- (void)setAge:(NSNumber *)age {_age = age;}
- (void)setIsLoud:(BOOL *)isLoud {_isLoud = isLoud;}

/* Getters */
- (NSNumber *)age{return _age;}
- (BOOL *)isLoud {return _isLoud;}

@end
