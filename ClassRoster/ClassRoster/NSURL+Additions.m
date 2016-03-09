//
//  NSURL+Additions.m
//  ClassRoster
//
//  Created by Andy Malik on 3/9/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import "NSURL+Additions.h"

@implementation NSURL (Additions)

+ (NSURL *)documentsDirectory {
    return [[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]firstObject];
}

+ (NSURL *)archiveURL {
    return [[self documentsDirectory]URLByAppendingPathComponent:@"students-Data-Base"];
}

@end
