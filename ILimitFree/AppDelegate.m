//
//  AppDelegate.m
//  ILimitFree
//
//  Created by qf on 15/5/15.
//  Copyright (c) 2015年 liang. All rights reserved.
//


/**
企业项目开发流程：
 1.第一，要有项目的概念->项目的定位->这个项目能够解决什么样的问题
 2.原型设计->如何将概念以设计图的形式呈现出来
 3.详细设计->说明文档->对原型图中每一个页面的说明
 4.效果图->美工根据原型设计和需求文档将每一个页面设计出来。
 5.编码：程序员按照效果图搭建UI,根据需求文档完成业务逻辑
    （1）创建工程
    （2）创建一些文件夹
    （3）将工程上传到SVN/GIT服务器
    （4）其他开发人员可以从服务器将代码下砸下来，在下载下来的代码的基础上开发，提交，更新，实现多人开发代码同步
 6.测试-> 需要专业的测试人员->并写测试用例
 7.APP上线
 9.APP迭代
 */



#import "RootTabBarController.h"
#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize window =_window;
- (void)dealloc{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //===========================================
    RootTabBarController *rootVC = [[RootTabBarController alloc] initWithNibName:@"RootTabBarController" bundle:nil];
    _window.rootViewController = rootVC;
    [rootVC release];

    
    
    
    
    
    
    
    
    //==========================================
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
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
