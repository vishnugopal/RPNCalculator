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

- (NSNumber *) performOperationOnStack:(NSString*) operation;

@end
