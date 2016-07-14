//
//  TMBMediaBaseViewController.m
//  Tumblrbot
//
//  Created by Brian Bowman on 7/16/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBMediaBaseViewController.h"

@implementation TMBMediaBaseViewController

+ (instancetype)controllerWithPost:(TMBPost *)post storyboardIdentifier:(NSString *)storyboardIdentifier
{
    TMBMediaBaseViewController *controller = [super controllerWithPost:post storyboardIdentifier:storyboardIdentifier];
    
    controller.post = post;
    controller.embeddedView.delegate = controller;
    
    return controller;
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"%@", error);
}


@end
