//
//  PanControlView.m
//  NotificationCenter
//
//  Created by Spencer Symington on 2019-01-20.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "PanControlView.h"

@implementation PanControlView


- (IBAction)pan:(UIPanGestureRecognizer*)sender {
    NSLog(@"did pan");
    self.touchPoint = [sender translationInView:self];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
