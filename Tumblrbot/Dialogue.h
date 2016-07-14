//
//  Dialogue.h
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class TMBChatPost;

NS_ASSUME_NONNULL_BEGIN

@interface Dialogue : NSManagedObject

+ (Dialogue *)dialogueFromDictionary:(NSDictionary *)dictionary inContext:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END

#import "Dialogue+CoreDataProperties.h"
