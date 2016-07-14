//
//  TMBChatPost.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBChatPost.h"
#import "Dialogue.h"

@implementation TMBChatPost

+ (instancetype)postFromDictionary:(NSDictionary *)dictionary inContext:(NSManagedObjectContext *)context
{
    TMBChatPost *post = [[[self class] alloc] initWithEntity:[NSEntityDescription entityForName:@"TMBChatPost" inManagedObjectContext:context]
                              insertIntoManagedObjectContext:context];
    
    [post setBaseDataWithDictionary:dictionary];
    
    post.body = [dictionary stringValueForKey:@"body"];
    post.title = [dictionary stringValueForKey:@"title"];
    
    NSArray *playerData = [NSArray arrayWithArray:dictionary[@"dialogue"]];
    
    if (playerData.count > 0) {
        for (NSDictionary *dialogue in playerData) {
            [post addChatObject:[Dialogue dialogueFromDictionary:dialogue inContext:context]];
        }
    }
    
    return post;
}

- (void)addChatObject:(Dialogue *)value
{
    NSMutableOrderedSet<Dialogue *> *temp = [NSMutableOrderedSet<Dialogue *> orderedSetWithOrderedSet:self.chat];
    [temp addObject:value];
    self.chat = [NSOrderedSet orderedSetWithOrderedSet:temp];
}


@end
