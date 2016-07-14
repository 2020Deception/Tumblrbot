//
//  TMBBaseViewController.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/15/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBBaseViewController.h"

@class TMBPost;

@implementation TMBBaseViewController

+ (instancetype)controllerWithPost:(TMBPost *)post
{
    return [TMBBaseViewController controllerWithPost:post storyboardIdentifier:[TMBBaseViewController storyboardIdentifier]];
}

+ (instancetype)controllerWithPost:(TMBPost *)post storyboardIdentifier:(NSString *)storyboardIdentifier
{
    TMBBaseViewController *controller;
    
    if (storyboardIdentifier != nil) {
        controller = [[UIStoryboard storyboardWithName:kStoryBoard bundle:nil]
                      instantiateViewControllerWithIdentifier:storyboardIdentifier];
    } else {
        controller = [[TMBBaseViewController alloc] init];
    }
    
    controller.post = post;
    
    return controller;
}

+ (NSString *)storyboardIdentifier
{
    return nil;
}

@end
