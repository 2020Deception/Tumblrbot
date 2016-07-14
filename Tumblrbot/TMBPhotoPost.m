//
//  TMBPhotoPost.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBPhotoPost.h"
#import "Photo.h"

@implementation TMBPhotoPost

+ (instancetype)postFromDictionary:(NSDictionary *)dictionary inContext:(NSManagedObjectContext *)context
{
    TMBPhotoPost *post = [[[self class] alloc] initWithEntity:[NSEntityDescription entityForName:@"TMBPhotoPost" inManagedObjectContext:context]
                               insertIntoManagedObjectContext:context];
    
    [post setBaseDataWithDictionary:dictionary];
    
    post.caption = [dictionary stringValueForKey:@"caption"];
    post.liked = [dictionary numberValueForKey:@"liked"];
    post.note_count = [dictionary numberValueForKey:@"note_count"];
    post.post_author = [dictionary stringValueForKey:@"post_author"];
    post.image_permalink = [dictionary stringValueForKey:@"image_permalink"];
    
    NSArray *playerData = [NSArray arrayWithArray:dictionary[@"photos"]];
    
    if (playerData.count > 0) {
        for (NSDictionary *player in playerData) {
            NSDictionary *originalPhoto = player[@"original_size"];
            if (originalPhoto != nil) {
                [post addPhotosObject:[Photo photoFromDictionary:originalPhoto inContext:context]];
            }
        }
    }
    
    return post;
}

- (void)addPhotosObject:(Photo *)value {
    NSMutableOrderedSet<Photo *> *temp = [NSMutableOrderedSet<Photo *> orderedSetWithOrderedSet:self.photos];
    [temp addObject:value];
    self.photos = [NSOrderedSet orderedSetWithOrderedSet:temp];
}

@end
