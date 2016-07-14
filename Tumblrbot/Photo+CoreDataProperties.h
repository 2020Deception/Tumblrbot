//
//  Photo+CoreDataProperties.h
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Photo.h"

NS_ASSUME_NONNULL_BEGIN

@interface Photo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *caption;
@property (nullable, nonatomic, retain) NSString *url;
@property (nullable, nonatomic, retain) NSNumber *width;
@property (nullable, nonatomic, retain) NSNumber *height;
@property (nullable, nonatomic, retain) TMBPhotoPost *photo_post;
@property (nullable, nonatomic, retain) TMBLinkPost *link_post;
@property (nullable, nonatomic, retain) Image *image;

@end

NS_ASSUME_NONNULL_END
