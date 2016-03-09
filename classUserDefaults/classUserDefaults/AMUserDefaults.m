//
//  AMUserDefaults.m
//  classUserDefaults
//
//  Created by Andy Malik on 3/8/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import "AMUserDefaults.h"

@interface AMUserDefaults ()

@property (strong, nonatomic) NSMutableDictionary * preferences;

@end

//

@implementation AMUserDefaults

+ (nonnull instancetype)sharedDefaults {
    static AMUserDefaults *shared = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[[self class]alloc]init];
    });
    
    return shared;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"%@", self.preferences);
        NSLog(@"%@", [self setupPreferences]);
        _preferences = [self setupPreferences];
    }
    return self;
}

#pragma mark - Helper Functions

- (void)synch {
    NSError * error;
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:self.preferences options:NSJSONWritingPrettyPrinted error:&error];
    
    if (!error && jsonData) {
        if ([jsonData writeToURL:[self preferenceURL] atomically:YES]) {
            [[NSNotificationCenter defaultCenter]postNotificationName:kAMUserDefaultsDidUpdate object:jsonData];
        }
    }
    
}

- (NSMutableDictionary *)setupPreferences {
    NSError * error;
    NSData *jsonData = [NSData dataWithContentsOfURL:[self preferenceURL]];
    
    if (jsonData) {
        NSMutableDictionary * json = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        
        if (!error && json) {
            return json;
        }
    }
    
    return [NSMutableDictionary new];
}

- (NSURL *)documentsDirectory {
    return [[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]firstObject];
}

- (NSURL *)preferenceURL {
    
    NSLog(@"%@", [[self documentsDirectory]URLByAppendingPathComponent:@"preferences.json"]);
    
    return [[self documentsDirectory]URLByAppendingPathComponent:@"preferences.json"];
}


- (void)setObject:(nonnull id)object key:(nonnull NSString *)key {
    [self.preferences setObject:object forKey:key];
    [self synch];
}

- (nonnull id)objectForKey:(NSString *)key {
    return [self.preferences objectForKey:key];
}

- (void)reset {
    [[NSFileManager defaultManager]removeItemAtURL:[self preferenceURL] error:nil];
}

@end












