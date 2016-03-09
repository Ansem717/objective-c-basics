//
//  AddressBook.m
//  TuesdayHomework
//
//  Created by Andy Malik on 3/8/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import "AddressBook.h"

@implementation AddressBook

#pragma mark - Custom Init
- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = [name copy];
        _book = [NSMutableArray array];
    }
    return self;
}

- (NSMutableArray *)contacts {
    return _book;
}

- (NSString *)name {
    return _name;
}

#pragma mark - Methods
- (void)addContact:(Contact *)contact {
    [[self contacts] addObject:contact];
}

- (NSUInteger) entries {
    return [[self contacts] count];
}

- (void)makeContact:(NSString *)name andEmail:(NSString *)email {
    Contact* tempContact = [[Contact alloc]initWithName:name andEmail:email];
    
    [self addContact:tempContact];
    
    [tempContact release];
}



@end
