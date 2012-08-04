//
//  ViewController.h
//  RPNCalculator
//
//  Created by Vishnu Gopal on 03/08/12.
//  Copyright (c) 2012 Vishnu Gopal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *display;
@property (nonatomic) Calculator *brain;

- (IBAction)numberPressed:(UIButton *)sender;
- (IBAction)enterPressed;
- (IBAction)operationPressed:(UIButton *)sender;

@end
