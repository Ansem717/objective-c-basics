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
- (void)add:(Student *)student;
- (void)remove:(Student *)student;
- (void)removeStudentAtIndex:(NSIndexPath *)index;
- (void)save;

@end
