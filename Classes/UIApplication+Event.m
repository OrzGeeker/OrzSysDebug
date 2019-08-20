//
//  UIApplication+Event.m
//  OrzSysDebug
//
//  Created by wangzhizhou on 2019/8/16.
//

#import "UIApplication+Event.h"
#import <objc/runtime.h>
#import "OrzSysDebug.h"

@implementation UIApplication(Event)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleSelector:@selector(motionEnded:withEvent:) withNewSelector:@selector(swizzledMotionEnded:withEvent:) forClass:[self class]];
    });
}


- (void)swizzledMotionEnded:(UIEventSubtype)motion withEvent:(nullable UIEvent *)event {
    
    [self swizzledMotionEnded:motion withEvent:event];
    
    [OrzSysDebug toggle];
}

+ (void)swizzleSelector:(SEL)oldSelector withNewSelector: (SEL)newSelector forClass: (Class)class {
    
    SEL originalSelector = oldSelector;
    SEL swizzledSelector = newSelector;
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if(didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
@end
