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
}

- (NSNumber *) performOperationOnStack:(NSString*) operation
{    
    double result = 0;
    double operand1 = [self popOperand];
    double operand2 = [self popOperand];

    if ([operation isEqualToString:@"*"]) {
        result =  operand2 + operand1;
    } else if ([operation isEqualToString:@"/"]) {
        result = operand2 / operand1;
    } else if ([operation isEqualToString:@"+"]) {
        result = operand2 + operand1;
    } else if ([operation isEqualToString:@"-"]) {
        result = operand2 - operand1;
    }
    
    NSNumber *resultValue = [NSNumber numberWithDouble:result];
    
    [self addToStack:resultValue];
    
    return resultValue;
}

- (double) popOperand
{
    NSNumber *operand = [self.stack lastObject];
    if(operand) {
        [self.stack removeLastObject];
    }
    
    return [operand doubleValue];
}

@end
