//
//  TMBAPIResponseHelper.h
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/17/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import <Foundation/Foundation.h>

/** TMBAPIResponseHelper helps place the response in our core data stack*/
@interface TMBAPIResponseHelper : NSObject

+ (instancetype)sharedInstance;

@property NSInteger APIOffset;
@property NSInteger APILimit;

/** Inserts the appropriate type of object into our core data stack */
+ (void)parseResponseObject:(NSDictionary *)responsePostDictionary inContext:(NSManagedObjectContext *)context;

+ (void)deleteAllObjectsInContext:(NSManagedObjectContext *)context;
+ (void)deleteObjectWithID:(NSNumber *)id InContext:(NSManagedObjectContext *)context;
@end
