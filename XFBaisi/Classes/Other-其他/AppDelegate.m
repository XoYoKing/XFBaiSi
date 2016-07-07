//
//  AppDelegate.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/25.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "AppDelegate.h"
#import "XFTabBarController.h"
#import "XFTopWindow.h"


@interface AppDelegate ()<UITabBarControllerDelegate>

/** 记录上一次选中的子控制器的索引 */
@property (nonatomic, assign) NSUInteger lastSelectedIndex;

@end

@implementation AppDelegate

#pragma mark - UITabBarControllerDelegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
    // 重复点击
    if (tabBarController.selectedIndex == self.lastSelectedIndex) {
        // 发出通知
        [[NSNotificationCenter defaultCenter] postNotificationName:XFTabBarButtonDidRepeatClickNotification object:nil];
    }
    // 记下当前选中的索引
    self.lastSelectedIndex = tabBarController.selectedIndex;
}

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    XFTabBarController *rootVC = [[XFTabBarController alloc] init];
    rootVC.delegate = self;
    
    self.window.rootViewController = rootVC;
    
    [self.window makeKeyAndVisible];
    
    // 顶部增加点击窗口
    [XFTopWindow xf_showTopWindow];
    
    return YES;
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
