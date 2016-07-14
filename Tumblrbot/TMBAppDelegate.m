//
//  TMBAppDelegate.m
//  Tumblrbot
//
//  Created by Matthew Bischoff on 12/6/13.
//  Copyright (c) 2013 Matthew Bischoff. All rights reserved.
//

#import "TMBAppDelegate.h"
#import "TMBTypeTableViewController.h"

#define kRootControllerID @"dash"

@implementation TMBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[UINavigationController alloc]
                                      initWithRootViewController:
                                      [[TMBTypeTableViewController alloc] init]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
