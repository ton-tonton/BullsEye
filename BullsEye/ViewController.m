//
//  ViewController.m
//  BullsEye
//
//  Created by Tawatchai Sunarat on 4/21/15.
//  Copyright (c) 2015 ton. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *targetLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *roundLabel;
@property (weak, nonatomic) IBOutlet UISlider* slider;

@property (nonatomic) int currentValue;
@property (nonatomic) int targetValue;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startNewRound];
    [self updateLabels];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - action

- (IBAction)showAlert
{
    NSString *message = [NSString stringWithFormat:@"The value of slider is %d", self.currentValue];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hello wolrd"
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
    [self startNewRound];
    [self updateLabels];
}

- (IBAction)sliderMoved:(UISlider *)slider
{
    self.currentValue = roundf(slider.value);
}

#pragma mark - function

- (void)startNewRound
{
    self.currentValue = 50;
    self.slider.value = self.currentValue;
    self.targetValue = 1 + arc4random_uniform(100);
}

- (void)updateLabels
{
    self.targetLabel.text = [NSString stringWithFormat:@"%d", self.targetValue];
}

@end
