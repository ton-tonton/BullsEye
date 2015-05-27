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
    
    [self initialCustomSlider];
    [self startNewGame];
    [self updateLabels];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
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
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}

- (IBAction)sliderMoved:(UISlider *)slider
{
    self.currentValue = roundf(slider.value);
}

- (IBAction)startOver:(id)sender
{
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.duration = 1;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    [self startNewGame];
    [self updateLabels];
    [self.view.layer addAnimation:transition forKey:nil];
}


#pragma mark - alert delegate

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self startNewRound];
    [self updateLabels];
}

#pragma mark - function

- (void)startNewGame
{
    self.score = 0;
    self.round = 0;
    [self startNewRound];
}

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

- (void) initialCustomSlider
{
    UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb-Highlighted"];
    UIImage *trackLeftImage = [[UIImage imageNamed:@"SliderTrackLeft"]
                               resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    UIImage *trackRightImage = [[UIImage imageNamed:@"SliderTrackRight"]
                                resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    
    [self.slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    [self.slider setThumbImage:thumbImageHighlighted forState:UIControlStateHighlighted];
    [self.slider setMinimumTrackImage:trackLeftImage forState:UIControlStateNormal];
    [self.slider setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];
}

@end
