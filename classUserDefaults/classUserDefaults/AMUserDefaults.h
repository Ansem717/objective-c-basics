//
//  AMUserDefaults.h
//  classUserDefaults
//
//  Created by Andy Malik on 3/8/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * _Nonnull const kAMUserDefaultsDidUpdate = @"com.AndyMalik.kAMUserDefaultsDidUpdate";

@interface AMUserDefaults : NSObject

+ (nonnull instancetype)sharedDefaults;

- (void)setObject:(nonnull id)object key:(nonnull NSString *)key;
- (nonnull id)objectForKey:(nonnull NSString *)key;

- (void)reset;

@end
