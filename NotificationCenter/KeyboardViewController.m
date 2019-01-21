//
//  KeyboardViewController.m
//  NotificationCenter
//
//  Created by Spencer Symington on 2019-01-20.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "KeyboardViewController.h"

@interface KeyboardViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (nonatomic,readonly)CGFloat normalConstraintPos;

@end

@implementation KeyboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    [notificationCenter addObserver:self selector:@selector(keyboardDidChange:) name:UIKeyboardDidChangeFrameNotification object:nil];
    
    //set the constant for when the keyboard is down
    _normalConstraintPos = self.bottomConstraint.constant;
}

-(void)keyboardDidChange:(NSNotification*)notification{
    NSLog(@"keyboard did change %@",notification.userInfo);
    
    //get the end position of the keyboard as a value
    NSValue *value = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
    
    //turn it into a rect
    CGRect rect = value.CGRectValue;
    
    //get the top point of the keyboard
    float yPos = rect.origin.y;
    
    //if it is the same as the screen height
    if(yPos == self.view.bounds.size.height){
        //set the constaint to normal
        NSLog(@"Keyboard is down");
        self.bottomConstraint.constant = self.normalConstraintPos;
    }else{
        //set the constraint above the keyboard
        NSLog(@"Keyboard is up");
        self.bottomConstraint.constant = self.view.bounds.size.height - yPos;
        NSLog(@"yPos is %f",yPos);

    }
    
}
- (IBAction)tapOnView:(id)sender {
    _textField.resignFirstResponder;
}



@end
