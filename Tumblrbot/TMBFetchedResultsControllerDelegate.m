//
//  TMBFetchedResultsControllerDelegate.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBFetchedResultsControllerDelegate.h"

@interface TMBFetchedResultsControllerDelegate ()

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation TMBFetchedResultsControllerDelegate

- (instancetype)initWithTableView:(UITableView *)tableView {
    if (self = [super init]) {
        _tableView = tableView;
    }
    
    return self;
}

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:sectionIndex];
    
    switch (type) {
        case NSFetchedResultsChangeInsert: {
            [self.tableView insertSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
            
            break;
        }
        case NSFetchedResultsChangeDelete: {
            [self.tableView deleteSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
            
            break;
        }
        case NSFetchedResultsChangeMove: {
            [self.tableView deleteSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
            [self.tableView insertSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
            
            break;
        }
        case NSFetchedResultsChangeUpdate: {
            [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
            
            break;
        }
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)object atIndexPath:(NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    void (^deleteIndexPathRows)(void) = ^{
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    };
    
    void (^insertNewIndexPathRows)(void) = ^{
        [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
    };
    
    switch (type) {
        case NSFetchedResultsChangeInsert: {
            insertNewIndexPathRows();
            
            break;
        }
        case NSFetchedResultsChangeDelete: {
            deleteIndexPathRows();
            
            break;
        }
        case NSFetchedResultsChangeMove: {
            deleteIndexPathRows();
            insertNewIndexPathRows();
            
            break;
        }
        case NSFetchedResultsChangeUpdate: {
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            break;
        }
    }
}

@end
