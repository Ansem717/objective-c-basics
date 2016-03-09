//
//  Contact.m
//  TuesdayHomework
//
//  Created by Andy Malik on 3/8/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import "Contact.h"

@implementation Contact

#pragma mark - Custom Init
- (instancetype)initWithName:(NSString *)name andEmail:(NSString *)email {
    self = [super init];
    if (self) {
        _name = name;
        _email = email;
    }
    return self;
}

#pragma mark - Setters
- (void)setName:(NSString *)name {
    if (_name != name) {
        [name retain];
        [_name release];
        _name = name;
    }
}

- (void)setEmail:(NSString *)email {
    if (_email != email) {
        [email retain];
        [_email release];
        _email = email;
    }
}

#pragma mark - Getters
- (NSString *)name {
    return _name;
}

- (NSString *)email {
    return _email;
}

#pragma mark
- (void)dealloc {
    [_email release];
    [_name release];
    _email = nil;
    _name = nil;
    [super dealloc];
}

@end











