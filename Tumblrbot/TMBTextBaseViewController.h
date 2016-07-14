//
//  TMBTextBaseViewController.h
//  Tumblrbot
//
//  Created by Brian Bowman on 7/16/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBBaseViewController.h"
#import "TMBBaseTextView.h"

/** TMBTextBaseViewController is the base view controller that all text based TMBBaseViewController instances */
@interface TMBTextBaseViewController : TMBBaseViewController

/** textView is the textView associated with the controller */
@property IBOutlet TMBBaseTextView *textView;

/** sets the text for all display endpoints on all relevent controllers
 @param text the text for the top label
 @param detailText the text for the detail textView
  */
- (void)setText:(NSAttributedString *)text detailText:(NSAttributedString *)detailText;

@end
