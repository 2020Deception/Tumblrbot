//
//  TMBDashboardTableViewDataSource.h
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import <Foundation/Foundation.h>

/** This notifies the controller that the scrolling is near the bottom and new posts should be fetched*/
@protocol TMBDashboardTableViewDataSourceScrollingDelegate <NSObject>
@required
/** called when the tableView scrolls to point where the offset was set*/
- (void)tableView:(UITableView *)table didScrollToIndexPath:(NSIndexPath *)indexPath;

@end

@interface TMBDashboardTableViewDataSource : NSObject <UITableViewDataSource>

- (instancetype)initWithTableView:(UITableView *)tableView
         fetchedResultsController:(NSFetchedResultsController *)controller;

@property (weak) id<TMBDashboardTableViewDataSourceScrollingDelegate> delegate;

@end
