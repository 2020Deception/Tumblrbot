//
//  TMBQuoteViewController.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/15/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBQuoteViewController.h"
#import "TMBQuotePost.h"

static NSString * const kStoryboardID = @"quote";

@implementation TMBQuoteViewController

+ (instancetype)controllerWithPost:(TMBPost *)post
{
    return [TMBQuoteViewController controllerWithPost:post storyboardIdentifier:kStoryboardID];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TMBQuotePost *post = (TMBQuotePost *)self.post;
    
    [self setText:post.source.convertedHTMLString detailText:post.text.convertedHTMLString];
}

@end
