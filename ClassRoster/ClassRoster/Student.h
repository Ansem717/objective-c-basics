//
//  Student.h
//  ClassRoster
//
//  Created by Andy Malik on 3/9/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject {
    NSString *_firstName;
    NSString *_lastName;
    NSString *_email;
    NSString *_phoneNumber;
}

#pragma mark - Custom Init
- (instancetype)initWithFirstName:(NSString *)firstName
                      andLastName:(NSString *)lastName
                         andEmail:(NSString *)email
                   andPhoneNumber:(NSString *)phoneNumber;

#pragma mark - Setters
- (void)setFirstName:(NSString *)firstName;
- (void)setLastName:(NSString *)lastName;
- (void)setEmail:(NSString *)email;
- (void)setPhoneNumber:(NSString *)phoneNumber;

#pragma mark - Getters
- (NSString *)firstName;
- (NSString *)lastName;
- (NSString *)email;
- (NSString *)phoneNumber;

@end
