//
//  TMBBaseViewController.h
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/15/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TMBThemeManager.h"
#import "TMBBaseLabel.h"
#import "NSString+TMBHTMLString.h"

@class TMBPost;

/** TMBBaseViewController is the base view controller that all non-tableview controllers inherit from */
@interface TMBBaseViewController : UIViewController

/** titleLabel is the top label for all text based posts */
@property IBOutlet TMBBaseLabel *titleLabel;

/** the post object associated with the controller */
@property (strong) TMBPost *post;

/** factory method to generate a TMBBaseViewController object
  @param post the post associated with the controller
 */
+ (instancetype)controllerWithPost:(TMBPost *)post;

/** factory method to generate a TMBBaseViewController object
 @param post the post associated with the controller
 @param storyboardIdentifier the storyboard identifier for the controller
 */
+ (instancetype)controllerWithPost:(TMBPost *)post storyboardIdentifier:(NSString *)storyboardIdentifier;

@end
