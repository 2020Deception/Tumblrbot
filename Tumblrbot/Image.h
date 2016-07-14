//
//  Image.h
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Photo;

NS_ASSUME_NONNULL_BEGIN

@interface Image : NSManagedObject

+ (Image *)imageFromData:(NSData *)data inContext:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END

#import "Image+CoreDataProperties.h"


@interface ImageToDataTransformer : NSValueTransformer
@end