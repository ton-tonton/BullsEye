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
@property (nonatomic) int score;
@property (nonatomic) int round;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.score = 0;
    self.round = 0;
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
    int diff = abs(self.targetValue - self.currentValue);
    int point = 100 - diff;
    self.score += point;
    
    NSString *title;
    
    if (diff == 0) {
        title = @"God eye!";
    } else if (diff < 5) {
        title = @"You almost had it!";
    } else if (diff < 10) {
        title = @"Pretty good!";
    } else {
        title = @"Woo, Noob!";
    }
    
    NSString *message = [NSString stringWithFormat:@"your score is %d", point];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
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
    self.round += 1;
    self.currentValue = 50;
    self.slider.value = self.currentValue;
    self.targetValue = 1 + arc4random_uniform(100);
}

- (void)updateLabels
{
    self.targetLabel.text = [NSString stringWithFormat:@"%d", self.targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", self.score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d", self.round];
}

@end
