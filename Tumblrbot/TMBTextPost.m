//
//  TMBTextPost.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBTextPost.h"

@implementation TMBTextPost

+ (instancetype)postFromDictionary:(NSDictionary *)dictionary inContext:(NSManagedObjectContext *)context
{
    TMBTextPost *post = [[[self class] alloc] initWithEntity:[NSEntityDescription entityForName:@"TMBTextPost" inManagedObjectContext:context]
                              insertIntoManagedObjectContext:context];
    
    [post setBaseDataWithDictionary:dictionary];
    
    post.body = [dictionary stringValueForKey:@"body"];
    post.title = [dictionary stringValueForKey:@"title"];
    
    return post;
}

@end
