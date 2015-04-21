//
//  ViewController.m
//  BullsEye
//
//  Created by Tawatchai Sunarat on 4/21/15.
//  Copyright (c) 2015 ton. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hello wolrd"
                                                        message:@"my first app"
                                                       delegate:nil
                                              cancelButtonTitle:@"Awesome"
                                              otherButtonTitles:nil];
    [alertView show];
}

@end
