//
//  CloudBackup.m
//  ClassRoster
//
//  Created by Andy Malik on 3/9/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import "CloudBackup.h"
#import "Student+Additions.h"

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
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"TRUEPREDICATE"];
    CKQuery *q = [[CKQuery alloc]initWithRecordType:StudentRecordType predicate:pred];
    
    [self.database performQuery:q inZoneWithID:nil completionHandler:^(NSArray<CKRecord *> * _Nullable results, NSError * _Nullable error) {
       
        [Student studentsFromRecords:results completion:^(NSArray *students) {
            completion(YES, students);
        }];
        
    }];
}

- (void)save:(Student *)student completion:(CloudBackupCompletion)completion {
    CKRecord *newStudentRecord = [[CKRecord alloc]initWithRecordType:StudentRecordType];
    newStudentRecord[@"firstName"] = student.firstName;
    newStudentRecord[@"lastName"] = student.lastName;
    newStudentRecord[@"email"] = student.email;
    newStudentRecord[@"phoneNumber"] = student.phoneNumber;
    
    [self.database saveRecord:newStudentRecord completionHandler:^(CKRecord * _Nullable record, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", [error localizedDescription]);
        } else if (record) {
            [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                completion(YES, @[student]);
            }];
        }
    }];
}

- (void)delete:(Student *)student completion:(CloudBackupCompletion)completion {
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"email == %@", student.email];
    CKQuery *q = [[CKQuery alloc]initWithRecordType:StudentRecordType predicate:pred];
    
    [self.database performQuery:q inZoneWithID:nil completionHandler:^(NSArray<CKRecord *> * _Nullable results, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", [error localizedDescription]);
        } else if (results) {
            for (CKRecord * record in results) {
                [self.database deleteRecordWithID:record.recordID completionHandler:^(CKRecordID * _Nullable recordID, NSError * _Nullable error) {
                    if (error) {
                        NSLog(@"%@", [error localizedDescription]);
                    } else {
                        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                            completion(YES, @[student]);
                        }];
                    }
                }];
            }
        }
    }];
}

@end













