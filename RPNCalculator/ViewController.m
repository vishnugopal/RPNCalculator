//
//  ViewController.m
//  RPNCalculator
//
//  Created by Vishnu Gopal on 03/08/12.
//  Copyright (c) 2012 Vishnu Gopal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (getter = isEnteringANumber, nonatomic) BOOL enteringANumber;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.display.text = @"";
    self.enteringANumber = YES;
}

- (void)viewDidUnload
{
    [self setDisplay:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (Calculator *) brain
{
    if(!_brain) {
        _brain = [[Calculator alloc] init];
    }
    
    return _brain;
}

- (IBAction)numberPressed:(UIButton *)sender {
    if (self.isEnteringANumber) {
        self.display.text = [self.display.text stringByAppendingString: sender.currentTitle];
    } else {
        self.display.text = sender.currentTitle;
        self.enteringANumber = YES;
    }
}

- (IBAction)enterPressed {
    if (self.isEnteringANumber) {
        NSNumber *enteredNumber = [NSNumber numberWithDouble:[self.display.text doubleValue]];
        [self.brain addToStack:enteredNumber];
        self.enteringANumber = NO;
    }
}

- (IBAction)operationPressed:(UIButton *)sender {
    if (self.isEnteringANumber) {
        [self enterPressed];
    }
    
    NSString *operation = sender.currentTitle;
    NSNumber *result = [self.brain performOperationOnStack:operation];
    self.display.text = [result stringValue];
    self.enteringANumber = NO;
}
@end
