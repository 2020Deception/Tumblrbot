//
//  TMBVideoViewController.m
//  Tumblrbot
//
//  Created by Brian Bowman on 7/15/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBVideoViewController.h"
#import "TMBVideoPost.h"
#import "Player.h"

static NSString * const kStoryboardID = @"video";

@implementation TMBVideoViewController

+ (instancetype)controllerWithPost:(TMBPost *)post
{
   return [super controllerWithPost:post
               storyboardIdentifier:kStoryboardID];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TMBVideoPost *post = (TMBVideoPost *)self.post;

    self.titleLabel.attributedText = post.caption.convertedHTMLString;
    
    self.embeddedView.scrollView.scrollEnabled = false;
    
    [self.embeddedView loadHTMLString:post.players.firstObject.embed_code
                              baseURL:nil];
}

#pragma mark - Web View Delegate

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    CGSize contentSize = webView.scrollView.contentSize;
    CGSize viewSize = webView.bounds.size;
    float rw = viewSize.width / contentSize.width;
    webView.scrollView.minimumZoomScale = rw;
    webView.scrollView.maximumZoomScale = rw;
    webView.scrollView.zoomScale = rw;
}

@end
