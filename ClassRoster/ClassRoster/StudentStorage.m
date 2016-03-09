//
//  StudentStorage.m
//  ClassRoster
//
//  Created by Andy Malik on 3/9/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import "StudentStorage.h"
#import "NSURL+Additions.h"

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

- (NSArray *)allStudents {
    return self.students;
}

- (void)add:(Student *)student {
    [self.students addObject:student];
    [self save];
}

- (void)remove:(Student *)student {
    [self.students removeObject:student];
    [self save];
    
}

- (void)removeStudentAtIndex:(NSIndexPath *)index {
    if (index.row < self.students.count) {
        [self.students removeObjectAtIndex:index.row];
        [self save];
    }
}

- (void)save {
    [NSKeyedArchiver archiveRootObject:self.students toFile:[[NSURL archiveURL]path]];
}
@end
