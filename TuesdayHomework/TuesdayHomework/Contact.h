//
//  Contact.h
//  TuesdayHomework
//
//  Created by Andy Malik on 3/8/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject {
    NSString * _name;
    NSString * _email;
}

#pragma mark - Custom Init
- (instancetype)initWithName:(NSString *)name andEmail:(NSString *)email;

#pragma mark - Setters
- (void)setName:(NSString *)name;
- (void)setEmail:(NSString *)email;

#pragma mark - Getters
- (NSString *)name;
- (NSString *)email;

@end
