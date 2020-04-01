//
//  AppDelegate.m
//  ElevatorStandard
//
//  Created by fly on 2020/4/1.
//  Copyright © 2020 fly. All rights reserved.
//

#import "AppDelegate.h"
#import "FLYTabBarViewController.h"
#import "FLYLocationManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    
    FLYTabBarViewController * tabVC = [[FLYTabBarViewController alloc] init];
    self.window.rootViewController = tabVC;
    
    
    return YES;
}



@end
