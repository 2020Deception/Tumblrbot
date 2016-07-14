//
//  TMBDashboardTableViewDelegate.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/17/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBDashboardTableViewDelegate.h"
#import "TMBQuoteViewController.h"
#import "TMBTextViewController.h"
#import "TMBLinkViewController.h"
#import "TMBVideoViewController.h"
#import "TMBAnswerViewController.h"
#import "TMBChatTableViewController.h"
#import "TMBAudioViewController.h"
#import "TMBPhotoTableViewController.h"
#import "TMBPost.h"

#import "TMBTextPost.h"
#import "TMBAudioPost.h"
#import "TMBAnswerPost.h"
#import "TMBTextPost.h"
#import "TMBLinkPost.h"
#import "TMBPhotoPost.h"
#import "TMBQuotePost.h"
#import "TMBChatPost.h"
#import "TMBLinkPost.h"
#import "TMBVideoPost.h"

@interface TMBDashboardTableViewDelegate ()

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) UINavigationController *navigationController;

@end

@implementation TMBDashboardTableViewDelegate

- (instancetype)initWithTableView:(UITableView *)tableView
         fetchedResultsController:(NSFetchedResultsController *)controller
             navigationController:(UINavigationController *)navigationController
{
    if (self = [super init]) {
        _tableView = tableView;
        _fetchedResultsController = controller;
        _navigationController = navigationController;
    }
    
    return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TMBPost *post = [self.fetchedResultsController objectAtIndexPath:indexPath];
    if ([post.class isEqual:[TMBTextPost class]]) {
        [self.navigationController pushViewController:[TMBTextViewController controllerWithPost:post] animated:YES];
    } else if ([post.class isEqual:[TMBQuotePost class]]) {
        [self.navigationController pushViewController:[TMBQuoteViewController controllerWithPost:post] animated:YES];
    } else if ([post.class isEqual:[TMBLinkPost class]]) {
        [self.navigationController pushViewController:[TMBLinkViewController controllerWithPost:post] animated:YES];
    } else if ([post.class isEqual:[TMBVideoPost class]]) {
        [self.navigationController pushViewController:[TMBVideoViewController controllerWithPost:post] animated:YES];
    } else if ([post.class isEqual:[TMBAnswerPost class]]) {
        [self.navigationController pushViewController:[TMBAnswerViewController controllerWithPost:post] animated:YES];
    } else if ([post.class isEqual:[TMBAudioPost class]]) {
        [self.navigationController pushViewController:[TMBAudioViewController controllerWithPost:post] animated:YES];
    } else if ([post.class isEqual:[TMBPhotoPost class]]) {
        [self.navigationController pushViewController:[TMBPhotoTableViewController controllerWithPost:post] animated:YES];
    } else if ([post.class isEqual:[TMBChatPost class]]) {
        [self.navigationController pushViewController:[TMBChatTableViewController controllerWithPost:post] animated:YES];
    } else {
        // type is unknown
    }
}

@end
