//
//  TMBCoreDataStackManager.h
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/8/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

@import CoreData;
@import Foundation;

typedef void (^TMBCoreDataStackManagerBlock)(NSManagedObjectContext *context);

@interface TMBCoreDataStackManager : NSObject

+ (instancetype)sharedManager;

@property (nonatomic, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, readonly) NSManagedObjectContext *mainContext;

/** gets a private queue context to allow a task to be performed on it. It is saved at the end.
 @param task Task to be performed on the private queue
 */
- (void)runBlockOnBackgroundContext:(TMBCoreDataStackManagerBlock)task;

/** gets the main queue context to allow a task to be performed on it. It is saved at the end.
 @param task Task to be performed on the main queue.
 */
- (void)runBlockOnMainContext:(TMBCoreDataStackManagerBlock)task;

@end
