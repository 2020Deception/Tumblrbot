//
//  TMBChatTableViewController.m
//  Tumblrbot
//
//  Created by Brian Bowman on 7/15/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBChatTableViewController.h"
#import "TMBChatTableViewDataSource.h"

static NSString * const kStoryboardID = @"chat";

@interface TMBChatTableViewController ()

@property (nonatomic) TMBChatTableViewDataSource *tableviewDataSource;

@end

@implementation TMBChatTableViewController

+ (instancetype)controllerWithPost:(TMBPost *)post
{
    TMBChatTableViewController *controller = [super controllerWithPost:post
                                                  storyboardIdentifier:kStoryboardID];
    
    controller.tableviewDataSource = [[TMBChatTableViewDataSource alloc] initWithPost:(TMBChatPost *)controller.post];
    controller.tableView.dataSource = controller.tableviewDataSource;
    
    return controller;
}

@end
