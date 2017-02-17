//
//  AppDelegate.m
//  NIMTest
//
//  Created by LZF on 2017/2/13.
//  Copyright © 2017年 zf.com. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "NIMSDK.h"
#import "IMManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    /* 注册SDK */
    //21805e1f41594602ac33d2320a8d5c4d 自己的
    //188e675e4c9e389ac5ef5835221e8d22
    //45c6af3c98409b18a84451215d0bdd6e demo

    [[NIMSDK sharedSDK] registerWithAppID:@"45c6af3c98409b18a84451215d0bdd6e"
                                  cerName:nil];

    
    [[IMManager share] manualLogin:@"18682152037" token:@"123456"];
    
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[RootViewController alloc] init]];
    self.window.rootViewController = nav;
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
