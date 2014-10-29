//
//  AppDelegate.m
//  DemoApp
//
//  Created by Stas on 29/10/14.
//
//

#import "AppDelegate.h"
#import "DeptransMenu.h"

@implementation AppDelegate


- (id) init {
    if ((self = [super init])) {
        //....
    }
    return self;
}

- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[HostViewController alloc] initWithNibName:nil bundle:nil];
    
    
    return YES;
}

- (void) applicationWillResignActive:(UIApplication *)application {
    /// ...
}

- (void) applicationDidEnterBackground:(UIApplication *)application {
    /// ...
}

- (void) applicationWillEnterForeground:(UIApplication *)application {
    /// ...
}

- (void) applicationDidBecomeActive:(UIApplication *)application {
    /// ...
}

- (void) applicationWillTerminate:(UIApplication *)application {
    /// ...
}

@end
