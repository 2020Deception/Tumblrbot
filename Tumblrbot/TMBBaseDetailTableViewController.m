//
//  TMBBaseDetailTableViewController.m
//  Tumblrbot
//
//  Created by Brian Bowman on 7/16/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBBaseDetailTableViewController.h"

#define kEstimatedRowHeight 44.0

@class TMBPost;

@implementation TMBBaseDetailTableViewController

+ (instancetype)controllerWithPost:(TMBPost *)post
{
    return [TMBBaseDetailTableViewController controllerWithPost:post
                                           storyboardIdentifier:[TMBBaseDetailTableViewController storyboardIdentifier]];
}

+ (instancetype)controllerWithPost:(TMBPost *)post
              storyboardIdentifier:(NSString *)storyboardIdentifier {
    
    TMBBaseDetailTableViewController *controller;
    
    if (storyboardIdentifier != nil) {
        controller = [[UIStoryboard storyboardWithName:kStoryBoard bundle:nil]
                      instantiateViewControllerWithIdentifier:storyboardIdentifier];
    } else {
        controller = [[TMBBaseDetailTableViewController alloc] init];
    }
    
    controller.post = post;
    return controller;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = kEstimatedRowHeight;
}

+ (NSString *)storyboardIdentifier
{
    return nil;
}

@end
