//
//  Calculator.h
//  RPNCalculator
//
//  Created by Vishnu Gopal on 03/08/12.
//  Copyright (c) 2012 Vishnu Gopal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

- (void) addToStack:(NSNumber *) number;

- (void) performOperationOnStack:(NSString*) operation;

@end
