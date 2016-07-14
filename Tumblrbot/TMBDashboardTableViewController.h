//
//  TMBDashboardTableViewController.h
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/6/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBBaseTableViewController.h"

/** TMBDashboardTableViewController is the dashboard which the displays a set of fetched posts */
@interface TMBDashboardTableViewController : TMBBaseTableViewController

/** returns a controller with a given fetch type
 @param fetchType is the type of post to fetch */
+ (instancetype)controllerWithFetchType:(NSString *)fetchType;

@end
