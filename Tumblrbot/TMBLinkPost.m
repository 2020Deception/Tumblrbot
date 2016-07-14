//
//  TMBLinkPost.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBLinkPost.h"
#import "Photo.h"

@implementation TMBLinkPost

+ (instancetype)postFromDictionary:(NSDictionary *)dictionary inContext:(NSManagedObjectContext *)context
{
    TMBLinkPost *post = [[[self class] alloc] initWithEntity:[NSEntityDescription entityForName:@"TMBLinkPost" inManagedObjectContext:context]
                              insertIntoManagedObjectContext:context];
    
    [post setBaseDataWithDictionary:dictionary];
    
    post.excerpt = [dictionary stringValueForKey:@"excerpt"];
    post.url = [dictionary stringValueForKey:@"url"];
    post.author = [dictionary stringValueForKey:@"author"];
    post.publisher = [dictionary stringValueForKey:@"publisher"];
    post.user_description = [dictionary stringValueForKey:@"user_description"];
    post.title = [dictionary stringValueForKey:@"title"];
    
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
