//
//  TMBCoreDataStackManager.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/8/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBCoreDataStackManager.h"

@interface TMBCoreDataStackManager ()

@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, strong) NSManagedObjectContext *masterContext;
@property (nonatomic, strong) NSManagedObjectContext *mainContext;

@end

@implementation TMBCoreDataStackManager

+ (instancetype)sharedManager
{
    
    static TMBCoreDataStackManager *sharedManager = nil;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        sharedManager = [[self alloc] init];
        
        void (^registerToSaveMainContextWhenObservingNotificationWithName)(NSString *) = ^(NSString *notificationName) {
            [[NSNotificationCenter defaultCenter] addObserver:sharedManager selector:@selector(saveMainContext) name:notificationName object:nil];
        };
        registerToSaveMainContextWhenObservingNotificationWithName(UIApplicationDidEnterBackgroundNotification);
        registerToSaveMainContextWhenObservingNotificationWithName(UIApplicationWillTerminateNotification);
    });
    
    return sharedManager;
}

#pragma mark - Actions

- (void)runBlockOnMainContext:(TMBCoreDataStackManagerBlock)task
{
    if (task) {
        task(self.mainContext);
        
        [self saveMainContext];
    }
}

- (void)runBlockOnBackgroundContext:(TMBCoreDataStackManagerBlock)task
{
    NSManagedObjectContext *backgroundContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    backgroundContext.parentContext = self.mainContext;
    
    if (task) {
        task(backgroundContext);
        [self saveContext:backgroundContext];
    }
}

#pragma mark - Core Data

/**
 *  Save the provided managed object context as well as its parent context(s) (recursively)
 */
- (void)saveContext:(NSManagedObjectContext *)context
{
    if ([context hasChanges]) {
        NSError *error;
        
        if (![context save:&error]) {
            NSLog(@"Error saving context: %@ %@ %@", self, error, [error userInfo]);
        }
        
        [self saveContext:context.parentContext];
    }
}

/**
 *  Save the main queue's context as well as its parent context(s) (recursively)
 */
- (void)saveMainContext
{
    [self saveContext:self.mainContext];
}

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)mainContext
{
    if (_mainContext != nil) {
        return _mainContext;
        
    }
    
    _masterContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    _masterContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy;
    _masterContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _mainContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        _mainContext.parentContext = _masterContext;
    }
    return _mainContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Tumblrbot" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Tumblrbot.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


@end
