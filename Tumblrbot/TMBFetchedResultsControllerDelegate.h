//
//  TMBFetchedResultsControllerDelegate.h
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMBFetchedResultsControllerDelegate : NSObject <NSFetchedResultsControllerDelegate>

- (instancetype)initWithTableView:(UITableView *)tableView;

@end
