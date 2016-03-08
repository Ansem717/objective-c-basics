//
//  Child.h
//  Week5-Monday-Homework
//
//  Created by Andy Malik on 3/7/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import "Person.h"

@interface Child : Person {
    NSNumber * _age;
    BOOL * _isLoud;
}

/* Custom Init */
- (instancetype)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andAge:(NSNumber *)age andIsLoud:(BOOL *)isLoud;

/* Setters */
- (void)setAge:(NSNumber *)age;
- (void)setIsLoud:(BOOL *)isLoud;

/* Getters */
- (NSNumber *)age;
- (BOOL *)isLoud;

@end
