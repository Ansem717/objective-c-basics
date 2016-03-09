//
//  AppDelegate.m
//  ClassRoster
//
//  Created by Andy Malik on 3/9/16.
//  Copyright © 2016 AndyMalik. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    UINavigationController* nvc = (UINavigationController *)self.window.rootViewController;
    ViewController *homeVC = (ViewController *)nvc.viewControllers.firstObject;
    
    [homeVC updateStudents];
}

- (void)applicationWillTerminate:(UIApplication *)application {

}

@end
