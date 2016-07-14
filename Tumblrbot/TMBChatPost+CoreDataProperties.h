//
//  TMBChatPost+CoreDataProperties.h
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "TMBChatPost.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMBChatPost (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *body;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSOrderedSet<Dialogue *> *chat;

@end

@interface TMBChatPost (CoreDataGeneratedAccessors)

- (void)addChatObject:(Dialogue *)value;
- (void)removeChatObject:(Dialogue *)value;
- (void)addChat:(NSSet<Dialogue *> *)values;
- (void)removeChat:(NSSet<Dialogue *> *)values;

@end

NS_ASSUME_NONNULL_END
