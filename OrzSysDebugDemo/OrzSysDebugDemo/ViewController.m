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

// Motion Event
-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if(motion != UIEventSubtypeMotionShake) return;
    [OrzSysDebug toggle];
}

// Button Action
- (IBAction)showSysDebug:(UIButton *)sender {
    [OrzSysDebug toggle];
}

@end
