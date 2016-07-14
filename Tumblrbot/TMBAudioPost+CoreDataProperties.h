//
//  TMBAudioPost+CoreDataProperties.h
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "TMBAudioPost.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMBAudioPost (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *caption;
@property (nullable, nonatomic, retain) NSString *album_art;
@property (nullable, nonatomic, retain) NSString *artist;
@property (nullable, nonatomic, retain) NSString *player;
@property (nullable, nonatomic, retain) NSString *album;
@property (nullable, nonatomic, retain) NSNumber *plays;
@property (nullable, nonatomic, retain) NSString *track_name;
@property (nullable, nonatomic, retain) NSNumber *track_number;
@property (nullable, nonatomic, retain) NSNumber *year;

@end

NS_ASSUME_NONNULL_END
