//
//  Dialogue+CoreDataProperties.h
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Dialogue.h"

NS_ASSUME_NONNULL_BEGIN

@interface Dialogue (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *label;
@property (nullable, nonatomic, retain) NSString *phrase;
@property (nullable, nonatomic, retain) TMBChatPost *chat;

@end

NS_ASSUME_NONNULL_END
