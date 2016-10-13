//
//  AppDelegate.m
//  AFNetworking网络状态监控
//
//  Created by heJF on 16/5/20.
//  Copyright © 2016年 cztv. All rights reserved.
//

#import "AppDelegate.h"
#import "AFNetworking.h"
#import "Reachability.h"

@interface AppDelegate ()
@property (nonatomic, assign) NSInteger number;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    //网络监控句柄
//    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
//    //要监控网络连接状态，必须要先调用单例的startMonitoring方法
//    [manager startMonitoring];
//    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        //status:
//        //AFNetworkReachabilityStatusUnknown          = -1,  未知
//        //AFNetworkReachabilityStatusNotReachable     = 0,   未连接
//        //AFNetworkReachabilityStatusReachableViaWWAN = 1,   3G
//        //AFNetworkReachabilityStatusReachableViaWiFi = 2,   无线连接
//        NSLog(@"%ld", (long)status);
////        _number = status;
//        switch (status) {
//            case AFNetworkReachabilityStatusUnknown:
//                NSLog(@"网络状态未知");
//                break;
//            case AFNetworkReachabilityStatusNotReachable:
//                NSLog(@"网络未连接");
//                break;
//            case AFNetworkReachabilityStatusReachableViaWWAN:
//                NSLog(@"2/3/4G网络");
//                break;
//                
//            default:
//                 NSLog(@"wify网络");
//                break;
//        }
//    }];
    
//******************************************苹果自带的网络监控****************************************************************
    // Allocate a reachability object
    Reachability* reach = [Reachability reachabilityWithHostname:@"www.baidu.com"];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    [reach startNotifier];
    return YES;
}
- (void)reachabilityChanged:(NSNotification *)note{
    Reachability* curReach = [note object];
    [curReach currentReachabilityStatus];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    [self updateInterfaceWithReachability:curReach];
}
- (void)updateInterfaceWithReachability:(Reachability *)reachability
{
    NetworkStatus netStatus = [reachability currentReachabilityStatus];
    switch (netStatus) {
        case NotReachable:
            NSLog(@"====当前网络状态不可达=======");
            break;
        case ReachableViaWiFi:
            NSLog(@"====当前网络状态为Wifi=======");
            break;
        case ReachableViaWWAN:
            NSLog(@"====当前网络状态为3G=======");
            break;
    }
}



- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

@end
