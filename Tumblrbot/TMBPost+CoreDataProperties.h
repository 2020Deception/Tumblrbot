//
//  TMBPost+CoreDataProperties.h
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "TMBPost.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMBPost (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *id;
@property (nullable, nonatomic, retain) NSString *blog_name;
@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *type;
@property (nullable, nonatomic, retain) NSString *format;
@property (nullable, nonatomic, retain) NSString *post_url;
@property (nullable, nonatomic, retain) NSString *source_url;
@property (nullable, nonatomic, retain) NSNumber *timestamp;
@property (nullable, nonatomic, retain) NSString *source_title;
@property (nullable, nonatomic, retain) NSNumber *liked;
@property (nullable, nonatomic, retain) NSString *state;

@end

NS_ASSUME_NONNULL_END
