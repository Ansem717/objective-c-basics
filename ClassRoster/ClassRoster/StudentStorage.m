//
//  StudentStorage.m
//  ClassRoster
//
//  Created by Andy Malik on 3/9/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import "StudentStorage.h"
#import "NSURL+Additions.h"
#import "CloudBackup.h"
#import "Student.h"

@interface StudentStorage ()

@property (strong, nonatomic) NSMutableArray *students;

@end


@implementation StudentStorage

#pragma mark - Singleton
+ (instancetype)shared {
    
    static StudentStorage *shared = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[[self class]alloc]init];
    });
    
    return shared;
}

#pragma mark - Init
- (instancetype)init {
    self = [super init];
    if (self) {
        
        //Try to grab the data from archive
        _students = [NSKeyedUnarchiver unarchiveObjectWithData:[NSData dataWithContentsOfURL:[NSURL archiveURL]]];
        
        //If failed, create new array
        if (!_students) {
            _students = [[NSMutableArray alloc]init];
        }
        
    }
    return self;
}

#pragma mark - Array Methods

- (void)addStudentsFromCloudKit:(NSArray *)students {
    if (self.students.count == 0) {
        self.students = [[NSMutableArray alloc]initWithArray:students];
    } else {
        for (Student *cloudStudent in students) {
            
            NSString *cloudEmail = cloudStudent.email;
            BOOL found = NO;
            
            for (Student *localStudent in students) {
                
                NSString *localEmail = localStudent.email;
                
                if ([localEmail isEqualToString:cloudEmail]) {
                    found = YES; break;
                }
            }
            
            if (!found) {
                [self.students addObject:cloudStudent];
            }
        }
    }
    
}

- (NSArray *)allStudents {
    return self.students;
}

- (NSInteger)count {
    return self.students.count;
}

- (Student *)studentForIndexPath:(NSIndexPath *)index {
    return [self.students objectAtIndex:index.row];
}

- (void)add:(Student *)student completion:(StudentStoreCompletion)completion {
    if (![self.students containsObject:student]) {
        [[CloudBackup shared]enqueueOperation:CloudOperationSave student:student completion:^(BOOL success, NSArray *students) {
            if (success) {
                [self.students addObject:students.firstObject];
                [self save];
                
                completion();
            }
        }];
    }
}

- (void)remove:(Student *)student completion:(StudentStoreCompletion)completion {
    if ([self.students containsObject:student]) {
        
        [[CloudBackup shared]enqueueOperation:CloudOperationDelete student:student completion:^(BOOL success, NSArray *students) {
            if (success) {
                [self.students removeObject:student];
                [self save];
                
                completion();
            }
        }];
    }
}

- (void)removeStudentAtIndex:(NSIndexPath *)index completion:(StudentStoreCompletion)completion {
    [self remove:[self studentForIndexPath:index] completion:completion];
}

- (void)save {
    [NSKeyedArchiver archiveRootObject:self.students toFile:[[NSURL archiveURL]path]];
}

@end
