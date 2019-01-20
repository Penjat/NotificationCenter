//
//  StepViewController.m
//  NotificationCenter
//
//  Created by Spencer Symington on 2019-01-20.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "StepViewController.h"

@interface StepViewController ()
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

@end

@implementation StepViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)addStep:(UIStepper*)sender {
    NSLog(@"adding step %f",sender.value);
    
    [self postNotificationStepperCount];
}
-(void)postNotificationStepperCount{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    NSDictionary *userInfo = @{@"wasPressed":@(self.stepper.value)};
    
    NSNotification *stepperNotification = [[NSNotification alloc] initWithName:@"wasPressed" object:@(self.stepper.value) userInfo:userInfo];
    
    [notificationCenter postNotification:stepperNotification];
}
-(void)viewDidDisappear:(BOOL)animated{
    NSLog(@"I am disappearing");
    [self postNotificationStepperCount];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
