//
//  TMBAPIResponseHelper.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/17/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBAPIResponseHelper.h"

#import "TMBCoreDataStackManager.h"

#import "TMBTextPost.h"
#import "TMBAudioPost.h"
#import "TMBAnswerPost.h"
#import "TMBTextPost.h"
#import "TMBLinkPost.h"
#import "TMBPhotoPost.h"
#import "TMBQuotePost.h"
#import "TMBChatPost.h"
#import "TMBLinkPost.h"
#import "TMBVideoPost.h"

#define kAPILimit 10
#define kRefreshPadding 5

@implementation TMBAPIResponseHelper

+ (instancetype)sharedInstance
{
    static TMBAPIResponseHelper *sharedInstance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TMBAPIResponseHelper alloc] init];
        sharedInstance.APILimit = kAPILimit;
        sharedInstance.APIOffset = kAPILimit - kRefreshPadding;
    });
    
    return sharedInstance;
}

+ (void)parseResponseObject:(NSDictionary *)responsePostDictionary inContext:(NSManagedObjectContext *)context
{
    if ([responsePostDictionary[@"type"] isEqualToString:@"text"]) {
        [context insertObject:[TMBTextPost postFromDictionary:responsePostDictionary inContext:context]];
    } else if ([responsePostDictionary[@"type"] isEqualToString:@"quote"]) {
        [context insertObject:[TMBQuotePost postFromDictionary:responsePostDictionary inContext:context]];
    } else if ([responsePostDictionary[@"type"] isEqualToString:@"link"]) {
        [context insertObject:[TMBLinkPost postFromDictionary:responsePostDictionary inContext:context]];
    } else if ([responsePostDictionary[@"type"] isEqualToString:@"answer"]) {
        [context insertObject:[TMBAnswerPost postFromDictionary:responsePostDictionary inContext:context]];
    } else if ([responsePostDictionary[@"type"] isEqualToString:@"video"]) {
        [context insertObject:[TMBVideoPost postFromDictionary:responsePostDictionary inContext:context]];
    } else if ([responsePostDictionary[@"type"] isEqualToString:@"audio"]) {
        [context insertObject:[TMBAudioPost postFromDictionary:responsePostDictionary inContext:context]];
    } else if ([responsePostDictionary[@"type"] isEqualToString:@"photo"]) {
        [context insertObject:[TMBPhotoPost postFromDictionary:responsePostDictionary inContext:context]];
    } else if ([responsePostDictionary[@"type"] isEqualToString:@"chat"]) {
        [context insertObject:[TMBChatPost postFromDictionary:responsePostDictionary inContext:context]];
    } else {
        [context insertObject:[TMBPost postFromDictionary:responsePostDictionary inContext:context]];
    }
}

+ (void)deleteAllObjectsInContext:(NSManagedObjectContext *)context
{
    NSArray *cachedPosts = [context executeFetchRequest:[TMBPost allPostsFetchRequest] error:nil];
    
    for (TMBPost *cachedPost in [cachedPosts reverseObjectEnumerator]) {
        [context deleteObject:cachedPost];
    }
}

+ (void)deleteObjectWithID:(NSNumber *)id InContext:(NSManagedObjectContext *)context
{
    NSArray *cachedPosts = [context executeFetchRequest:
                            [TMBPost postsFetchRequestWithID:id]
                                                  error:nil];
    
    if (cachedPosts.count > 0) {
        for (TMBPost *cachedPost in [cachedPosts reverseObjectEnumerator]) {
            [context deleteObject:cachedPost];
        }
    }
}

@end
