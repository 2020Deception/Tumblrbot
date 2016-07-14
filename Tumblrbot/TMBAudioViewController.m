//
//  TMBAudioViewController.m
//  Tumblrbot
//
//  Created by Brian Bowman on 7/15/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBAudioViewController.h"
#import "TMBAudioPost.h"

static NSString * const kStoryboardID = @"audio";

@implementation TMBAudioViewController

+ (instancetype)controllerWithPost:(TMBPost *)post
{
    return [TMBAudioViewController controllerWithPost:post
                                 storyboardIdentifier:kStoryboardID];
}

- (void)viewDidLoad
{
    TMBAudioPost *post = (TMBAudioPost *)self.post;
    
    self.titleLabel.attributedText = post.caption.convertedHTMLString;
    
    // hide the webview until it finishes loading
    self.embeddedView.hidden = true;
    [self.embeddedView loadHTMLString:post.player baseURL:nil];
    self.embeddedView.delegate = self;
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
    self.embeddedView.hidden = false;
}

@end
