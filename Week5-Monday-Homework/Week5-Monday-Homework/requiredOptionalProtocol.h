//
//  requiredOptional.h
//  Week5-Monday-Homework
//
//  Created by Andy Malik on 3/7/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol requiredOptional <NSObject>

@required
- (void)thisIsRequired;

@optional
- (void)thisIsOptional;

@end
