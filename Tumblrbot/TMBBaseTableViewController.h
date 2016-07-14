//
//  TMBBaseTableViewController.h
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/17/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import <UIKit/UIKit.h>

/** TMBBaseViewController is the base view controller that all non-detail tableview controllers inherit from */
@interface TMBBaseTableViewController : UITableViewController

/** factory method to generate a TMBBaseTableViewController object
 @param storyboardIdentifier the storyboard identifier for the controller
 */
+ (instancetype)controllerWithStoryboardIdentifier:(NSString *)storyboardIdentifier;

@end
