//
//  Calculator.m
//  RPNCalculator
//
//  Created by Vishnu Gopal on 03/08/12.
//  Copyright (c) 2012 Vishnu Gopal. All rights reserved.
//

#import "Calculator.h"

@interface Calculator ()

@property (nonatomic) NSMutableArray *stack;

@end

@implementation Calculator

- (NSMutableArray *) stack
{
    if(!_stack) {
        _stack = [[NSMutableArray alloc] init];
    }
    
    return _stack;
}

- (void) addToStack:(NSNumber *) number
{
    [self.stack addObject:number];
    NSLog(@"Stack is now: %@", self.stack);
}

- (void) performOperationOnStack:(NSString*) operation
{
    NSLog(@"Perform operation called: %@", operation);
}

@end
