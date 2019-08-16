//
//  OrzSysDebug.m
//  OrzSysDebug
//
//  Created by wangzhizhou on 2019/8/2.
//

#import "OrzSysDebug.h"
#import "OrzOverlayWindow.h"

@implementation OrzSysDebug

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[NSNotificationCenter defaultCenter] addObserver:[self class] selector:@selector(applicationDidFinishLaunching) name:UIApplicationDidFinishLaunchingNotification object:nil];
    });
}

+ (void)applicationDidFinishLaunching {
    [self prepare];
}

+ (void)prepare {
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    id overlayClass = NSClassFromString(@"UIDebuggingInformationOverlay");
    [overlayClass performSelector:NSSelectorFromString(@"prepareDebuggingOverlay")];
#pragma clang diagnostic pop

}

+ (void)toggle {
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    // Tap status bar with two fingers to start UIDebuggingInformationOverlay
    // 两个手指同时点击状态栏弹出调试框
    if (@available(iOS 11.0, *)) {
        // Simulate two finger click status bar events
        // 模拟两个手指点击状态栏的事件
        id overlayClass = NSClassFromString(@"UIDebuggingInformationOverlay");
        [overlayClass performSelector:NSSelectorFromString(@"overlay")];
        id handlerClass = NSClassFromString(@"UIDebuggingInformationOverlayInvokeGestureHandler");
        
        id handler = [handlerClass performSelector:NSSelectorFromString(@"mainHandler")];
        [handler performSelector:NSSelectorFromString(@"_handleActivationGesture:") withObject:[[OrzOverlayWindow alloc] init]];
    } else {
        id overlayClass = NSClassFromString(@"UIDebuggingInformationOverlay");
        id overlay = [overlayClass performSelector:NSSelectorFromString(@"overlay")];
        [overlay performSelector:NSSelectorFromString(@"toggleVisibility")];
    }
#pragma clang diagnostic pop
    
}

@end
