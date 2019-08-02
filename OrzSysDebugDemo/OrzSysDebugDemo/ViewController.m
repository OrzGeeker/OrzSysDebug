//
//  ViewController.m
//  OrzSysDebugDemo
//
//  Created by wangzhizhou on 2019/8/2.
//  Copyright © 2019 wangzhizhou. All rights reserved.
//

#import "ViewController.h"
#import <OrzSysDebug/OrzSysDebug.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if(motion != UIEventSubtypeMotionShake) return;
    [OrzSysDebug show];
}

- (IBAction)showSysDebug:(UIButton *)sender {
    [OrzSysDebug show];
}

@end
