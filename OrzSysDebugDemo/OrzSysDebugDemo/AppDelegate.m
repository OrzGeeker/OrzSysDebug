//
//  AppDelegate.m
//  OrzSysDebugDemo
//
//  Created by wangzhizhou on 2019/8/2.
//  Copyright © 2019 wangzhizhou. All rights reserved.
//

#import "AppDelegate.h"
#import <OrzSysDebug/OrzSysDebug.h>
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [OrzSysDebug prepare];
    return YES;
}

@end
