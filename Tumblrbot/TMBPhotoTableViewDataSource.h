//
//  TMBPhotoTableViewDataSource.h
//  Tumblrbot
//
//  Created by Brian Bowman on 7/16/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TMBPhotoPost;

@interface TMBPhotoTableViewDataSource : NSObject <UITableViewDataSource>

- (instancetype)initWithPost:(TMBPhotoPost *)post;

@end
