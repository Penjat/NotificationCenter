//
//  StepViewController.m
//  NotificationCenter
//
//  Created by Spencer Symington on 2019-01-20.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "StepViewController.h"

@interface StepViewController ()

@end

@implementation StepViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)addStep:(UIStepper*)sender {
    NSLog(@"adding step %f",sender.value);
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    NSDictionary *userInfo = @{@"wasPressed":@(sender.value)};
    
    NSNotification *stepperNotification = [[NSNotification alloc] initWithName:@"wasPressed" object:@(sender.value) userInfo:userInfo];
    
    [notificationCenter postNotification:stepperNotification];
    
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
