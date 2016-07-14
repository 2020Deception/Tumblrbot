//
//  TMBAudioPost.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBAudioPost.h"

@implementation TMBAudioPost

+ (instancetype)postFromDictionary:(NSDictionary *)dictionary inContext:(NSManagedObjectContext *)context
{
    TMBAudioPost *post = [[[self class] alloc] initWithEntity:[NSEntityDescription entityForName:@"TMBAudioPost" inManagedObjectContext:context]
                               insertIntoManagedObjectContext:context];
    
    [post setBaseDataWithDictionary:dictionary];
    
    post.caption = [dictionary stringValueForKey:@"caption"];
    post.album_art = [dictionary stringValueForKey:@"album_art"];
    post.artist = [dictionary stringValueForKey:@"artist"];
    post.player = [dictionary stringValueForKey:@"player"];
    post.album = [dictionary stringValueForKey:@"album"];
    post.plays = [dictionary numberValueForKey:@"plays"];
    post.track_name = [dictionary stringValueForKey:@"track_name"];
    post.track_number = [dictionary numberValueForKey:@"track_number"];
    post.year = [dictionary numberValueForKey:@"year"];
    
    return post;
}

@end
