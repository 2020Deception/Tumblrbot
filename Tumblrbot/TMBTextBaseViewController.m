//
//  TMBTextBaseViewController.m
//  Tumblrbot
//
//  Created by Brian Bowman on 7/16/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBTextBaseViewController.h"
#import "TMBPost.h"

@implementation TMBTextBaseViewController

- (void)setText:(NSAttributedString *)text detailText:(NSAttributedString *)detailText
{
    self.titleLabel.attributedText = text;
    
    NSMutableAttributedString *bodyString = [[NSMutableAttributedString alloc] initWithAttributedString:detailText];
    if (self.post.post_url.length > 0) {
        [bodyString appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"
                                                                           attributes:@{NSLinkAttributeName : self.post.post_url}]];
        [bodyString appendAttributedString:[[NSAttributedString alloc] initWithString:@"Click to view original post"
                                                                           attributes:@{NSLinkAttributeName : self.post.post_url}]];
    }
    if (self.post.source_url.length > 0) {
        [bodyString appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"
                                                                           attributes:@{NSLinkAttributeName : self.post.source_url}]];
        [bodyString appendAttributedString:[[NSAttributedString alloc] initWithString:@"Click to view source"
                                                                           attributes:@{NSLinkAttributeName : self.post.source_url}]];
    }
    
    self.textView.attributedText = bodyString;
}

@end
