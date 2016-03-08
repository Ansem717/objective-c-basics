//
//  Contact.m
//  classUserDefaults
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
        _name = name;
    }
}

- (void)setEmail:(NSString *)email {
    if (_email != email) {
        _email = email;
    }
}

- (NSString *)name {
    return _name;
}

- (NSString *)email {
    return _email;
}

@end
