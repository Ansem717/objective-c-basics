//
//  CloudBackup.m
//  ClassRoster
//
//  Created by Andy Malik on 3/9/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import "CloudBackup.h"

static NSString *const StudentRecordType = @"Student";

@interface CloudBackup ()

@property (strong, nonatomic) CKContainer * container;
@property (strong, nonatomic) CKDatabase * database;

@end



@implementation CloudBackup

+ (instancetype)shared {
    static CloudBackup *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[[self class]alloc]init];
    });
    return shared;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _container = [CKContainer defaultContainer];
        _database = [_container privateCloudDatabase];
    }
    return self;
}

- (void)enqueueOperation:(CloudBackupCompletion)completion {
    [self enqueueOperation:CloudOperationRetrieve student:nil completion:completion];
}

- (void)enqueueOperation:(CloudOperation)operation
                 student:(Student *)student
              completion:(CloudBackupCompletion)completion
{
    if (operation == CloudOperationSave) {
        [self save:student completion:completion];
    }
    
    if (operation == CloudOperationRetrieve) {
        [self retrieve:completion];
    }
    
    if (operation == CloudOperationDelete) {
        [self delete:student completion:completion];
    }
}


- (void)retrieve:(CloudBackupCompletion)completion {
    
}

- (void)save:(Student *)student completion:(CloudBackupCompletion)completion {
    
}

- (void)delete:(Student *)student completion:(CloudBackupCompletion)completion {
    
}

@end













