//
//  TMBAnswerPost+CoreDataProperties.h
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "TMBAnswerPost.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMBAnswerPost (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *question;
@property (nullable, nonatomic, retain) NSString *answer;
@property (nullable, nonatomic, retain) NSString *asking_name;
@property (nullable, nonatomic, retain) NSString *asking_url;

@end

NS_ASSUME_NONNULL_END
