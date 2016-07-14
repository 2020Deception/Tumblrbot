//
//  TMBVideoPost+CoreDataProperties.h
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "TMBVideoPost.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMBVideoPost (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *caption;
@property (nullable, nonatomic, retain) NSOrderedSet<Player *> *players;

@end

@interface TMBVideoPost (CoreDataGeneratedAccessors)

- (void)addPlayersObject:(Player *)value;
- (void)removePlayersObject:(Player *)value;
- (void)addPlayers:(NSOrderedSet<Player *> *)values;
- (void)removePlayers:(NSOrderedSet<Player *> *)values;

@end

NS_ASSUME_NONNULL_END
