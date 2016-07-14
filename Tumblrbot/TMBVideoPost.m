//
//  TMBVideoPost.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBVideoPost.h"
#import "Player.h"

@implementation TMBVideoPost

+ (instancetype)postFromDictionary:(NSDictionary *)dictionary inContext:(NSManagedObjectContext *)context
{
    TMBVideoPost *post = [[[self class] alloc] initWithEntity:[NSEntityDescription entityForName:@"TMBVideoPost" inManagedObjectContext:context]
                               insertIntoManagedObjectContext:context];
    
    [post setBaseDataWithDictionary:dictionary];
    
    post.caption = [dictionary stringValueForKey:@"caption"];
    
    NSArray *playerData = [NSArray arrayWithArray:dictionary[@"player"]];
    
    if (playerData.count > 0) {
        for (NSDictionary *player in playerData) {
            [post addPlayersObject:[Player playerFromDictionary:player inContext:context]];
        }
    }
    
    return post;
}

- (void)addPlayersObject:(Player *)value
{
    NSMutableOrderedSet<Player *> *temp = [NSMutableOrderedSet<Player *> orderedSetWithOrderedSet:self.players];
    [temp addObject:value];
    self.players = [NSOrderedSet orderedSetWithOrderedSet:temp];
}

@end
