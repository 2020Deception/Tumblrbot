//
//  TMBTextViewController.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/15/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBTextViewController.h"
#import "TMBTextPost.h"

static NSString * const kStoryboardID = @"text";

@implementation TMBTextViewController

+ (instancetype)controllerWithPost:(TMBPost *)post
{
    return [TMBTextViewController controllerWithPost:post storyboardIdentifier:kStoryboardID];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TMBTextPost *post = (TMBTextPost *)self.post;
    
    [self setText:post.title.convertedHTMLString detailText:post.body.convertedHTMLString];
}

+ (NSString *)storyboardIdentifier
{
    return @"text";
}

@end
