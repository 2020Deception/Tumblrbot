//
//  TMBPost.h
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "NSDictionary+TMBDictionaryJSONParser.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMBPost : NSManagedObject

+ (instancetype)postFromDictionary:(NSDictionary *)dictionary inContext:(NSManagedObjectContext *)context;
- (void)setBaseDataWithDictionary:(NSDictionary *)dictionary;

+ (NSFetchRequest *)allPostsFetchRequest;
+ (NSFetchRequest *)postsFetchRequestWithID:(NSNumber *)requestedItemID;

@end

NS_ASSUME_NONNULL_END

#import "TMBPost+CoreDataProperties.h"
