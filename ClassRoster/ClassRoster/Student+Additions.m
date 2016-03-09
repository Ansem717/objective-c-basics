//
//  Student+Additions.m
//  ClassRoster
//
//  Created by Andy Malik on 3/9/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import "Student+Additions.h"
#import "NSString+Additions.h"

@import CloudKit;

#define IS_FISTNAME_VALID self.firstName.length > 0
#define IS_LASTNAME_VALID self.lastName.length > 0
#define IS_EMAIL_VALID self.email.isValidEmailAddress


@implementation Student (Additions)

- (BOOL)isValidStudent {
    
    if (IS_FISTNAME_VALID > 0 && IS_LASTNAME_VALID && IS_EMAIL_VALID) {
        return YES;
    }
    
    return NO;
}

+ (void)studentsFromRecords:(NSArray *)records completion:(StudentCompletion)completion {
    if (!records || records.count == 0) {
        completion(nil);
    }
    
    if (records.count > 0) {
        
        [[[NSOperationQueue alloc]init]addOperationWithBlock:^{
           
            NSMutableArray *students = [[NSMutableArray alloc]init];
            
            for (CKRecord *record in records) {
                NSString * firstName = record[@"firstName"];
                NSString * lastName = record[@"lastName"];
                NSString * email = record[@"email"];
                NSString * phoneNumber = record[@"phoneNumber"];
                
                Student *currStudent = [[Student alloc] initWithFirstName:firstName andLastName:lastName andEmail:email andPhoneNumber:phoneNumber];
                
                [students addObject:currStudent];
            }
            
            [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                completion(students);
            }];
            
        }];
        
    }
}

@end
