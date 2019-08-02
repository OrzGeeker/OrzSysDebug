//
//  OrzOverlayWindow.m
//  OrzSysDebug
//
//  Created by wangzhizhou on 2019/8/2.
//

#import "OrzOverlayWindow.h"

@implementation OrzOverlayWindow

// [[UIDebuggingInformationOverlayInvokeGestureHandler mainHandler] _handleActivationGesture:(UIGestureRecognizer *)]
// requires a UIGestureRecognizer, as it checks the state of it. We just fake that here.
- (UIGestureRecognizerState)state {
    return UIGestureRecognizerStateEnded;
}

@end
