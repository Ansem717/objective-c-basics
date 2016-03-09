//
//  CloudBackup.h
//  ClassRoster
//
//  Created by Andy Malik on 3/9/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

@import UIKit;
@import CloudKit;

@class Student;

typedef enum: NSUInteger {
    CloudOperationSave = 0,
    CloudOperationRetrieve,
    CloudOperationDelete
} CloudOperation;

typedef void(^CloudBackupCompletion)(BOOL success, NSArray *students);

@interface CloudBackup : NSObject

+ (instancetype)shared;

- (void)enqueueOperation:(CloudBackupCompletion)completion;

- (void)enqueueOperation:(CloudOperation)operation
                 student:(Student *)student
              completion:(CloudBackupCompletion)completion;

@end
