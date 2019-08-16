//
//  UIApplication+ShakeEvent.m
//  OrzSysDebug
//
//  Created by wangzhizhou on 2019/8/16.
//

#import "UIApplication+ShakeEvent.h"
#import <objc/runtime.h>
#import "OrzSysDebug.h"

@implementation UIApplication(ShakeEvent)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(sendEvent:);
        SEL swizzledSelector = @selector(swizzledSendEvent:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        
        if(didAddMethod) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)swizzledSendEvent:(UIEvent *)event {
    [self swizzledSendEvent:event];
    
    if(event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake) {
        NSTimeInterval currentTimestamp = [[NSDate date] timeIntervalSince1970];
        NSUInteger interval = (NSUInteger)((currentTimestamp - lastShakeEventTimestamp) * 1000);
        lastShakeEventTimestamp = currentTimestamp;
        // 100毫秒内的多次事件，按一次来处理
        if(interval > 100){
            [OrzSysDebug toggle];
        }
    }
}

static NSTimeInterval lastShakeEventTimestamp = NSTimeIntervalSince1970;

@end
