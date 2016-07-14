//
//  TMBLinkViewController.m
//  Tumblrbot
//
//  Created by Brian Bowman on 7/15/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBLinkViewController.h"
#import "TMBLinkPost.h"

static NSString * const kStoryboardID = @"link";

@implementation TMBLinkViewController

+ (instancetype)controllerWithPost:(TMBPost *)post
{
    return [TMBLinkViewController controllerWithPost:post
                                storyboardIdentifier:kStoryboardID];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TMBLinkPost *post = (TMBLinkPost *)self.post;
    
    NSMutableAttributedString *bodyString = [[NSMutableAttributedString alloc]
                                             initWithAttributedString:post.excerpt.convertedHTMLString];
    
    if (post.url.length > 0) {
        [bodyString appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"
                                                                           attributes:@{NSLinkAttributeName : post.url}]];
        [bodyString appendAttributedString:[[NSAttributedString alloc] initWithString:@"Click to view original link"
                                                                           attributes:@{NSLinkAttributeName : post.url}]];
    }
    
    [self setText:post.title.convertedHTMLString detailText:bodyString];
}

@end
