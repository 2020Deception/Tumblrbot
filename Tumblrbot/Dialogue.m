//
//  Dialogue.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "Dialogue.h"
#import "TMBChatPost.h"

@implementation Dialogue

+ (Dialogue *)dialogueFromDictionary:(NSDictionary *)dictionary inContext:(NSManagedObjectContext *)context
{
    Dialogue *dialogue = [[[self class] alloc] initWithEntity:[NSEntityDescription entityForName:@"Dialogue" inManagedObjectContext:context]
                           insertIntoManagedObjectContext:context];
    
    dialogue.name = [dictionary stringValueForKey:@"name"];
    dialogue.label = [dictionary stringValueForKey:@"label"];
    dialogue.phrase = [dictionary stringValueForKey:@"phrase"];
    
    return dialogue;
}

@end
