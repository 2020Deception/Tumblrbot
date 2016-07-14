//
//  TMBDashboardTableViewDelegate.h
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/17/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMBDashboardTableViewDelegate : NSObject <UITableViewDelegate>

- (instancetype)initWithTableView:(UITableView *)tableView
         fetchedResultsController:(NSFetchedResultsController *)controller
             navigationController:(UINavigationController *)navigationController;

@end
