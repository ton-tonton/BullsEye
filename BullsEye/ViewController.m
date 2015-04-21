//
//  ViewController.m
//  BullsEye
//
//  Created by Tawatchai Sunarat on 4/21/15.
//  Copyright (c) 2015 ton. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) int currentValue;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.currentValue = 50;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert
{
    NSString *message = [NSString stringWithFormat:@"The value of slider is %d", self.currentValue];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hello wolrd"
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"Awesome"
                                              otherButtonTitles:nil];
    [alertView show];
}

- (IBAction)sliderMoved:(UISlider *)slider
{
    self.currentValue = roundf(slider.value);
}

@end
