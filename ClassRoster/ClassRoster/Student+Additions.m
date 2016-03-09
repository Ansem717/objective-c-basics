//
//  Student+Additions.m
//  ClassRoster
//
//  Created by Andy Malik on 3/9/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import "Student+Additions.h"
#import "NSString+Additions.h"

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

@end
