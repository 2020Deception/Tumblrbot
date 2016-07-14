//
//  Player+CoreDataProperties.h
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Player.h"

NS_ASSUME_NONNULL_BEGIN

@interface Player (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *embed_code;
@property (nullable, nonatomic, retain) NSNumber *width;
@property (nullable, nonatomic, retain) TMBVideoPost *player_post;

@end

NS_ASSUME_NONNULL_END
