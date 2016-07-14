//
//  TMBDashboardTableViewController.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/6/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBDashboardTableViewController.h"

#import "TMBCoreDataStackManager.h"
#import "TMBFetchedResultsControllerDelegate.h"
#import "TMBDashboardTableViewDataSource.h"
#import "TMBDashboardTableViewDelegate.h"
#import "TMBAPIResponseHelper.h"

#import "TMBPost.h"

#define kRefreshPadding 1

static NSString * const kStoryboardID = @"table";

@import CoreData;

@interface TMBDashboardTableViewController () <TMBDashboardTableViewDataSourceScrollingDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic) TMBFetchedResultsControllerDelegate *fetchedResultsControllerDelegate;
@property (nonatomic) TMBDashboardTableViewDataSource *tableviewDataSource;
@property (nonatomic) TMBDashboardTableViewDelegate *tableviewDelegate;

@property (assign) id localChangedObserver;

@property NSString *fetchType;

@end

@implementation TMBDashboardTableViewController {
    BOOL APIHasMoreToLoad;
    BOOL isFetching;
}

#pragma mark - TMBDashboardTableViewDataSourceScrollingDelegate callback

- (void)tableView:(UITableView *)table didScrollToIndexPath:(NSIndexPath *)indexPath
{
    [self getMorePostsWithOffset:indexPath.row];
}

#pragma mark - init

+ (instancetype)controller
{
    return [TMBDashboardTableViewController controllerWithStoryboardIdentifier:kStoryboardID];
}

+ (instancetype)controllerWithFetchType:(NSString *)fetchType
{
    TMBDashboardTableViewController *controller = [TMBDashboardTableViewController controller];
    controller.fetchType = fetchType;
    return controller;
}

#pragma mark - view

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    APIHasMoreToLoad = YES;
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self
                            action:@selector(refresh)
                  forControlEvents:UIControlEventValueChanged];
    
    self.tableviewDataSource = [[TMBDashboardTableViewDataSource alloc]
                                initWithTableView:self.tableView
                                fetchedResultsController:self.fetchedResultsController];
    self.tableviewDataSource.delegate = self;
    self.tableView.dataSource = self.tableviewDataSource;
    
    self.tableviewDelegate = [[TMBDashboardTableViewDelegate alloc]
                              initWithTableView:self.tableView
                              fetchedResultsController:self.fetchedResultsController
                              navigationController:self.navigationController];
    
    self.tableView.delegate = self.tableviewDelegate;
    
    [TMAPIClient sharedInstance].OAuthConsumerKey = @"";
    [TMAPIClient sharedInstance].OAuthConsumerSecret = @"";
    [TMAPIClient sharedInstance].OAuthToken = @"";
    [TMAPIClient sharedInstance].OAuthTokenSecret = @"";
    
    [self refresh];
}

#pragma mark - data

/*! refresh reaches out to the API. Upon refreshes the fetchedResultsController */
- (void)refresh
{
    if (isFetching == YES) {
        return;
    }
    
    isFetching = YES;
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    __weak typeof(self) weakSelf = self;
    
    NSDictionary *params = [self.fetchType isEqualToString:@"all"] ?
    nil :
  @{@"type" : self.fetchType};
    
    [[TMAPIClient sharedInstance]
     dashboard:params
     callback:^(id response, NSError *error) {
         
         __strong typeof(weakSelf) strongSelf = weakSelf;
         
         if (error != nil) {
             NSLog(@"%@", error);
             return;
         }
         
         [strongSelf cacheResponse:response isInitialFetch:YES];
         
         APIHasMoreToLoad = YES;
    }];
}

- (void)getMorePostsWithOffset:(NSInteger)offset {
    
    if (APIHasMoreToLoad == NO) {
        return;
    }
    
    if (isFetching == YES) {
        return;
    }
    
    isFetching = YES;
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    NSDictionary *params = [self.fetchType isEqualToString:@"all"] ?
        @{@"offset" : @(offset),
          @"limit" : @([TMBAPIResponseHelper sharedInstance].APILimit)} :
        @{@"offset" : @(offset),
          @"limit" : @([TMBAPIResponseHelper sharedInstance].APILimit),
          @"type" : self.fetchType};
    
    __weak typeof(self) weakSelf = self;
    [[TMAPIClient sharedInstance]
     dashboard:params
     callback:^(id response, NSError *error) {
         
         __strong typeof(weakSelf) strongSelf = weakSelf;
         
         if (error != nil) {
             NSLog(@"%@", error);
             return;
         }
         
         [strongSelf cacheResponse:response isInitialFetch:NO];
     }];
}

/** cacheResponse caches the response to core data
 @param response the response object
 @param isInitialFetch boolean value to indicate if this is the initial fetch
 */
- (void)cacheResponse:(id)response isInitialFetch:(BOOL)isInitialFetch {
    
    __weak typeof(self) weakSelf = self;
    NSBlockOperation *refreshComplete = [NSBlockOperation blockOperationWithBlock:^{
        [weakSelf.refreshControl endRefreshing];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        isFetching = NO;
    }];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[TMBCoreDataStackManager sharedManager] runBlockOnBackgroundContext:^(NSManagedObjectContext *context) {
            
            // Create new posts out of the API response
            NSArray *responsePostDictionaries = response[@"posts"];
            
            if (responsePostDictionaries.count == 0) {
                APIHasMoreToLoad = NO;
                return;
            }
            
            // if it is the initial fetch, clear everything out and refresh
            if (isInitialFetch == YES) {
                [TMBAPIResponseHelper deleteAllObjectsInContext:context];
                [TMBAPIResponseHelper sharedInstance].APIOffset = 15;
            } else {
                [TMBAPIResponseHelper sharedInstance].APIOffset += responsePostDictionaries.count - kRefreshPadding;
            }
            
            for (NSDictionary *responsePostDictionary in responsePostDictionaries) {
                
                // check if we have the item already, lets update it if we do
                [TMBAPIResponseHelper deleteObjectWithID:[responsePostDictionary numberValueForKey:@"id"]
                                               InContext:context];
                
                [TMBAPIResponseHelper parseResponseObject:responsePostDictionary inContext:context];
            }
        }];
        
        [[NSOperationQueue mainQueue] addOperation:refreshComplete];
    });
}

#pragma mark - NSFetchedResultsController

// called after fetched results controller received a content change notification
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView reloadData];
}

- (NSFetchedResultsController *)fetchedResultsController
{
    // Set up the fetched results controller if needed.
    if (_fetchedResultsController == nil) {
        // nil for section name key path means "no sections".
        NSFetchedResultsController *aFetchedResultsController =
        [[NSFetchedResultsController alloc] initWithFetchRequest:[TMBPost allPostsFetchRequest]
                                            managedObjectContext:[[TMBCoreDataStackManager sharedManager] mainContext]
                                              sectionNameKeyPath:nil
                                                       cacheName:nil];
        self.fetchedResultsController = aFetchedResultsController;
        
        self.fetchedResultsControllerDelegate = [[TMBFetchedResultsControllerDelegate alloc] initWithTableView:self.tableView];
        
        self.fetchedResultsController.delegate = self.fetchedResultsControllerDelegate;
        
        NSError *error = nil;
        
        if (![self.fetchedResultsController performFetch:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
    
    return _fetchedResultsController;
}

@end
