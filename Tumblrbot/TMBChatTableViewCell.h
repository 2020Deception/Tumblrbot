//
//  TMBChatTableViewCell.h
//  Tumblrbot
//
//  Created by Brian Bowman on 7/15/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TMBBaseTextView;

@interface TMBChatTableViewCell : UITableViewCell

@property (weak) IBOutlet TMBBaseTextView *textView;

@end
