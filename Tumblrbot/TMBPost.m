//
//  TMBPost.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBPost.h"

@implementation TMBPost

+ (instancetype)postFromDictionary:(NSDictionary *)dictionary inContext:(NSManagedObjectContext *)context
{
    TMBPost *post = [[[self class] alloc] initWithEntity:[NSEntityDescription entityForName:@"TMBPost" inManagedObjectContext:context]
                          insertIntoManagedObjectContext:context];
    
    [post setBaseDataWithDictionary:dictionary];
    
    return post;
}

- (void)setBaseDataWithDictionary:(NSDictionary *)dictionary
{
    self.blog_name = [dictionary stringValueForKey:@"blog_name"];
    self.id = [dictionary numberValueForKey:@"id"];
    self.post_url = [dictionary stringValueForKey:@"post_url"];
    self.type = [dictionary stringValueForKey:@"type"];
    self.timestamp = [dictionary numberValueForKey:@"timestamp"];
    self.date = [dictionary dateValueForKey:@"date"];
    self.format = [dictionary stringValueForKey:@"format"];
    self.source_url = [dictionary stringValueForKey:@"source_url"];
    self.source_title = [dictionary stringValueForKey:@"source_title"];
    self.liked = [dictionary numberValueForKey:@"liked"];
    self.state = [dictionary stringValueForKey:@"state"];
}

+ (NSFetchRequest *)allPostsFetchRequest
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"TMBPost"];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"id != nil"];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"id" ascending:NO]];
    
    return fetchRequest;
}

+ (NSFetchRequest *)postsFetchRequestWithID:(NSNumber *)requestedItemID
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([TMBPost class])];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"id == %@", requestedItemID];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"id" ascending:NO]];
    
    return fetchRequest;
}

@end
