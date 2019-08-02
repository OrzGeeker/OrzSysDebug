# OrzSysDebug

A tool to enable UIDebuggingInformationOverlay for iOS 10 &amp; 11 &amp; 12.


## Usage

The Pod Use Apple's Private API, so you should only depend this pod for debug Target, not for AppleStore Package.

## Add to Podfile

```
source 'https://github.com/OrzGeeker/Specs.git'
...
pod 'OrzSysDebug', :configurations=>['Debug']
```

## Config In App

```
#import <OrzSysDebug/OrzSysDebug.h>
...

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Override point for customization after application launch.
    [OrzSysDebug prepare];
    
    return YES;
}
...
@end
```

## Show The Debug Overlay

When on device, you can tap status bar with two fingers to start UIDebuggingInformationOverlay。

If you want show debug overlay with code,  refer to the following example:

```
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
```

## Demo

![OrzSysDebug.gif](OrzSysDebug.gif)

- [Video Download(2.0M)](OrzSysDebug.mp4)
