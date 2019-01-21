//
//  KVOViewController.m
//  NotificationCenter
//
//  Created by Spencer Symington on 2019-01-20.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "KVOViewController.h"
#import "PanControlView.h"

@interface KVOViewController ()

@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (weak, nonatomic) IBOutlet PanControlView *whiteView;


@end

@implementation KVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.whiteView addObserver:self forKeyPath:@"touchPoint" options:NSKeyValueObservingOptionNew context:nil];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"recieving message");
    if([keyPath isEqualToString:@"touchPoint"]){
        id value = change[NSKeyValueChangeNewKey];
        NSValue *valueCast = (NSValue *)value;
        CGPoint point = valueCast.CGPointValue;
        
        CGFloat xPosition = self.yellowView.center.x;
        CGFloat yPosition = self.yellowView.center.y;
        
        CGPoint newCenter = CGPointMake(xPosition + (point.x *0.2), yPosition + (point.y*0.2));
        self.yellowView.center = newCenter;
    }
}



@end
