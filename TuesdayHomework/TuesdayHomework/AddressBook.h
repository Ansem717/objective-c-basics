//
//  AddressBook.h
//  TuesdayHomework
//
//  Created by Andy Malik on 3/8/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface AddressBook : NSObject {
    NSString * _name;
    NSMutableArray * _book;
}

#pragma mark - Custom Init
- (instancetype)initWithName:(NSString *)name;

#pragma mark - Getter
- (NSMutableArray *)contacts;
- (NSString *)name;

#pragma mark - Methods
- (void)addContact:(Contact *)contact;
- (NSUInteger) entries;
- (void)makeContact:(NSString *)name andEmail:(NSString *)email;

@end
