//
//  TMBAnswerPost.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBAnswerPost.h"

@implementation TMBAnswerPost

+ (instancetype)postFromDictionary:(NSDictionary *)dictionary inContext:(NSManagedObjectContext *)context
{
    TMBAnswerPost *post = [[[self class] alloc] initWithEntity:[NSEntityDescription entityForName:@"TMBAnswerPost" inManagedObjectContext:context]
                                insertIntoManagedObjectContext:context];
    
    [post setBaseDataWithDictionary:dictionary];
    
    post.question = [dictionary stringValueForKey:@"question"];
    post.answer = [dictionary stringValueForKey:@"answer"];
    post.asking_url = [dictionary stringValueForKey:@"asking_url"];
    post.asking_name = [dictionary stringValueForKey:@"asking_name"];
    
    return post;
}

@end
