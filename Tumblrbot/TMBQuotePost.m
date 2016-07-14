//
//  TMBQuotePost.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBQuotePost.h"

@implementation TMBQuotePost

+ (instancetype)postFromDictionary:(NSDictionary *)dictionary inContext:(NSManagedObjectContext *)context
{
    TMBQuotePost *post = [[[self class] alloc] initWithEntity:[NSEntityDescription entityForName:@"TMBQuotePost" inManagedObjectContext:context]
                               insertIntoManagedObjectContext:context];
    
    [post setBaseDataWithDictionary:dictionary];
    
    post.text = [dictionary stringValueForKey:@"text"];
    post.source = [dictionary stringValueForKey:@"source"];
    
    return post;
}

@end
