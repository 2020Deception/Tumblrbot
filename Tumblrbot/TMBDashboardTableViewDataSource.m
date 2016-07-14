//
//  TMBDashboardTableViewDataSource.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBDashboardTableViewDataSource.h"
#import "TMBAPIResponseHelper.h"
#import "TMBDashboardTableViewCell.h"
#import "TMBPost.h"

@interface TMBDashboardTableViewDataSource ()

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@end

@implementation TMBDashboardTableViewDataSource

- (instancetype)initWithTableView:(UITableView *)tableView
         fetchedResultsController:(NSFetchedResultsController *)controller
{
    if (self = [super init]) {
        _tableView = tableView;
        _fetchedResultsController = controller;
    }
    
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.fetchedResultsController.sections.count;
}

/**
 * The number of rows is equal to the number of items in the array.
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberOfRows = 0;
    
    if ([[self.fetchedResultsController sections] count] > 0) {
        id <NSFetchedResultsSectionInfo> sectionInfo = self.fetchedResultsController.sections[section];
        numberOfRows = [sectionInfo numberOfObjects];
    }
    
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TMBDashboardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    TMBPost *post = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = post.blog_name;
    cell.detailTextLabel.text = post.type;
    
    if (indexPath.row == [TMBAPIResponseHelper sharedInstance].APIOffset) {
        if (self.delegate != nil) {
            __weak typeof(self) weakSelf = self;
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                __strong typeof(weakSelf) strongSelf = weakSelf;
                [strongSelf.delegate tableView:tableView didScrollToIndexPath:indexPath];
            }];
        }
    }
    
    return cell;
}


@end
