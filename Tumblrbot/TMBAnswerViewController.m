//
//  TMBAnswerViewController.m
//  Tumblrbot
//
//  Created by Brian Bowman on 7/15/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBAnswerViewController.h"
#import "TMBAnswerPost.h"

static NSString * const kStoryboardID = @"answer";

@implementation TMBAnswerViewController

+ (instancetype)controllerWithPost:(TMBPost *)post
{
    return [TMBAnswerViewController controllerWithPost:post storyboardIdentifier:kStoryboardID];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TMBAnswerPost *post = (TMBAnswerPost *)self.post;
    
    NSMutableAttributedString *bodyString = [[NSMutableAttributedString alloc] initWithString:@"Question:\n\n"];
    [bodyString appendAttributedString:post.question.convertedHTMLString];
    [bodyString appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n\nAnswer:\n\n"]];
    [bodyString appendAttributedString:post.answer.convertedHTMLString];
    
    [self setText:post.asking_name.convertedHTMLString detailText:bodyString];
}

@end
