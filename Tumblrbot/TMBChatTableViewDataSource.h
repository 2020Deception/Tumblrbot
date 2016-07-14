//
//  TMBChatTableViewDataSource.h
//  Tumblrbot
//
//  Created by Brian Bowman on 7/16/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TMBChatPost;

@interface TMBChatTableViewDataSource : NSObject <UITableViewDataSource>

- (instancetype)initWithPost:(TMBChatPost *)post;

@end
