//
//  NSDate+TMBDateFormatter.h
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (TMBDateFormatter)

/*! 
 * dateFromString turns a Tumblr string into an NSDate object
 @param string the string value to be converted
 */
+ (NSDate *)dateFromString:(NSString *)string;

@end
