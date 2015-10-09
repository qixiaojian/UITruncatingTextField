//
//  ViewController.m
//  UItextFieldText
//
//  Created by 戚小建 on 15/9/22.
//  Copyright (c) 2015年 jianke. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    textField.lineBreakMode = NSLineBreakByTruncatingHead;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)hide:(id)sender
{
    [textField resignFirstResponder];
}
- (IBAction)truncateHead:(id)sender
{
    textField.lineBreakMode = NSLineBreakByTruncatingHead;
    [textField becomeTruncatingMode];
}
- (IBAction)truncateMiddle:(id)sender
{
    textField.lineBreakMode = NSLineBreakByTruncatingMiddle;
    [textField becomeTruncatingMode];
}
- (IBAction)truncateTail:(id)sender
{
    textField.lineBreakMode = NSLineBreakByTruncatingTail;
    [textField becomeTruncatingMode];
}
- (IBAction)enterText:(id)sender
{
    textField.text = @"1234567890987654321";
}
@end
