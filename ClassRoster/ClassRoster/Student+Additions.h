//
//  Student+Additions.h
//  ClassRoster
//
//  Created by Andy Malik on 3/9/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import "Student.h"

typedef void(^StudentCompletion)(NSArray *students);

@interface Student (Additions)

- (BOOL)isValidStudent;
+ (void)studentsFromRecords:(NSArray *)records completion:(StudentCompletion)completion;

@end
