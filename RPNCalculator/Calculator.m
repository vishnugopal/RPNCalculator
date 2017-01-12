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

@implementation Calculator{
   NSMutableArray *_stack;
    NSString *_operator;
}
@synthesize  stack=_stack;
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
    if(_stack.count>1){
    double operand1 = [self popOperand];
    double operand2 = [self popOperand];
        NSString *temp = operation;
        operation = _operator;
        _operator = temp;
    if ([operation isEqualToString:@"*"]) {
        if (isnan(operand2)) {
            operand2=1;
        }
        result =  operand2 * operand1;
    } else if ([operation isEqualToString:@"/"]) {
        if(isnan(operand2)){
            operand2=operand1;
            operand1=1;
        }
        result = operand2 / operand1;
    } else if ([operation isEqualToString:@"+"]) {
        if(isnan(operand2)){
            operand2=0;
        }
        result = operand2 + operand1;
    } else if ([operation isEqualToString:@"-"]) {
        if(isnan(operand2)){
            operand2=0;
        }
        result = operand2 - operand1;
    }
    
    NSNumber *resultValue = [NSNumber numberWithDouble:result];
    
    [self addToStack:resultValue];
    
    return resultValue;
    }else if(_stack.count==1){
            _operator = operation;
            return (NSNumber*)_stack.lastObject;
    }
    else {
        return (NSNumber*)_stack.lastObject;
    }
}

- (double) popOperand
{
    NSNumber *operand = [self.stack lastObject];
    if(operand) {
        [self.stack removeLastObject];
        return [operand doubleValue];
    }
    return NAN;
}

@end
