//
//  Player.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "Player.h"
#import "TMBVideoPost.h"

@implementation Player

+ (instancetype)playerFromDictionary:(NSDictionary *)dictionary inContext:(NSManagedObjectContext *)context
{
    Player *player = [[[self class] alloc] initWithEntity:[NSEntityDescription entityForName:@"Player" inManagedObjectContext:context]
                           insertIntoManagedObjectContext:context];
    
    player.width = [dictionary numberValueForKey:@"width"];
    player.embed_code = [dictionary stringValueForKey:@"embed_code"];
    
    return player;
}

@end
