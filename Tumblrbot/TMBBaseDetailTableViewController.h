//
//  TMBBaseDetailTableViewController.h
//  Tumblrbot
//
//  Created by Brian Bowman on 7/16/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TMBPost;

/** TMBBaseViewController is the base view controller that all detail tableview controllers inherit from */
@interface TMBBaseDetailTableViewController : UITableViewController

/** the post object associated with the controller */
@property (strong) TMBPost *post;

/** factory method to generate a TMBBaseDetailTableViewController object
 @param post the post associated with the controller
 */
+ (instancetype)controllerWithPost:(TMBPost *)post;

/** factory method to generate a TMBBaseDetailTableViewController object
 @param post the post associated with the controller
 @param storyboardIdentifier the storyboard identifier for the controller
 */
+ (instancetype)controllerWithPost:(TMBPost *)post
              storyboardIdentifier:(NSString *)storyboardIdentifier;

@end
