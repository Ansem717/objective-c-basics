//
//  StudentStorage.h
//  ClassRoster
//
//  Created by Andy Malik on 3/9/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

@import UIKit;
@class Student;

typedef void(^StudentStoreCompletion)();

@interface StudentStorage : NSObject

+ (instancetype)shared;

- (NSArray *)allStudents;
- (NSInteger)count;
- (Student *)studentForIndexPath:(NSIndexPath *)index;
;
- (void)addStudentsFromCloudKit:(NSArray *)students;
- (void)add:(Student *)student completion:(StudentStoreCompletion)completion;
- (void)remove:(Student *)student completion:(StudentStoreCompletion)completion;
- (void)removeStudentAtIndex:(NSIndexPath *)index completion:(StudentStoreCompletion)completion;
- (void)save;

@end
