//
//  Contact.h
//  classUserDefaults
//
//  Created by Andy Malik on 3/8/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject {
    NSString * _name;
    NSString * _email;
}

- (void)setName:(NSString *)name;
- (void)setEmail:(NSString *)email;

- (NSString *)name;
- (NSString *)email;

- (instancetype)initWithName:(NSString *)name andEmail:(NSString *)email;

@end
