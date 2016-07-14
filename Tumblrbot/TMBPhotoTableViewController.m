//
//  TMBPhotoTableViewController.m
//  Tumblrbot
//
//  Created by Brian Bowman on 7/16/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBPhotoTableViewController.h"
#import "TMBPhotoTableViewDataSource.h"

static NSString * const kStoryboardID = @"photo";

@interface TMBPhotoTableViewController ()

@property (nonatomic) TMBPhotoTableViewDataSource *tableviewDataSource;

@end

@implementation TMBPhotoTableViewController

+ (instancetype)controllerWithPost:(TMBPost *)post
{
    TMBPhotoTableViewController *controller = [super controllerWithPost:post
                                                   storyboardIdentifier:kStoryboardID];
    
    controller.tableviewDataSource = [[TMBPhotoTableViewDataSource alloc] initWithPost:(TMBPhotoPost *)controller.post];
    controller.tableView.dataSource = controller.tableviewDataSource;
    
    return controller;
}

@end
