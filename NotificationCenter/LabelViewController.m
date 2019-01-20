//
//  LabelViewController.m
//  NotificationCenter
//
//  Created by Spencer Symington on 2019-01-20.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "LabelViewController.h"

@interface LabelViewController ()

@end

@implementation LabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    [notificationCenter addObserver:self selector:@selector(updateLabel:) name:@"wasPressed" object:nil];
}
-(void)updateLabel:(NSNotification*)notification{
    
    NSLog(@"should update the label");
    self.counterLabel.text = [[NSString alloc]initWithFormat:@"%@",notification.object ];
}




@end
