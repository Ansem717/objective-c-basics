//
//  Student.m
//  ClassRoster
//
//  Created by Andy Malik on 3/9/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import "Student.h"

@implementation Student

#pragma mark - Initializers
- (instancetype)initWithFirstName:(NSString *)firstName
                      andLastName:(NSString *)lastName
                         andEmail:(NSString *)email
                   andPhoneNumber:(NSString *)phoneNumber
{
    self = [super init];
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
        _email = email;
        _phoneNumber = phoneNumber;
    }
    return self;
}

- (instancetype)init {
    [NSException raise:@"USE initWithFirstName:lastName:email:phoneNumber: FOR STUDENT" format:@"Please use designated initializer!"];
    return nil;
}

#pragma mark - Setters
- (void)setFirstName:(NSString *)firstName {
    if (_firstName != firstName) {
        _firstName = [firstName copy];
    }
}

- (void)setLastName:(NSString *)lastName {
    if (_lastName != lastName) {
        _lastName = [lastName copy];
    }
}

- (void)setEmail:(NSString *)email {
    if (_email != email) {
        _email = [email copy];
    }
}

- (void)setPhoneNumber:(NSString *)phoneNumber {
    if (_phoneNumber != phoneNumber) {
        _phoneNumber = [phoneNumber copy];
    }
}

#pragma mark - Getters
- (NSString *)firstName {
    return _firstName;
}
- (NSString *)lastName {
    return _lastName;
}
- (NSString *)email {
    return _email;
}
- (NSString *)phoneNumber {
    return _phoneNumber;
}


@end
